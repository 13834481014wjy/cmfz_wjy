package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/insert")
    public String insertUser(User user){
        userService.addUser(user);
        return "redirect:/user.jsp";
    }

    @RequestMapping("/login")
    public @ResponseBody String login(User user){
        String userByUsernamePwd = userService.findUserByUsernamePwd(user);
        return userByUsernamePwd;
    }

    @RequestMapping("/update")
    public String updateUser(User user){
        userService.modifyUser(user);
        return "redirect:/user.jsp";
    }



}
