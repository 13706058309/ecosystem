<%--
  Created by IntelliJ IDEA.
  User: yuzhen
  Date: 2020/11/20
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>申请记录表格</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
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
<h1 style="text-align: center">申请记录查询</h1>
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<div class="demoTbale" style="text-align: center">
    用户名:
    <div class="layui-inline" >
        <input type="text" class="layui-input"  id="username"  placeholder="请输入姓名">
    </div>

    <button class="layui-btn" data-type="reload" id="serch" onclick="">查询</button>
    </div>
<table id="jlgl" lay-filter="test"></table>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="show">查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="examine">审核</a>
</script>


<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js" charset="UTF-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>

    var path = $("#path").val();

    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#jlgl'
            ,url:path+'/zsgl/getJl'
            // ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            // ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
            //     title: '提示'
            //     ,layEvent: 'LAYTABLE_TIPS'
            //     ,icon: 'layui-icon-tips'
            // }]
            ,title: '用户数据表'
            ,cols: [[
                {type:'numbers', title:'编号', width:100, fixed: 'left', sort: true}
                ,{field:'userName', title:'用户名', width:200, templet:function (data) {
                        return data.user.userName;
                    }}
                ,{field:'fieldName', title:'领域名字', width:200 ,templet:function (data) {
                        return data.field.fieldName;
                    }}
                ,{field:'beginTime', title:'申请时间', width:300}
                ,{field:'turnoverTime', title:'修改时间', width:300}
                ,{field:'trueName', title:'真实姓名', width:200}
                ,{field:'cerPhone', title:'联系号码', width:200}
                ,{field:'state', title:'审核状态', width:200 ,templet:function (data) {
                        return data.state.paramName;
                    }}
                ,{fixed: '', title:'操作', toolbar: '#barDemo', width:200}
            ]]
            ,page: true
        });



        //头工具栏事件
        // table.on('toolbar(test)', function(obj){
        //     var checkStatus = table.checkStatus(obj.config.id);
        //     switch(obj.event){
        //         case 'getCheckData':
        //             var data = checkStatus.data;
        //             layer.alert(JSON.stringify(data));
        //             break;
        //         case 'getCheckLength':
        //             var data = checkStatus.data;
        //             layer.msg('选中了：'+ data.length + ' 个');
        //             break;
        //         case 'isAll':
        //             layer.msg(checkStatus.isAll ? '全选': '未全选');
        //             break;
        //
        //         //自定义头工具栏右侧图标 - 提示
        //         case 'LAYTABLE_TIPS':
        //             layer.alert('这是工具栏右侧自定义的一个图标按钮');
        //             break;
        //     };
        // });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            var cerId = data.cerId;
            //console.log(obj)
            if(obj.event === 'examine'){

            } else if(obj.event === 'show'){

            }
        });
    });

</script>
</body>
</html>
