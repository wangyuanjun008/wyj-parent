package com.wyj.entity.system;

import java.util.Date;

import com.wyj.entity.BaseEntity;

/**
 * 权限
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月5日 下午4:22:18
 */
public class Auth extends BaseEntity {

    private Long authId;

    private String authName;// 权限名

    private String authSign;// 权限标识(user:create)

    private Menu menu;// 菜单

    private Integer orderNum;// 排序
    
    private Date createTime;

    private Long createUserId;

    private Date modifyTime;

    private Long modifyUserId;

    // private List<Role> roles;

    public Long getAuthId() {
        return authId;
    }

    public void setAuthId(Long authId) {
        this.authId = authId;
    }

    public String getAuthName() {
        return authName;
    }

    public void setAuthName(String authName) {
        this.authName = authName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Long createUserId) {
        this.createUserId = createUserId;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Long getModifyUserId() {
        return modifyUserId;
    }

    public void setModifyUserId(Long modifyUserId) {
        this.modifyUserId = modifyUserId;
    }

    public String getAuthSign() {
        return authSign;
    }

    public void setAuthSign(String authSign) {
        this.authSign = authSign;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    // public List<Role> getRoles() {
    // return roles;
    // }
    //
    // public void setRoles(List<Role> roles) {
    // this.roles = roles;
    // }

}
