<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/11
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<style>
    .layui-table th{
        text-align: center;
    }
    .layui-table{
        text-align: center;
    }
    .layui-form-select dl {
        max-height:200px;
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
<script id="btns" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="down">下载</a>
</script>

<h1 style="text-align: center">待定简历</h1>
<br>
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
<div class="demoTable layui-form" style="margin-left: 30%">
    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label" style="width:100px">发布岗位名称:</label>
            <div class="layui-input-inline">
                <input type="tel" id="topic" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <div class="layui-input-inline" style="margin-top: -2%">
                <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" data-type="reload">查询</button>
            </div>
        </div>
    </div>

</div>

<table id="userTable" lay-filter="test"></table>

<div id="resumesDetailDiv" style="display: none">
    <table class="layui-table">
        <tr >
            <td width="19%">姓名</td>
            <td width="19%">2</td>
            <td width="19%">民族</td>
            <td width="19%">4</td>
            <td rowspan="4" colspan="2"></td>
        </tr>
        <tr >
            <td>政治面貌</td>
            <td>2</td>
            <td>出生年月日</td>
            <td>4</td>
        </tr>
        <tr >
            <td>毕业学校</td>
            <td>2</td>
            <td>工作年限</td>
            <td>4</td>
        </tr>
        <tr >
            <td>学历</td>
            <td>2</td>
            <td>专业</td>
            <td>4</td>
        </tr>
        <tr >
            <td>学历</td>
            <td>2</td>
            <td>专业</td>
            <td>4</td>
        </tr>
        <tr >
            <td>地址</td>
            <td colspan="2">2</td>
            <td>联系方式</td>
            <td colspan="2">4</td>
        </tr>
        <tr>
            <td rowspan="1">教育背景</td>
            <td colspan="5"> </td>
        </tr>

        <tr>
            <td rowspan="1">工作经验</td>
            <td colspan="5"> </td>
        </tr>

        <tr>
            <td rowspan="1">项目经验</td>
            <td colspan="5"> </td>
        </tr>

        <tr>
            <td rowspan="1">自我评价</td>
            <td colspan="5"> </td>
        </tr>

    </table>
</div>
</body>
<script>
    var layer;
    var path = $("#path").val();
    var docID;
    var objs;
    var index;
    var form;
    layui.use(['laydate','layer','form'],function () {
        form = layui.form;
        form.render();
        var laydate = layui.laydate;
        layer = layui.layer;
        laydate.render({
            elem:'#beginTime'
        });

        laydate.render({
            elem:'#endTime'
        });
    })

    $(function () {
        $.ajax({
            url:path+"/fDoc/findAll",
            type:"post",
            typeData:"text",
            success:function (data) {
                var arr = JSON.parse(data);
                $("#type").empty();
                var $sel = $("<option>"+'请选择'+"</option>");
                $("#type").append($sel)
                for(var i=0;i<arr.length;i++){
                    var $option = $("<option>"+arr[i].doc_Type+"</option>");
                    $("#type").append($option);
                }
                form.render();
            },
        });
    })

    layui.use('table',function () {
        var table = layui.table;
        table.render({
            elem:'#userTable',
            height:312,
            limits:[3,6],
            limit:3,
            url:"${pageContext.request.contextPath}/fDoc/findDoc",
            page:true,
            id: 'testReload',
            cols:[[
                {field:'doc_Name',title:'文档标题',sort:true},
                {field:'user_Name',title:'上传人',templet:'<div>{{d.userInfo.user_Name}}</div>'},
                {field:'up_Time',title:'上传时间',sort:true},
                {field:'dow_Score',title:'下载积分',sort:true},
                {field:'doc_type',title:'文档类型',templet:'<div>{{d.docConfig.doc_Type}}</div>'},
                {field:'dow_Num',title:'下载次数',sort:true},
                {title:'操作',toolbar:'#btns',width:250}
            ]]
        });

        table.on('tool(test)', function(obj){
            var data = obj.data;
            docID = data.doc_ID;
            var u_ID = data.u_ID;
            // var doc_Type_ID = data.doc_Type_ID;
            var score = data.dow_Score;
            var paths = data.path;
            if(obj.event === 'down'){
                if(userScore<score){
                    layer.msg("积分不足无法下载")
                    return false;
                }
                alert(docID);
                if(confirm("确定下载")){
                    location.href = path+"/fDoc/download?doc_ID="+docID;
                }
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
                        userName: $('#userName').val(),
                        beginTime:$('#beginTime').val(),
                        endTime:$('#endTime').val(),
                        topic:$('#topic').val(),
                        type:$('#type').val(),
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

    function returnMain() {
        location.href = path+"/front/main";
    }

    function oper() {
        layer.open({
            type:1,
            area:['80%','70%'],
            offset: ['5%', '10%'],
            content:$("#resumesDetailDiv"),
        })
    }

</script>
</html>
