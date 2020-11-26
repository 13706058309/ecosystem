<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-11-13
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>我的项目</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/project/projectManage.js" charset="UTF-8"></script>
    <script type="text/html" id="toolbar">

        {{#  if(d.states.paramName=="待付款"){ }}
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="detail">查看详情</a>
            <a class="layui-btn layui-bg-orange layui-btn-xs" lay-event="payMoney">立即付款</a>
            <a class="layui-btn layui-bg-orange layui-btn-xs" lay-event="del">删除订单</a>
        {{#  } }}
        {{#  if(d.states.paramName=="已发布"){ }}
        <a class="layui-btn layui-bg-orange layui-btn-xs" lay-event="aband">放弃项目</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="detail">查看详情</a>
        <a class="layui-btn layui-bg-orange layui-btn-xs" lay-event="chooseUser">选择承接人</a>
        {{#  } }}
        {{#  if(d.states.paramName=="已承接"){ }}
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="detail">查看详情</a>
        <a class="layui-btn layui-bg-orange layui-btn-xs" lay-event="evolve">查看进度</a>
        {{#  } }}
        {{#  if(d.states.paramName=="待验收"){ }}
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="detail">查看详情</a>
        <a class="layui-btn layui-bg-orange layui-btn-xs" lay-event="downProject">下载项目</a>
        <a class="layui-btn layui-bg-orange layui-btn-xs" lay-event="finish">确认完成</a>
        {{#  } }}
        {{#  if(d.states.paramName=="已完成"){ }}
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="detail">查看详情</a>
        {{#  } }}


    </script>
</head>
<body style="width:100%;margin: auto;height: 100%">
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<%--<div>--%>
<ul class="layui-nav " lay-filter="param"  style="background-color: #eff1ff;height: 50px;vertical-align: middle">
    <li class="layui-nav-item" style="line-height: 50px"><a class="params" href="javascript:;" style="text-decoration: none;color: #414141"><input type="hidden" value="" >全部</a></li>
    <c:if test="${not empty parameters}">
        <c:forEach items="${parameters}" var="parameter">
            <li class="layui-nav-item" style="line-height: 50px"><a  class="params" href="javascript:;" style="text-decoration: none;color: #414141"><input type="hidden" value="${parameter.paramId}">${parameter.paramName}</a></li>
        </c:forEach>
    </c:if>
    <a  class="layui-btn layui-btn-warm" style="margin-left: 100px;padding:0px 20px" href="${pageContext.request.contextPath}/project/publishProject" >发布项目</a>
</ul>
<%--</div>--%>
<table id="demo" lay-filter="test"></table>
</body>
</html>
