<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/23
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>

<!DOCTYPE>
<!--解决idea thymeleaf 表达式模板报红波浪线-->
<!--suppress ALL -->
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>聊天页面</title>
    <!-- jquery在线版本 -->
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
    <!--引入样式-->
    <link href="${pageContext.request.contextPath}/css/comp/socketChart.css" rel="stylesheet"/>
    <style>
        .dis{
            border: green 1px solid;
            height: 10%;
        }
    </style>
</head>
<body>
<div id="hz-main">
    <input type="hidden" id="compID" value="${comp.bUserId}">
    <input type="hidden" id="path" value="${pageContext.request.contextPath}">
    <div id="hz-message">
        <!-- 头部 -->
        正在与<span id="toUserName"></span>聊天
        <hr style="margin: 0px;"/>
        <!-- 主体 -->
        <div id="hz-message-body">
        </div>
        <!-- 功能条 -->
        <div id="">
            <button>表情</button>
            <button>图片</button>
            <button id="videoBut">视频</button>
            <button onclick="send()" style="float: right;">发送</button>
        </div>
        <!-- 输入框 -->
        <div contenteditable="true" id="hz-message-input">

        </div>
    </div>
    <div id="hz-group" >
        <input type="hidden" id="talks" value="1">
<%--        登录用户：<span id="talks" th:text="${username}">请登录</span>--%>
<%--        <br/>--%>
<%--        在线人数:<span id="onlineCount">0</span>--%>
<%--        <ul>--%>
<%--            <li><div class="dis">12</div></li>--%>
<%--            <li>12</li>--%>
<%--            <li>12</li>--%>
<%--        </ul>--%>
        <div class="dis">12</div>
        <div class="dis">12</div>
        <div class="dis">12</div>
        <!-- 主体 -->
        <div id="hz-group-body">

        </div>
    </div>
</div>
</body>
<script type="text/javascript" th:inline="javascript">
    //项目根路径
    <%--var ctx = [[${pageContext.request.getContextPath()}]];//登录名--%>
    var ctx = $("#path").val();
    <%--var username = /*[[${username}]]*/'';--%>
    // var compID = $("#compID").val();
    var compID = 2;
</script>
<script src="${pageContext.request.contextPath}/js/comp/socketChart.js"></script>
</html>
</html>
