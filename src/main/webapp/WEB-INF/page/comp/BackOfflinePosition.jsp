<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/11
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<body>
<script id="btns" type="text/html">
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="go">查看详情</a>
</script>

<h1 style="text-align: center">已下线岗位</h1>
<br>
<input type="hidden" value="${pageContext.request.contextPath}" id="path">

<table id="userTable" lay-filter="test"></table>

<button onclick="oper()">dfds</button>
<div id="changeDiv" style="display: none;margin-top: 3%">
    <form class="layui-form" action="" style="margin-left: 15%;margin-right: 15%">
        <div class="layui-form-item" >
            <label class="layui-form-label">职位类别</label>
            <div class="layui-input-inline">
                <select name="quiz1">

                </select>
            </div>
            <div class="layui-input-inline">
                <select name="quiz2">

                </select>
            </div>
            <div class="layui-input-inline">
                <select name="quiz3">

                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">岗位名称:</label>
            <div class="layui-input-inline">
                <input type="text" id="account" name="account" lay-verify="required|phone" autocomplete="off" class="layui-input" >
                <label class="layui-form-label" style="color: red;display: none">skfsadsads</label>
            </div>

        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">所属部门:</label>
            <div class="layui-input-inline">
                <input type="text" id="department" name="account" lay-verify="required|phone" autocomplete="off" class="layui-input" >
            </div>
        </div>

        <hr class="layui-bg-green">

        <div class="layui-form-item">
            <label class="layui-form-label">工作性质</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="全职" title="全职" checked="">
                <input type="radio" name="sex" value="兼职" title="兼职">
                <input type="radio" name="sex" value="实习" title="实习" >
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">月薪范围</label>
                <div class="layui-input-inline" style="width: 200px;">
                    <input type="text" name="price_min" placeholder="￥" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">-</div>
                <div class="layui-input-inline" style="width: 200px;">
                    <input type="text" name="price_max" placeholder="￥" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">k</div>
            </div>
        </div>

        <div class="layui-form-item" >
            <label class="layui-form-label">工作城市</label>
            <div class="layui-input-inline">
                <select name="quiz1">

                </select>
            </div>
            <div class="layui-input-inline">
                <select name="quiz2">

                </select>
            </div>

        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">具体地址:</label>
            <div class="layui-input-inline">
                <input type="text" id="address" name="account" lay-verify="required|phone" autocomplete="off" class="layui-input" >
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">招收人数:</label>
            <div class="layui-input-inline">
                <input type="text" id="num" name="account" lay-verify="required|phone" autocomplete="off" class="layui-input" >
            </div>
        </div>
        <hr class="layui-bg-green">

        <div class="layui-form-item" >
            <label class="layui-form-label">工作经验</label>
            <div class="layui-input-inline">
                <select name="quiz1">
                    <option>不限</option>
                    <option>应届毕业生</option>
                    <option>1年以下</option>
                    <option>1-3年</option>
                    <option>3-5年</option>
                    <option>5-10年</option>
                    <option>10年以上</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item" >
            <label class="layui-form-label">学历</label>
            <div class="layui-input-inline">
                <select name="quiz1">
                    <option>不限</option>
                    <option>大专</option>
                    <option>本科</option>
                    <option>硕士</option>
                    <option>博士</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">投递邮箱</label>
            <div class="layui-input-inline">
                <input type="text" id="email" name="email" lay-verify="required|phone" autocomplete="off" class="layui-input" >
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">工作描述</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" class="layui-textarea" style="width: 60%; height: 35%"></textarea>
            </div>
        </div>

        <hr class="layui-bg-green">

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">修改</button>
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">退出</button>
            </div>
        </div>
    </form>
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
    })

    $(function () {
        $.ajax({
            url:path+"/docConfig/findAll",
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

    function oper() {
        layer.open({
            type:1,
            area:['80%','70%'],
            offset: ['5%', '10%'],
            content:$("#changeDiv"),
        })
    }

</script>
</html>
