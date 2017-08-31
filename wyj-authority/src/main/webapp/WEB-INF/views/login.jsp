<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>登录页</title>

	<link href="${bathPath}/plugins/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="${bathPath}/plugins/material-design-iconic-font-2.2.0/css/material-design-iconic-font.min.css" rel="stylesheet"/>
	<link href="${bathPath}/plugins/waves-0.7.5/waves.min.css" rel="stylesheet"/>
	<link href="${bathPath}/plugins/checkbix/css/checkbix.min.css" rel="stylesheet"/>
	<link href="${bathPath}/css/login.css" rel="stylesheet"/>
</head>
<body>
<div id="login-window">
	<div class="input-group m-b-20">
		<span class="input-group-addon"><i class="zmdi zmdi-account"></i></span>
		<div class="fg-line">
			<input id="username" type="text" class="form-control" name="username" placeholder="帐号" required autofocus value="admin">
		</div>
	</div>
	<div class="input-group m-b-20">
		<span class="input-group-addon"><i class="zmdi zmdi-male"></i></span>
		<div class="fg-line">
			<input id="password" type="password" class="form-control" name="password" placeholder="密码" required value="123456">
		</div>
	</div>
	<div class="clearfix">
	</div>
	<div class="checkbox">
		<input id="rememberMe" type="checkbox" class="checkbix" data-text="自动登录" name="rememberMe">
	</div>
	<a id="login-bt" href="javascript:;" class="waves-effect waves-button waves-float"><i class="zmdi zmdi-arrow-forward"></i></a>
</div>
<script src="${bathPath}/plugins/jquery-3.2.1/jquery-3.2.1.min.js"></script>
<script src="${bathPath}/plugins/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<script src="${bathPath}/plugins/waves-0.7.5/waves.min.js"></script>
<script src="${bathPath}/plugins/checkbix/js/checkbix.min.js"></script>

<script src="${bathPath}/js/login.js"></script>
<script type="text/javascript">
	Checkbix.init();
</script>
</body>
</html>