package com.example.demo.controller;

import com.example.demo.service.UserDataService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private UserDataService userDataService;

    @GetMapping("/admin")
    public String userList(Model model) {
        model.addAttribute("users", userService.findAllUsers());
        return "admin";
    }

    @GetMapping("/admin/{id}/delete")
    public String deleteUser(Model model, @PathVariable Long id) {
        userDataService.deleteUserData(id);
        userService.deleteUser(id);
        return "redirect:/admin";
    }

}
