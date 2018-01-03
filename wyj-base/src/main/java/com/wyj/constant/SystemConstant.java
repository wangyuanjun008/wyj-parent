package com.wyj.constant;

/**
 * 静态变量
 * 
 * 
 * @author：WangYuanJun
 * @date：2017年9月19日 上午11:21:04
 */
public class SystemConstant {
	
	/**
	 * 菜单类型
	 *
	 */
    public enum MenuType {
        /**
         * 目录
         */
    	CATALOG(0),
        /**
         * 菜单
         */
        MENU(1),
        /**
         * 按钮
         */
        BUTTON(2);

        private int value;

        private MenuType(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }

}
