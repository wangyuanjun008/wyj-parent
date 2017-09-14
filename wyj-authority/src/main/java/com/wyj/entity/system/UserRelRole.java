package com.wyj.entity.system;

import com.wyj.entity.BaseEntity;

/**
 * 用户关联角色
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月5日 下午4:09:50
 */
public class UserRelRole extends BaseEntity {

    private Long userRelRoleId;

    private Long userId;

    private Long roleId;

    public Long getUserRelRoleId() {
        return userRelRoleId;
    }

    public void setUserRelRoleId(Long userRelRoleId) {
        this.userRelRoleId = userRelRoleId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

}
