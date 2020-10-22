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

    @PutMapping("add")
    public void userAdd(@RequestBody UserModel user)
    {
        fetchDataService.save(user);
    }

    @PutMapping("update")
    public void userUpdate(@RequestBody UserModel user)
    {
        fetchDataService.save(user);
    }

    @DeleteMapping("delete/{id}")
    public void userDelete(@PathVariable Integer id)
    {
        fetchDataService.deleteById(id);
    }
}
