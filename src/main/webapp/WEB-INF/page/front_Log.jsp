<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/9
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>前台日志管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../JS/layui/css/layui.css">
    <input id="path" type="hidden" value="${pageContext.request.contextPath}">

</head>

<style>
    .container{
        width: 620px;
        height: 400px;
        min-height: 400px;
        max-height: 400px;
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        margin: auto;
        padding: 20px;
        z-index: 100;
        border-radius: 8px;
        background-color: #fff;
        box-shadow: 0 3px 18px rgba(10, 0, 0, .5);
        font-size: 16px;
    }

    a:hover{
        text-decoration: underline;
    }

</style>

<script src="${pageContext.request.contextPath}/JS/jquery-3.5.1.js"></script>
<script charset="UTF-8" src="${pageContext.request.contextPath}/JS/value.js"></script>
<script src="${pageContext.request.contextPath}/JS/layui/layui.js"></script>

<body>

<form class="layui-form" action="denglujieguo" method="post">
    <div class="container">
        <div class="layui-form-item">
            查询条件：
        </div>

        <div class="layui-form-item">
            &nbsp;&nbsp;&nbsp;日志时间：<input type="text" style="height: 30px">&nbsp;至&nbsp;<input type="text"style="height: 30px">
        </div>

        <div class="layui-form-item">
            <button type="submit" style="margin-left: 500px;margin-top: -50px;width: 75px">查询</button>
        </div>

    </div>
</form>

<table class="layui-table" lay-data="{width: 892, height:330, url:'/demo/table/user/', page:true, id:'idTest'}" lay-filter="demo">
    <thead>
    <tr>
        <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
        <th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th>
        <th lay-data="{field:'username', width:80}">用户名</th>
        <th lay-data="{field:'sex', width:80, sort: true}">性别</th>
        <th lay-data="{field:'city', width:80}">城市</th>
        <th lay-data="{field:'sign', width:160}">签名</th>
        <th lay-data="{field:'experience', width:80, sort: true}">积分</th>

        <th lay-data="{field:'classify', width:80}">职业</th>
        <th lay-data="{field:'wealth', width:135, sort: true}">财富</th>
        <th lay-data="{field:'score', width:80, sort: true, fixed: 'right'}">评分</th>
        <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
    </tr>
    </thead>
</table>

</body>
</html>
