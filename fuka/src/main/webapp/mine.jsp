<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
String path = request.getContextPath();
String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
	<base href="<%=basepath%>"></base>
	<meta charset="utf-8"></meta>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>个人中心</title>
		<link rel="stylesheet" type="text/css" href="tool/bootstrap.css"/>
		<script src="tool/jquery-1.11.3.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			div.fuka{
				color: red;
				font-family: 黑体;
				font-size: 20px;
				font-weight: bold;
			}
			div.list{
				margin-bottom: 10px;
			}
			em{
				font-style: normal;
			}
		</style>
	</head>
	<body>
		<h2 class="text-center text-info">个人中心</h2>
		<p class="text-center"><em style="font-style: normal;color: orangered;">${nowuser.uname}</em> 欢迎回来！</p>
		<hr >
		<h3 class="text-center text-success">请及时更新自己的福卡哟！</h3>
		<p class="text-center">您福卡的信息<em style="color: blueviolet;">（请输入实际数量,系统会自动计算）</em>：</p>
		<form id="f">

			<div class="list col-xs-12">
				<div class="fuka col-xs-4">
					爱国福：
				</div>
				<div class="num col-xs-8">
					<button type="button" style="float: left;" class="btn btn-success" onclick="addaiguo('+')"><</button>
					<input class="form-control" type="number" name="aiguo" style="width: 40%;float: left;margin: 0 5px 0 5px;text-align: center;" value="${nowuser.aiguo}"/>
					<button type="button" style="float: left;" class="btn btn-success" onclick="addaiguo('-')">></button>
				</div>
			</div>
			<div class="list col-xs-12">
				<div class="fuka col-xs-4">
					富强福：
				</div>
				<div class="num col-xs-8">
					<button type="button" style="float: left;" class="btn btn-success" onclick="addfuqiang('+')"><</button>
					<input class="form-control" type="number" name="fuqiang" style="width: 40%;float: left;margin: 0 5px 0 5px;text-align: center;" value="${nowuser.fuqiang}"/>
					<button type="button" style="float: left;" class="btn btn-success" onclick="addfuqiang('-')">></button>
				</div>
			</div>
			<div class="list col-xs-12">
				<div class="fuka col-xs-4">
					和谐福：
				</div>
				<div class="num col-xs-8">
					<button type="button" style="float: left;" class="btn btn-success" onclick="addhexie('+')"><</button>
					<input class="form-control" type="number" name="hexie" style="width: 40%;float: left;margin: 0 5px 0 5px;text-align: center;" value="${nowuser.hexie}"/>
					<button type="button" style="float: left;" class="btn btn-success" onclick="addhexie('-')">></button>
				</div>
			</div>
			<div class="list col-xs-12">
				<div class="fuka col-xs-4">
					友善福：
				</div>
				<div class="num col-xs-8">
					<button type="button" style="float: left;" class="btn btn-success" onclick="addyoushan('+')"><</button>
					<input class="form-control" type="number" name="youshan" style="width: 40%;float: left;margin: 0 5px 0 5px;text-align: center;" value="${nowuser.youshan}"/>
					<button type="button" style="float: left;" class="btn btn-success" onclick="addyoushan('-')">></button>
				</div>
			</div>
			<div class="list col-xs-12">
				<div class="fuka col-xs-4">
					敬业福：
				</div>
				<div class="num col-xs-8">
					<button type="button" style="float: left;" class="btn btn-success" onclick="addjingye('+')"><</button>
					<input class="form-control" type="number" name="jingye" style="width: 40%;float: left;margin: 0 5px 0 5px;text-align: center;" value="${nowuser.jingye}"/>
					<button type="button" style="float: left;" class="btn btn-success" onclick="addjingye('-')">></button>
				</div>
			</div>
		</form>
		<button type="button" class="btn btn-success col-xs-10 col-xs-offset-1" id="save" style="margin-bottom: 10px;margin-top: 20px;">保存福卡信息</button>
		
		<button type="button" class="btn btn-info col-xs-10 col-xs-offset-1" onclick="window.location='index.jsp'" style="margin-bottom: 10px;">返回首页</button>
		
		<button type="button" class="btn btn-danger col-xs-10 col-xs-offset-1" style="margin-bottom: 10px;" id="exit">退出登录</button>
		
		<button type="button" class="btn btn-warning col-xs-10 col-xs-offset-1" style="color: red;" id="del">从平台上删除我的信息</button>
		

	<script>

		var aiguo = $('input[name=aiguo]');
		var fuqiang = $('input[name=fuqiang]');
		var hexie = $('input[name=hexie]');
		var youshan = $('input[name=youshan]');
		var jingye = $('input[name=jingye]');

		function addaiguo(flag) {
			if(flag=='+'){
				aiguo.val(parseInt(aiguo.val())+1);
			}else{
				if(aiguo.val()==0){
					alert('不能再少了!')
					return;
				}
				aiguo.val(parseInt(aiguo.val())-1);
			}
		}

		function addfuqiang(flag) {
			if(flag=='+'){
				fuqiang.val(parseInt(fuqiang.val())+1);
			}else{
				if(fuqiang.val()==0){
					alert('不能再少了!')
					return;
				}
				fuqiang.val(parseInt(fuqiang.val())-1);
			}
		}

		function addhexie(flag) {
			if(flag=='+'){
				hexie.val(parseInt(hexie.val())+1);
			}else{
				if(hexie.val()==0){
					alert('不能再少了!')
					return;
				}
				hexie.val(parseInt(hexie.val())-1);
			}
		}

		function addyoushan(flag) {
			if(flag=='+'){
				youshan.val(parseInt(youshan.val())+1);
			}else{
				if(youshan.val()==0){
					alert('不能再少了!')
					return;
				}
				youshan.val(parseInt(youshan.val())-1);
			}
		}

		function addjingye(flag) {
			if(flag=='+'){
				jingye.val(parseInt(jingye.val())+1);
			}else{
				if(jingye.val()==0){
					alert('不能再少了!')
					return;
				}
				jingye.val(parseInt(jingye.val())-1);
			}
		}

		$(function () {
			// 判断登录
			$.post('user/ifLogin',function (data) {
				if (data == '0'){
					alert('您未登录，请先登录');
					window.location='login.jsp';
				}
			})

			// 保存时
			$('#save').on('click',function () {
				var f = $('#f').serialize();
				$.post('user/update',f,function (data) {
					if(data == '1'){
						alert('保存成功');
						window.location.reload();
					}else{
						alert('保存失败');
					}
				})
			})

			// 退出时
			$('#exit').on('click',function () {
				if(confirm('确定要退出吗?')){
					$('<a>').attr('href','user/exit')[0].click();
				}
			})

			// 删除用户del
			$('#del').on('click',function () {
				if(confirm('确定要删除用户吗?')){
					$.post('user/del',function (data) {
						if(data == '1'){
							alert('删除成功！返回首页！');
							$('<a>').attr('href','user/exit')[0].click();
						}else{
							alert('删除失败');
						}
					})
				}
			})

		})

	</script>
	</body>
</html>
