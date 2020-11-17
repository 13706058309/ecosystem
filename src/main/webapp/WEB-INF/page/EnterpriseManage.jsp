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
    <title>企业管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../JS/layui/css/layui.css">

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
        <div class="layui-form-item" style="margin-top: 20px;margin-left: 20px">企业名称：<input type="text"></div>

        <div class="layui-form-item" style="height: 30px;margin-left: 300px;margin-top: -35px">状态：<input type="text">
<%--            <select style="width: 180px">--%>
<%--             <option>---</option>--%>
<%--                <option>禁用</option>--%>
<%--                <option>启用</option>--%>
<%--            </select>--%>
        </div>

        <div class="layui-form-item">
            <button type="submit" style="margin-left: 550px;margin-top: -35px;width: 75px">搜索</button>
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
                        ,{field: '2', title: '企业名称', width:80}
                        ,{field: '3', title: '联系方式', width:80, sort: true}
                        ,{field: '5', title: '申请人', width: 177}
                        ,{field: '5', title: '申请时间', width: 177}
                        ,{field: '5', title: '操作', width: 177}
                    ]]
                });
            });
        </script>
<%--        <div style="margin-left: 150px;">上一页</div>--%>
<%--        <div style="margin-left: 235px;margin-top: -20px">1/1</div>--%>
<%--        <div style="margin-left: 300px;margin-top: -20px">下一页</div>--%>
        </div>
</form>



</body>
</html>
