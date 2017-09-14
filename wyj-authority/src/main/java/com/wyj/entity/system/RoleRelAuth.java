package com.wyj.entity.system;

import com.wyj.entity.BaseEntity;

/**
 * 角色关联权限
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月5日 下午4:39:29
 */
public class RoleRelAuth extends BaseEntity {

    private Long roleRelAuthId;

    private Long roleId;

    private Long authId;

    public Long getRoleRelAuthId() {
        return roleRelAuthId;
    }

    public void setRoleRelAuthId(Long roleRelAuthId) {
        this.roleRelAuthId = roleRelAuthId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getAuthId() {
        return authId;
    }

    public void setAuthId(Long authId) {
        this.authId = authId;
    }

}
