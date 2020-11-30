<%--
  Created by IntelliJ IDEA.
  User: yuzhen
  Date: 2020/11/15
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>前端注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dmaku.css">
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
            <input type="text" name="userName"  id="username" placeholder="请输入您的姓名">
            <input type="text" name="account" id="account" placeholder="请输入您的账号" maxlength="13">
            <input type="password" name="pwd" id="pwd" placeholder="请输入您的密码" maxlength="14">
            <input type="password" name="pwd1"  id="pwd1" placeholder="请确认您的密码" maxlength="14">
            <input type="text" name="telephone"  id="telephone" placeholder="请输入您的手机" maxlength="11" >
            <input type="button" name="mesCode" id="mesCode" value="点击获取验证码" onclick="sendMes()">
            <input type="text" name="acthCode" id="acthCode" placeholder="请输入短信验证码" maxlength="4">
            <input type="text" name="address"  id="address" placeholder="请输入您的地址" maxlength="30">
            <a onclick="ajax_reg()"><input type="button" value="提交"></a>
            <p class="message"><a href="${pageContext.request.contextPath}/golog/login">返回登录</a>或者<a href="${pageContext.request.contextPath}/homePage/home">返回首页</a></p>
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

    $(function () {
        //用户名限制必须有汉字
        $("#username").blur(function () {
            var pattern = /[\u4e00-\u9fa5]{2,6}$/;
            if(!pattern.test($(this).val())){
                alert("必须是汉字且2个字以上，最多6位");
                $(this).val("");
            }
        })
        //账号不能包含特殊符号和汉字
        $("#account").blur(function () {
            var pattern = /^[A-z_]\w{5,13}$/;
            if(!pattern.test($(this).val())){
                alert("账号首位要字母只能由字母数字_组成，至少6位，最多14位");
                $(this).val("");
            }
        })
        //密码只能有字母，数字，下划线组成
        $("#pwd").blur(function () {
            var pattern = /\w{6,14}$/;
            if(!pattern.test($(this).val())){
                alert("密码只能由字母数字_组成,且至少6位，最多14位");
                $(this).val("");
            }
        })

        //手机号验证方法
        $("#telephone").blur(function () {
            var pattern = /0?(13|14|15|18|17)[0-9]{9}/;
            if(!pattern.test($(this).val())){
                alert("请输入正确手机号");
                $(this).val("");
            }
        })

        //地址限制必须有汉字
        // $("#address").blur(function () {
        //     var pattern = /[\u4e00-\u9fa5]{6,12}$/;
        //     if(!pattern.test($(this).val())){
        //         alert("必须是汉字且6字以上，最多12位");
        //         $(this).val("");
        //     }
        // })

    })

    //获取短信
    function sendMes() {
        var phone = $("#telephone").val();
        var pattern = /0?(13|14|15|18|17)[0-9]{9}/;
        if (!pattern.test(phone)) {
            alert("请输入正确手机号");
        } else {
            $.ajax({
                url: path + "/golog/recReg",
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
                        layer.msg("该账号已存在!");
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


    // ajax注册
    function ajax_reg() {
        var path = $("#path").val();
        var userName = $("#username").val().trim();
        var account = $("#account").val().trim();
        var pwd = $("#pwd").val().trim();
        var pwd1 = $("#pwd1").val().trim();
        var telephone= $("#telephone").val().trim();
        var vmesCode = $("#acthCode").val().trim();
        var address = $("#address").val().trim();


        $.ajax({
            url:path+"/golog/regiest",
            data:{"userName":userName,"account":account,"pwd":pwd,"telephone":telephone,"vmesCode":vmesCode,"address":address},
            type:"post",
            typeData:"text",
            beforeSend:function () {
                if(userName.length==0){
                    alert("请填写用户名!");
                    return false;
                }
                if(account.length==0){
                    alert("请填写账号!");
                    return false;
                }
                if(pwd.length==0){
                    alert("请填写密码!");
                    return false;
                }
                if(pwd1 != pwd){
                    alert("两次密码要一致!");
                    return false;
                }
                if (vmesCode.length==0){
                    alert("验证码不能为空!");
                    return false;
                }
                if(address.length==0){
                    alert("地址不能为空,请填入30字以内有效地址!");
                    return false;
                }
                return true;
            },
            success:function (info) {
                // alert(info);
                if(info=='regsuccess'){
                    var mes = confirm("恭喜您注册成功!是否去登录呢?");
                    if (mes == true){
                        location.href = path+"/golog/login";
                    } else{
                        alert("欢迎成为我们的会员!");
                    }
                } else if (info == 'regfaid'){
                    var mess = confirm("对不起注册失败!是否重新注册？");
                    if(mess == true){
                        location.href = path+"/golog/reg";
                    } else {
                        // alert("期待您的下一次到来哦!");
                    }
                } else if (info == 'repeat') {
                    alert("对不起账号已经存在,请重新注册!");
                } else if (info == '1'){
                    alert("验证码错误!");
                } else if (info == '2'){
                    alert("手机号与验证码接收手机号不同！");
                }
            },
        })
    }

    //是否为应届生
    function isStu() {
        var stu = confirm("是否为应届生？");
        if(stu == true){

        } else{
            prompt("请输入您的工作经验!");

        }
    }

</script>
</body>
</html>
