<%--
  Created by IntelliJ IDEA.
  User: yuzhen
  Date: 2020/11/14
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>前端登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dmaku.css">
    <style>
        .btn-danger:hover {
            color: lightgreen;
            background-color: #c9302c;
            border-color: #ac2925;
        }

        .btn-danger {
            color: lightgreen;
            background-color: #d9534
        }

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
            border-radius: 4px;
        }

        .btn:hover {
            color: #333;
            text-decoration: none;
        }
    </style>
</head>
<body class="body">
<div class="login-page">
    <div class="form">
        <input type="hidden" id="path" value="${pageContext.request.contextPath}"/>
        <form class="register-form">
            <input type="text" name="account" id="account" placeholder="请输入账号">
            <input type="password" name="pwd1" id="pwd1" placeholder="请输入密码">
            <img id="vCodeImg" src="${pageContext.request.contextPath}/golog/getCode" style="width: 270px;height: 47px"
                 onclick="changeImg()">
            <input type="text" name="vCode" id="vCode" placeholder="请输入图形验证码">
            <a onclick="ajax_Login()"><input type="button" value="登录"></a>
            <p class="message"><a href="javascript:">手机登录</a>&nbsp|&nbsp<a
                    href="${pageContext.request.contextPath}/golog/reg">注册</a></p>
            <p class="message"><a href="${pageContext.request.contextPath}/golog/forget">忘记密码</a>&nbsp|&nbsp<a href="${pageContext.request.contextPath}/homePage/home">返回首页</a></p>
        </form>
        <form class="login-form">
            <input type="text" name="phoneNumber" id="phone" placeholder="请输入手机号">
            <input type="button" name="mesCode" id="mesCode" value="点击获取验证码" onclick="sendMes()" class="btn btn-danger">
            <input type="text" name="acthCode" id="acthCode" placeholder="请输入短信验证码">
            <a onclick="mesLog()"><input type="button" value="登录"></a>
            <p class="message"><a href="javascript:">账号登录</a>&nbsp|&nbsp<a
                    href="${pageContext.request.contextPath}/golog/reg">注册</a></p>
            <p class="message"><a href="${pageContext.request.contextPath}/golog/forget">忘记密码</a>&nbsp|&nbsp<a href="${pageContext.request.contextPath}/homePage/home">返回首页</a></p>
        </form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/js/dmaku.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    var path = $("#path").val();
    var layer;
    var InterValObj;
    var curCount=60;
    layui.use('layer',function () {
        layer = layui.layer;
    })

    //图形验证码刷新
    function changeImg() {
        $("#vCodeImg").attr("src", path + "/golog/getCode?dates=" + new Date());
    }


    //发送短信
    function sendMes() {
        var phone = $("#phone").val();
        var pattern = /0?(13|14|15|18|17)[0-9]{9}/;
        if (!pattern.test(phone)) {
            alert("请输入正确手机号");
        } else {
            $.ajax({
                url: path + "/golog/aliSend",
                type: "post",
                data: "phone=" + phone,
                dataType: 'text',
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


    //短信登录
    function mesLog() {
        var value = $("#mesCode").val();
        if(value == '点击获取验证码'){
            alert("验证码未发送!");
            return false;
        }
        var phone = $("#phone").val();
        var code = $("#acthCode").val();
        // console.log(phone);
        // console.log(code);

        $.ajax({
            url:path+"/golog/mesLog",
            type:'post',
            data:"phone=" + phone + "&code=" + code,
            dataType:'text',
            beforeSend:function () {
                var pattern = /0?(13|14|15|18|17)[0-9]{9}/;
                if(!pattern.test(phone)){
                    alert("请输入正确手机号!");
                    return false;
                }
                if (code.length != 4){
                    alert("请输入四位验证码!");
                    return false;
                }
                return true;
            },
            success:function (info) {
                if(info == 'success'){
                    layer.msg("登录成功!");
                    location.href = path + "/homePage/home";
                } else if(info == 'j'){
                    alert("此账号已被禁用!");
                } else if (info=='d'){
                    alert("此账号已被删除!");
                } else if (info == 'f') {
                    alert("账号审核未通过，无法登录!");
                } else if (info=='8'){
                    alert("验证码错误!");
                } else if (info == '9'){
                    alert("手机号错误!");
                }
            }
        })


    }

    //ajax登录
    function ajax_Login() {
        var account = $("#account").val();
        var pwd = $("#pwd1").val();
        var sVCode = $("#vCode").val();
        $.ajax({
            url: path + "/golog/log",
            data: "account=" + account + "&pwd=" + pwd + "&sVCode=" + sVCode,
            type: "get",
            typeData: "text",
            beforeSend: function () {
                if (account.length == 0) {
                    alert("账号不能为空!");
                    return false;
                }
                if (pwd.length == 0) {
                    alert("密码不能为空!");
                    return false;
                }
                if (vCode.length == 0) {
                    alert("验证码不能为空!");
                    return false;
                }
                return true;
            },
            success: function (info) {
                // alert(info);
                changeImg();
                if (info == 'success') {
                    location.href = path + "/homePage/home";
                } else if (info == 'passMiss') {
                    var isA = confirm("用户名或密码错误!");
                    // if (isA == true) location.href = path + "/golog/reg";
                } else if (info == 'disable') {
                    alert("此账号已被禁用!请联系管理员!");
                } else if (info == 'delete') {
                    var isA = confirm("此账号已被删除!是否重新注册?");
                    if (isA == true) location.href = path + "/golog/reg";
                } else if (info == 'auditFailed') {
                    alert("此账号还未通过审核,请稍后重试!");
                } else if (info == 'vCodeError') {
                    alert("验证码错误!");
                }
            },

            error: function () {

            }
        })
    }
</script>
</body>
</html>
