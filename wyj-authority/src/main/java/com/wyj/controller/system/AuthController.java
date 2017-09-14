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
import com.wyj.entity.data.DataGroup;
import com.wyj.entity.system.Auth;
import com.wyj.entity.system.Menu;
import com.wyj.service.system.AuthService;
import com.wyj.service.system.MenuService;
import com.wyj.utils.Retval;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月14日 下午3:41:04
 */
@Controller
@RequestMapping(value = "/auth")
public class AuthController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private AuthService authService;

    @Autowired
    private MenuService menuService;
    
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    private String index() {
        return "/auth/auth";
    }

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String query(@RequestParam(value = "offset", required = true, defaultValue = "1") Integer page, @RequestParam(value = "limit", required = false, defaultValue = "10") Integer pageSize,Long menuId) {
        PageHelper.startPage(page, pageSize);
        Menu menu = new Menu();
        menu.setMenuId(menuId);
        Auth auth = new Auth();
        auth.setMenu(menu);
        List<Auth> auths = authService.list(auth);
        PageInfo<Auth> pageInfo = new PageInfo<Auth>(auths);
        return JSON.toJSONString(pageInfo.getList());
    }

    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Retval save(Auth auth) {
        Retval retval = Retval.newInstance();
        try {
            if(auth.getAuthId() == null){
                authService.save(auth);
            }else{
                authService.update(auth);
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
        Auth auth = authService.getObjectById(Long.valueOf(id));
        retval.put("obj", auth);
        return retval;
    }
    
    @ResponseBody
    @RequestMapping(value="/remove",method=RequestMethod.POST)
    public Retval remove(@RequestParam Long[] ids){
        Retval retval = Retval.newInstance();
        try {
            authService.batchRemoveAuth(ids);
            
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            retval.fail(e.getMessage());
        }
        return retval;
    }
    
}
