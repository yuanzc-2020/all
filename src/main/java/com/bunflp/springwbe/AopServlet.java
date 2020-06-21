package com.bunflp.springwbe;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;


public class AopServlet {
    //@ResponseBody
    @ExceptionHandler(RuntimeException.class)
    public String aop(){

        return "PageOne";
    }

}
