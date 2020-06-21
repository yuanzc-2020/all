package com.bunflp.serviceImpl;

import com.bunflp.bean.User;
import com.bunflp.dao.UserLogin;
import com.bunflp.service.UserLoginService;

import javax.annotation.Resource;
import java.util.List;

public class UserLoginImpl implements UserLoginService {
    @Resource
    private UserLogin userLogin;


    @Override
    public List<User> getUser(User user) {
        return userLogin.getUser(user);
    }
}
