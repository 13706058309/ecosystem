<%--
  Created by IntelliJ IDEA.
  User: yuzhen
  Date: 2020/11/17
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台登陆</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        html, body {width: 100%;height: 100%;overflow: hidden}
        body {background: #1E9FFF;}
        body:after {content:'';background-repeat:no-repeat;background-size:cover;-webkit-filter:blur(3px);-moz-filter:blur(3px);-o-filter:blur(3px);-ms-filter:blur(3px);filter:blur(3px);position:absolute;top:0;left:0;right:0;bottom:0;z-index:-1;}
        .layui-container {width: 100%;height: 100%;overflow: hidden}
        .admin-login-background {width:360px;height:300px;position:absolute;left:50%;top:30%;margin-left:-180px;margin-top:-100px;}
        .logo-title {text-align:center;letter-spacing:2px;padding:14px 0;}
        .logo-title h1 {color:#1E9FFF;font-size:25px;font-weight:bold;}
        .login-form {background-color:#fff;border:1px solid #fff;border-radius:3px;padding:14px 20px;box-shadow:0 0 8px #eeeeee;}
        .login-form .layui-form-item {position:relative;}
        .login-form .layui-form-item label {position:absolute;left:1px;top:1px;width:38px;line-height:36px;text-align:center;color:#d2d2d2;}
        .login-form .layui-form-item input {padding-left:36px;}
        .captcha {width:60%;display:inline-block;}
        .captcha-img {display:inline-block;width:34%;float:right;}
        .captcha-img img {height:34px;border:1px solid #e6e6e6;height:36px;width:100%;}
    </style>
</head>
<body>
<div class="layui-container">
    <div class="admin-login-background">
        <input type="hidden" id="path" value="${pageContext.request.contextPath}">
        <div class="layui-form login-form">
            <form class="layui-form">
                <div class="layui-form-item logo-title">
                    <h1>欢迎您,管理员!</h1>
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-username" ></label>
                    <input type="text" name="username" id="username" lay-verify="required|account" placeholder="请输入您的管理员账号" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-password"></label>
                    <input type="password" name="password" id="password" lay-verify="required|password" placeholder="请输入您的管理员密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-vercode"></label>
                    <input type="text" name="captcha" id="captcha" lay-verify="required|captcha" placeholder="图形验证码" autocomplete="off" class="layui-input verification captcha">
                    <div class="captcha-img">
                        <img id="captchaPic" src="${pageContext.request.contextPath}/golog/getCode" onclick="changeImg()">
                    </div>
                </div>
                <div class="layui-form-item">
                    <a href="${pageContext.request.contextPath}/test/findPwd"><p>忘记密码</p></a>
<%--                    <a><input type="button" name="forgetPass" id="forgetPass" src=""></a>--%>
<%--                    <input type="button" name="rememberMe"  lay-skin="primary" value="忘记密码">--%>
                </div>
                <div class="layui-form-item">
<%--                    <button class="layui-btn layui-btn layui-btn-normal layui-btn-fluid" onclick="adminLog()">登 入</button>--%>
<%--                    <a class="layui-btn layui-btn layui-btn-normal layui-btn-fluid" type="button" onclick="adminLog()" title="登录">--%>
                        <a onclick="adminLog()"><input type="button" value="登录" class="layui-btn layui-btn layui-btn-normal layui-btn-fluid"></a>
                </div>
                <div class="layui-form-item">
                    <a href="${pageContext.request.contextPath}/test/reg"><input type="button" value="企业入住" class="layui-btn layui-btn layui-btn-normal layui-btn-fluid"></a>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/jquery.particleground.min.js" charset="utf-8"></script>
<script>




    function adminLog() {

        var path = $("#path").val();
        var account = $("#username").val();
        var password = $("#password").val();
        var sVCode = $("#captcha").val();

        $.ajax({
            url:path+"/golog/adLog",
            data:{"account":account,"password":password,"sVCode":sVCode},
            type:"post",
            typeData:"text",
            beforeSend:function () {

                if (account.length==0){
                    layer.msg("账号不能为空！");
                    return false;
                }
                if (password.length==0) {
                    layer.msg("密码不能为空!");
                    return false;
                }
                if(sVCode.trim().length==0){
                    layer.msg("验证码不能为空!");
                    return false;
                }
                return true;
            },
            success:function (info) {
                console.log(info);
                if (info == 'success'){
                    layer.msg("登陆成功!");
                    location.href = path+"/golog/adminMain";
                } else if (info=='noAcc'){
                    layer.msg("管理员账号不存在,登录失败!");
                }else if (info == 'noReviewed'){
                    layer.msg("登录失败,此账号待审核!");
                } else if (info = 'failedPass'){
                    layer.msg("登录失败,此账号未通过审核!");
                } else if (info == 'vCodeError'){
                    layer.msg("登录失败,验证码错误，请重试!");
                } else {
                    layer.msg("当前账号无权限,请联系管理员!");
                }
            },
            error:function () {
                console.log("ssss")
            }
        })

    }



    function changeImg() {
        var path = $("#path").val();
        $("#captchaPic").attr("src",path+"/golog/getCode?dates="+new Date());
    }

    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer;

        // 登录过期的时候，跳出ifram框架
        if (top.location != self.location) top.location = self.location;

        // 粒子线条背景
        $(document).ready(function(){
            $('.layui-container').particleground({
                dotColor:'#7ec7fd',
                lineColor:'#7ec7fd'
            });
        });

        // 进行登录操作
        form.on('submit(login)', function (data) {
            data = data.field;
            if (data.username == '') {
                layer.msg('用户名不能为空');
                return false;
            }
            if (data.password == '') {
                layer.msg('密码不能为空');
                return false;
            }
            if (data.captcha == '') {
                layer.msg('验证码不能为空');
                return false;
            }
            layer.msg('登录成功', function () {
                window.location = '../index.html';
            });
            return false;
        });
    });
</script>
</body>
</html>
