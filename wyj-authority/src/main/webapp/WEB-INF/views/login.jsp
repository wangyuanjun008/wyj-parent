<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登录页</title>

<link href="${bathPath}/plugins/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet" />
<link href="${bathPath}/plugins/jquery-confirm/jquery-confirm.min.css" rel="stylesheet" />
<link href="${bathPath}/css/login2.css" rel="stylesheet" />
</head>
<body>
	<main class="auth-main">
		<div class="auth-block">
			<h1>登录</h1>
			<div class="form-horizontal">
				<div class="form-group">
					<label for="username" class="col-sm-2 control-label">用户名</label>
					<div class="col-sm-10">
						<input id="userName" type="text" class="form-control" name="userName" placeholder="帐号" required value="admin">
					</div>
				</div>
				<div class="form-group">
					<label for="password" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-10">
						<input id="password" type="password" class="form-control" name="password" placeholder="密码" required value="123456">
					</div>
				</div>
				<div class="form-group">
					<label for="password" class="col-sm-2 control-label">验证码</label>
					<div class="col-sm-10">
						<input id="captcha" type="text" class="form-control" name="captcha" placeholder="验证码">
					</div>
				</div>
				<div class="form-group">
					<label for="password" class="col-sm-2 control-label"></label>
					<div class="col-sm-10">
						<img src="${ctx}/captcha" id="imgCaptcha"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" id="aCaptcha">点击刷新</a>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button id="login-bt" type="submit" class="btn btn-default btn-auth">登录</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script src="${bathPath}/plugins/jquery-3.2.1/jquery-3.2.1.min.js"></script>
	<script src="${bathPath}/plugins/jquery-confirm/jquery-confirm.min.js"></script>
	<script src="${bathPath}/plugins/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
        $(function() {

            // 点击登录按钮
            $('#login-bt').click(function() {
                login();
            });
            
            // 回车事件
            $('#userName, #password,#captcha').keypress(function(event) {
                if (13 == event.keyCode) {
                    login();
                }
            });

            $('#imgCaptcha').click(function() {
                $(this).attr('src', '${ctx}/captcha?' + Math.floor(Math.random() * 100));
            });

            $('#aCaptcha').click(function() {
                $('#imgCaptcha').attr('src', '${ctx}/captcha?' + Math.floor(Math.random() * 100));
            });
        });

        // 登录
        function login() {
            $.ajax({
                url : '${ctx}/login',
                type : 'POST',
                data : {
                    userName : $('#userName').val(),
                    password : $('#password').val(),
                    captcha : $('#captcha').val()
                },
                dataType : "json",
                success : function(result) {
                    if (result.success == true) {
                        window.location.href = '${ctx}/public';
                    } else {
                        
                        $.confirm({
                            title : '系统提示',
                            content : result.errorMsg,
                            buttons : {
                                ok : {
                                    text : "确定",
                                    btnClass : 'btn-primary',
                                    keys : [ 'enter' ]
                                }
                            }
                        });
                    }
                },
                error : function(error) {
                    console.log(error);
                }
            });
        }
    </script>
</body>
</html>