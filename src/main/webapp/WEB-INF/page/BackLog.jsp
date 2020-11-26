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
    <title>后台日志管理</title>
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <input id="path" type="hidden" value="${pageContext.request.contextPath}">

</head>

<body>

<script src="${pageContext.request.contextPath}/jquery-3.5.1.js"></script>
<script charset="UTF-8" src="${pageContext.request.contextPath}/js/value.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

<form class="layui-form" action="denglujieguo" method="post">
    <div class="container">
        <div class="layui-form-item">
            查询条件：
        </div>

        <div class="layui-form-item">
            &nbsp;&nbsp;&nbsp;日志时间：<input type="text" style="height: 30px">&nbsp;至&nbsp;<input type="text"style="height: 30px">
        </div>

        <div class="layui-form-item">
            <button type="submit" style="margin-left: 500px;margin-top: -30px;width: 75px">查询</button>
        </div>
        <table id="demo" lay-filter="test"></table>
        <script>
            layui.use('table', function(){
                var table = layui.table;
                //第一个实例
                table.render({
                    elem: '#demo'
                    ,height: 312
                    ,url: '/demo/table/user/' //数据接口
                    ,page: true //开启分页
                    ,cols: [[ //表头
                        {field: '1', title: '序列', width:80, sort: true, fixed: 'left'}
                        ,{field: '2', title: '操作人', width:80}
                        ,{field: '3', title: '操作时间', width:80, sort: true}
                        ,{field: '5', title: '操作事项', width: 177}
                    ]]
                });
            });
        </script>
<%--        <div style="margin-left: 200px;">上一页</div>--%>
<%--        <div style="margin-left: 300px;margin-top: -20px">下一页</div>--%>
        </div>
</form>



</body>
</html>
