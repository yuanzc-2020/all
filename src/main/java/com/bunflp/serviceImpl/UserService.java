package com.bunflp.serviceImpl;

import com.bunflp.bean.User;
import com.bunflp.dao.AcountDao;
import com.bunflp.service.UserSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class UserService implements UserSer {
    @Resource
    private AcountDao acountDao;
    @Override
    public List<User> select(int id) {
        List<User> list = acountDao.selectMa(id);
        return list;
    }
}
