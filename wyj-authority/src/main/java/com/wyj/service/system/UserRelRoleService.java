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
public interface UserRelRoleService extends BaseService<UserRelRole, Long> {

    void removeByUserId(Long userId);

    void batchRemoveByUserId(Long[] userIds);

    void batchRemoveByRoleId(Long[] roleIds);

    List<Long> listRoleIdByUserId(Long userId);
}
