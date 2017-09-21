package com.wyj.enums;
/**
 * 菜单类型
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月21日 下午1:32:37
 */
public enum MenuTypeEnum implements BaseEnum {
    
    CATALOG("目录"), MENU("菜单"), BUTTON("按钮");
    
    private String content;

    private MenuTypeEnum(String name) {
        this.content = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
