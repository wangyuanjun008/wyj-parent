package com.wyj.dao.system;

import java.util.List;

import com.wyj.dao.BaseMapper;
import com.wyj.entity.system.RoleRelMenu;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月12日 下午3:24:44
 */
public interface RoleRelMenuMapper extends BaseMapper<RoleRelMenu, Long>{

    int batchRemoveByMenuId(Long[] id);
    
    int batchRemoveByRoleId(Long[] id);
    
    List<Long> listMenuIdByRoleId(Long id);
}
