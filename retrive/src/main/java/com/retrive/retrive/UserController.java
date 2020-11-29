package com.retrive.retrive;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserController {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping("users")
    public ResponseEntity<List<User>> getAllUsers()
    {
        List<User> users = jdbcTemplate.query("select * from datain1",new BeanPropertyRowMapper(User.class));

        return new ResponseEntity<>(users,HttpStatus.OK);
    }
}
