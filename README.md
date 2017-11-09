# wyj-parent
基于SSM框架的轻量级开发框架，已经完成基于角色的操作权限管理，对前后端进行封装，可快速实现CRUD的开发。项目采用Maven多模块构建，方便按需求进行模块化扩展。

### 项目介绍
- 一个轻量级的Java快速开发框架，能快速开发项目并交付（规划后期不定时发布更新）
- 友好的代码结构及注释，便于阅读及二次开发，命名规范和工程分层规约参考阿里巴巴JAVA开发规范
- 前后端开发封装，快速实现CRUD开发
- 基于角色的权限管理，细分到按钮权限（规划将支持数据权限）
- 基于Maven模块化开发，可快速扩展个性化业务模块
### 技术方案
- 核心框架：Spring
- WEB框架：SpringMVC
- ORM框架：Mybatis
- 安全框架：Shiro
- 主页框架：Bootstrap
- JS框架：jquery.js
- 表格插件：bootstrap-table
- 树形插件：ztree
- 表单校验：jquery.validator
### 项目结构
- wyj-parent：父级（聚合）模块
- wyj-base：公共通用模块
- wyj-authority：权限模块、通用字典和系统日志功能模块
### 命名规范（参考阿里巴巴Java开发手册）
-  获取单个对象的方法用 get 做前缀
-  获取多个对象的方法用 list 做前缀
-  获取统计值的方法用 count 做前缀
-  插入的方法用 save(推荐) 或 insert 做前缀
-  删除的方法用 remove(推荐) 或 delete 做前缀
-  修改的方法用 update 做前缀
### 运行效果
![image](https://github.com/wangyuanjun008/wyj-parent/raw/master/images/login.png)
![image](https://github.com/wangyuanjun008/wyj-parent/raw/master/images/homepage.png)
![image](https://github.com/wangyuanjun008/wyj-parent/raw/master/images/user.png)
![image](https://github.com/wangyuanjun008/wyj-parent/raw/master/images/user1.png)
![image](https://github.com/wangyuanjun008/wyj-parent/raw/master/images/role.png)
![image](https://github.com/wangyuanjun008/wyj-parent/raw/master/images/role1.png)
![image](https://github.com/wangyuanjun008/wyj-parent/raw/master/images/role2.png)
![image](https://github.com/wangyuanjun008/wyj-parent/raw/master/images/menu.png)
![image](https://github.com/wangyuanjun008/wyj-parent/raw/master/images/auth.png)
![image](https://github.com/wangyuanjun008/wyj-parent/raw/master/images/datagroup.png)
![image](https://github.com/wangyuanjun008/wyj-parent/raw/master/images/datadict.png)
![image](https://github.com/wangyuanjun008/wyj-parent/raw/master/images/log.png)