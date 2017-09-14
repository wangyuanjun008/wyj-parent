package com.wyj.service.system.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyj.dao.BaseMapper;
import com.wyj.dao.system.RoleMapper;
import com.wyj.entity.system.Role;
import com.wyj.service.impl.BaseServiceImpl;
import com.wyj.service.system.RoleService;
import com.wyj.service.system.UserRelRoleService;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月7日 上午11:06:57
 */
@Service(value = "RoleService")
public class RoleServiceImpl extends BaseServiceImpl<Role, Long> implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private UserRelRoleService userRelRoleService;

    @Override
    public BaseMapper<Role, Long> getMapper() {
        return roleMapper;
    }

    @Override
    public int batchRemoveRole(Long[] ids) {
        int count = roleMapper.batchRemove(ids);
        userRelRoleService.batchRemoveByRoleId(ids);
        return count;
    }

}
