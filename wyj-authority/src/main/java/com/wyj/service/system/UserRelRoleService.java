package com.wyj.service.system;

import java.util.List;

import com.wyj.entity.system.UserRelRole;
import com.wyj.service.BaseService;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月12日 下午4:08:16
 */
public interface UserRelRoleService extends BaseService<UserRelRole, Long>{

    public void removeByUserId(Long userId);

    public void batchRemoveByUserId(Long[] userIds);

    public void batchRemoveByRoleId(Long[] roleIds);

    public List<Long> listRoleIdByUserId(Long userId);
}
