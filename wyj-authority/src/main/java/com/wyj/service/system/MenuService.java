package com.wyj.service.system;

import com.wyj.entity.system.Menu;
import com.wyj.service.BaseService;

public interface MenuService extends BaseService<Menu, Long> {

    int batchRemoveMenu(Long[] ids);

}
