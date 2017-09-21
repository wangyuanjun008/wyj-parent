package com.wyj.dao.system;

import java.util.List;

import com.wyj.dao.BaseMapper;
import com.wyj.entity.system.Menu;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月7日 下午9:00:45
 */
public interface MenuMapper extends BaseMapper<Menu, Long> {

    int countMenuChildren(Long parentId);
    
    List<String> listMenuPermsByUserId(Long userId);

    List<Long> listAllMenuIdByUserId(Long userId);
    
    List<Menu> listNotButton(Menu menu);
}
