package com.wyj.entity;

import java.sql.Timestamp;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月26日 下午9:04:12
 */
public class SysLogEntity extends BaseEntity {

    /**
     * 日志id
     */
    private Long logId;


    /**
     * 操作
     */
    private String operation;

    /**
     * 方法
     */
    private String method;

    /**
     * 参数
     */
    private String params;

    /**
     * 耗时
     */
    private Long time;

    /**
     * 创建时间
     */
    private Timestamp createTime;

    public Long getLogId() {
        return logId;
    }

    public void setLogId(Long logId) {
        this.logId = logId;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params;
    }

    public Long getTime() {
        return time;
    }

    public void setTime(Long time) {
        this.time = time;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

}
