package com.wyj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Index {

    @RequestMapping("/index")
    public String index() {
        return "public";
    }
    
    @RequestMapping("/login")
    public String login() {
        return "login";
    }
}
