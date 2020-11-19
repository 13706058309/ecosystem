<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/10
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/BackUniversityTalent.css">
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>

<body>
<script id="btns" type="text/html">

    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="detail">查看详情</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>

</script>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>

<h1 style="text-align: center">高校人才推荐</h1>
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
<div class="demoTable layui-form" style="margin-left: 10%">
    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">推荐时间</label>
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

        <div class="layui-inline">
            <label class="layui-form-label">姓名:</label>
            <div class="layui-input-inline">
                <input type="tel" id="talentName" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">专业:</label>
        <div class="layui-input-inline">
            <input type="tel" id="profession" lay-verify="required|phone" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">学校:</label>
        <div class="layui-input-inline">
            <input type="tel" id="school" lay-verify="required|phone" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-input-inline" style="margin-left: 8%">
            <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" data-type="reload">查询</button>
        </div>
    </div>
</div>
<div id="detailTalent" style="display: none;padding: 3%">
    <table class="layui-table" >
        <tr>
            <td  colspan="6"><h2>高校简历查看</h2></td>
        </tr>
        <tr >
            <td>姓名</td>
            <td id="tName"></td>
            <td>出生年月日</td>
            <td id="tBirthday"></td>
            <td>政治面貌</td>
            <td id="tpolistat"></td>
        </tr>

        <tr >
            <td>毕业学校</td>
            <td id="tSchool"></td>
            <td>学历</td>
            <td id="tEducation"></td>
            <td>专业</td>
            <td id="tProfession"></td>
        </tr>

        <tr>
            <td rowspan="1">联系方式</td>
            <td colspan="5" id="tAddress"> </td>
        </tr>

        <tr>
            <td rowspan="1">具体地址</td>
            <td colspan="5" id="tAdd"> </td>
        </tr>

        <tr>
            <td rowspan="1">工作经验</td>
            <td colspan="5" id="tWorkExp"> </td>
        </tr>

        <tr>
            <td rowspan="1">技能证书</td>
            <td colspan="5" id="tCert"> </td>
        </tr>

        <tr>
            <td rowspan="1">职业规划</td>
            <td colspan="5" id="tWorkPlan"> </td>
        </tr>

        <tr>
            <td rowspan="1">自我评价</td>
            <td colspan="5" id="tSelfEva"> </td>
        </tr>

    </table>
    <div class="layui-input-inline" style="margin-left: 50%">
        <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" onclick="outResume()" >简历导出</button>
    </div>
</div>
    <table id="userTable" lay-filter="test"></table>
</body>
<script>
    var layer;
    var path = $("#path").val();
    var objs;
    var data;
    var index;
    var form;
    var talentID;
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
            height:330,
            limits:[5],
            limit:5,
            url:"${pageContext.request.contextPath}/rec/findUnviTalent",
            page:true,
            id: 'testReload',
            cols:[[
                {type: 'checkbox', fixed: 'left'},
                {field:'talentName',title:'姓名'},
                {field:'school',title:'学校'},
                {field:'birthday',title:'出生年月日'},
                {field:'contactInfo',title:'联系方式'},
                {field:'profession',title:'专业'},
                {field:'education',title:'学历'},
                {field:'politicalStatus',title:'政治面貌'},
                {field:'workExp',title:'工作经历',hide:'true'},
                {field:'jobPlan',title:'职业规划',hide:'true'},
                {field:'selfEva',title:'自我评价',hide:'true'},
                {field:'recommendTime',title:'投递时间',templet:'<div>{{d.compAndtalent.recommendTime}}</div>'},
                {title:'操作',toolbar:'#btns',width:250}
            ]]
        });

        table.on('tool(test)', function(obj){
            data = obj.data;
            var compAndTalId = data.compAndtalent.compAndTalId;

            if(obj.event === 'del'){
                layer.confirm('是否删除',{
                    btn:['删除','取消'],
                    time:20000,
                },function (index) {
                    $.ajax({
                        url:path+"/rec/delUnviTalent",
                        data:"compAndTalId="+compAndTalId,
                        type:"get",
                        typeData:"text",
                        success:function (info) {
                            layer.msg(info);
                            if(info=='删除成功'){
                                obj.del();
                            }
                        },
                    })
                })
            } else if(obj.event === 'detail'){
                talentID = data.talentId;
                addResume();
                layer.open({
                    type:1,
                    area:['70%','70%'],
                    offset: ['10%', '15%'],
                    content:$("#detailTalent"),
                })
            }
        });

        //工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
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
                        talentName: $('#talentName').val(),
                        beginTime:$('#beginTime').val(),
                        endTime:$('#endTime').val(),
                        school:$('#school').val(),
                        profession:$('#profession').val(),
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


    function addResume() {
        $("#tName").text(data.talentName);
        $("#tBirthday").text(data.birthday);
        $("#tpolistat").text(data.politicalStatus);
        $("#tSchool").text(data.school);
        $("#tEducation").text(data.education);
        $("#tProfession").text(data.profession);
        $("#tAddress").text(data.contactInfo);
        $("#tWorkExp").text(data.workExp);
        $("#tWorkPlan").text(data.jobPlan);
        $("#tSelfEva").text(data.selfEva);
        $("#tCert").text(data.certificate);
        $("#tAdd").text(data.address);
    }

    function outResume() {
        location.href = path+"/rec/outTalentResum?talentID="+talentID;
    }

</script>
</html>
