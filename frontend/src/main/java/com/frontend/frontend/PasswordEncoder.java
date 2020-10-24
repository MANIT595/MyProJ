package com.frontend.frontend;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncoder  {
    public static void main(String args[])
    {
        BCryptPasswordEncoder encoder =new BCryptPasswordEncoder();
        String rawpasss = "manikanta";
        String encodedPassword= encoder.encode(rawpasss);
        System.out.println(encodedPassword);
    }
}
