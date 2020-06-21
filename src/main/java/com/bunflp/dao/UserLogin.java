package com.bunflp.dao;

import com.bunflp.bean.User;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;
@Component
public interface UserLogin {
    List<User> getUser(User user);

}
