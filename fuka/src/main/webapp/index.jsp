<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basepath%>">
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>福卡互换平台</title>
	<link rel="stylesheet" type="text/css" href="tool/bootstrap.css"/>
	<script src="tool/jquery-1.11.3.js" type="text/javascript" charset="utf-8"></script>
	<style type="text/css">
		*{
			padding: 0;
			margin: 0;
		}
		p{
			margin: 0;
			padding: 0;
		}
		div.line{
			font-size: 12px;
		}
	</style>
</head>
<body>
<h2 class="text-center text-info">福卡互换平台</h2>
<hr style="margin: 0;">
<div class="search col-xs-12" style="height: 40px;margin-top: 10px;">
	<div class="col-xs-5">
		<p style="line-height: 40px;font-family: 微软雅黑;font-size: 15px;">
			<img src="static/search.png" style="height: 70%;" >
			搜索福卡:
		</p>
		
	</div>
	<div class="col-xs-7">
		<select class="form-control" id="search">
			<option value="">请选择您要的福卡</option>
			<option value ="aiguo">爱国</option>
			<option value ="fuqiang">富强</option>
			<option value ="hexie">和谐</option>
			<option value ="youshan">友善</option>
			<option value ="jingye">敬业</option>
			
		</select>
	</div>
</div>
<p class="text-center">发布信息，请点击个人中心登录</p>

<div class="line col-xs-12">
	<div class="col-xs-6">
		<p class="text-center text-success">点击用户可查看详情</p>
	</div>
	<div class="col-xs-3">
		<p class="text-center" style="color: orange;text-decoration: underline" onclick="alert('正在开发...')">交易平台</p>
	</div>
	<div class="col-xs-3">
		<p class="text-center" style="color: blue;text-decoration: underline" onclick="window.location='mine.jsp'">个人中心</p>
	</div>
	
</div>

<table class="table table-bordered table-striped" style="font-size: 13px;">
</table>
<p style="position: static;bottom: 0;text-align: center">Power by:<em style="font-style: normal;font-weight: bold">Garen</em>

<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=14978435&site=qq&menu=yes">
	<img src="http://wpa.qq.com/pa?p=2:14978435:51" style="corder:0">
</a>
</p>
</body>
<script type="text/javascript">


	function initTable(){
		var tr = $('<tr>');
		tr.append($('<th>').text('用户'));
		tr.append($('<th>').text('需求项'));
		tr.append($('<th>').text('多余项'));
		$('table.table').append(tr);
	}

	$(function () {


		var table = $('table.table');
		initTable();
		$.post('user/getAllUser',function (data) {
			console.log(data);
			// 遍历所有的data
			for(var user of data) {
				// 创建一个tr
				var tr = $('<tr>');
				tr.append($('<td>').text(user.uname));

				// 创建两个td
				var xuqiu = $('<td>');
				var jiaohuan = $('<td>');
				// 判断需求
				if(user.aiguo>1){
					jiaohuan.text(jiaohuan.text()+' 爱国');
				}else if(user.aiguo == 0){
					xuqiu.text(xuqiu.text()+' 爱国');
				}
				if(user.fuqiang>1){
					jiaohuan.text(jiaohuan.text()+' 富强');
				}else if(user.fuqiang == 0){
					xuqiu.text(xuqiu.text()+' 富强');
				}
				if(user.hexie>1){
					jiaohuan.text(jiaohuan.text()+' 和谐');
				}else if(user.hexie ==0){
					xuqiu.text(xuqiu.text()+' 和谐');
				}
				if(user.youshan>1){
					jiaohuan.text(jiaohuan.text()+' 友善');
				}else if(user.youshan==0){
					xuqiu.text(xuqiu.text()+' 友善');
				}
				if(user.jingye>1){
					jiaohuan.text(jiaohuan.text()+' 敬业');
				}else if(user.jingye==0){
					xuqiu.text(xuqiu.text()+' 敬业');
				}
				tr.append(xuqiu);
				tr.append(jiaohuan);
				table.append(tr);
			}
		})

		$('#search').on('change',function () {
			var table = $('table.table');
			table.text('');
			initTable();
			// 获取当前选项
			var fuka = $(this).val();
			if(fuka == ''){
				return;
			}

			$.post('user/getUserByFuka?fuka='+fuka,function (data) {
				if (data==''){
					var p = $('<td>').css('color','red').attr('colspan','3').css('text-align','center').text('当前没有多余 '+$('#search').find("option:selected").text()+'卡 的人哟~再等等吧！');
					table.append(p);
				}

				// 遍历所有的data
				for(var user of data) {
					// 创建一个tr
					var tr = $('<tr>');
					tr.append($('<td>').text(user.uname));

					// 创建两个td
					var xuqiu = $('<td>');
					var jiaohuan = $('<td>');
					// 判断需求
					if(user.aiguo>1){
						jiaohuan.text(jiaohuan.text()+' 爱国');
					}else if(user.aiguo == 0){
						xuqiu.text(xuqiu.text()+' 爱国');
					}
					if(user.fuqiang>1){
						jiaohuan.text(jiaohuan.text()+' 富强');
					}else if(user.fuqiang == 0){
						xuqiu.text(xuqiu.text()+' 富强');
					}
					if(user.hexie>1){
						jiaohuan.text(jiaohuan.text()+' 和谐');
					}else if(user.hexie ==0){
						xuqiu.text(xuqiu.text()+' 和谐');
					}
					if(user.youshan>1){
						jiaohuan.text(jiaohuan.text()+' 友善');
					}else if(user.youshan==0){
						xuqiu.text(xuqiu.text()+' 友善');
					}
					if(user.jingye>1){
						jiaohuan.text(jiaohuan.text()+' 敬业');
					}else if(user.jingye==0){
						xuqiu.text(xuqiu.text()+' 敬业');
					}
					tr.append(xuqiu);
					tr.append(jiaohuan);
					table.append(tr);
				}
			})
		})

		// table事件委托
		$('table.table').on('click','tr',function () {
			var uname = $(this).find('td')[0].innerText;
			$.post('user/xiangqing?uname='+uname,function (data) {
				if(data=='1'){
					window.location='main.jsp';
				}
			})
		})

	})
</script>
</html>
