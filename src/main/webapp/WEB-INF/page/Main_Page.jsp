<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cykj.entity.Menu" %><%--
  Created by IntelliJ IDEA.
  User: lxz
  Date: 2020/9/2
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    System.out.println(path);
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>系统管理</title>
    <link rel="stylesheet" href="../JS/layui/css/layui.css">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">

</head>
<script src="../JS/jquery-3.5.1.js"></script>
<script charset="UTF-8" src="../JS/value.js"></script>
<script src="../JS/layui/layui.js"></script>


<body class="layui-layout-body">
<input id="path" type="hidden" value="${pageContext.request.contextPath}">

<form class="layui-form" action="aMenu" method="post">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">文档后台管理</div>
        <ul class="layui-nav layui-layout-right" name="back_user_name()" >
            <li class="layui-nav-item">
                <a href="javascript:">
<%--                    ${backUser.getBack_user_name}--%>
                </a>

            </li>

        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <h2>系统管理</h2>
                    <h2>岗位管理</h2>
                    <h2>数据统计</h2>
                    <h2>用户日志</h2>
                    <h2>管理员日志</h2>
<%--                    <c:if test="${not empty menuMap}">--%>
<%--                        <c:forEach items="${menuMap}" var="menuList">--%>
<%--                            <div>--%>
<%--                                <h3 id="1" onclick="showOrHide(this)"><c:out value="${menuList.key}"></c:out></h3>--%>
<%--                                <ul class='menu_ul'>--%>
<%--                                    <c:forEach items="${menuList.value}" var="menu">--%>
<%--                                        <a title="${menu.url}" onclick="changePath(this)">${menu.m_name} </a>--%>
<%--                                    </c:forEach>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
<%--                        </c:forEach>--%>
<%--                    </c:if>--%>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">

        <iframe src="" frameborder="0" id="iframe" style="height: 100% ;width: 100%"></iframe>
    </div>

    <div class="layui-footer">

    </div>
</div>
</form>
</body>

<script type="text/javascript">

</script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });

    function changePath(node) {
        var x = document.getElementById("iframe").src = node.title;
        // alert("路径"+x);
    };

    function changePath(node) {
        var y = document.getElementById("iframe").src = node.title;
        // alert("路径"+x);
    }

    function showOrHide(node) {
        $(node).siblings().slideToggle();
    }
</script>
</html>




