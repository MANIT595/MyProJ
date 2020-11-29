package com.signup.signup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
    // autowire to add query
    @Autowired
    JdbcTemplate jdbcTemplate;

@PostMapping(path ="addUser")
    public String addUser(User user)
{
    // insert query
    String insert_query = "insert into datain1"
            +"(username,email,password)"
            +"value"
            +"(?,?,?);";

   int rows = jdbcTemplate.update(insert_query,user.getUsername(),user.getEmail(),user.getPassword());
if(rows==1) {
    return "success";
}
else
{
    return "error";
}
}
}
