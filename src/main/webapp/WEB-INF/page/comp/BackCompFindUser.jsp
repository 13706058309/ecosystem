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
    <script src="${pageContext.request.contextPath}/js/comp/Common.js"></script>


<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<style>
    * {
        overflow: hidden;
        padding:0;
        margin:0;
    }

    canvas {
        display: block;
    }
</style>
<body>

<script id="btns" type="text/html">
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="detail">查看详情</a>
</script>

<h1 style="text-align: center">招聘查找</h1>
<br>
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
<div class="demoTable layui-form" style="margin-left: 12%">
    <div class="layui-form-item">

        <div class="layui-inline">
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
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">专业:</label>
            <div class="layui-input-inline">
                <input type="tel" id="profession"  class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">性别:</label>
            <div class="layui-input-inline">
                <select class="layui-input" id="sex">
                    <option value="不限">不限</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">是否应届</label>
            <div class="layui-input-inline">
                <select class="layui-input" id="isGraduate">
                    <option value="0">不限</option>
                    <option value="1">应届生</option>
                    <option value="2">非应届生</option>
                </select>
            </div>
        </div>

        <div class="layui-inline">
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
        </div>

        <div class="layui-inline">
            <div class="layui-input-inline"  style="margin-left: 40%">
                <button type="button" class="layui-btn  layui-btn-fluid" data-type="reload" style="width: 50%">查询</button>
            </div>
        </div>
    </div>
</div>
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
    <div class="layui-input-inline" style="margin-left: 50%">
        <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" onclick="outResumes()" >简历导出</button>
    </div>
</div>
<div id="payForm" style="display: none;padding: 5%">

        <input name="WIDout_trade_no" id="WIDout_trade_no" type="hidden">
        <input name="WIDsubject" id="WIDsubject" type="hidden">
        <input name="WIDtotal_amount" id="WIDtotal_amount" type="hidden">
        <input name="WIDbody" id="WIDbody" type="hidden">

        <table class="layui-table">
            <tr>
                <td>
                <h2 id="money">支付20个人才币下载？</h2>
                </td>
            </tr>
            <tr style="margin-top: 3%">
                <td>
                <input type="button" class="layui-btn layui-btn-lg layui-btn-fluid" value="支付下载" onclick="pays()" >
                </td>
            </tr>
        </table>

</div>
<table id="userTable" lay-filter="test"></table>

<script  src="${pageContext.request.contextPath}/static/bg/js/tween.js"></script>
<script  src="${pageContext.request.contextPath}/static/bg/js/bgs.js"></script>
<canvas id="c"></canvas>
</body>
<script>
    var resumeID = "";
    var layer;
    var path = $("#path").val();
    var index;
    var form;
    <%
        String resumeID = (String) request.getSession().getAttribute("resumeID");
        if(resumeID!=null){
            out.write("resumeID="+resumeID);
            request.getSession().removeAttribute("resumeID");
        }

    %>
    layui.use(['laydate','layer','form'],function () {
        form = layui.form;
        form.render();
        layer = layui.layer;
    })

    layui.use('table',function () {
        var table = layui.table;

        table.render({
            elem:'#userTable',
            height:310,
            limits:[5],
            limit:5,
            url:"${pageContext.request.contextPath}/rec/compFindResume",
            page:true,
            id: 'testReload',
            cols:[[
                {field:'realName',title:'姓名', fixed: 'left'},
                {field:'sex',title:'性别'},
                {field:'profession',title:'专业'},
                {field:'isGraduate',title:'是否应届生',templet:function (d) {
                        if(d.isGraduate==1){
                            res = "是";
                        }else{
                            res = "否";
                        }
                        return res;
                    }},
                {field:'wrokYear',title:'工作时间',sort:true},
                {field:'education',title:'学历',templet:'<div>{{d.education.education}}</div>'},
                {title:'操作',toolbar:'#btns',width:250}
            ]]
        });

        table.on('tool(test)', function(obj){
            var data = obj.data;
            var resumeID = data.resumeId;
            if(obj.event === 'detail'){
                showDetails(data);
                findDetailResume(resumeID,data.isShow);
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
                        educationId:$('#evdu').val(),
                        wrokYear:$('#wrokYear').val(),
                        isGraduate:$('#isGraduate').val(),
                        profession:$('#profession').val(),
                        sex:$('#sex').val(),
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

$(function () {
   if(resumeID.length!=0){
        location.href = path+"/rec/outResume?resumeID="+resumeID;
        resumeID == "";
   }
})

</script>
</html>
