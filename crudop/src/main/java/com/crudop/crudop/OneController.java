package com.crudop.crudop;

import com.crudop.crudop.FetchDataService;
import com.crudop.crudop.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class OneController {


    @Autowired
    FetchDataService fetchDataService;

    @CrossOrigin("http://localhost:4200/users")
    @GetMapping("users")
    public List<UserModel> userModel()
    {
        return (List<UserModel>) fetchDataService.findAll();
    }


    @GetMapping("users/{id}")
    public UserModel userModel(@PathVariable Integer id)
    {
        return fetchDataService.findById(id).get();
    }

    @PostMapping("add")
    public String  userAdd(@RequestBody UserModel user)
    {
        fetchDataService.save(user);
        return "Successfully Registered";
    }

    @PutMapping("update")
    public void userUpdate(@RequestBody UserModel user)
    {
        fetchDataService.save(user);
    }

    @CrossOrigin("http://localhost:4200/users")
    @DeleteMapping("delete/{id}")
    public String userDelete(@PathVariable Integer id)
    {
        fetchDataService.deleteById(id);
        return "Successfully Deleted";
    }

    //@GetMapping("delete/{username}")
    //public UserModel hell(@PathVariable String username)
    //{
      //  return fetchDataService.findByEmailAddress(username);

    //}
    @PostMapping("login")
    public UserModel  userLogin(@RequestBody UserModel user)
    {
        return fetchDataService.findByEmailAddress(user.getEmail(),user.getPassword());
    }
}
