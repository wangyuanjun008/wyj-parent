package com.wyj.service;

import com.wyj.entity.SysLogEntity;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月26日 下午9:35:42
 */
public interface SysLogService extends BaseService<SysLogEntity, Long>{

	int batchRemoveAll();
}
