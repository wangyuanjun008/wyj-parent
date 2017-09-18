package com.wyj.service.system;

import java.util.List;

import com.wyj.entity.system.RoleRelMenu;
import com.wyj.service.BaseService;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月18日 下午4:27:22
 */
public interface RoleRelMenuService extends BaseService<RoleRelMenu, Long>{
    
    int batchRemoveByMenuId(Long[] id);
    
    int batchRemoveByRoleId(Long[] id);
    
    List<Long> listMenuIdByRoleId(Long id);
}
