package com.wyj.controller.login;

import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wyj.entity.Retval;
import com.wyj.entity.system.Menu;
import com.wyj.service.system.MenuService;
import com.wyj.service.system.UserService;
import com.wyj.utils.ShiroUtils;

@Controller
public class LoginController {

    @Autowired
    private MenuService menuService;
    
    @RequestMapping("/index")
    public String index() {
        return "login";
    }

    @RequestMapping("/public")
    public ModelAndView index1() {
        ModelAndView modelAndView=new ModelAndView("public");
        List<Menu> menus = menuService.listAllMenuIdByUserId(ShiroUtils.getUserId());
        modelAndView.addObject("menus",menus);
        
        return modelAndView;
    }
    
    /**
     * 登录
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/login",method=RequestMethod.POST)
    public Retval login(String userName,String password) {
        Retval retval = Retval.newInstance();
        Subject subject = ShiroUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
        try {
            subject.login(token);
            
        }catch (UnknownAccountException e) {
            retval.fail(e.getMessage());
        }catch (IncorrectCredentialsException e) {
            retval.fail(e.getMessage());
        }catch (LockedAccountException e) {
            retval.fail(e.getMessage());
        }catch (AuthenticationException e) {
            retval.fail("账户验证失败");
        }
        
        return retval;
    }
}
