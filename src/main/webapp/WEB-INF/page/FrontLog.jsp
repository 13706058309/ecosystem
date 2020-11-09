<%--
  Created by IntelliJ IDEA.
  User: lxz
  Date: 2020/10/13
  Time: 15:16
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
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>昵称</th>
                <th>加入时间</th>
                <th>签名</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>贤心</td>
                <td>2016-11-29</td>
                <td>人生就像是一场修行</td>
            </tr>
            <tr>
                <td>许闲心</td>
                <td>2016-11-28</td>
                <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
            </tr>
            </tbody>
        </table>
        <div style="margin-left: 200px;">上一页</div>
        <div style="margin-left: 300px;margin-top: -20px">下一页</div>
        </div>
</form>



</body>
</html>
