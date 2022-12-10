package com.example.demo.controller;

import com.example.demo.entity.Post;
import com.example.demo.entity.User;
import com.example.demo.entity.UserData;
import com.example.demo.service.PostService;
import com.example.demo.service.UserDataService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

@Controller
public class ProfileController {
    @Autowired
    UserService userService;
    @Autowired
    UserDataService userDataService;
    @Autowired
    PostService postService;

    @GetMapping("/{name}/profile")
    public String profile(Model model, @PathVariable String name) {
        User user = userService.findUserByUserame(getCurrentUsername());
        UserData userData = userDataService.findById(user.getId());
        userData.setUser(user);
        userDataService.saveUserData(userData);
        model.addAttribute("userDataForm", userData);
        return "profile";
    }

    @PostMapping("/{name}/profile")
    public String newUserData(@ModelAttribute("userDataForm") @Valid UserData userDataForm, BindingResult bindingResult, Model model) {
        User user = userService.findUserByUserame(getCurrentUsername());
        UserData userData = userDataService.findById(user.getId());
        userData.setName(userDataForm.getName());
        userData.setAddress(userDataForm.getAddress());
        userData.setPhone(userDataForm.getPhone());
        if (!bindingResult.hasErrors()) {
            userDataService.saveUserData(userData);
        }
        return "profile";
    }
    @GetMapping("/{name}/profile/posts")
    public String usersPosts(Model model, @PathVariable String name) {
        Iterable<Post> posts = postService.findAllByUser(getCurrentUser());
        HomeController.fillPosts(model, posts);
        return "usersposts";
    }
    private User getCurrentUser(){
        return userService.findUserByUserame(getCurrentUsername());
    }

    public String getCurrentUsername() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return auth.getName();
    }


}
