<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/11
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comp/BackUnPassResume.css">
<script src="${pageContext.request.contextPath}/js/comp/Common.js"></script>

<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>

<body>
<script id="btns" type="text/html">
    <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="detail">查看详情</a>
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="pass">通知面试</a>
    <a class="layui-btn layui-btn-xs" lay-event="deter">待定</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="refuse">拒绝</a>
</script>
<style type="text/css">
    .layui-table-cell {
        height: auto !important;
        white-space: normal;

    }
    .layui-table img{
        max-width: 200px;
    }
</style>
<h1 style="text-align: center">待处理简历</h1>
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
<div class="demoTable layui-form" style="margin-left: 25%">
    <div class="layui-form-item" style="margin-left: -10%">

            <label class="layui-form-label">投递时间</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="beginTime"  placeholder="yyyy-MM-dd">
            </div>

            <label class="layui-form-label">至</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="endTime" placeholder="yyyy-MM-dd">
            </div>


    </div>
    <div class="layui-form-item" style="margin-left: -10%">

        <label class="layui-form-label">发布岗位:</label>
        <div class="layui-input-inline">
            <input type="tel" id="postName" class="layui-input">
        </div>

        <label class="layui-form-label">学历</label>
        <div class="layui-input-inline">
            <select class="layui-input" id="evdu">
                <option value="0">不限</option>
                <option value="1">高中</option>
                <option value="2">大专</option>
                <option value="3">本科</option>
                <option value="4">硕士</option>
                <option value="5">博士</option>
            </select>
        </div>



            <div class="layui-input-inline" style="margin-left: 8%">
                <button type="button" class="layui-btn  layui-btn-fluid" data-type="reload" style="width: 60%">查询</button>
            </div>

    </div>
</div>

<div style="display: none" id="passTime">
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">具体通知</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" style="width: 80%; height: 85%" id="passMsg" name="passMsg"></textarea>
        </div>
    </div>
</div>

<table id="userTable" lay-filter="test"></table>

<div id="detailDiv" style="display: none;padding: 3%">
    <table class="layui-table">
        <tr><td colspan="6">简历详情</td></tr>
        <tr >
            <td width="19%">姓名</td>
            <td width="19%" id="dName">2</td>
            <td width="19%">民族</td>
            <td width="19%" id="dClen">4</td>
            <td rowspan="5" colspan="2" id="imgs" ></td>
        </tr>
        <tr >
            <td>政治面貌</td>
            <td id="dPolistatu">2</td>
            <td>出生年月日</td>
            <td id="dBir">4</td>
        </tr>
        <tr >
            <td>性别</td>
            <td id="dSex">2</td>
            <td>工作年限</td>
            <td id="dWorkYear">4</td>
        </tr>
        <tr >
            <td>学历</td>
            <td id="dEdu">2</td>
            <td>专业</td>
            <td id="dProf">4</td>
        </tr>
        <tr >
            <td>毕业学校</td>
            <td id="DSchool">2</td>
            <td>就业状态</td>
            <td id="jobStand"></td>
        </tr>
        <tr >
            <td>期望工作</td>
            <td colspan="2" id="DHwork">2</td>
            <td>意向行业</td>
            <td colspan="2" id="DHIndustry">4</td>
        </tr>
        <tr >
            <td>地址</td>
            <td colspan="2" id="DAddress">2</td>
            <td>联系方式</td>
            <td colspan="2" id="DRealInfo">4</td>
        </tr>
        <tr>
            <td rowspan="1">自我评价</td>
            <td colspan="5" id="DselfEva" > </td>
        </tr>
        <tbody id="tbody">

        </tbody>

    </table>
    <div class="layui-input-inline" style="margin-left: 45%">
        <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" onclick="outResume()" >简历导出</button>
    </div>
</div>
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
            height:300,
            limits:[5],
            limit:5,
            url:"${pageContext.request.contextPath}/rec/findWaitResumes",
            page:true,
            id: 'testReload',
            cols:[[
                {field:'realName',title:'姓名',templet:'<div>{{d.resume.realName}}</div>'},
                {field:'isGraduate',title:'是否应届生',templet:function (d) {
                        if(d.resume.isGraduate==1){
                            res = "是";
                        }else{
                            res = "否";
                        }
                        return res;
                    }},
                {field:'profession',title:'应聘岗位',templet:'<div>{{d.postPosition.postName}}</div>'},
                {field:'wrokYear',title:'工作时间',sort:true,templet:'<div>{{d.resume.wrokYear}}</div>'},
                {field:'education',title:'学历'},
                {field:'deliTime',title:'投递时间',sort:true},
                {title:'操作',toolbar:'#btns',width:300}
            ]]
        });

        table.on('tool(test)', function(obj){
            var data = obj.data;
            var deliID = data.deliveryId;
            var resumeID = data.resume.resumeId;

            if(obj.event === 'refuse'){
                layer.confirm('是否拒绝选中的简历',{
                    btn:['拒绝','取消'],
                    time:20000,
                },function (index) {
                    $.ajax({
                        url:path+"/rec/delResumeOne",
                        data:"deliID="+deliID,
                        type:"post",
                        typeData:"text",
                        success:function (info) {

                            if(info==1){
                                layer.alert("成功拒绝");
                                obj.del();
                            }else{
                                layer.alert("网络繁忙，删除拒绝")
                            }
                        },
                    })
                })
            }else if(obj.event === 'pass'){
                $("#passMsg").val("");
                layer.open({
                    type:1,
                    title:"面试具体通知",
                    area:['40%','40%'],
                    offset: ['10%', '30%'],
                    content:$("#passTime"),
                    btn:['发送','取消'],
                    btn1: function (index,layero) {
                        var msg = $("#passMsg").val();
                        $.ajax({
                            url:path+"/rec/passResume",
                            data:"deliID="+deliID+"&msg="+msg,
                            type:"post",
                            typeData:"text",
                            beforeSend:function(){
                                if(msg.length==0){
                                    layer.alert("请填写面试通知");
                                    return false;
                                }
                                if(msg.length>100){
                                    layer.alert("面试通知长度不能超过100");
                                    return false;
                                }
                            },
                            success:function (info) {
                                layer.close(index);
                                if(info==1){
                                    layer.alert("通知面试成功");
                                    obj.del();
                                }else{
                                    layer.alert("网络繁忙，通知失败")
                                }
                            },
                        })
                    },
                    btn2:function (index,layero) {
                        layer.close(index);
                    }
                })
            }else if(obj.event === 'deter'){
                layer.confirm('是否待定选中的简历',{
                    btn:['确定','取消'],
                    time:20000,
                },function (index) {
                    $.ajax({
                        url:path+"/rec/deterResumeOne",
                        data:"deliID="+deliID,
                        type:"post",
                        typeData:"text",
                        success:function (info) {
                            if(info==1){
                                layer.alert("成功待定");
                                obj.del();
                            }else{
                                layer.alert("网络繁忙，待定失败")
                            }
                        },
                    })
                })
            }else if(obj.event === 'detail'){
                showDetail(data);
                findDetailResume(resumeID)
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
                        evdu:$('#evdu').val(),
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
