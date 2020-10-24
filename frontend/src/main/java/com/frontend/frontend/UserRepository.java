package com.frontend.frontend;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<User,Integer> {

    @Query(value = "SELECT u FROM User u  where u.email = ?1")
    User findByEmail(String email);

}
