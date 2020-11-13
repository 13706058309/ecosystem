<%--
  Created by IntelliJ IDEA.
  User: WUWX
  Date: 2020/11/10
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" type="text/css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <title>个人中心</title>
    <style>
        body{
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-container">
<%--    <blockquote class="layui-elem-quote">注意：下述演示中的颜色只是做一个区分作用，并非栅格内置。</blockquote>--%>

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>始终等比例水平排列</legend>
    </fieldset>

    <div class="layui-row" style="margin-top:10px ">
        <div class="layui-col-xs12">
            <div class="grid-demo grid-demo-bg1"></div>
        </div>
        <div class="layui-col-xs3">
            <div class="grid-demo grid-demo-bg1">
                <div>
                    <h1>我的信息</h1>
                    <div><a href="">密码修改</a></div>
                    <div><a href="">收藏岗位</a></div>
                </div>
                <div style="margin-top:10px ">
                    <h1>简历设置</h1>
                    <div><a href="">修改设置</a></div>
                </div>
            </div>
        </div>
        <div class="layui-col-xs9">
            <div class="grid-demo">
                <iframe src="${pageContext.request.contextPath}/center/jianli" id="iframe" style="height: 80%;width: 100%" name="iframe"></iframe>
            </div>
        </div>
        <div class="layui-col-xs12">
            <div class="grid-demo grid-demo-bg1">6/12</div>
        </div>
    </div>
</div>
</body>
</html>
