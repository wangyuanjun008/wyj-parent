package com.wyj.service.system.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyj.dao.BaseMapper;
import com.wyj.dao.system.AuthMapper;
import com.wyj.entity.system.Auth;
import com.wyj.service.impl.BaseServiceImpl;
import com.wyj.service.system.AuthService;

@Service(value = "AuthService")
public class AuthServiceImpl extends BaseServiceImpl<Auth, Long> implements AuthService {

    @Autowired
    private AuthMapper authMapper;

    @Override
    public BaseMapper<Auth, Long> getMapper() {
        return authMapper;
    }

    @Override
    public int batchRemoveAuth(Long[] authIds) {
        int count = authMapper.batchRemove(authIds);
        return count;
    }

    @Override
    public Boolean isSubNodeById(Long authId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Auth> listSubMenuByParentId(Long authId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Auth> listOneNodeMenus() {
        // TODO Auto-generated method stub
        return null;
    }

}
