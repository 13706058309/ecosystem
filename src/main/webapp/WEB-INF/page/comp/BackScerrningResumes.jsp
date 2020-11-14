<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/11
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comp/BackScerrningResumes.css">
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>

<body>
<script id="btns" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="refuse">拒绝</a>
</script>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">过滤选择的简历</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>

<h1 style="text-align: center">简历过滤</h1>
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
<div class="demoTable layui-form" style="margin-left: 10%">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">投递时间</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="beginTime"  placeholder="yyyy-MM-dd">
            </div>
        </div>
        <div class="layui-inline" style="margin-left: -1%">
            <label class="layui-form-label">至</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="endTime" placeholder="yyyy-MM-dd">
            </div>
        </div>

        <div class="layui-inline" style="margin-left: -1%">
            <label class="layui-form-label">应聘岗位:</label>
            <div class="layui-input-inline">
                <input type="tel" id="postName"  class="layui-input">
            </div>
        </div>

    </div>
    <div class="layui-form-item">

        <label class="layui-form-label">学历</label>
        <div class="layui-input-inline">
                <select class="layui-input" id="evdu">
                    <option value="0">不限</option>
                    <option value="1">高中及以下</option>
                    <option value="2">大专及以下</option>
                    <option value="3">本科及以下</option>
                    <option value="4">硕士及以下</option>
                    <option value="5">博士</option>
                </select>
        </div>

        <label class="layui-form-label">工作经验</label>
        <div class="layui-input-inline">
            <select class="layui-input" id="wrokYear">
                <option value="0">不限</option>
                <option value="1">1年以下</option>
                <option value="3">3年以下</option>
                <option value="5">5年以下</option>
                <option value="10">10年以下</option>
            </select>
        </div>

        <label class="layui-form-label">是否应届</label>
        <div class="layui-input-inline">
            <select class="layui-input" id="isGraduate">
                <option value="0">不限</option>
                <option value="1">应届生</option>
                <option value="2">非应届生</option>
            </select>
        </div>

        <div class="layui-input-inline" style="margin-left: 3%">
            <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" data-type="reload" style="width: 50%" >查询</button>
        </div>
    </div>
</div>

<table id="userTable" lay-filter="test"></table>

<div id="changeDiv" style="display: none">
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


    layui.use('table',function () {
        var table = layui.table;
        table.render({
            elem:'#userTable',
            toolbar: '#toolbarDemo',
            height:340,
            limits:[5],
            limit:5,
            url:"${pageContext.request.contextPath}/rec/findScerResumes",
            page:true,
            id: 'testReload',
            cols:[[
                {type: 'checkbox', fixed: 'left'},
                {field:'realName',title:'姓名'},
                {field:'isGraduate',title:'是否应届生',templet:function (d) {
                        if(d.isGraduate==1){
                            res = "是";
                        }else{
                            res = "否";
                        }
                        return res;
                    }},
                {field:'profession',title:'应聘岗位',templet:'<div>{{d.postPosition.postName}}</div>'},
                {field:'wrokYear',title:'工作时间',sort:true},
                {field:'education',title:'学历',templet:'<div>{{d.education.education}}</div>'},
                {field:'deliTime',title:'投递时间',sort:true,templet:'<div>{{d.delivery.deliTime}}</div>'},
                {title:'操作',toolbar:'#btns',width:250}
            ]]
        });

        table.on('tool(test)', function(obj){
            var data = obj.data;
            var deliID = data.delivery.deliveryId;

            if(obj.event === 'refuse'){
                layer.confirm('是否过滤选中的简历',{
                    btn:['过滤','取消'],
                    time:20000,
                },function (index) {
                    $.ajax({
                        url:path+"/rec/scerrResumeOne",
                        data:"deliID="+deliID,
                        type:"post",
                        typeData:"text",
                        success:function (info) {

                            if(info==1){
                                layer.alert("成功过滤");
                                obj.del();
                            }else{
                                layer.alert("网络繁忙，过滤失败")
                            }
                        },
                    })
                })
            }
        });

        //工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    var length = data.length;
                    if(length==0){
                        layer.alert("请选择过滤的简历");
                        return false;
                    }
                    layer.confirm('是否过滤选中的简历',{
                        btn:['过滤','取消'],
                        time:20000,
                    },function (index) {
                        $.ajax({
                            url:path+"/rec/scerrResume",
                            data:"msg="+JSON.stringify(data),
                            type:"post",
                            typeData:"text",
                            success:function (info) {

                                table.reload('testReload', {
                                    page: {
                                        curr: 1,
                                    },
                                    where: {
                                        postName: $('#postName').val(),
                                        beginTime:$('#beginTime').val(),
                                        endTime:$('#endTime').val(),
                                        educationId:$('#evdu').val(),
                                        wrokYear:$('#wrokYear').val(),
                                        isGraduate:$('#isGraduate').val(),
                                    }
                                }, 'data');
                                layer.alert("成功过滤"+info+"个");
                            },
                        })
                    })
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选')
                    break;
            };
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
                        educationId:$('#evdu').val(),
                        wrokYear:$('#wrokYear').val(),
                        isGraduate:$('#isGraduate').val(),
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
            content:$("#changeDiv"),
        })
    }

</script>
</html>
