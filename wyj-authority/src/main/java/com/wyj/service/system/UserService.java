package com.wyj.service.system;

import com.wyj.entity.system.User;
import com.wyj.service.BaseService;

public interface UserService extends BaseService<User, Long> {

    int saveUser(User user);

    int updateUser(User user);

    int batchRemoveUser(Long[] userIds);

    User getUserById(Long userId);
    
    User getUserByUserName(String userName);
}
