package com.wyj.dao.system;

import java.util.List;

import com.wyj.dao.BaseMapper;
import com.wyj.entity.system.Role;

public interface RoleMapper extends BaseMapper<Role, Long>{
    
    List<String> listRoleSignByUserId(Long userId);
}
