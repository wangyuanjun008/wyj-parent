package com.wyj.service.system;

import com.wyj.entity.system.User;
import com.wyj.service.BaseService;

public interface UserService extends BaseService<User, Long>{

    public int saveUser(User user);
    
    public int updateUser(User user);
    
    public int batchRemoveUser(Long[] userIds);
    
    public User getUserById(Long userId);
}
