package com.wyj.service.system;

import java.util.HashMap;

import com.wyj.entity.Retval;
import com.wyj.entity.system.User;
import com.wyj.service.BaseService;

public interface UserService extends BaseService<User, Long> {

    int saveUser(User user);

    int updateUser(User user);

    int batchRemoveUser(Long[] userIds);

    User getUserById(Long userId);
    
    User getUserByUserName(String userName);
    
    Retval updatePasswordByUser(HashMap<String, Object> query);
}
