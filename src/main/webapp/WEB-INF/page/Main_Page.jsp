<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cykj.entity.Menu" %>
<%--
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
    <meta name="renderer" content="webkit">
    <title>系统管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

</head>

<body class="layui-layout-body">

<script src="${pageContext.request.contextPath}/jquery-3.5.1.js"></script>
<script charset="UTF-8" src="${pageContext.request.contextPath}/js/value.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

<input id="path" type="hidden" value="${pageContext.request.contextPath}">

<form class="layui-form" action="aMenu" method="post">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">后台管理</div>
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
<%--            <ul class="layui-nav layui-nav-tree" lay-filter="test">--%>
<%--                <li class="layui-nav-item layui-nav-itemed">--%>
                    <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                        <li class="layui-nav-item layui-nav-itemed">
                            <a class="" href="javascript:;">系统管理</a>
                            <dl class="layui-nav-child">
                                <dd><a href="${pageContext.request.contextPath}/test/userManage"
                                        target="mainx">用户管理</a></dd>
                                <dd><a href="javascript:;">管理员管理</a></dd>
                                <dd><a href="${pageContext.request.contextPath}/test/EnterpriseManage"
                                        target="mainy">企业管理</a></dd>
                            </dl>
                        </li>
                        <li class="layui-nav-item">
                            <a href="javascript:;">岗位管理</a>
                            <dl class="layui-nav-child">
                                <dd><a href="javascript:;">岗位配置</a></dd>
                                <dd><a href="javascript:;">权限配置</a></dd>
                            </dl>
                        </li>
                        <li class="layui-nav-item">
                            <a href="javascript:;">数据统计</a>
                            <dl class="layui-nav-child">
                                <dd><a href="javascript:;">注册人员统计</a></dd>
                                <dd><a href="javascript:;">入住企业统计</a></dd>
                            </dl>
                        </li>
                        <li class="layui-nav-item layui-nav-itemed">
                            <a class="" href="javascript:;">日志管理</a>
                            <dl class="layui-nav-child">
                                <dd><a href="javascript:;">用户日志</a></dd>
                                <dd><a href="javascript:;">管理员日志</a></dd>
                            </dl>
                        </li>
                    </ul>
<%--                    <h2>系统管理</h2>--%>
<%--                    <dd><a href="javascript:;" title="${pageContext.request.contextPath}/page/UserManage.jsp">用户管控</a></dd>--%>
<%--                    <h2>岗位管理</h2>--%>
<%--                    <h2>数据统计</h2>--%>
<%--                    <h2>用户日志</h2>--%>
<%--                    <h2>管理员日志</h2>--%>

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
<%--                </li>--%>
<%--            </ul>--%>
        </div>
    </div>

    <div class="layui-body">

        <iframe src="" frameborder="0" id="iframe" name="mainx" style="height: 100% ;width: 100%"></iframe>
        <iframe src="" frameborder="0" id="iframey" name="mainy" style="height: 100% ;width: 100%"></iframe>
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
        alert("路径"+x);
    };

    function changePath(node) {
        var y = document.getElementById("iframey").src = node.title;
        // alert("路径"+x);
    }

    function showOrHide(node) {
        $(node).siblings().slideToggle();
    }
</script>
</html>




