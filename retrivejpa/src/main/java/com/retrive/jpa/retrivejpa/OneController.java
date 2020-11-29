package com.retrive.jpa.retrivejpa;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
public class OneController {

    @Autowired
    FetchDataService fetchDataService;

@GetMapping("users")
List<UserModel> userModel()
{
return fetchDataService.findAll();
}

}
