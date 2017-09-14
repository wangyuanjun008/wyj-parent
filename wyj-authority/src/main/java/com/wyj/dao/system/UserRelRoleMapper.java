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
public interface UserRelRoleMapper extends BaseMapper<UserRelRole, Long>{


    public void removeByUserId(Long userId);

    public void batchRemoveByUserId(Long[] userIds);

    public void batchRemoveByRoleId(Long[] roleIds);

    public List<Long> listRoleIdByUserId(Long userId);
}
