<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>测试</title>
<link href="${bathPath}/plugins/fullPage/jquery.fullPage.css" rel="stylesheet" />
<link href="${bathPath}/plugins/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet" />
<link href="${bathPath}/plugins/material-design-iconic-font-2.2.0/css/material-design-iconic-font.min.css" rel="stylesheet" />
<link href="${bathPath}/plugins/waves-0.7.5/waves.min.css" rel="stylesheet" />
<link href="${bathPath}/plugins/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet" />
<link href="${bathPath}/css/admin.css" rel="stylesheet" />
<link href="${bathPath}/plugins/jquery-confirm/jquery-confirm.min.css" rel="stylesheet" />
<style>
/** skins **/
#wyj_auth_server #header {
	background: #3c8dbc;
}

#wyj_auth_server .content_tab {
	background: #3c8dbc;
}

#wyj_auth_server .s-profile>a {
	background: url(${bathPath}/images/wyj_upms.png) left top no-repeat;
}

#wyj_ucenter_home #header {
	background: #6539B4;
}

#wyj_ucenter_home .content_tab {
	background: #6539B4;
}

#wyj_ucenter_home .s-profile>a {
	background: url(${bathPath}/images/wyj_ucenter.png) left top no-repeat;
}

.mCSB_containe {
	background: #1e282c;
}
</style>
</head>
<body>
	<header id="header">
		<ul id="menu">
			<li id="guide" class="line-trigger">
				<div class="line-wrap">
					<div class="line top"></div>
					<div class="line center"></div>
					<div class="line bottom"></div>
				</div>
			</li>
			<li id="logo" class="hidden-xs"><a href="index.html"> < <%-- 			<img src="${bathPath}/images/logo.png" /> --%>
			</a> <span id="system_title">权限管理系统</span></li>
			<li class="pull-right">
				<ul class="hi-menu">
					<!-- 搜索 -->
					<li class="dropdown"><a class="waves-effect waves-light" data-toggle="dropdown" href="javascript:;"> <i class="him-icon zmdi zmdi-search"></i>
					</a>
						<ul class="dropdown-menu dm-icon pull-right">
							<form id="search-form" class="form-inline">
								<div class="input-group">
									<input id="keywords" type="text" name="keywords" class="form-control" placeholder="搜索" />
									<div class="input-group-btn">
										<button type="submit" class="btn btn-default">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</div>
								</div>
							</form>
						</ul></li>
					<li class="dropdown"><a class="waves-effect waves-light" data-toggle="dropdown" href="javascript:;"> <i class="him-icon zmdi zmdi-dropbox"></i>
					</a>
						<ul class="dropdown-menu dm-icon pull-right">
							<li class="skin-switch">请选择系统切换</li>
							<li class="divider"></li>
							<li><a class="waves-effect switch-systems" href="javascript:;" systemid="1" systemname="wyj_auth_server" systemtitle="权限管理系统"><i class="zmdi zmdi-shield-security"></i> 权限管理系统</a></li>

							<li><a class="waves-effect switch-systems" href="javascript:;" systemid="4" systemname="wyj_ucenter_home" systemtitle="用户管理系统"><i class="zmdi zmdi-account"></i> 用户管理系统</a></li>

						</ul></li>
					<li class="dropdown"><a class="waves-effect waves-light" data-toggle="dropdown" href="javascript:;"> <i class="him-icon zmdi zmdi-more-vert"></i>
					</a>
						<ul class="dropdown-menu dm-icon pull-right">
							<li class="hidden-xs"><a class="waves-effect" data-ma-action="fullscreen" href="javascript:fullPage();"><i class="zmdi zmdi-fullscreen"></i> 全屏模式</a></li>
							<li><a class="waves-effect" data-ma-action="clear-localstorage" href="javascript:;"><i class="zmdi zmdi-delete"></i> 清除缓存</a></li>
							<li><a class="waves-effect" data-toggle="modal" onclick="personInfo();"><i class="zmdi zmdi-account"></i> 修改密码</a></li>
							<li><a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-run"></i> 退出登录</a></li>
						</ul></li>
				</ul>
			</li>
		</ul>
	</header>
	<section id="main">
		<!-- 左侧导航区 -->
		<aside id="sidebar">
			<!-- 个人资料区 -->
			<div class="s-profile">
				<a class="waves-effect waves-light" href="javascript:;">
					<div class="sp-pic">
						<img src="${bathPath}/images/user.jpg" />
					</div>
					<div class="sp-info">
						小汪汪，您好！ <i class="zmdi zmdi-caret-down"></i>
					</div>
				</a>
			</div>
			<!-- /个人资料区 -->
			<!-- 菜单区 -->
			<ul class="main-menu"">
				<c:forEach items="${menus}" var="menu">
					<li class="sub-menu"><a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-collection-text"></i>${menu.name}</a>
						<ul>
							<c:choose>
								<c:when test="${menu.list != null}">
									<c:forEach items="${menu.list}" var="subMenu">
										<li><a class="waves-effect" href="javascript:Tab.addTab('${subMenu.name}', '${ctx}${subMenu.url }');">${subMenu.name}</a></li>
									</c:forEach>
								</c:when>
							</c:choose>

						</ul></li>
				</c:forEach>
				<li>
					<div class="upms-version">&copy; WYJ_auth V1.0.0</div>
				</li>
			</ul>
			<!-- /菜单区 -->
		</aside>
		<!-- /左侧导航区 -->
		<section id="content">
			<div class="content_tab">
				<div class="tab_left">
					<a class="waves-effect waves-light" href="javascript:;"><i class="zmdi zmdi-chevron-left"></i></a>
				</div>
				<div class="tab_right">
					<a class="waves-effect waves-light" href="javascript:;"><i class="zmdi zmdi-chevron-right"></i></a>
				</div>
				<ul id="tabs" class="tabs">
					<li id="tab_home" data-index="home" data-closeable="false" class="cur"><a class="waves-effect waves-light">首页</a></li>
				</ul>
			</div>
			<div class="content_main">
				<div id="iframe_home" class="iframe cur">
					<h3>&nbsp;&nbsp;&nbsp;项目介绍</h3>
					<ul>
						<li>一个轻量级的Java快速开发平台(框架)，能快速开发项目并交付</li>
						<li>友好的代码结构及注释，便于阅读及二次开发</li>
						<li>命名规范和工程分层规约参考阿里巴巴JAVA开发规范</li>
						<li>基于角色的权限管理，细分到按钮权限</li>
						<li>单点登录(SSO)，提供统一用户单点登录认证、用户鉴权功能</li>
						<li>用户会话管理，提供分布式用户会话管理</li>
						<li>操作日志管理，提供记录用户登录、操作等日志</li>
						<li>基于Maven模块化开发，可快速实现个性化业务模块</li>
					</ul>
					<h3>&nbsp;&nbsp;&nbsp;获取帮助</h3>
					<ul>
						<li>git地址：<a href="https://github.com/wangyuanjun008/wyj-parent.git" target="_blank">https://github.com/wangyuanjun008/wyj-parent.git</a></li>
						<li>如需关注项目最新动态，请Watch、Star项目，同时也是对项目最好的支持</li>
					</ul>
				</div>
			</div>
		</section>
	</section>
	<footer id="footer"></footer>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLable" aria-hidden="true">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
					<h4 class="modal-title" id="myModalLabel">修改密码</h4>
				</div>
				<div class="modal-body">
					<form method="get" id="saveForm" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-4 control-label"><span class="red">*</span>原密码:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="oldPassword">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label"><span class="red">*</span>新密码:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="newPassword">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label"><span class="red">*</span>再输入新密码:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="repeatNewPassword">
							</div>
						</div>

						<input type="hidden" name="createTime" /> <input type="hidden" name="createUserId" /> <input type="hidden" name="roleId" />
					</form>
				</div>
				<div class="modal-footer" style="border: none; margin-left: 40%; padding-bottom: 20px;">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updatePassword('${ctx}/user/updatePassword');">提交</button>
				</div>
			</div>
		</div>
	</div>


	<script src="${bathPath}/plugins/jquery-3.2.1/jquery-3.2.1.min.js"></script>
	<script src="${bathPath}/plugins/jquery-confirm/jquery-confirm.min.js"></script>
	<script src="${bathPath}/plugins/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<script src="${bathPath}/plugins/waves-0.7.5/waves.min.js"></script>
	<script src="${bathPath}/plugins/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="${bathPath}/plugins/BootstrapMenu.min.js"></script>
	<script src="${bathPath}/plugins/device.min.js"></script>
	<script src="${bathPath}/plugins/fullPage/jquery.fullPage.min.js"></script>
	<script src="${bathPath}/plugins/fullPage/jquery.jdirk.min.js"></script>
	<script src="${bathPath}/plugins/jquery.cookie.js"></script>
	<script src="${bathPath}/plugins/bootstrap-table-1.11.1/bootstrap-table.min.js"></script>
	<script src="${bathPath}/js/admin.js"></script>
</body>
</html>

