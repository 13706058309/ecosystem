<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/11
  Time: 18:29
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>

<body>
<script id="btns" type="text/html">
    <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="detail">查看详情</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
</script>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="delCheck">删除选中的简历</button>
    </div>
</script>

<h1 style="text-align: center">通知面试简历</h1>
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
<div class="demoTable layui-form" style="margin-left: 27%">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">投递时间</label>
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

        <div class="layui-inline">
            <label class="layui-form-label" >岗位名称:</label>
            <div class="layui-input-inline">
                <input type="tel" id="postName"  class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label" >名字:</label>
            <div class="layui-input-inline">
                <input type="tel" id="userName"  class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <div class="layui-input-inline" style="margin-left: 8%">
                <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" data-type="reload">查询</button>
            </div>
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
            <td rowspan="5" colspan="2"><img src="" id="imgs" width="100%" height="100%"></td>
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
            <td colspan="5" id="DselfEva"  > </td>
        </tr>
        <tbody id="tbody">

        </tbody>

    </table>
    <div class="layui-input-inline" style="margin-left: 50%">
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
            toolbar: '#toolbarDemo',
            height:340,
            limits:[5],
            limit:5,
            url:"${pageContext.request.contextPath}/rec/findPassResumes",
            page:true,
            id: 'testReload',
            cols:[[
                {type: 'checkbox', fixed: 'left',width: 50},
                {field:'realName',title:'姓名',fixed: 'left',width:"10%"},
                {field:'clan',title:'民族',hide:'true'},
                {field:'politicalStatus',title:'政治面貌',hide:'true'},
                {field:'birthday',title:'出生日期',hide:'true'},
                {field:'contactInfo',title:'联系方式',hide:'true'},
                {field:'school',title:'毕业院校',hide:'true'},
                {field:'profession',title:'专业',hide:'true'},
                {field:'isGraduate',title:'是否应届生',width:"10%",templet:function (d) {
                        if(d.isGraduate==1){
                            res = "是";
                        }else{
                            res = "否";
                        }
                        return res;
                    }},
                {field:'profession',title:'应聘岗位',templet:'<div>{{d.postPosition.postName}}</div>',width:"15%"},
                {field:'wrokYear',title:'工作时间',sort:true,width:"15%"},
                {field:'education',title:'学历',templet:'<div>{{d.education.education}}</div>',width:"15%"},
                {field:'qualiCer',title:'资格证书',hide:'true'},
                {field:'selfEva',title:'自我评价',hide:'true'},
                {field:'address',title:'地址',hide:'true'},
                {field:'deliTime',title:'投递时间',sort:true,templet:'<div>{{d.delivery.deliTime}}</div>',width:"15%"},
                {field:'educationalBackgrounds',title:'教育背景',sort:true,templet:'<div>{{d.educationalBackgrounds}}</div>' ,hide:'true'},
                {field:'workExperiences',title:'工作经验',sort:true,templet:'<div>{{d.workExperiences}}</div>' ,hide:'true'},
                {field:'projectExperiences',title:'项目经验',sort:true,templet:'<div>{{d.projectExperiences}}</div>' ,hide:'true'},
                {title:'操作',toolbar:'#btns',width:"20%"}
            ]]
        });

        table.on('tool(test)', function(obj){
            var data = obj.data;
            var deliID = data.delivery.deliveryId;
            var resumeID = data.resumeId;
            if(obj.event === 'del'){
                layer.confirm('是否删除选中的简历',{
                    btn:['删除','取消'],
                    time:20000,
                },function (index) {
                    $.ajax({
                        url:path+"/rec/delPassResumeOne",
                        data:"deliID="+deliID,
                        type:"post",
                        typeData:"text",
                        success:function (info) {

                            if(info==1){
                                layer.alert("成功删除");
                                obj.del();
                            }else{
                                layer.alert("网络繁忙，删除失败")
                            }
                        },
                    })
                })
            }else if(obj.event === 'detail'){
                showDetail(data);
                findDetailResume(resumeID)
            }
        });


        //工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'delCheck':
                    var data = checkStatus.data;
                    var length = data.length;
                    if(length==0){
                        layer.alert("请选择删除的简历");
                        return false;
                    }
                    layer.confirm('是否删除选中的简历',{
                        btn:['删除','取消'],
                        time:20000,
                    },function (index) {
                        $.ajax({
                            url:path+"/rec/delPassResume",
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
                                    }
                                }, 'data');
                                layer.alert("成功删除"+info+"个");
                            },
                        })
                    })
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
                        userName: $('#userName').val(),
                        beginTime:$('#beginTime').val(),
                        endTime:$('#endTime').val(),
                        postName:$('#postName').val(),
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

</script>
</html>
