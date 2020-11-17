<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/10
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="alternate" media="handheld"  />
    <!-- end 云适配 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>找回密码-拉勾网-最专业的互联网招聘平台</title>

    <meta name="baidu-site-verification" content="QIQ6KC1oZ6" />

    <!-- <div class="web_root"  style="display:none">http://www.lagou.com</div> -->
    <script type="text/javascript">
        var ctx = "http://www.lagou.com";
        console.log(1);
    </script>
    <link rel="Shortcut Icon" href="http://www.lagou.com/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/BackFindPwd.css"/>
    <script src="${pageContext.request.contextPath}/style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery.lib.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/core.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/analytics.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

    <script type="text/javascript">
        var youdao_conv_id = 271546;
    </script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/conv.js"></script>
</head>

<body id="login_bg">
<div class="login_wrapper">
    <div class="login_header" style="margin-top: -15%">
        <a href="index.html"><img src="${pageContext.request.contextPath}/imgs/logo.png" width="285" height="62" alt="拉勾招聘" /></a>
        <div id="cloud_s"><img src="${pageContext.request.contextPath}/style/images/cloud_s.png" width="81" height="52" alt="cloud" /></div>
        <div id="cloud_m"><img src="${pageContext.request.contextPath}/style/images/cloud_m.png" width="136" height="95"  alt="cloud" /></div>
    </div>

    <input type="hidden" id="resubmitToken" value="" />
    <div class="find_psw">
        <form id="pswForm" action="http://www.lagou.com/rs.html" method="post">
            <div class="layui-form-item" style="margin-left:-11%;">
                <label class="layui-form-label" >手机号码:</label>
                <div class="layui-input-inline">
                    <input type="text" id="account" name="account" lay-verify="required|phone" autocomplete="off" class="layui-input" style="height: 37px">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left:-11%;">
                <label class="layui-form-label">重置密码:</label>
                <div class="layui-input-inline">
                    <input type="password" name="pwd" id="pwd" lay-verify="required|phone" autocomplete="off" class="layui-input" style="height: 37px">
                </div>
            </div>
            <div class="layui-form-item " style="margin-left:-11%;">
                <label class="layui-form-label">确认密码:</label>
                <div class="layui-input-inline">
                    <input type="password" name="pwd" id="againPwd" lay-verify="required|phone" autocomplete="off" class="layui-input" style="height: 37px">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left:-11%;">
                <label class="layui-form-label">验证码:</label>
                <div class="layui-input-inline" >
                    <input type="password" name="pwd" id="vCode" lay-verify="required|phone" autocomplete="off" class="layui-input" style="height: 37px;width: 150px">
                </div>
                <input type="button" value="获取验证码" class="layui-btn layui-btn-normal " style="background-color: #0D9572">

            </div>
            <input type="submit" id="submitLogin" value="找回密码" style="margin-left: 24%"/>
            <input type="button" value="123" onmouseover="tip()">
        </form>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $('#pswForm input[type="text"]').focus(function(){
            $(this).siblings('.error').hide();
        });
        //验证表单

        $("#pswForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                }
            },
            messages: {
                email: {
                    required: "请输入注册时使用的邮箱地址",
                    email: "请输入有效的邮箱地址，如：vivi@lagou.com"
                }
            },
            submitHandler:function(form){
                $(form).find(":submit").attr("disabled", true);
                form.submit();
            }
        });
    });

    function tip() {

        console.log(123);
    }
</script>
</body>
</html>
