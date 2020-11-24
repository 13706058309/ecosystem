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
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<html>
<head>
    <title>Title</title>
</head>
<style>
    #mainChat{
        border: 2px solid #2cffda;
        background-color: #a5c3ff;
        margin:3% 17%;
        /*border-radius: 20px;*/
        position: relative;
        z-index: 1;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }
</style>
<body>
    <div id="mainChat">

    </div>
</body>
</html>
