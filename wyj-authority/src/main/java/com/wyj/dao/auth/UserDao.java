package com.wyj.dao.auth;

import java.util.List;

import com.wyj.entity.auth.User;

public interface UserDao {

    public User getUserById(Long userId);

    public void saveUser(User user);

    public void removeUserById(Long userId);

    public void updateUser(User user);

    public List<User> listUser();
}
