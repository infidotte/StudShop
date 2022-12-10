package com.example.demo.controller;

import com.example.demo.entity.Post;
import com.example.demo.entity.User;
import com.example.demo.entity.UserData;
import com.example.demo.service.ImageService;
import com.example.demo.service.PostService;
import com.example.demo.service.UserDataService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.Transient;
import javax.validation.Valid;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Optional;

@Controller
public class PostController {
    @Autowired
    UserService userService;
    @Autowired
    UserDataService userDataService;
    @Autowired
    PostService postService;
    @Autowired
    ImageService imageService;

    @Transient
    Post currentPost;

    @GetMapping("post/newpost")
    public String newPost(Model model){
        Post post = new Post();
        model.addAttribute("newPostForm", post);
        return "newpost";
    }
    @PostMapping("post/newpost")
    public String savePost(
            @ModelAttribute("newPostForm") @Valid Post newPostForm, @RequestParam("file") MultipartFile file) throws IOException {

        newPostForm.setUser(getCurrentUser());
        imageService.saveImage(newPostForm, file);
        postService.savePost(newPostForm);
        return "redirect:/";
    }
    @GetMapping("/post/{id}/delete")
    public String deletePost(Model model, @PathVariable(value = "id") Long id){
        Post post = postService.findById(id).get();
        postService.deletePost(post);
        return "redirect:/";
    }
    @GetMapping("/post/{id}")
    public String postDetails(Model model, @PathVariable(value = "id") Long id){
        Optional<Post> post = postService.findById(id);
        ArrayList<Post> result = new ArrayList<>();
        post.ifPresent(result :: add);
        model.addAttribute("postDetails", result);
        UserData userData = userDataService.findById(result.get(0).getUser().getId());
        ArrayList<UserData> res = new ArrayList<>();
        res.add(userData);
        model.addAttribute("postUser", res);
        return "post";
    }
    public User getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return userService.findUserByUserame(auth.getName());
    }
}