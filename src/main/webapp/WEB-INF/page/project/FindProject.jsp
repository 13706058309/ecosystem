<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-11-13
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>找项目</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <style>
        .header-top-warp-v1{
            width: 100%;
            background-color: #fbfbfb;
            border-bottom: 1px solid #e7e7e7;
            height:36px;
        }
        .header{
            width: 1190px;
            background-color: #fbfbfb;
            border-bottom: 1px solid #e7e7e7;
            height:36px;
            margin: auto;
        }
        .header-top-left{
            float: left;
        }
        .header-top-right{
            float: right;
        }
        .item-homeurl{
            margin-top: 5px;
            margin-left:100px ;
        }
        .header-top-user{
            display: inline-block;
            float: left;
            margin: 0;
            padding: 0;
            position: relative;
        }
        .hover-title{
            float: left;
            cursor: pointer;
            position: relative;
            padding: 0 12px;
            z-index: 60;
            width: 100%;
            box-sizing: border-box;
            height: 36px;
            line-height: 36px;
            display: block;
            border-left: 1px solid transparent;
            border-right: 1px solid transparent;
        }
    </style>
</head>
<body>
<div class="header-top-warp-v1">
    <div class="header">
        <ul class="header-top-left">
            <li class="item-homeurl">
                <i class="layui-icon layui-icon-home" style="color:#44D0C7;font-size:1.4em"></i>钱程无忧首页
            </li>
        </ul>
        <div class="header-top-right">
            <ul class="header-top-user">
                <li style="float: left;position: relative;">
                    <span class="hover-title">登录</span>
                </li>
                <li style="float: left;position: relative;">
                    <span class="hover-title">注册</span>
                </li>
                <li style="float: left;position: relative;">
                    <span class="hover-title">我的项目</span>
                </li>
            </ul>
        </div>
    </div>
</div>
<div style="background-color: cornflowerblue;width:1190px;margin: auto;display:block;height: 80px;margin-top: 10px;" >
    <div style="width: 400px">
        <ul style="">
            <li>
                <img src="${pageContext.request.contextPath}/style/images/logo.png" width="150" height="80" alt="钱程无忧-关注你的钱程"/>
            </li>

            <li>

            </li>
        </ul>

    </div>
</div>
</body>
</html>
