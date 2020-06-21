package com.bunflp.springwbe;

import com.bunflp.bean.User;
import com.bunflp.dao.UserLogin;

import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.List;

@SpringBootTest
class SpringwbeApplicationTests {
    @Resource
    private UserLogin userLogin;
    @Test
    void contextLoads() {
        User u = new User();
        u.setUid(20200601);
        u.setPassword("q");
        List<User> list = userLogin.getUser(u);
        System.out.println(list.isEmpty());
    }

}
