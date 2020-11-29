package com.frontend.frontend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
public class HomeController {

    @Autowired
    private UserRepository repo;

    @GetMapping("")
    public String home(Model model)
    {
        User userr = new User();
        model.addAttribute("user",userr);
        return "register";
    }


    @PostMapping("register")
    public String doRegister(@ModelAttribute("user") User user)
    {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encoded = encoder.encode(user.getPassword());
        user.setPassword(encoded);

        repo.save(user);
             return "Success";
    }


    @GetMapping("list_users")
    public String users(Model model)
    {

        List<User> listusers = repo.findAll();
        model.addAttribute("listusers",listusers);
        return "user";
    }


    @PostMapping(path ="/edite/{id}")
    public String edited(@ModelAttribute("user") User user,Model model,@PathVariable("id") int id)
    {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encoded = encoder.encode(user.getPassword());
        user.setPassword(encoded);
        repo.save(user);
        List<User> listusers = repo.findAll();
        model.addAttribute("listusers",listusers);
        return "user";
    }

    @RequestMapping(path ="/edit/{id}")
    public String editEmployeeById(Model model, @PathVariable("id") int id)

    {
        User usere = repo.findById(id).get();
        model.addAttribute("usere",usere);
        return "edit";
    }
    @RequestMapping(path = "/delete/{id}")
    public String deleteEmployeeById(Model model, @PathVariable("id") int id)
    {
        repo.deleteById(id);
        List<User> listusers = repo.findAll();
        model.addAttribute("listusers",listusers);
        return "user";

    }

    @RequestMapping(path ="/logout")
    public String logout(Model model)

    {

        return "register";
    }
}
