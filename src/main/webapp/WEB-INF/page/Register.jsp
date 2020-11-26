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
<%--    只能输入中文--%>
            <input type="text" name="userName"  id="username" placeholder="请输入您的姓名" maxlength="4" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')">
<%--    只能输入数字--%>
            <input type="text" name="account" id="account" placeholder="请输入您的账号" onkeyup="this.value=this.value.replace(/\D/g,'')">
            <input type="password" name="pwd" id="pwd" placeholder="请输入您的密码" maxlength="12">
            <input type="password" name="pwd1"  id="pwd1" placeholder="请确认您的密码" maxlength="12">
<%--只能输入十一位的手机--%>
            <input type="text" name="telephone"  id="telephone" placeholder="请输入您的手机" maxlength="11" onkeyup="this.value=this.value.replace(/\D/g,'')">
<%--    只能输入中文--%>
            <input type="text" name="address"  id="address" placeholder="请输入您的地址" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')">
<%--            <input type="button" value="是否为应届生" onclick="isStu()">--%>
            <a onclick="ajax_reg()"><input type="button" value="提交"></a>
    <p class="message"><a href="${pageContext.request.contextPath}/golog/login">返回登录</a></p>
        </form>
    </div>
</div>
<script>

    // $(function () {
    //     //用户名限制必须有汉字
    //     $("#username").blur(function () {
    //         var pattern = /[\u4e00-\u9fa5]{2,6}$/;
    //         if(!pattern.test($(this).val())){
    //             alert("必须是汉字且2个字以上，最多6位");
    //             $(this).val("");
    //         }
    //     })
    //     //账号不能包含特殊符号和汉字
    //     $("#account").blur(function () {
    //         var pattern = /^[A-z_]\w{5,13}$/;
    //         if(!pattern.test($(this).val())){
    //             alert("账号首位要字母只能由字母数字_组成，至少6位，最多14位");
    //             $(this).val("");
    //         }
    //     })
    //     //密码只能有字母，数字，下划线组成
    //     $("#pwd").blur(function () {
    //         var pattern = /\w{6,14}$/;
    //         if(!pattern.test($(this).val())){
    //             alert("密码只能由字母数字_组成,且至少6位，最多14位");
    //             $(this).val("");
    //         }
    //     })
    //     //手机号验证方法
    //     $("#telephone").blur(function () {
    //         var pattern = /0?(13|14|15|18|17)[0-9]{9}/;
    //         if(!pattern.test($(this).val())){
    //             alert("请输入正确手机号");
    //             $(this).val("");
    //         }
    //     })
    //
    //     //地址限制必须有汉字
    //     $("#address").blur(function () {
    //         var pattern = /[\u4e00-\u9fa5]{6,12}$/;
    //         if(!pattern.test($(this).val())){
    //             alert("必须是汉字且6字以上，最多12位");
    //             $(this).val("");
    //         }
    //     })
    //
    // })
    //
    // ajax注册
    function ajax_reg() {
        var path = $("#path").val();
        var userName = $("#username").val().trim();
        var account = $("#account").val().trim();
        var pwd = $("#pwd").val().trim();
        var pwd1 = $("#pwd1").val().trim();
        var telephone= $("#telephone").val().trim();
        // var vmesCode = $("#vmesCode").val().trim();
        var address = $("#address").val().trim();


        $.ajax({
            url:path+"/golog/regiest",
            data:{"userName":userName,"account":account,"pwd":pwd,"telephone":telephone,"address":address},
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
                if(telephone.length==0){
                    alert("请填写手机号!");
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
                        alert("欢迎加入我们的大家庭!");
                    }
                } else if (info == 'regfaid'){
                    var mess = confirm("对不起注册失败!是否重新注册？");
                    if(mess == true){
                        location.href = path+"/golog/reg";
                    } else {
                        alert("期待您的下一次到来哦!");
                    }
                } else if (info == 'repeat') {
                    alert("对不起账号已经存在,请重新注册!");
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

    //短信获取验证码
    function sendmessage(obj,second){
        if(sendmessage){
            countDown(obj,second)
        }
        else{
            alert("错误，虽然永远走不到这里！");
        }
    }
    function countDown(obj,second){
        // 如果秒数还是大于0，则表示倒计时还没结束
        if(second>=0){
            // 获取默认按钮上的文字
            if(typeof buttonDefaultValue === 'undefined' ){
                buttonDefaultValue =  obj.defaultValue;
            }
            // 按钮置为不可点击状态
            obj.disabled = true;
            // 按钮里的内容呈现倒计时状态
            obj.value = buttonDefaultValue+'('+second+')';
            // 时间减一
            second--;
            // 一秒后重复执行
            setTimeout(function(){countDown(obj,second);},1000);
            // 否则，按钮重置为初始状态
        }else{
            // 按钮置未可点击状态
            obj.disabled = false;
            // 按钮里的内容恢复初始状态
            obj.value = buttonDefaultValue;
        }
    }
</script>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/js/dmaku.js"></script>
</body>
</html>
