package com.example.demo.service;

import com.example.demo.entity.Image;
import com.example.demo.entity.Post;
import com.example.demo.entity.User;
import com.example.demo.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class PostService {
    @Autowired
    PostRepository postRepository;
    @Autowired


    public Iterable<Post> findAll(){
        return postRepository.findAll();
    }
    public Optional<Post> findById(Long id){
        return postRepository.findById(id);

    }
    public Iterable<Post> findAllByUser(User user){
        return postRepository.findAllByUser(user);
    }

    public void savePost(Post post) throws IOException {
        postRepository.save(post);
    }
    public void deletePost(Post post){
        postRepository.delete(post);
    }

}
