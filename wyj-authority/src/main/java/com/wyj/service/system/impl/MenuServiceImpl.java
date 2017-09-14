package com.wyj.service.system.impl;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyj.dao.BaseMapper;
import com.wyj.dao.system.MenuMapper;
import com.wyj.entity.system.Menu;
import com.wyj.service.impl.BaseServiceImpl;
import com.wyj.service.system.MenuService;

@Service(value = "MenuService")
public class MenuServiceImpl extends BaseServiceImpl<Menu, Long> implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public BaseMapper<Menu, Long> getMapper() {
        return menuMapper;
    }

    @Override
    public Boolean isSubNodeById(Long menuId) {
        Menu menu = new Menu();
        menu.setParentId(menuId);
        List<Menu> menus = menuMapper.list(menu);
        if (CollectionUtils.isEmpty(menus)) {
            return false;
        }
        return true;
    }

    @Override
    public List<Menu> listSubMenuByParentId(Long menuId) {
        Menu menu = new Menu();
        menu.setParentId(menuId);
        return menuMapper.list(menu);
    }

    @Override
    public List<Menu> listOneNodeMenus() {
        return menuMapper.listOneNodeMenus();
    }

    @Override
    public int batchRemoveMenu(Long[] ids) {
        // TODO Auto-generated method stub
        return 0;
    }



}
