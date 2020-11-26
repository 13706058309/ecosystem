<%--
  Created by IntelliJ IDEA.
  User: yuzhen
  Date: 2020/11/19
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<html>
<head>
    <title>后台日志</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<style>
    .layui-table th{
        text-align: center;
    }
    .layui-table{
        text-align: center;
    }

    #lay{
        font-size: 18px;
    }

    .layui-form-select dl {
        max-height:200px;
    }

    .layui-table-page {
        text-align: center;
    }

</style>
<body>
<h1 style="text-align: center">日志查看</h1>
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
<div class="demoTable" style="margin-left: 20%">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">开始时间</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="beginTime" placeholder="yyyy-MM-dd">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">结束时间</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="endTime" placeholder="yyyy-MM-dd">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">操作人:</label>
        <div class="layui-input-inline">
            <input type="tel" id="bUserName" lay-verify="required|phone" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-input-inline" style="margin-left: 8%">
            <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" data-type="reload">查询</button>
        </div>
    </div>
</div>

<table id="dailyTable" lay-filter="test"></table>
</body>
<script>
    var layer;
    var path = $("#path").val();

    layui.use(['laydate','layer'],function () {
        var laydate = layui.laydate;
        layer = layui.layer;
        laydate.render({
            elem:'#beginTime'
        });

        laydate.render({
            elem:'#endTime'
        });
    })

    layui.use('table',function () {
        var table = layui.table;
        table.render({
            elem:'#dailyTable',
            height:312,
            limits:[3,6],
            limit:3,
            url:"${pageContext.request.contextPath}/backLog/findLog",
            page:true,
            id: 'testReload',
            cols:[[
                {field:'bLogId',title:'ID',width: 120, sort: true, fixed: 'left'},
                {field:'operaTime',title:'操作时间',sort:true},
                {field:'bUserName',title:'操作人',templet:'<div>{{d.backUser.bUserName}}</div>'},
                {field:'matter',title:'操作事项'},
            ]]
        });

        var $ = layui.$, active = {
            reload: function(){
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                    where: {
                        bUserName: $('#bUserName').val(),
                        beginTime:$('#beginTime').val(),
                        endTime:$('#endTime').val(),
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    })


</script>
</html>