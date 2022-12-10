package com.example.demo.controller;

import com.example.demo.entity.Post;
import com.example.demo.service.PostService;
import org.eclipse.jdt.internal.compiler.parser.Parser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.persistence.Converter;
import java.util.*;
import java.util.stream.StreamSupport;

@Controller
public class HomeController {
    @Autowired
    PostService postService;

    @GetMapping("/")
    public String home(Model model){
        Iterable<Post> posts = postService.findAll();
        fillPosts(model, posts);
        return "index";
    }

    static void fillPosts(Model model, Iterable<Post> posts) {
        List<Post> posts1 = new ArrayList<>();
        posts.forEach(posts1 :: add);
        Collection<Post> posts2 = new ArrayList<>();
        for (int i = posts1.size()-1; i>=0; i--){
            posts2.add(posts1.get(i));
        }
        model.addAttribute("posts", posts2);
    }

    @GetMapping("/login")
    public String login(Model model){
        return "login";
    }



}
