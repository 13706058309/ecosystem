<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/11
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comp/BackOnlinePosition.css">
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<body>

<script id="btns" type="text/html">
    <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="offLine">下线</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
</script>

    <h1 style="text-align: center">已发布岗位</h1>
    <br>
    <input type="hidden" value="${pageContext.request.contextPath}" id="path">
<div class="demoTable layui-form" style="margin-left: 25%">
    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">发布时间</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="beginTime"  placeholder="yyyy-MM-dd">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">至</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="endTime" placeholder="yyyy-MM-dd">
            </div>
        </div>

    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">岗位名称:</label>
        <div class="layui-input-inline">
            <input type="tel" id="postName"  class="layui-input">
        </div>

        <div class="layui-input-inline" style="margin-left: 8%">
            <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" data-type="reload">查询</button>
        </div>
    </div>
</div>

    <table id="onLineTable" lay-filter="test"></table>
</body>
<script>
    var layer;
    var path = $("#path").val();
    var objs;
    var index;
    var form;
    layui.use(['laydate','layer','form'],function () {
        form = layui.form;
        form.render();
        var laydate = layui.laydate;
        layer = layui.layer;
    })

    layui.use('table',function () {
        var table = layui.table;
        table.render({
            elem:'#onLineTable',
            height:332,
            limits:[5],
            limit:5,
            url:"${pageContext.request.contextPath}/rec/findOnlinePosition",
            page:true,
            id: 'testReload',
            cols:[[
                {field:'postName',title:'岗位名称',sort:true},
                {field:'department',title:'部门'},
                {field:'education',title:'学历'},
                {field:'workNature',title:'工作性质'},
                {field:'workYear',title:'工作时间'},
                {field:'releaseTime',title:'发布时间'},
                {title:'操作',toolbar:'#btns',width:250}
            ]]
        });

        table.on('tool(test)', function(obj){
            var data = obj.data;
            var pPostId = data.pPostId;

            if(obj.event === 'del'){
                layer.confirm('是否删除',{
                    btn:['删除','取消'],
                    time:20000,
                },function (index) {
                    $.ajax({
                        url:path+"/rec/delPositionStand",
                        data:"pPostId="+pPostId,
                        type:"post",
                        typeData:"text",
                        success:function (info) {
                            layer.msg(info);
                            if(info=='删除成功'){
                                obj.del();
                            }
                        },
                    })
                })
            } else if(obj.event === 'offLine'){
                layer.confirm('是否下线岗位',{
                    btn:['下线','取消'],
                    time:20000,
                },function (index) {
                    $.ajax({
                        url:path+"/rec/offLinePosition",
                        data:"pPostId="+pPostId,
                        type:"post",
                        typeData:"text",
                        success:function (info) {
                            if(info=='1'){
                                layer.msg("下线成功");
                                obj.del();
                            }else{
                                layer.msg("网络繁忙，下线失败");
                            }
                        },
                    })
                })
            }else if(obj.event==='down'){
                var docPath = obj.data.path;
                location.href = path+"/doc/downFile?docID="+docID;
            }
        });

        var $ = layui.$, active = {
            reload: function(){
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                    where: {
                        postName: $('#postName').val(),
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
    function closeLayer() {
        layer.close(index);
    }

</script>
</html>
