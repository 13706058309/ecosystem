<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/19
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<link  type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<html>
<head>
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<style>
    .layui-input{
        border-width: 2px;
        border-radius: 5px;
    }

    .layui-form-select dl {
        max-height:200px;
    }

    #register{
        border: 2px solid #2cffda;
        background-color: #a5c3ff;
        margin:3% 17%;
        border-radius: 20px;
        position: relative;
        z-index: 1;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    #bodys{
        background-image: url("${pageContext.request.contextPath}/imgs/3.png");
        background-repeat: no-repeat;
        background-size: cover;
    }

    .photoUpLoad{
        margin-left: 10%;
        width: 60%;
        height: 30%;
        position: relative;
        cursor: pointer;
        border-radius: 2px;
        border: solid 1px #d0daea;
    }
    .photo{
        opacity: 0;
        z-index: 999;
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
    }
    .photoEcho{
        z-index: 99;
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
    }

    .photoUpLoad .cross{
        color: #d0daea;
        font-size: 44px;
        line-height: 44px;
        position: absolute;
        top: 38px;
        right: 36px;
    }
</style>
<body id="bodys">
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
<div id="register">
    <h1 style="text-align: center">企业注册</h1>
    <form class="layui-form layui-form-pane">
        <br>

        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">公司名称</label>
            <div class="layui-input-block">
                <input type="text" name="title" autocomplete="off" placeholder="请输入公司名称" class="layui-input" style="width: 80%">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">负责人姓名</label>
            <div class="layui-input-block">
                <input type="text" name="title" autocomplete="off" placeholder="请输入公司名称" class="layui-input" style="width: 80%">
            </div>
        </div>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 2%;">
            <legend style="margin-left: 20%">负责人省份证上传</legend>
        </fieldset>


        <div class="layui-form-item" style="margin-left: 15%">
        <div id="photoUpLoad" class="photoUpLoad">
            <input type="file" id="photo" class="photo" name="" accept="image/*"><span class="cross">+</span>
            <img src="" alt="" id="photoEcho" class="photoEcho">
        </div>
        </div>

        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">公司名称</label>
            <div class="layui-input-block">
                <input type="text" name="title" autocomplete="off" placeholder="请输入公司名称" class="layui-input" style="width: 80%">
            </div>
        </div>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 2%;">
            <legend style="margin-left: 20%">公司营业执照上传</legend>
        </fieldset>


        <div class="layui-form-item" style="margin-left: 15%">
            <div id="photoUpLoads" class="photoUpLoad">
                <input type="file" id="photos"  class="photo" name="" accept="image/*"><span class="cross">+</span>
                <img src="" alt="" id="photoEchos" class="photoEchos">
            </div>
        </div>


        <div class="layui-form-item" style="margin-left: 22%">
            <label class="layui-form-label">所在城市</label>
            <div class="layui-input-inline">
                <select name="quiz1">
                    <option value="">请选择省</option>
                    <option value="浙江" selected="">浙江省</option>
                    <option value="你的工号">江西省</option>
                    <option value="你最喜欢的老师">福建省</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="quiz2">
                    <option value="">请选择市</option>
                    <option value="杭州">杭州</option>
                    <option value="宁波" disabled="">宁波</option>
                    <option value="温州">温州</option>
                    <option value="温州">台州</option>
                    <option value="温州">绍兴</option>
                </select>
            </div>

        </div>

        <div class="layui-form-item" style="margin-left: 22%">
            <label class="layui-form-label">所属行业</label>
            <div class="layui-input-inline" style="width: 56%">
                <select name="quiz1">
                    <option value="">请选择省</option>
                    <option value="浙江" selected="">浙江省</option>
                    <option value="你的工号">江西省</option>
                    <option value="你最喜欢的老师">福建省</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">公司邮箱</label>
            <div class="layui-input-block">
                <input type="text" name="title" autocomplete="off" placeholder="请输入公司名称" class="layui-input" style="width: 80%">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">申请账号</label>
            <div class="layui-input-block">
                <input type="text" name="title" autocomplete="off" placeholder="请输入公司名称" class="layui-input" style="width: 80%">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">输入密码</label>
            <div class="layui-input-block">
                <input type="text" name="title" autocomplete="off" placeholder="请输入公司名称" class="layui-input" style="width: 80%">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">再次确认</label>
            <div class="layui-input-block">
                <input type="text" name="title" autocomplete="off" placeholder="请输入公司名称" class="layui-input" style="width: 80%">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">绑定手机号</label>
            <div class="layui-input-block">
                <input type="text" name="title" autocomplete="off" placeholder="请输入公司名称" class="layui-input" style="width: 80%">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 25%">
            <label class="layui-form-label">验证码</label>
            <div class="layui-input-inline">
                <input type="text" name="number" autocomplete="off" class="layui-input">
            </div>

            <div class="layui-input-inline">
                <input type="button" name="number" autocomplete="off" class=" layui-btn" value="发送验证码">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 4%">
            <div class="layui-input-inline" style="margin-left: 22%">
                <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" onclick="ajax_reg()">注册</button>
            </div>
            <div class="layui-input-inline">
                <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid"><a href="${pageContext.request.contextPath}/front/loginPage">返回</a></button>
            </div>
        </div>


    </form>
</div>

</body>
<script>
    var layer;
    var path = $("#path").val();
    layui.use(['form','layer'],function () {
        var form = layui.form;
        layer = layui.layer;
        form.render();
    })

    $("#photo").change(function(){
        var file = this.files[0];
        console.log(file);
        if(!file){
            return false;
        }

        var maxSize = 1024*5 ; //图片最大KB
        if(!/(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file.type)){
            top.alertLocal("请上传gif,jpeg,jpg,png格式的图片！");
            return;
        }
        if(file.size > maxSize* 1024){
            top.alertLocal("请上传"+maxSize+"KB以下的图片");
            return;
        }

        var objUrl = getObjectURL(file) ;
        if (objUrl) {
            $("#photoEcho").attr("src", objUrl) ;
        }
    }) ;
    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null ;
        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }

</script>
</html>
