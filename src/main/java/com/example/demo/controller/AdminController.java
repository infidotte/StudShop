package com.example.demo.controller;

import com.example.demo.entity.Post;
import com.example.demo.service.PostService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Optional;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private PostService postService;
    @GetMapping("/admin")
    public String userList(Model model){
        model.addAttribute("allUsers", userService.findAllUsers());
        return "admin";
    }
    @PostMapping("/admin")
    public String deleteUser(@RequestParam(required = true, defaultValue = "") Long userId,
                             @RequestParam(required = true, defaultValue = "") String action,
                             Model model){
        if(action.equals("delete")){
            userService.deleteUser(userId);
        }
        return "redirect:/admin";
    }

}
