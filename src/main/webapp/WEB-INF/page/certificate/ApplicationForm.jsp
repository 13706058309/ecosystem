<%--
  Created by IntelliJ IDEA.
  User: WTQ
  Date: 2020/11/12
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>证书申请列表</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/style.css"/>
</head>
<body>
<div id="body">
    <div id="container" >

        <table class="layui-table" lay-data="{width: 1032, height:632, url:'/demo/table/user/',cellMinWidth: 80 , page:true, id:'idTest'}" lay-filter="demo">
            <thead>
            <tr>
                <th lay-data="{field:'id', fixed: true,  align:'center'}">ID</th>
                <th lay-data="{field:'username',  align:'center'}">申请人</th>
                <th lay-data="{field:'sex',  align:'center'}">证书类型</th>
                <th lay-data="{field:'city',  align:'center'}">申请时间</th>
                <th lay-data="{field:'sign',  align:'center'}">结束时间</th>
                <th lay-data="{field:'experience',  align:'center'}">申请状态</th>
                <th lay-data="{fixed: 'right',  align:'center', toolbar: '#barDemo'}">操作</th>
            </tr>
            </thead>
        </table>
    </div>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('table', function(){
        var table = layui.table;
        //监听表格复选框选择
        table.on('checkbox(demo)', function(obj){
            console.log(obj)
        });
        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });


        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>

</body>
</html>
