package com.bunflp.service;

import com.bunflp.bean.User;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface UserLoginService {
    public List<User> getUser(User user);
}
