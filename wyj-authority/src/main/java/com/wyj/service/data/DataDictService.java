package com.wyj.service.data;

import java.util.List;
import java.util.Map;

import com.wyj.entity.data.DataDict;
import com.wyj.service.BaseService;
/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年8月23日 下午11:53:56
 */
public interface DataDictService extends BaseService<DataDict, Long>{

    /**
     * 数据字典下拉
     * @param groupCode
     * @return
     */
    public List<Map<Long, String>> getDataDictByGroupCode(String groupCode);
}
