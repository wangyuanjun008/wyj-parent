package com.wyj.service.data;

import java.util.List;

import com.wyj.entity.data.DataGroup;
/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年8月23日 下午11:54:01
 */
public interface DataGroupService {

    public DataGroup getDataGroupById(Long groupId);

    public void saveDataGroup(DataGroup dataGroup);

    public void removeDataGroupById(Long groupId);

    public void updateDataGroup(DataGroup dataGroup);

    public List<DataGroup> listDataGroup();
}
