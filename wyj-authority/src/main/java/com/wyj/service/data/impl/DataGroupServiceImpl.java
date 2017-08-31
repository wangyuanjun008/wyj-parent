package com.wyj.service.data.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyj.dao.data.DataGroupDao;
import com.wyj.entity.data.DataGroup;
import com.wyj.service.data.DataGroupService;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年8月23日 下午11:54:13
 */
@Service(value = "DataGroupService")
public class DataGroupServiceImpl implements DataGroupService {

    @Autowired
    private DataGroupDao dataGroupDao;

    @Override
    public DataGroup getDataGroupById(Long groupId) {
        return dataGroupDao.getDataGroupById(groupId);
    }

    @Override
    public void saveDataGroup(DataGroup dataGroup) {
        dataGroupDao.saveDataGroup(dataGroup);
    }

    @Override
    public void removeDataGroupById(Long groupId) {
        dataGroupDao.removeDataGroupById(groupId);
    }

    @Override
    public void updateDataGroup(DataGroup dataGroup) {
        dataGroupDao.updateDataGroup(dataGroup);
    }

    @Override
    public List<DataGroup> listDataGroup() {
        return dataGroupDao.listDataGroup();
    }

}
