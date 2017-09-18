package com.wyj.dao.system;

import java.util.List;

import com.wyj.dao.BaseMapper;
import com.wyj.entity.system.UserRelRole;

/**
 * 
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月12日 下午3:24:44
 */
public interface UserRelRoleMapper extends BaseMapper<UserRelRole, Long> {

    void removeByUserId(Long userId);

    void batchRemoveByUserId(Long[] userIds);

    void batchRemoveByRoleId(Long[] roleIds);

    List<Long> listRoleIdByUserId(Long userId);
}
