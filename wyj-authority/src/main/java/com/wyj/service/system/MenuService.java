package com.wyj.service.system;

import java.util.List;

import com.wyj.entity.system.Menu;
import com.wyj.service.BaseService;

public interface MenuService extends BaseService<Menu, Long>{

    
    /**
     * 是否有子节点
     * @param menuId
     * @return true:有  false 无
     */
    public Boolean isSubNodeById(Long menuId);
    
    /**
     * 根据父节点查找子节点
     * @param menuId
     * @return
     */
    public List<Menu> listSubMenuByParentId(Long menuId);
    
    /**
     * 查找一级节点
     * @return
     */
    public List<Menu> listOneNodeMenus();
    
    public int batchRemoveMenu(Long[] ids);
}
