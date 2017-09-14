package com.wyj.controller;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wyj.entity.system.User;
import com.wyj.service.system.UserService;
import com.wyj.utils.Retval;

@Controller
public class IndexController {

    @Autowired
    private UserService userService;

    @RequestMapping("/index")
    public String index() {
        return "login";
    }

    @RequestMapping("/public")
    public String index1() {
        
        
        
        
        return "public";
    }
    
    @ResponseBody
    @RequestMapping(value="/login",method=RequestMethod.POST)
    public String login(User user) {
        Retval retval = Retval.newInstance();
        List<User> users = userService.list(user);

        if (CollectionUtils.isEmpty(users)) {
            return "fail";
        }
        return "success";
    }
}
