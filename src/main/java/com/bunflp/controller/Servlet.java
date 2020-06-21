package com.bunflp.controller;

import com.bunflp.bean.User;
import com.bunflp.dao.AcountDao;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@Controller
public class Servlet {
    @Resource
    private AcountDao a ;

    public void setA(AcountDao a) {
        this.a = a;
    }

    @RequestMapping("/method")
    public String method(Model model){
        model.addAttribute("key","weeretertre");
        return "PageOne";
    }

    @RequestMapping( value = "/getUser/{id}")
    public String getUserByCondition(@PathVariable("id") int id, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws ServletException, IOException {
        List<User> list =  a.selectMa(id);
        System.out.println(list.toString());

        return "homepage";
    }

}
