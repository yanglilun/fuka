<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
	<base href="<%=basepath%>"></base>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta charset="utf-8">
		<title>登录界面</title>
		<link rel="stylesheet" type="text/css" href="tool/bootstrap.css"/>
		<script src="tool/jquery-1.11.3.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			em{
				font-style: normal;
			}
		</style>
	</head>
	<body>
		<h2 class="text-success text-center">登录界面</h2>
		<hr >
		<p class="col-xs-10 col-xs-offset-1"><em style="color: red;">未注册</em>的朋友可以填写账号密码后点击注册按钮，自动注册并进入平台</p>
		<p class="col-xs-10 col-xs-offset-1"><em style="color: green;">已注册</em>的朋友可以填写账号密码后点击登录按钮进入平台</p>
		<p class="col-xs-10 col-xs-offset-1" style=" color:  #1B6D85;">欢迎注册福卡互换信息平台，本公益平台使用完全免费 ^_^ 有问题请联系QQ:14978435 </p>
		<form id="f">
			<div class="list col-xs-8 col-xs-offset-2">
				<p class="text-center">用户名</p>
				<input type="text" name="uname" placeholder="请输入用户名" class="form-control"/>
			</div>
			<div class="list col-xs-8 col-xs-offset-2">
				<p class="text-center">QQ</p>
				<input type="text" name="qq" placeholder="请输入QQ号" class="form-control"/>
			</div>
			<div class="list col-xs-8 col-xs-offset-2" style="margin-bottom: 20px;">
				<p class="text-center">密码</p>
				<input type="password" name="password" placeholder="请输入密码" class="form-control"/>
			</div>
		</form>
		<button type="button" class="btn btn-success col-xs-3 col-xs-offset-2" id="login">登录</button>
		<button type="button" class="btn btn-info col-xs-3 col-xs-offset-2" id="reg">注册</button>
		<button type="button" class="btn col-xs-8 col-xs-offset-2 btn-warning" style="margin-top: 10px;" onclick="window.location='index.jsp'">返回首页</button>
	
	</body>
	<script>
		$(function () {
		    $('#reg').on('click',function () {
                var f = $('#f').serialize();
                $.post('user/register',f,function (data) {
                    if(data=='1'){
                        alert('注册成功！请重新登录！')
                    }else{
                        alert('注册失败！')
                    }
                })
            })

			$('#login').on('click',function () {
				var f = $('#f').serialize();
				$.post('user/login',f,function (data) {
					console.log(data);
					switch (data) {
						case '0':
							alert('密码错误');
							break;
						case '-1':
							alert('用户不存在，请注册');
							break;
						case '1':
							window.location='mine.jsp';
							break;
						default:
							break;
					}
				})
			})
		})
	</script>
</html>
