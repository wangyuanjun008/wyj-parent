package com.wyj.service.system.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wyj.dao.BaseMapper;
import com.wyj.dao.system.UserMapper;
import com.wyj.entity.system.User;
import com.wyj.service.impl.BaseServiceImpl;
import com.wyj.service.system.UserRelRoleService;
import com.wyj.service.system.UserService;

@Service(value = "UserService")
@Transactional
public class UserServiceImpl extends BaseServiceImpl<User, Long> implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public BaseMapper<User, Long> getMapper() {
        return userMapper;
    }

    @Autowired
    private UserRelRoleService userRelRoleService;

    @Override
    public int saveUser(User user) {
        int count = userMapper.save(user);
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("userId", user.getUserId());
        hashMap.put("roles", user.getRoles());
        userRelRoleService.save(hashMap);
        return count;
    }

    @Override
    public int updateUser(User user) {
        int count = userMapper.update(user);
        Long userId = user.getUserId();
        userRelRoleService.removeByUserId(userId);
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("userId", userId);
        hashMap.put("roles", user.getRoles());
        userRelRoleService.save(hashMap);
        return count;
    }

    @Override
    public int batchRemoveUser(Long[] userIds) {
        int count = userMapper.batchRemove(userIds);
        userRelRoleService.batchRemoveByUserId(userIds);
        return count;
    }

    @Override
    public User getUserById(Long userId) {
        User user = userMapper.getObjectById(userId);
        user.setRoles(userRelRoleService.listRoleIdByUserId(userId));
        return user;
    }

    @Override
    public User getUserByUserName(String userName) {
        return userMapper.getUserByUserName(userName);
    }

}
