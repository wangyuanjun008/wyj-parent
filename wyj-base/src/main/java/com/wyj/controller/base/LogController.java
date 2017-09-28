package com.wyj.controller.base;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyj.entity.Retval;
import com.wyj.entity.SysLogEntity;
import com.wyj.service.SysLogService;
/**
 * 日志
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月28日 下午10:45:48
 */
@Controller
@RequestMapping(value = "/log")
public class LogController {
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private SysLogService sysLogService;
    
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    private String index() {
        return "/log/log";
    }
    
    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String query(@RequestParam(value = "offset", required = true, defaultValue = "1") Integer page, @RequestParam(value = "limit", required = false, defaultValue = "10") Integer pageSize) {
        PageHelper.startPage(page, pageSize);
        List<SysLogEntity> sysLogEntities = sysLogService.list();
        PageInfo<SysLogEntity> pageInfo = new PageInfo<SysLogEntity>(sysLogEntities);
        return JSON.toJSONString(pageInfo.getList());
    }
    
    @ResponseBody
    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public Retval remove(@RequestParam Long[] ids) {
        Retval retval = Retval.newInstance();
        try {
            sysLogService.batchRemove(ids);

        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            retval.fail(e.getMessage());
        }
        return retval;
    }
    
}
