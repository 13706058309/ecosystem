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
    <input type="hidden" value="${pageContext.request.contextPath}" id="path">
    <input type="hidden" id="resubmitToken" value="" />
    <div class="find_psw">
        <form id="pswForm" action="http://www.lagou.com/rs.html" method="post">
            <div class="layui-form-item" style="margin-left:-11%;">
                <label class="layui-form-label" >手机号码:</label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" name="account" lay-verify="required|phone" autocomplete="off" class="layui-input" style="height: 6%">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left:-11%;">
                <label class="layui-form-label">重置密码:</label>
                <div class="layui-input-inline">
                    <input type="password" name="pwd" id="pwd"  autocomplete="off" class="layui-input" style="height: 6%">
                </div>
            </div>
            <div class="layui-form-item " style="margin-left:-11%;">
                <label class="layui-form-label">确认密码:</label>
                <div class="layui-input-inline">
                    <input type="password" name="pwd" id="againPwd" autocomplete="off" class="layui-input" style="height: 6%">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left:-11%;">
                <label class="layui-form-label">验证码:</label>
                <div class="layui-input-inline" >
                    <input type="text" name="vCode" id="vCode"  autocomplete="off" class="layui-input" style="height: 6%;width: 80%">
                </div>
                <input type="button" value="获取验证码" class="layui-btn layui-btn-normal " style="background-color: #0D9572" onclick="sendCode()" id="codeBtn">

            </div>

            <div class="layui-form-item" style="margin-left:2%;">

                <div class="layui-input-inline" >
                    <input type="button" value="找回密码" class="layui-btn layui-btn-lg " style="background-color: #2bffbc" onclick="findPwd()">
                </div>

                <div class="layui-input-inline" >
                    <input type="button" value="返回登录" class="layui-btn layui-btn-lg " style="background-color: #74fdff" onclick="goLog()" >
                </div>

            </div>

<%--            <input type="button" id="submitLogin" value="找回密码" style="margin-left: 0%" onclick="findPwd()">--%>
        </form>
    </div>
</div>

<script type="text/javascript">
    var layer;
    var InterValObj;
    var path = $("#path").val();
    var curCount=120;
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
                url:path+"/rec/sendCode",
                type:'post',
                data:"phone=" + phone,
                dataType:'text',
                success:function(data){
                    if(data=='1'){
                        layer.msg("发送成功");
                        $("#codeBtn").attr("disabled", "true");
                        $("#codeBtn").css("background-color", "grey");
                        $("#codeBtn").val( curCount + "秒");
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
            curCount=120;
            window.clearInterval(InterValObj);//停止计时器
            $("#codeBtn").removeAttr("disabled");//启用按钮
            $("#codeBtn").css("background-color", "#0D9572");
            $("#codeBtn").val("重新发送");
        }
        else {
            curCount--;
            $("#codeBtn").val(curCount +"秒");
        }
    }

    function findPwd() {
        var value = $("#codeBtn").val();
        if(value=='获取验证码'){
            layer.alert("验证码未发送");
            return false;
        }
        if(value=='重新发送'){
            layer.alert("验证码过时，请重新发送");
            return false;
        }
        var phone = $("#phone").val();
        var vCode = $("#vCode").val();
        var pwd = $("#pwd").val();
        var againPwd = $("#againPwd").val();

        $.ajax({
            url:path+"/rec/findPwd",
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
                    curCount=120;
                    window.clearInterval(InterValObj);//停止计时器
                    $("#codeBtn").removeAttr("disabled");//启用按钮
                    $("#codeBtn").css("background-color", "#0D9572");
                    $("#codeBtn").val("发送验证码");
                    var phone = $("#phone").val("");
                    var vCode = $("#vCode").val("");
                    var pwd = $("#pwd").val("");
                    var againPwd = $("#againPwd").val("");
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

    function goLog() {
        location.href = path+"/golog/admin";
    }

</script>
</body>
</html>
