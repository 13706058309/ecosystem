<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/13
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>后台主页</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script>
        //JavaScript代码区域
        $(function () {
            layui.use(['element','layer'], function(){
                var element = layui.element;
                var layer=layui.layer;
            });
        })
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">后台管理首页</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${adminInfo.bUserName}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <c:if test="${not empty menuList}">
                    <c:forEach items="${menuList}" var="menu" varStatus="menuIndex">
                        <li class="layui-nav-item <c:if test="${menuIndex.index==0}">layui-nav-itemed</c:if>">
                            <a href="javascript:;">${menu.title}</a>
                        <c:if test="${not empty menu.children}">
                            <dl class="layui-nav-child">
                            <c:forEach items="${menu.children}" var="menuChild">
                                    <dd><a href="${pageContext.request.contextPath}/${menuChild.url}" target="mainFrame">${menuChild.title}</a></dd>
                            </c:forEach>
                            </dl>
                        </c:if>
                        </li>
                    </c:forEach>
                </c:if>

<%--                <li class="layui-nav-item layui-nav-itemed">--%>
<%--                    <a class="" href="javascript:;">用户管理</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="${pageContext.request.contextPath}/jsp/admin/userSearch.jsp" target="mainFrame">用户查询</a></dd>--%>
<%--                        <dd><a href="javascript:;">用户管控</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item">--%>
<%--                    <a href="javascript:;">文档管理</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="${pageContext.request.contextPath}/jsp/admin/docManager.jsp" target="mainFrame">文档审核</a></dd>--%>
<%--                        <dd><a href="javascript:;">文档配置</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item">--%>
<%--                    <a href="javascript:;">日志管理</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="javascript:;">日志列表</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
<%--                <li class="layui-nav-item">--%>
<%--                    <a href="javascript:;">系统配置</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="javascript:;">系统奖励配置</a></dd>--%>
<%--                        <dd><a href="javascript:;">注册奖励配置</a></dd>--%>
<%--                        <dd><a href="${pageContext.request.contextPath}/jsp/admin/powerManager.jsp" target="mainFrame">权限配置</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
        <iframe style="width: 100%;height: 100%;border: 0px" name="mainFrame"> </iframe>
        </div>
    </div>

<%--    <div class="layui-footer">--%>
<%--        <!-- 底部固定区域 -->--%>
<%--        © layui.com - 底部固定区域--%>
<%--    </div>--%>
</div>




</body>
</html>
