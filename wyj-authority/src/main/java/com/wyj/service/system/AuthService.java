package com.wyj.service.system;

import java.util.List;

import com.wyj.entity.system.Auth;
import com.wyj.service.BaseService;

public interface AuthService extends BaseService<Auth, Long> {

    public int batchRemoveAuth(Long[] authIds);
    
    /**
     * 是否有子节点
     * @param menuId
     * @return true:有  false 无
     */
    public Boolean isSubNodeById(Long authId);
    
    /**
     * 根据父节点查找子节点
     * @param menuId
     * @return
     */
    public List<Auth> listSubMenuByParentId(Long authId);
    
    /**
     * 查找一级节点
     * @return
     */
    public List<Auth> listOneNodeMenus();
}
