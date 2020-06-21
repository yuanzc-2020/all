package com.bunflp.dao;

import com.bunflp.bean.User;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface AcountDao {

    public List<User> selectMa(int id);
}
