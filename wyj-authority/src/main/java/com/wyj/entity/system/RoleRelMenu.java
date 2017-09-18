package com.wyj.entity.system;

import com.wyj.entity.BaseEntity;

/**
 * 角色关联权限
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月5日 下午4:39:29
 */
public class RoleRelMenu extends BaseEntity {

    private Long roleRelMenuId;

    private Long roleId;

    private Long menuId;

    public Long getRoleRelMenuId() {
        return roleRelMenuId;
    }

    public void setRoleRelMenuId(Long roleRelMenuId) {
        this.roleRelMenuId = roleRelMenuId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getMenuId() {
        return menuId;
    }

    public void setMenuId(Long menuId) {
        this.menuId = menuId;
    }

}
