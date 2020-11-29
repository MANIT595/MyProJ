package com.retrive.jpa.retrivejpa;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface FetchDataService extends JpaRepository<UserModel,Integer> {
    @Override
    List<UserModel> findAll();


}
