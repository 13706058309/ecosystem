<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/11
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>课程列表页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="http://cymooc.org:80/common/css/jquery.pagination.css">
    <link rel="stylesheet" type="text/css" href="http://cymooc.org:80/common/css/course/courseList.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"/>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script>
        // 课程目录中每个章节到视频播放页的链接
        function checkIsLogin(unitId) {
            var basePath = $('#basePath').val();
            var userId = $('#userId').val();
            console.log(userId);
            if (userId==undefined || userId==""){
                alert("请先登录");
            }else {
                top.location = basePath + "/courseAppraise/playPage?unitId="+unitId;
            }
        }
    </script>
</head>


<body>
<input type="hidden" id="basePath" value="${pageContext.request.contextPath}"/>
<input type="hidden" id="userId" value="${qUser.userId}"/>
    <div style="width: 100%;height: 720px;">
        <c:if test="${not empty units}">
            <c:forEach items="${units}" var="unit" varStatus="unitStatus">
            <div class="courseDiv" id="${unit.unitId}" style="line-height: 50px">
<%--                <a href="${pageContext.request.contextPath}/courseAppraise/playPage?unitId=${unit.unitId}" target="_top">--%>
                <a onclick="checkIsLogin('${unit.unitId}')"  target="_top">
                    <i class="layui-icon layui-icon-play" style="font-size: 35px; float: left; margin: 1px 20px;color: #0d9572"></i>
                    <p class="courseName overText">第${unitStatus.count}章&nbsp;&nbsp;${unit.unitName}</p>
                </a>
            </div>
            </c:forEach>
        </c:if>
    </div>
    <div class="clear"></div>
</body>
</html>
