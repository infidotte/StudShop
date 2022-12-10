package com.example.demo.repository;

import com.example.demo.entity.UserData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserDataRepository extends CrudRepository<UserData, Long> {
    @Query(value = "select * from user_data where user_id = id", nativeQuery = true)
    List<UserData> findByUserId(@Param("id") Long id);
}
