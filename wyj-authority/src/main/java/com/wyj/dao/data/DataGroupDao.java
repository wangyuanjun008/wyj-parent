package com.wyj.dao.data;

import java.util.List;

import com.wyj.entity.data.DataGroup;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年8月23日 下午9:51:26
 */
public interface DataGroupDao {
    public DataGroup getDataGroupById(Long groupId);

    public void saveDataGroup(DataGroup dataGroup);

    public void removeDataGroupById(Long groupId);

    public void updateDataGroup(DataGroup dataGroup);

    public List<DataGroup> listDataGroup();
}
