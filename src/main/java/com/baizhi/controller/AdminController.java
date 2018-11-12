package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public String login(Admin admin,HttpServletRequest request,String code){
        HttpSession session = request.getSession();
        String validationCode = (String)session.getAttribute("validationCode");
        if(validationCode.equals(code)){
            Admin admin1 = adminService.findByUsernameAndPwd(admin);
            if(admin1!=null){
                session.setAttribute("admin",admin1);
                return "redirect:/back/main/main.jsp";
            }
            return "redirect:/back/admin/login.jsp";
        }else{
            return "redirect:/back/admin/login.jsp";
        }

    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.setAttribute("admin",null);
        return "redirect:/back/admin/login.jsp";

    }

    @RequestMapping("/update")
    public @ResponseBody String update(Admin admin,HttpServletRequest request){

        adminService.motify(admin);
        HttpSession session = request.getSession();
        session.setAttribute("admin",null);
        return "back/admin/login.jsp";
    }
}
