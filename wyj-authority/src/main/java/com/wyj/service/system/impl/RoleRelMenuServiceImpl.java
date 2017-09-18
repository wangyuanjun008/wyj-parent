package com.wyj.service.system.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyj.dao.BaseMapper;
import com.wyj.dao.system.RoleRelMenuMapper;
import com.wyj.entity.system.RoleRelMenu;
import com.wyj.service.impl.BaseServiceImpl;
import com.wyj.service.system.RoleRelMenuService;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月18日 下午4:29:52
 */
@Service(value="RoleRelMenuService")
public class RoleRelMenuServiceImpl extends BaseServiceImpl<RoleRelMenu, Long> implements RoleRelMenuService {

    @Autowired
    private RoleRelMenuMapper roleRelMenuMapper;

    @Override
    public BaseMapper<RoleRelMenu, Long> getMapper() {
        return roleRelMenuMapper;
    }

    @Override
    public int batchRemoveByMenuId(Long[] id) {
        return roleRelMenuMapper.batchRemoveByMenuId(id);
    }

    @Override
    public int batchRemoveByRoleId(Long[] id) {
        return roleRelMenuMapper.batchRemoveByRoleId(id);
    }

    @Override
    public List<Long> listMenuIdByRoleId(Long id) {
        return roleRelMenuMapper.listMenuIdByRoleId(id);
    }

}
