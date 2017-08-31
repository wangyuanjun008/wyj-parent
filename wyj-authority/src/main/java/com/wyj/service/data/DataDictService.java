package com.wyj.service.data;

import java.util.List;

import com.wyj.entity.data.DataDict;
/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年8月23日 下午11:53:56
 */
public interface DataDictService {

    public DataDict getDataDictById(Long dictId);

    public void saveDataDict(DataDict DataDict);

    public void removeDataDictById(Long dictId);

    public void updateDataDict(DataDict DataDict);

    public List<DataDict> listDataDict();
}
