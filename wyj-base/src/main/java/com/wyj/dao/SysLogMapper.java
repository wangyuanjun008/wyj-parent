package com.wyj.dao;

import org.mybatis.spring.annotation.MapperScan;

import com.wyj.entity.SysLogEntity;


/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月26日 下午9:09:21
 */
@MapperScan
public interface SysLogMapper extends BaseMapper<SysLogEntity,Long> {

	int batchRemoveAll();
	
}
