package com.wyj.service.system;

import java.util.List;
import java.util.Set;

import com.wyj.entity.Retval;
import com.wyj.entity.system.Menu;
import com.wyj.service.BaseService;

public interface MenuService extends BaseService<Menu, Long> {

    Retval batchRemoveMenu(Long[] ids);
    
    /**
     * 是否有子节点
     * @param parentIds
     * @return
     */
    Boolean isSubNodeByParentId(Long[] parentIds);
    
    
    Set<String> listMenuPermsByUserId(Long userId);
    
    List<Menu> listAllMenuIdByUserId(Long userId);
    
    List<Menu> listNotButton(Menu menu);
}
