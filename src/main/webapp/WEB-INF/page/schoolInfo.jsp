
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
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
</script>
<div style="display: none;width: 360px;height: 250px;" id="changeDiv">
    <br>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label"  >账号：</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="account1">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label" >性别：</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="sex1">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label" >昵称：</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="name1">
            </div>
        </div>
        <div class="layui-inline">
            <div class="layui-input-inline">
                <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" style="margin-left: 100px" onclick="sureChange()">确定</button>
            </div>
        </div>
    </div>
</div>

<input type="hidden" value="${pageContext.request.contextPath}" id="path">

<table id="userTable" lay-filter="test"class="layui-table-page"></table>
</body>
<script>
    var layer;
    var path = $("#path").val();
    var uIDs;
    var objs;
    layui.use(['laydate','layer'],function () {
        layer = layui.layer;

    })


    layui.use('table',function () {
        var table = layui.table;
        table.render({
            elem:'#userTable',
            height:312,
            url: 'showSchoolInfo' ,//数据接口,
            cols: [[ //表头
                {field: 'id', title: 'ID', sort: true}
                ,{field: 'account', title: '账号',sort: true }
                ,{field: 'sex', title: '性别', sort: true}
                ,{field: 'name', title: '昵称', sort: true}
                ,{field: 'regTime', title: '注册时间', sort: true}
                ,{title:'操作',toolbar:'#btns',width:210}
            ]]


        });

        table.on('tool(test)', function(obj){
            var data = obj.data;
             if(obj.event === 'edit'){
                $("#account1").val(data.account);
                $("#sex1").val(data.sex);
                $("#name1").val(data.name);
                layer.open({
                    type:1,
                    content:$("#changeDiv"),
                })
                uIDs = data.id;
                objs = obj;
            }
        });

    })
    function closeLayer() {
        layer.close(layer.index);
    }
    function sureChange() {
        var account = $("#account1").val().trim();
        var sex = $("#sex1").val().trim();
        var name = $("#name1").val().trim();
        $.ajax({
            url:path+"/userServlet?methodName=changeUser",
            data:"uID="+uIDs+"&account="+account+"&sex="+sex+"&name="+name,
            type:"get",
            typeData:"text",
            beforeSend:function () {
                if(name.length==0||sex.length==0||account.length==0){
                    layer.msg("请填写完整");
                    return false;
                }

                return confirm("确定修改");
            },
            success:function (info) {
                layer.msg(info,{
                    time:1000,
                    end:function () {
                        if (info=="修改成功"){
                            location.href=path+"/talent/schoolInfo";
                        }
                    }
                })
            },
        })
    }

</script>
</html>
