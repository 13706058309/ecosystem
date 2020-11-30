<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-11-13
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单详情</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/project/projectEvolve.js" charset="UTF-8"></script>
    <style>
        .demand-main {
            position: relative;
            /*width: 800px;*/
            /*background: #fff;*/
            margin:15px auto;
            /*background-color: coral;*/
            border: 1px solid black;
        }
        /*.fl {*/
        /*    float: left;*/
        /*}*/
        .left-message {
            width: 970px;
            min-height: 138px;
            padding-bottom: 25px;
            position: relative;
        }
        .demand-title {
            padding-top: 10px;
            padding-bottom: 10px;
            font-weight: 700;
            font-size: 16px;
            color: #333;
            background-color: #0f8a7d;
        }
        .demand-title i {
            display: inline-block;
            height: 14px;
            width: 4px;
            background-color: #f60;
            vertical-align: middle;
            margin-top: -2px;
        }
        .title {
            color: #999;
            min-width: 56px;
            text-align: right;
            vertical-align: top;
            margin-right: 20px;
            margin-left: 10px;
        }
        .description {
            color: #333;
            text-align: left;
            display: inline-block;
            width: 766px;
        }
        .demand-content p {
            padding-bottom: 18px;
            line-height: 18px;
        }
        .orange-color{
            color: orangered;
        }
        p{
            margin: 0;
            padding: 0;
        }

    </style>
</head>

<script type="text/html" id="toolbar">
    <a class="layui-btn layui-btn-danger layui-btn-xs" style="padding:0 20px" lay-event="chooseApplicant">选Ta</a>
</script>
<body>
<input type="hidden" id="projectId" value="${projectEvolve.project.projectId}">
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
    <div class="demand-main fl left-message J--message">
        <p class="demand-title" >
        <i></i>
        <span class="message">
            需求信息
        </span>
        </p>
        <div class="demand-content J-show-hide " style="max-height: none;">
            <p class="up clearfix order-title J-order-title">
                <span class="fl title">需求名称</span>
                <span class="fr description">
                <span class="J-description-ordertitle">${projectEvolve.project.projectName}</span>
                </span>
            </p>
            <div class="clearfix J-order-price">
                <span class="fl title">预算金额</span>
                <p class="fr description">
                    <span class="orange-color">${projectEvolve.project.money}<em>元</em></span>
                </p>
            </div>
            <div style="display: none">
                <p class="clearfix">
                    <span class="fl title">需求类型</span>
                    <span class="fr description task-addtional">
                         <label>${projectEvolve.project.field.paramName}</label>
                    </span>
                </p>
                <p class="clearfix">
                    <span class="fl title">需求描述</span>
                    <span class="fr description">
                        ${projectEvolve.project.projectSynopsis}
                    </span>
                <p class="clearfix">
                    <span class="fl title">需求文件</span>
                    <span class="fr description">
                        <a onclick="demandFile('${projectEvolve.project.docUrl}')">下载需求</a>
                </span>
                </p>
                <p class="clearfix">
                    <span class="fl title">申请要求</span>
                    <span class="fr description">
                        ${projectEvolve.project.projectCondition}
                    </span>
                </p>
            </div>
            <div>
                <a class="fl title" href="javascript:;" style="color: #ff410e" onclick="show_Hide(this)">
                展开 v
                </a>
            </div>
        </div>
    </div>
<%--    承接人信息/选择承接人--%>
    <c:if test="${projectEvolve.project.states.paramId==35}">
        <div class="demand-main fl left-message J--message">
            <p class="demand-title">
                <i></i>
                <span class="message">
                        选择承接人
                </span>
            </p>
            <table id="userTable" lay-filter="userTable" style="width: 100%"></table>
        </div>
    </c:if>
    <c:if test="${projectEvolve.project.userInfo ne null}">
        <div class="demand-main fl left-message J--message">
            <p class="demand-title">
                <i></i>
                <span class="message">
                    承接人信息
                </span>
            </p>
            <span class="fl title">已获取证书</span>
            <ul>
                <c:if test="${not empty projectEvolve.cerLists}">
                    <li>
                        <p style="margin-left: 10px;width: 300px;display: inline-block">证书名称</p>
                        <p style="margin-left: 10px;width: 300px;display: inline-block">获取时间</p>
                    </li>
                    <c:forEach items="${projectEvolve.cerLists}" var="cer">
                    <li style="display: block;border-bottom:1px solid  #ababa6;margin-top: 5px">
                            <span style="margin-left: 10px;width: 300px;display: inline-block">
                                    ${cer.name}
                            </span>
                            <span style="margin-left: 10px;width: 300px;display: inline-block">
                                    ${cer.gainTime}
                            </span>
                        </c:forEach>
                    </li>
                </c:if>
            </ul>
            <span class="fl title ">承接过的项目</span>
            <ul>
                <c:if test="${not empty projectEvolve.userProjects}">
                    <li>
                        <p style="margin-left: 10px;width: 300px;display: inline-block">项目标题</p>
                        <p style="margin-left: 10px;width: 300px;display: inline-block">项目类型</p>
                        <p style="margin-left: 10px;width: 300px;display: inline-block">总成交金额： ${projectEvolve.moneyTotal} 元</p>
                    </li>
                    <c:forEach items="${projectEvolve.userProjects}" var="userProject" varStatus="varIndex">
                        <c:if test="${varIndex.index<=4}">
                            <li style="display: block;border-bottom:1px solid  #ababa6;margin-top: 5px">
                            <span style="margin-left: 10px;width: 300px;display: inline-block">
                                    ${userProject.projectInfo.projectName}
                            </span>
                            <span style="margin-left: 10px;width: 300px;display: inline-block">
                                    ${userProject.projectInfo.field.paramName}
                            </span>
                        </c:if>
                    </c:forEach>
                    </li>
                </c:if>
            </ul>
        </div>
    </c:if>
<%--    <c:if test="${projectEvolve.project.states.paramId==35}">--%>
<%--        <div class="demand-main fl left-message J--message">--%>
<%--            <p class="demand-title">--%>
<%--                <i></i>--%>
<%--                <span class="message">--%>
<%--                    订单状态--%>
<%--                </span>--%>
<%--            </p>--%>
<%--            <div>--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <a class="fl title" href="javascript:;" style="color: #ff410e" onclick="show_Hide(this)">--%>
<%--                    收起 ^--%>
<%--                </a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </c:if>--%>


</body>
</html>
