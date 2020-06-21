package com.bunflp.bean;

import org.springframework.stereotype.Component;

@Component
public class User {
    private int uid;
    private String name;

    private String password;


    public Integer getUidd() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


}
