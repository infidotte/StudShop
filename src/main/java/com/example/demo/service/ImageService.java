
package com.example.demo.service;

import com.example.demo.entity.Image;
import com.example.demo.entity.Post;
import com.example.demo.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Optional;

@Service
public class ImageService {
    @Autowired
    ImageRepository imageRepository;

    public Optional<Image> findById(Long id) {
        return imageRepository.findById(id);
    }

    public boolean saveImage(Post post, MultipartFile file) throws IOException {
        if (file.getSize() != 0) {
            Image image = new Image();
            image.setName(file.getName());
            image.setOriginalFileName(file.getOriginalFilename());
            image.setContentType(file.getContentType());
            image.setSize(file.getSize());
            image.setBytes(file.getBytes());
            image.setPost(post);
            imageRepository.save(image);
        }
        return true;
    }
}

