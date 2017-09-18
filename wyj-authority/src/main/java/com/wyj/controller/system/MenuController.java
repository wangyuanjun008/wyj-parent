package com.wyj.controller.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyj.entity.system.Menu;
import com.wyj.service.system.MenuService;
import com.wyj.utils.Retval;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年8月23日 下午11:45:50
 */
@Controller
@RequestMapping(value = "/menu")
public class MenuController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    private String index() {
        return "/menu/menu";
    }

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String query(@RequestParam(value = "offset", required = true, defaultValue = "1") Integer page, @RequestParam(value = "limit", required = false, defaultValue = "10") Integer pageSize, Long parentId) {
        PageHelper.startPage(page, pageSize);
        List<Menu> menus = null;
        Menu menu = new Menu();
        menu.setParentId(parentId);
        menu.setType(1); //筛选菜单
        menus = menuService.list(menu);
        PageInfo<Menu> pageInfo = new PageInfo<Menu>(menus);
        return JSON.toJSONString(pageInfo.getList());
    }

    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Retval save(Menu menu) {
        Retval retval = Retval.newInstance();
        try {
            if (menu.getMenuId() == null) {
                menu.setType(1); //菜单标识
                menuService.save(menu);
            } else {
                menuService.update(menu);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return retval;
    }

    @ResponseBody
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Retval edit(@PathVariable String id) {
        Retval retval = Retval.newInstance();
        Menu menu = menuService.getObjectById(Long.valueOf(id));
        retval.put("obj", menu);
        return retval;
    }

    @ResponseBody
    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public Retval remove(@RequestParam Long[] ids) {
        Retval retval = Retval.newInstance();
        try {
            menuService.batchRemove(ids);

        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            retval.fail(e.getMessage());
        }
        return retval;
    }

    /**
     * 加载树
     * 
     * @param id
     * @param type
     * @return
     */
//    @ResponseBody
//    @RequestMapping(value = "/renderTree", method = RequestMethod.GET)
//    public List<Map<String, Object>> renderTree(Long id, String type) {
//        List<Map<String, Object>> returnList = new ArrayList<Map<String, Object>>();
//        // 加载根节点
//        if (StringUtils.isEmpty(id)) {
//            Map<String, Object> root = new HashMap<String, Object>();
//
//            root.put("id", 0);// 根节点的ID
//            root.put("name", "权限管理系统"); // 根节点的名字
//            root.put("isParent", true);//// 设置根节点为父节点
//
//            // 加载一级节点
//            List<Map<String, Object>> returnList1 = new ArrayList<Map<String, Object>>();
//
//            List<Menu> menus = menuService.listOneNodeMenus();
//            for (Menu menu : menus) {
//                Map<String, Object> node = new HashMap<String, Object>();
//                node.put("id", menu.getMenuId());
//                node.put("name", menu.getName());
//                node.put("isParent", menuService.isSubNodeById(menu.getMenuId(),1));
//                returnList1.add(node);
//            }
//
//            root.put("children", returnList1);
//            returnList.add(root);
//            return returnList;
//        }
//
//        // 加载子节点
//        List<Menu> menus = null;
//        if (id != null && id > 0L) {
//            menus = menuService.listSubMenuByParentId(id,1);
//            for (Menu menu : menus) {
//                Map<String, Object> node = new HashMap<String, Object>();
//                node.put("id", menu.getMenuId());
//                node.put("name", menu.getName());
//                node.put("isParent", menuService.isSubNodeById(menu.getMenuId(),1));
//                returnList.add(node);
//            }
//        }
//        return returnList;
//    }
    
    @ResponseBody
    @RequestMapping(value = "/renderTree", method = RequestMethod.GET)
    public List<Menu> renderTree() {
        Menu menu = new Menu();
        menu.setType(1);
        return menuService.list(menu);
    }

}
