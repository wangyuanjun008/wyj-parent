package com.wyj.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyj.entity.data.DataGroup;
import com.wyj.service.data.DataGroupService;
import com.wyj.utils.Retval;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年8月23日 下午11:46:36
 */
@Controller
@RequestMapping(value = "/dataGroup")
public class DataGroupController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DataGroupService dataGroupService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    private String index() {
        return "/data/dataGroup";
    }

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String query(@RequestParam(value = "offset", required = true, defaultValue = "1") Integer page, @RequestParam(value = "limit", required = false, defaultValue = "10") Integer pageSize) {
        PageHelper.startPage(page, pageSize);
        List<DataGroup> dataGroups = dataGroupService.listDataGroup();
        PageInfo<DataGroup> pageInfo = new PageInfo<DataGroup>(dataGroups);
        return JSON.toJSONString(pageInfo.getList());
    }

    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public void save(DataGroup dataGroup) {
        try {
            if(dataGroup.getGroupId() == null){
                dataGroupService.saveDataGroup(dataGroup);
            }else{
                dataGroupService.updateDataGroup(dataGroup);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Retval edit(@PathVariable String id) {
        Retval retval = Retval.newInstance();
        DataGroup dataGroup = dataGroupService.getDataGroupById(Long.valueOf(id));
        retval.put("obj", dataGroup);
        return retval;
    }

    @ResponseBody
    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public Retval remove(@RequestParam Long id) {
        Retval retval = Retval.newInstance();
        try {
            dataGroupService.removeDataGroupById(id);

        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            retval.fail(e.getMessage());
        }
        return retval;
    }
}
