package com.bunflp.controller;

import com.bunflp.bean.User;
import com.bunflp.dao.UserLogin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class UserLoginServlet {

    @Resource
    private UserLogin userLogin;

    @RequestMapping("/getUser")
    public String  getUser(User u, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws ServletException, IOException {
        List<User> list =  userLogin.getUser(u);
        if(list.size() != 0){
            return "homepage";
        }else {
            return "Login";
        }


    }


}