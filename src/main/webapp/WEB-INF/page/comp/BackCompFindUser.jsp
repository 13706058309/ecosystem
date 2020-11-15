<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/10
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/BackCompFindUser.css">
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>

<body>
<script id="btns" type="text/html">
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="go">查看详情</a>
</script>

<h1 style="text-align: center">招聘查找</h1>
<br>
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
<div class="demoTable layui-form" style="margin-left: 25%">
    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">姓名:</label>
            <div class="layui-input-inline">
                <input type="tel" id="userName" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">学历:</label>
            <div class="layui-input-inline">
                <input type="tel" id="education" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">行业:</label>
        <div class="layui-input-inline">
            <input type="tel" id="industry" lay-verify="required|phone" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-input-inline" style="margin-left: 12%" >
            <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" data-type="reload">查询</button>
        </div>
    </div>
</div>

<table id="userTable" lay-filter="test"></table>
</body>
<script>
    var layer;
    var path = $("#path").val();
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
            elem:'#userTable',
            height:312,
            limits:[3,6],
            limit:3,
            url:"${pageContext.request.contextPath}/doc/checkDoc",
            page:true,
            id: 'testReload',
            cols:[[
                {field:'doc_Name',title:'文档标题',sort:true},
                {field:'user_Name',title:'上传人',templet:'<div>{{d.userInfo.user_Name}}</div>'},
                {field:'up_Time',title:'上传时间',sort:true},
                {field:'dow_Score',title:'下载积分',sort:true},
                {field:'doc_type',title:'文档类型',templet:'<div>{{d.docConfig.doc_Type}}</div>'},
                {title:'操作',toolbar:'#btns',width:250}
            ]]
        });

        table.on('tool(test)', function(obj){
            var data = obj.data;
            docID = data.doc_ID;
            var u_ID = data.u_ID;
            var doc_Type_ID = data.doc_Type_ID;
            if(obj.event === 'go'){
                $.ajax({
                    url:path+"/doc/changeDocStand",
                    data:"doc_ID="+docID+"&standID=5&u_ID="+u_ID+"&doc_Type_ID="+doc_Type_ID,
                    type:"get",
                    typeData:"text",
                    beforeSend:function () {
                        return confirm("确定通过");
                    },
                    success:function (info) {
                        layer.msg(info);
                        if(info=='修改成功'){
                            obj.del();
                        }
                    },
                })

            } else if(obj.event === 'pass'){
                $.ajax({
                    url:path+"/doc/changeDocStand",
                    data:"doc_ID="+docID+"&standID=6",
                    type:"get",
                    typeData:"text",
                    beforeSend:function () {
                        return confirm("确定不通过");
                    },
                    success:function (info) {
                        layer.msg(info);
                        if(info=='修改成功'){
                            obj.del();
                        }
                    },
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

</script>
</html>
