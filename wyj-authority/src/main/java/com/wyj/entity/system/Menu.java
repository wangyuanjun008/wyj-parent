package com.wyj.entity.system;

import java.util.Date;
import java.util.List;

import com.wyj.entity.BaseEntity;

/**
 * 菜单
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月7日 下午2:44:36
 */
public class Menu extends BaseEntity {

    private Long menuId; // 菜单id

    private Long parentId; // 父级id

    private String name;// 菜单名称

    private String url;// 菜单url

    private String perms;// 授权标识(多个用逗号分隔，如：user:list,user:create)

    // private Integer type;// 类型(0：目录 1：菜单 2：按钮)

    private Integer orderNum;// 排序

    private Integer isUse;// 是否使用

    private Date createTime;

    private Long createUserId;

    private Date modifyTime;

    private Long modifyUserId;

    private List<?> menuDtls;

    private List<Auth> auths;
    
    public Long getMenuId() {
        return menuId;
    }

    public void setMenuId(Long menuId) {
        this.menuId = menuId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPerms() {
        return perms;
    }

    public void setPerms(String perms) {
        this.perms = perms;
    }

    // public Integer getType() {
    // return type;
    // }
    //
    // public void setType(Integer type) {
    // this.type = type;
    // }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
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

    public Integer getIsUse() {
        return isUse;
    }

    public void setIsUse(Integer isUse) {
        this.isUse = isUse;
    }

    public List<?> getMenuDtls() {
        return menuDtls;
    }

    public void setMenuDtls(List<?> menuDtls) {
        this.menuDtls = menuDtls;
    }

    public List<Auth> getAuths() {
        return auths;
    }

    public void setAuths(List<Auth> auths) {
        this.auths = auths;
    }

}
