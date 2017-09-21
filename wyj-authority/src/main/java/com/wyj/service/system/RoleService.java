package com.wyj.service.system;

import java.util.Set;

import com.wyj.entity.system.Role;
import com.wyj.service.BaseService;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月7日 上午11:06:55
 */
public interface RoleService extends BaseService<Role, Long> {

    int batchRemoveRole(Long[] ids);

    Role getRoleById(Long roleId);

    int updateRoleAuthorization(Role role);
    
    Set<String> listRoleSignByUserId(Long userId);
}
