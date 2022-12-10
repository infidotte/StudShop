package com.example.demo.service;

import com.example.demo.entity.User;
import com.example.demo.entity.UserData;
import com.example.demo.repository.UserDataRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Optional;

@Service
public class UserDataService {
    @PersistenceContext
    private EntityManager em;
    @Autowired
    UserDataRepository userDataRepository;

    public UserData findById(Long id){
        Optional<UserData> userData = userDataRepository.findById(id);
        return userData.orElse(new UserData());
    }
    public void saveUserData(UserData userData){
        userDataRepository.save(userData);
    }

}
