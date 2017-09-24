package com.wyj.service.data.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyj.dao.BaseMapper;
import com.wyj.dao.data.DataGroupMapper;
import com.wyj.entity.data.DataGroup;
import com.wyj.service.data.DataDictService;
import com.wyj.service.data.DataGroupService;
import com.wyj.service.impl.BaseServiceImpl;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年8月23日 下午11:54:13
 */
@Service(value = "DataGroupService")
public class DataGroupServiceImpl extends BaseServiceImpl<DataGroup, Long> implements DataGroupService {

    @Autowired
    private DataGroupMapper dataGroupMapper;
    
    @Autowired
    private DataDictService dataDictService;

    @Override
    public BaseMapper<DataGroup, Long> getMapper() {
        return dataGroupMapper;
    }

    @Override
    public int batchRemoveDataGroup(Long[] ids) {
        int count = dataGroupMapper.batchRemove(ids);
        dataDictService.batchRemoveByDataGroupId(ids);
        return count;
    }

}
