package com.wyj.dao.data;

import java.util.List;
import java.util.Map;

import com.wyj.entity.data.DataDict;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年8月23日 下午9:51:12
 */
public interface DataDictDao {
    public DataDict getDataDictById(Long dictId);

    public void saveDataDict(DataDict DataDict);

    public void removeDataDictById(Long dictId);

    public void updateDataDict(DataDict DataDict);

    public List<DataDict> listDataDict(DataDict dataDict);
    
    public List<Map<Long, String>> getDataDictByGroupCode(String groupCode);
}
