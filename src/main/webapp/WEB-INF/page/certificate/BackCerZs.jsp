<%--
  Created by IntelliJ IDEA.
  User: yuzhen
  Date: 2020/11/11
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>证书管理表格</title>
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
<h1 style="text-align: center">证书查询</h1>
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<div class="demoTbale" style="text-align: center">
    领域名字:
    <div class="layui-inline" style="width: 300px;">
        <input type="text" class="layui-input"  id="fieldName"  placeholder="按领域名字搜索">
    </div>
    证书费用:
    <div class="layui-inline" style="width: 300px;">
        <input type="text" class="layui-input"  id="certificationFee"  placeholder="按证书费用搜索">
    </div>

    <button class="layui-btn" data-type="reload" id="serch" onclick="">查询</button>
    <button class="layui-btn" data-type="reload" id="insertStaff" onclick="insert()" >新增</button>
</div>
<table id="zstb" lay-filter="test"></table>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js" charset="UTF-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var path = $("#path").val();
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#zstb'
            ,url:path+'/zsgl/getZs'
            // ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            // ,defaultToolbar: ['', '', '', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
            //
            // }]
            ,title: '用户数据表'
            ,cols: [[
                {type:'numbers', title:'编号', width:200, fixed: 'center', unresize: true, sort: true}
                ,{field:'fieldName', title:'领域名字', fixed: 'center' , width:200 ,templet:function (data) {
                     return data.field.fieldName;
                    }}
                ,{field:'cerChangeTime',fixed: 'center', title:'变更时间', width:350}
                ,{field:'certificationFee', fixed: 'center' ,title:'证书费用',width:300}
                    ,{field:'cerTrait',fixed: 'center', title:'证书特点', width:450}
                ,{fixed: '', title:'操作', toolbar: '#barDemo', width:400}
            ]]
            ,page: true
        });



        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            var cerId = data.cerId;

            //console.log(obj)
            if(obj.event === 'del'){
                // alert("1123123123123123123");
                $.ajax({
                    url:path+"/zsgl/delZs",
                    data:"cerId="+cerId,
                    type:"get",
                    typeData:"text",
                    beforeSend:function () {
                        return confirm("确定删除吗?");
                    },
                    success:function (info) {
                        if (info=='delSuccess'){
                            obj.del();
                            // obj.sta
                            layer.msg("删除成功!");
                        }
                    }
                })
            } else if(obj.event === 'edit'){
                layer.prompt({
                    formType: 2
                    ,value: data.email
                }, function(value, index){
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });
            }
        });
    });


    //新增
    function insert(){
        layui.layer.open({
            //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
            type: 1,
            title: "添加证书",
            area: ['600px', '400px'],
            content: $("#insert")//引用的弹出层的页面层的方式加载修改界面表单
        });
        //指定允许上传的文件类型
        upload.render({
            elem: '#test3'
            ,url: '' //改成您自己的上传接口
            ,accept: 'file' //普通文件
            ,done: function(res){
                layer.msg('上传成功');
                console.log(res);
            }
        });
    }
</script>
<!--表单的id用于表单的选择，style是在本页隐藏，只有点击编辑才会弹出-->
<div class="layui-row" id="insert" style="display:none">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane"  style="text-align: center">
            <div class="layui-form-item">
                <label class="layui-form-label">真实姓名:</label>
                <div class="layui-input-block">
                    <input type="text" name="username"  required  lay-verify="required" autocomplete="off" placeholder="请输入您的真实姓名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系号码:</label>
                <div class="layui-input-block">
                    <input type="text" name="number"  required  lay-verify="required" autocomplete="off" placeholder="请输入您的手机号" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">上传项目:</label>
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" id="test3"><i class="layui-icon"></i>上传文件</button>
<%--                    <input type="text" name="number"  required  lay-verify="required" autocomplete="off" placeholder="请输入您的手机号" class="layui-input">--%>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">身份证上传:</label>
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" id="test1">上传图片</button>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="demo1">
                        <p id="demoText"></p>
                    </div>
                    <%--                    <input type="text" name="number"  required  lay-verify="required" autocomplete="off" placeholder="请输入您的手机号" class="layui-input">--%>
                </div>
            </div>

            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
<%--                    <button type="button" class="layui-btn layui-btn-warm" lay-submit lay-filter="demo11">提交</button>--%>
                    <button class="layui-btn layui-btn-warm " lay-submit lay-filter="demo11"   >提交</button>
<%--                    <button class="layui-btn layui-btn-warm " onclick="function close() {--%>
<%--                        // $(this).close();--%>
<%--                        $(this).hide();--%>
<%--                    }"   >取消</button>--%>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
