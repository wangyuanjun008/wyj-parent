package com.wyj.entity.data;

import com.wyj.entity.base.BaseEntity;

/**
 * 数据字典
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年8月23日 下午5:25:22
 */
public class DataDict extends BaseEntity {
    /*
     * 分组Id
     */
    private Long dictId;//

    private String dictCode;// 编码

    private String dictName;// 名称

    // private String groupCode;// 分组编码

    private DataGroup dataGroup;

    private String remark;// 描述

    private String status;// 使用状态

    private Long dictParentId;//

    public Long getDictId() {
        return dictId;
    }

    public void setDictId(Long dictId) {
        this.dictId = dictId;
    }

    public String getDictCode() {
        return dictCode;
    }

    public void setDictCode(String dictCode) {
        this.dictCode = dictCode;
    }

    public String getDictName() {
        return dictName;
    }

    public void setDictName(String dictName) {
        this.dictName = dictName;
    }

    public DataGroup getDataGroup() {
        return dataGroup;
    }

    public void setDataGroup(DataGroup dataGroup) {
        this.dataGroup = dataGroup;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getDictParentId() {
        return dictParentId;
    }

    public void setDictParentId(Long dictParentId) {
        this.dictParentId = dictParentId;
    }

}
