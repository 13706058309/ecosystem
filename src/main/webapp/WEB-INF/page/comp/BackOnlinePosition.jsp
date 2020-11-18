<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/11
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comp/BackOnlinePosition.css">
<script src="${pageContext.request.contextPath}/js/comp/BackOnlinePosition.js"></script>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<body>

<script id="btns" type="text/html">
    <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="detail">查看详情</a>
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="offLine">下线</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
</script>

    <h1 style="text-align: center">已发布岗位</h1>
    <br>
    <input type="hidden" value="${pageContext.request.contextPath}" id="path">
<div class="demoTable layui-form" style="margin-left: 25%">
    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">发布时间</label>
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
        <label class="layui-form-label">岗位名称:</label>
        <div class="layui-input-inline">
            <input type="tel" id="postName"  class="layui-input">
        </div>

        <div class="layui-input-inline" style="margin-left: 8%">
            <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" data-type="reload">查询</button>
        </div>
    </div>
</div>
    <table id="onLineTable" lay-filter="test"></table>

<div id="postPositionDetailDiv" style="display: none;padding: 3%">
    <table class="layui-table">
        <tr>
            <td  colspan="6"><h2>招聘信息查看</h2></td>
        </tr>
        <tr>
            <td class="ziti" width="16%">岗位名称</td>
            <td id="dPostName" ondblclick="changePostName()"></td>
            <td class="ziti">岗位类型</td>
            <td id="dPostType" ondblclick="changePostType()"></td>
            <td class="ziti">所属部门</td>
            <td id="dDepart" ondblclick="changePostName()"></td>
        </tr>

        <tr>
            <td class="ziti">月薪范围</td>
            <td id="salary" ondblclick="changeSalary()">dsfs</td>
            <td class="ziti" >工作城市</td>
            <td id="dWorkCity" ondblclick="changeCity()"></td>
            <td class="ziti">招收人数</td>
            <td id="num" ondblclick="changeNum()"></td>
        </tr>

        <tr>
            <td class="ziti">工作经验</td>
            <td id="dWorkExp" ondblclick="changeWorkYear()"></td>
            <td class="ziti">学历</td>
            <td id="dEducation" ondblclick="changeEdu()"></td>
            <td class="ziti">工作性质</td>
            <td id="workType" ondblclick="changeWorkType()"></td>
        </tr>

        <tr>
            <td rowspan="1" class="ziti">投递邮箱</td>
            <td colspan="5" id="dEmail" ondblclick="changeEmail()"> </td>
        </tr>

        <tr>
            <td rowspan="1" class="ziti">联系方式</td>
            <td colspan="5" id="dContact" ondblclick="changeContact()"> </td>
        </tr>

        <tr>
            <td rowspan="1" class="ziti">具体地址</td>
            <td colspan="5" id="dAddress" ondblclick="changeAddre()"> </td>
        </tr>

        <tr>
            <td rowspan="1" class="ziti">福利描述</td>
            <td colspan="5" id="fuli" ondblclick="changeJobBenf()"> </td>
        </tr>

        <tr>
            <td rowspan="1" class="ziti">工作描述</td>
            <td colspan="5" id="workDes" ondblclick="changeJobDes()"> </td>
        </tr>

    </table>
</div>
</body>

</html>
