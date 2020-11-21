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
        <input type="hidden" id="path" value="${pageContext.request.contextPath}" />
        <form class="register-form">
            <input type="text" name="account" id="account" placeholder="请输入账号">
            <input type="password" name="pwd1" id="pwd1" placeholder="请输入密码">
            <img id="vCodeImg" src="${pageContext.request.contextPath}/golog/getCode" style="width: 270px;height: 47px" onclick="changeImg()">
            <input type="text" name="vCode" id="vCode" placeholder="请输入图形验证码">
            <a onclick="ajax_Login()"><input type="button" value="登录"></a>
            <p class="message">换种方式登录？<a href="javascript:">手机登录</a>或者<a href="${pageContext.request.contextPath}/golog/reg">成为会员</a></p>
        </form>
        <form class="login-form">
            <input type="text" name="phoneNumber"  id="phone" placeholder="请输入手机号">
            <input type="button" name="mesCode"  value="点击获取验证码" onclick="" class="btn btn-danger">
            <input type="text" name="acthCode" id="acthCode" placeholder="请输入短信验证码">
            <a onclick=""><input type="button" value="登录"></a>
            <p class="message">换种方式登录？<a href="javascript:">账号登录</a>或者<a href="${pageContext.request.contextPath}/golog/reg">成为会员</a></p>
        </form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/js/dmaku.js"></script>
<script>
    var path = $("#path").val();
    var messageData;
    var wait = 60;//验证码60秒后才可获取下一个

//图形验证码刷新
    function changeImg() {
        $("#vCodeImg").attr("src",path+"/golog/getCode?dates="+new Date());
    }

    // function getMsgNum() {
    //     var phoneNumber = $("#phone").val();
    //     setButtonStatus();
    //     var obj = {
    //         phoneNumber:phoneNumber
    //     };
    //
    //     $.ajax({
    //         url: path + '/Msg/send', // 后台短信发送接口
    //         type: 'POST',
    //         dataType: 'json',
    //         contentType: "application/json",
    //         async: false, //false 同步
    //         data: JSON.stringify(obj),
    //         success: function (result) {
    //             if(result.code == '200') {
    //                 messageData = result.data;
    //             }else {
    //                 alert("错误码:" + data.code + "  错误信息:" + data.message);
    //             }
    //         },
    //         error: function (XMLHttpRequest, textStatus, errorThrown) {
    //             console.log(XMLHttpRequest.status);
    //             console.log(XMLHttpRequest.readyState);
    //             console.log(textStatus);
    //         }
    //     });
    // }




    //验证码更新计时器
    function setButtonStatus() {
        if(wait == 0){
            this.removeAttribute("disabled");
            this.value="免费获取验证码";
            wait = 60;
        } else {
            this.setAttribute("disabled", true);
            this.value=wait+"秒后可以重新发送";
            wait--;
            setTimeout(function() {
                setButtonStatus()
            }, 1000)
        }
    }
    
    
    
    
    // function sendmessage(obj,second){
    //     if(sendmessage){
    //         countDown(obj,second)
    //     }
    //     else{
    //         alert("错误，虽然永远走不到这里！");
    //     }
    // }
    // function countDown(obj,second){
    //     // 如果秒数还是大于0，则表示倒计时还没结束
    //     if(second>=0){
    //         // 获取默认按钮上的文字
    //         if(typeof buttonDefaultValue === 'undefined' ){
    //             buttonDefaultValue =  obj.defaultValue;
    //         }
    //         // 按钮置为不可点击状态
    //         obj.disabled = true;
    //         // 按钮里的内容呈现倒计时状态
    //         obj.value = buttonDefaultValue+'('+second+')';
    //         // 时间减一
    //         second--;
    //         // 一秒后重复执行
    //         setTimeout(function(){countDown(obj,second);},1000);
    //         // 否则，按钮重置为初始状态
    //     }else{
    //         // 按钮置未可点击状态
    //         obj.disabled = false;
    //         // 按钮里的内容恢复初始状态
    //         obj.value = buttonDefaultValue;
    //     }
    // }


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
                } else if (info == 'disable') {
                    alert("此账号已被禁用!请联系管理员!");
                } else if (info == 'delete') {
                    alert("此账号已被删除!请重新注册!");
                } else if (info == 'Audit failed') {
                    alert("此账号还未通过审核,请稍后重试!");
                } else if (info == 'Vcode error') {
                    alert("验证码错误!");
                } else if (info == 'no account') {
                    alert("查无此账号,登录失败!");
                    var isA = confirm("是否注册?");
                    if (isA == true){
                        location.href = path + "/golog/reg";
                    }  else {

                    }
                }
            },

            error: function () {

            }
        })
    }
</script>
</body>
</html>
