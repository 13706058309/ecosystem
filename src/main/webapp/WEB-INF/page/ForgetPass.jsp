<%--
  Created by IntelliJ IDEA.
  User: yuzhen
  Date: 2020/11/10
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>用户忘记密码</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dmaku.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/dmaku.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>
        .btn-danger:hover {
            color: lightgreen;
            background-color: #c9302c;
            border-color: #ac2925;}
        .btn-danger {
            color: lightgreen;
            background-color: #d9534}
        .btn {
            display: inline-block;
            padding: 6px 12px;
            background-color: #C9302C;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: normal;
            line-height: 1.42857143;
            text-align: left;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;}
        .btn:hover{
            color: #333;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="login-page">
    <div class="form">
        <input type="hidden" value="${pageContext.request.contextPath}" id="path" />
        <form class="login-form">
            <input type="text" name="phoneNumber" id="phone" placeholder="请输入手机号">
            <input type="button" name="mesCode" id="mesCode" value="点击获取验证码" onclick="sendCode()" class="btn btn-danger">
            <input type="text" name="acthCode" id="acthCode" placeholder="请输入短信验证码">
            <input type="password" name="pwd" id="pwd" placeholder="请输入您的新密码" maxlength="12">
            <input type="password" name="pwd1"  id="pwd1" placeholder="请确认您的密码" maxlength="12">
            <a onclick="findPwd()"><input type="button" value="提交"></a>
            <p class="message"><a href="${pageContext.request.contextPath}/golog/login">返回登录</a>或者<a href="${pageContext.request.contextPath}/homePage/home">返回首页</a></p>
        </form>
    </div>
</div>
<script>
    var layer;
    var InterValObj;
    var path = $("#path").val();
    var curCount=60;
    layui.use('layer',function () {
        layer = layui.layer;
    })
    function sendCode() {
        var phone = $("#phone").val();
        var pattern = /0?(13|14|15|18|17)[0-9]{9}/;
        if(!pattern.test(phone)){
            layer.alert("请输入正确手机号");
        }else{
            $.ajax({
                url:path+"/golog/sendCode",
                type:'post',
                data:"phone=" + phone,
                dataType:'text',
                success:function(data){
                    if(data=='1'){
                        layer.msg("发送成功");
                        $("#mesCode").attr("disabled", "true");
                        $("#mesCode").css("background-color", "grey");
                        $("#mesCode").val( curCount + "秒");
                        InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
                    }else if(data=='2'){
                        layer.msg("手机号错误，该手机未注册过");
                    }else{
                        layer.msg("发送失败，请稍后再发");
                    }
                },
                error:function(){
                    layer.alert('请求超时或系统出错!');
                }
            });

        }
    }

    function SetRemainTime() {
        if (curCount == 0) {
            curCount=60;
            window.clearInterval(InterValObj);//停止计时器
            $("#mesCode").removeAttr("disabled");//启用按钮
            $("#mesCode").css("background-color", "#0D9572");
            $("#mesCode").val("重新发送");
        }
        else {
            curCount--;
            $("#mesCode").val(curCount +"秒");
        }
    }

    function findPwd() {
        var value = $("#mesCode").val();
        if(value=='获取验证码'){
            layer.alert("验证码未发送");
            return false;
        }
        var phone = $("#phone").val();
        var vCode = $("#acthCode").val();
        var pwd = $("#pwd").val();
        var againPwd = $("#pwd1").val();

        $.ajax({
            url:path+"/golog/findPass",
            type:'post',
            data:"phone=" + phone+"&pwd="+pwd+"&vCode="+vCode,
            dataType:'text',
            beforeSend:function(){
                if(pwd!==againPwd){
                    layer.alert("两次密码不一致");
                    return false;
                }
                if(vCode.trim().length!=4){
                    layer.alert("验证码输入错误");
                    return false;
                }
                var pattern = /0?(13|14|15|18|17)[0-9]{9}/;
                if(!pattern.test(phone)){
                    layer.alert("请输入正确手机号");
                    return false;
                }
            },
            success:function(data){
                if(data==1){
                    layer.msg("修改成功");
                    curCount=60;
                    window.clearInterval(InterValObj);//停止计时器
                    $("#mesCode").removeAttr("disabled");//启用按钮
                    $("#mesCode").css("background-color", "#0D9572");
                    $("#mesCode").val("发送验证码");
                    var phone = $("#phone").val("");
                    var vCode = $("#acthCode").val("");
                    var pwd = $("#pwd").val("");
                    var againPwd = $("#pwd1").val("");
                }else if(data=='2'){
                    layer.alert("手机号输入错误");
                }else if(data=='3'){
                    layer.alert("验证码输入错误");
                }else{
                    layer.alert("系统繁忙，找回失败");
                }
            },
            error:function(){
                layer.alert('请求超时或系统出错!');
            }
        });

    }

</script>

</body>
</html>

