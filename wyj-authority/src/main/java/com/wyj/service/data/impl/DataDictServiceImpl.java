package com.wyj.service.data.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyj.dao.BaseMapper;
import com.wyj.dao.data.DataDictMapper;
import com.wyj.entity.data.DataDict;
import com.wyj.service.data.DataDictService;
import com.wyj.service.impl.BaseServiceImpl;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年8月23日 下午11:54:08
 */
@Service(value = "DataDictServic")
public class DataDictServiceImpl extends BaseServiceImpl<DataDict, Long> implements DataDictService {

    @Autowired
    private DataDictMapper dataDictMapper;

    @Override
    public BaseMapper<DataDict, Long> getMapper() {
        return dataDictMapper;
    }

    @Override
    public List<Map<Long, String>> getDataDictByGroupCode(String groupCode) {
        return dataDictMapper.getDataDictByGroupCode(groupCode);
    }

}
