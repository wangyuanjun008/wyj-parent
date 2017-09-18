package com.wyj.service.system.impl;

import java.util.List;

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
    public int batchRemoveMenu(Long[] ids) {
        // TODO Auto-generated method stub
        return 0;
    }
}
