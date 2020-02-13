<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basepath%>">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <meta charset="utf-8">
    <title>详情</title>
    <link rel="stylesheet" type="text/css" href="tool/bootstrap.css"/>
    <script src="tool/jquery-1.11.3.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<h2 class="text-center text-success">详情信息</h2>
<hr>
<table id="tab" class="table table-bordered table-striped">
    <tr>
        <th>用户名</th>
        <th>QQ</th>
    </tr>
    <tr>
        <td>${mainuser.uname}</td>
        <td id="qq">${mainuser.qq}</td>
    </tr>
    <tr>
        <th>需求项</th>
        <th>多余项</th>
    </tr>
    <tr>
        <td id="xuqiu"></td>
        <td id="duoyu"></td>
    </tr>
</table>
<p class="text-center text-danger">交换福卡，谨防上当受骗！！</p>
<button type="button" class="btn btn-info col-xs-10 col-xs-offset-1" id="copy">一键复制QQ</button>
<button type="button" class="btn btn-danger col-xs-10 col-xs-offset-1" style="margin-top: 10px" onclick="history.go(-1)">返回</button>

<script>
    $(function () {
            // 创建两个td
            var xuqiu = $('#xuqiu');
            var jiaohuan = $('#duoyu');
            // 判断需求
            if(${mainuser.aiguo}>0){
                jiaohuan.text(jiaohuan.text()+' 爱国');
            }else{
                xuqiu.text(xuqiu.text()+' 爱国');
            }
            if(${mainuser.fuqiang}>0){
                jiaohuan.text(jiaohuan.text()+' 富强');
            }else{
                xuqiu.text(xuqiu.text()+' 富强');
            }
            if(${mainuser.hexie}>0){
                jiaohuan.text(jiaohuan.text()+' 和谐');
            }else{
                xuqiu.text(xuqiu.text()+' 和谐');
            }
            if(${mainuser.youshan}>0){
                jiaohuan.text(jiaohuan.text()+' 友善');
            }else{
                xuqiu.text(xuqiu.text()+' 友善');
            }
            if(${mainuser.jingye}>0){
                jiaohuan.text(jiaohuan.text()+' 敬业');
            }else{
                xuqiu.text(xuqiu.text()+' 敬业');
            }

        $('#copy').on('click',function () {
            copy('qq','innerText');
            alert('复制完成!')
        })


    })

    function  copy (id, attr) {
        let target = null;

        if (attr) {
            target = document.createElement('div');
            target.id = 'tempTarget';
            target.style.opacity = '0';
            if (id) {
                let curNode = document.querySelector('#' + id);
                target.innerText = curNode[attr];
            } else {
                target.innerText = attr;
            }
            document.body.appendChild(target);
        } else {
            target = document.querySelector('#' + id);
        }

        try {
            let range = document.createRange();
            range.selectNode(target);
            window.getSelection().removeAllRanges();
            window.getSelection().addRange(range);
            document.execCommand('copy');
            window.getSelection().removeAllRanges();
            console.log('复制成功')
        } catch (e) {
            console.log('复制失败')
        }

        if (attr) {
            // remove temp target
            target.parentElement.removeChild(target);
        }
    }
</script>
</body>
</html>
