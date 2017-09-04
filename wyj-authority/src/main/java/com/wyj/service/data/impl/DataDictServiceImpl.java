package com.wyj.service.data.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyj.dao.data.DataDictDao;
import com.wyj.entity.data.DataDict;
import com.wyj.service.data.DataDictService;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年8月23日 下午11:54:08
 */
@Service(value = "DataDictServic")
public class DataDictServiceImpl implements DataDictService {

    @Autowired
    private DataDictDao dataDictDao;

    @Override
    public DataDict getDataDictById(Long dictId) {
        return dataDictDao.getDataDictById(dictId);
    }

    @Override
    public void saveDataDict(DataDict DataDict) {
        dataDictDao.saveDataDict(DataDict);
    }

    @Override
    public void removeDataDictById(Long dictId) {
        dataDictDao.removeDataDictById(dictId);
    }

    @Override
    public void updateDataDict(DataDict DataDict) {
        dataDictDao.updateDataDict(DataDict);
    }

    @Override
    public List<DataDict> listDataDict(DataDict dataDict) {
        return dataDictDao.listDataDict(dataDict);
    }

    @Override
    public List<Map<Long, String>> getDataDictByGroupCode(String groupCode) {
        return dataDictDao.getDataDictByGroupCode(groupCode);
    }

}
