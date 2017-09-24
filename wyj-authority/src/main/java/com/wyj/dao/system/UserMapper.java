package com.wyj.dao.system;

import java.util.HashMap;

import com.wyj.dao.BaseMapper;
import com.wyj.entity.system.User;

public interface UserMapper extends BaseMapper<User, Long> {

    User getUserByUserName(String userName);
    
    int updatePasswordByUser(HashMap<String, Object> query);
}
