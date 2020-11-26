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
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <title>高校管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

</head>

<body>
<script src="${pageContext.request.contextPath}/jquery-3.5.1.js"></script>
<script charset="UTF-8" src="${pageContext.request.contextPath}/js/value.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

<form class="layui-form" action="" method="post">
    <div class="layui-form-item" style="margin-left: 100px">
        <div class="layui-inline" style="margin-top: 20px">
            <label class="layui-form-label">高校名称</label>
            <div class="layui-input-inline" style="width: 100px;">
                <input type="text" name="price_min" autocomplete="off" class="layui-input" style="width: 195px">
            </div>
        </div>

        <div class="layui-inline" style="margin-top: 20px;margin-left: 20px">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline" style="width: 195px;">
                <select name="city" lay-verify="required" style="margin-top: 140px">--%>
                    <option value=""></option>
                    <option value="0">启用</option>
                    <option value="1">禁用</option>
                </select>
            </div>
        </div>
    </div>
            <div class="layui-form-item" style="margin-left: 550px;margin-top: -47px;">
                <button type="button" class="layui-btn" style="margin-top: -10px;margin-left: 200px;width: 75px">搜索</button>
            </div>
    <table id="demo" lay-filter="test" style="margin-left: -600px"></table>
    <script>
        layui.use('table', function () {
            var table = layui.table;
            //第一个实例
            table.render({
                elem: '#demo'
                , height: 512
                , url: '/demo/table/user/' //数据接口
                , page: true //开启分页
                , cols: [[ //表头
                    {field: '1', title: '序列', width: 80, sort: true, fixed: 'left'}
                    , {field: '2', title: '用户名', width: 80}
                    , {field: '3', title: '联系方式', width: 80, sort: true}
                    , {field: '4', title: '学校名称', width: 80}
                    , {field: '5', title: '注册时间', width: 177}
                    , {field: '5', title: '操作', width: 177}
                ]]
            });
        });
    </script>
    <%--        <div style="margin-left: 150px;">上一页</div>--%>
    <%--        <div style="margin-left: 235px;margin-top: -20px">1/1</div>--%>
    <%--        <div style="margin-left: 300px;margin-top: -20px">下一页</div>--%>

</form>

</body>
</html>
