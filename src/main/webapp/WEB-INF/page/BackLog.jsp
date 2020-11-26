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
<%--        <input id="path" type="hidden" value="${pageContext.request.contextPath}">--%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script charset="UTF-8" src="${pageContext.request.contextPath}/js/value.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

</head>

<%--<body>--%>


<%--<form class="layui-form" action="denglujieguo" method="post">--%>
<%--    <div class="demoTable" style="margin-left: 0%">--%>
<%--    <div class="container">--%>
<%--        <div class="layui-form-item" style="margin-left: 40px;margin-top: 20px">--%>
<%--            查询条件：--%>
<%--        </div>--%>

<script src="${pageContext.request.contextPath}/jquery-3.5.1.js"></script>
<script charset="UTF-8" src="${pageContext.request.contextPath}/js/value.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

<%--        <div class="layui-form-item" style="margin-left: 100px">--%>
<%--            <div class="layui-inline" style="margin-top: 20px">--%>
<%--                <label class="layui-form-label">日志时间</label>--%>
<%--                <div class="layui-input-inline" style="width: 100px;">--%>
<%--                    <input type="text" class="layui-input" id="startTime" style="width: 195px" placeholder="yyyy-MM-dd">--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="layui-inline" style="margin-top: 20px;margin-left: 20px">--%>
<%--                <label class="layui-form-label">至</label>--%>
<%--                <div class="layui-input-inline" style="width: 195px;">--%>
<%--                    <input type="text" class="layui-input" id="endTime"   style="width: 195px" placeholder="yyyy-MM-dd">--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="layui-form-item" style="margin-left: 550px;margin-top: -47px;">--%>
<%--                <button type="button" class="layui-btn" style="margin-top: 0px;margin-left: 200px;width: 75px" data-type="reload">查询</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--        <table id="demo" lay-filter="test"></table>--%>
<%--        <script>--%>
<%--            layui.use('table', function(){--%>
<%--                var table = layui.table;--%>
<%--                //第一个实例--%>
<%--                table.render({--%>
<%--                    elem: '#demo'--%>
<%--                    ,height: 312--%>
<%--                    ,url: "${pageContext.request.contextPath}/test/bLog" //数据接口--%>
<%--                    ,page: true //开启分页--%>
<%--                    ,limits:[3,6]--%>
<%--                     ,limit:3--%>
<%--                    ,id:'testReload'--%>
<%--                    ,cols: [[ //表头--%>
<%--                        {field: 'bLogId', title: '序列', width:80, sort: true, fixed: 'left'}--%>
<%--                        ,{field: 'bUserId', title: '操作人', width:80}--%>
<%--                        ,{field: 'operaTime', title: '操作时间', width:180, sort: true}--%>
<%--                        ,{field: 'matter', title: '操作事项', width: 177}--%>
<%--                    ]]--%>
<%--                });--%>

<%--                var $ = layui.$, active = {--%>
<%--                    reload: function(){--%>
<%--                        alert("查询");--%>
<%--                        //执行重载--%>
<%--                        table.reload('testReload', {--%>
<%--                            page: {--%>
<%--                                curr: 1 //重新从第 1 页开始--%>
<%--                            },--%>
<%--                            where: {--%>
<%--                                startTime:$('#startTime').val(),--%>
<%--                                endTime:$('#endTime').val(),--%>
<%--                            }--%>
<%--                        }, 'data');--%>
<%--                    }--%>
<%--                };--%>

<%--                $('.demoTable .layui-btn').on('click', function(){--%>
<%--                    var type = $(this).data('type');--%>
<%--                    active[type] ? active[type].call(this) : '';--%>
<%--                });--%>
<%--            });--%>
<%--        </script>--%>
<%--        </div>--%>
<%--</form>--%>


</body>
</html>
<style>
    .layui-table th {
        text-align: center;
    }

    .layui-table {
        text-align: center;
    }

    #lay {
        font-size: 18px;
    }

    .layui-form-select dl {
        max-height: 200px;
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
                <input type="text" class="layui-input" id="startTime" placeholder="yyyy-MM-dd">
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

    layui.use(['laydate', 'layer'], function () {
        var laydate = layui.laydate;
        layer = layui.layer;
        laydate.render({
            elem: '#startTime'
        });

        laydate.render({
            elem: '#endTime'
        });
    })

    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#dailyTable',
            height: 470,
            limits: [10, 20],
            limit: 10,
            url: path+"/log/bLog",
            page: true,
            id: 'testReload',
            cols: [[
                {field: 'bLogId', title: '序列', width: 120, sort: true, fixed: 'left'}
                , {field: 'operaTime', title: '操作时间',width: 280, sort: true}
                , {field: 'bUserName', title: '操作人', width: 80,templet:'<div>{{d.backUser.bUserName}}</div>'}
                , {field: 'matter', title: '操作事项', width: 280}
            ]]
        });

        var $ = layui.$, active = {
            reload: function () {
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                    where: {
                        bUserName: $('#bUserName').val(),
                        startTime: $('#startTime').val(),
                        endTime: $('#endTime').val(),
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    })


</script>
</html>
