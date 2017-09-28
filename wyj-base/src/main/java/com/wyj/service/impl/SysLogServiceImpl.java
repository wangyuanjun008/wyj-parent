package com.wyj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyj.dao.BaseMapper;
import com.wyj.dao.SysLogMapper;
import com.wyj.entity.SysLogEntity;
import com.wyj.service.SysLogService;


/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月26日 下午9:46:10
 */
@Service("sysLogService")
public class SysLogServiceImpl extends BaseServiceImpl<com.wyj.entity.SysLogEntity, Long> implements SysLogService {

	@Autowired
	private SysLogMapper sysLogMapper;

	@Override
	public BaseMapper<SysLogEntity, Long> getMapper() {
	    return sysLogMapper;
	}
	
    @Override
    public int batchRemoveAll() {
        int count = sysLogMapper.batchRemoveAll();
        return count;
    }
}
