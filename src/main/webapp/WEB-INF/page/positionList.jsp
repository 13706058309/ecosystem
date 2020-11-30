<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="../js/jquery-3.5.1.js"></script>
<script src="../layui/layui.js"></script>
<link  type="text/css" rel="stylesheet" href="../layui/css/layui.css">


<html>
<head>
    <title>Title</title>
</head>
<style>
    .layui-table th{
        text-align: center;
    }
    .layui-table{
        text-align: center;
    }

    .layui-table-page{
        text-align: center;
    }

    .layui-form-select dl {
        max-height:200px;
    }
   
</style>
<body>

<script id="btns" type="text/html">

    <button  class="layui-btn layui-btn-xs"   lay-event="recommend">推荐</button>
</script>
<br><br>
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
<div id="talentDiv" style="display: none" >
    <div class="talentTable" style="margin-left: 10%">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">起始时间:</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="beginTime"  >
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">终止时间:</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="endTime" >
                </div>
            </div>
        </div>

        <div class="layui-form-item" >
            <label class="layui-form-label">高校名称:</label>
            <div class="layui-input-inline">
                <input type="tel" id="school" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">专业:</label>
            <div class="layui-input-inline">
                <input type="tel" id="profession" lay-verify="required|phone" autocomplete="off" class="layui-input">
<%--                <button type="button" class="layui-btn  layui-btn-lg" data-type="reload"style="width: 100px">搜索</button>--%>
            </div>

            <div class="layui-input-inline" >
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <button type="button" class="layui-btn  layui-btn-lg" data-type="reload"style="width: 100px">搜索</button>
            </div>
        </div>
    </div>

    <table id="talentTable" lay-filter="test"class="layui-table-page"></table>
    <div class="layui-inline">
        <div class="layui-input-inline" style="margin-left: 400px">
            <button type="button" class="layui-btn layui-btn-lg " onclick="back()">返回</button>
        </div>
    </div>
</div>
<div class="demoTable" style="margin-left: 5%">
    <div class="layui-form-item">
        <label class="layui-form-label">公司:</label>
        <div class="layui-input-inline">
            <input type="tel" id="companyName" lay-verify="required|phone" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">行业:</label>
        <div class="layui-input-inline">
            <input type="tel" id="industryName" lay-verify="required|phone" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">岗位:</label>
        <div class="layui-input-inline">
            <input type="tel" id="postName" lay-verify="required|phone" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-input-inline" style="margin-left: 8%">
            <button type="button" class="layui-btn layui-btn-radius layui-btn-lg"  data-type="reload"style="width: 100px">搜索</button>
        </div>
    </div>
</div>

    <table id="userTable" lay-filter="test"class="layui-table-page"></table>

</body>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-bg-orange layui-btn-sm" lay-event="recommendSure">确定推荐</button>
    </div>
</script>
<style>
    .layui-table-cell .layui-form-checkbox[lay-skin="primary"]{
        top: 50%;
        transform: translateY(-50%);
    }
</style>
<script>
    var companyID;
    var $;
    var layer;
    var path = $("#path").val();
    var uIDs;
    var objs;
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
            elem:'#userTable',
            height:325,
            limits:[5,10],
            limit:5,
            url: 'findPosition' ,//数据接口,
            page:true,
            id: 'testReload',
                    cols: [[ //表头

                        {field: 'industryName', title: '行业',sort: true }
                        ,{field: 'compName', title: '公司', sort: true}
                        ,{field: 'postName', title: '岗位', sort: true}
                        ,{field: 'releaseTime', title: '发布时间', sort: true}
                        ,{title:'操作',toolbar:'#btns',width:100}
                    ]]


        });
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event==='recommend'){
                companyID=data.companyID;
                layer.open({
                    type: 1,

                    offset: '30px',
                    area:["1000px","650px"],
                    content:$("#talentDiv"),
                })
            }

        });

        $ = layui.$, active = {
            reload: function(){
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                    where: {
                        companyName:$('#companyName').val(),
                        postName: $('#postName').val(),
                        industryName: $('#industryName').val(),
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    })

    layui.use('table',function () {
        var table = layui.table;
        table.render({
            elem:'#talentTable',
            height:350,
            limits:[5,10],
            limit:5,
            url: 'findTalent',//数据接口,
            toolbar: '#toolbarDemo', //开启头部工具栏，并为其绑定左侧模板
            defaultToolbar: ['filter',  { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
            title: ''
            ,layEvent: 'LAYTABLE_TIPS'
            ,icon: 'layui-icon-tips'
        }],
            page:true,
            id: 'testReloadTalent',
            cols: [[ //表头
                // {type:'radio'}
                {type:'checkbox'}
                ,{field: 'talentId', title: '人才ID',width: 160 }
                ,{field: 'talentName', title: '名字', width: 160}
                ,{field: 'school', title: '学校', width: 160}
                ,{field:'profession',title:'专业',width: 160}
                ,{field:'education',title:'学历',width: 160}
            ]]
        });
        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'recommendSure':
                    var data = checkStatus.data;
                    var talentIds=new Array();
                    for (var i=0;i<data.length;i++){
                        talentIds.push(JSON.stringify(data[i].talentId));
                    }
                    $.ajax({
                        url:path+"/talent/recommendSure",
                        data:"companyID="+companyID+"&talentIds="+talentIds,
                        type:"get",
                        typeData:"text",
                        beforeSend:function () {
                            if(data.length==0){
                                layer.msg("请先选择要推荐的人才")
                                return false;
                            }
                            return true;
                        },
                        success:function (info) {
                            layer.msg(info);
                        },
                    })
                    break;
            };
        });
        var $ = layui.$, active = {
            reload: function(){
                //执行重载
                table.reload('testReloadTalent', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                    where: {
                        profession: $('#profession').val(),
                        school: $('#school').val(),
                        beginTime:$('#beginTime').val(),
                        endTime:$('#endTime').val(),
                    }
                }, 'data');
            }
        };

        $('.talentTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    })
    function back(){

        location.reload();
    }
</script>
</html>
