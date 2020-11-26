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
    <title>项目详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/project/projectOfUser.css">
    <script src="${pageContext.request.contextPath}/js/project/projectOfUser.js" charset="UTF-8"></script>
    <style>
        .task-desc-container{
            padding: 22px 30px;
            font-size: 14px;
        }
        .task-desc-container {
            font-size: 14px;
        }
        .fl{
            float: left;
        }
        .order-info {
            width: 100%;
            height: 30px;
            box-sizing: border-box;
            padding-left: 0px;
            border:1px;
            background-color: #000000;
            font-size: 12px;
            line-height: 30px;
        }
        .order-title {
            width: 100%;
            height: 30px;
            background:#eff1ff;
            font-size: 12px;
            line-height: 30px;
        }
        .order-amount {
            font-size: 14px;
            background: #eff1ff;
            width: 182px;
            line-height: 30px;
            height: 30px;
            /*right: 603px;*/
            text-align: center;
            display: inline-block;
        }
        .order-state {
            font-size: 14px;
            line-height: 30px;
            height: 30px;
            width: 200px;
            text-align: center;
            /*right: 270px;*/
            display: inline-block;
            background: #eff1ff;
        }
        .order-ctrl {
            font-size: 14px;
            line-height: 30px;
            height: 30px;
            display: inline-block;
            text-align: center;
            width: 207px;
            background: #eff1ff;
         }

        .order-no {
            margin-right: 70px;
            display: inline-block;
            color: #999;
        }
        .create-time {
            display: inline-block;
            color: #999;
        }
        .additional-info {
            display: inline-block;
            width: 303px;
            height: 30px;
            margin-left: 100px;
            color: #999;
        }
        p{
            margin: 0px;
            padding: 0px;
        }
        table{
            border-collapse: collapse;
            border-spacing: 0;
        }
        .order-Name {
            color: #333;
            font-size: 14px;
            font-weight: 600;
            line-height: 20px;
            margin-top: 5px;
            margin-bottom: 5px;
        }
        .order-desc {
            color: #999;
            font-size: 12px;
            line-height: 17px;
            display: -webkit-box;
            overflow: hidden;
            white-space: normal !important;
            text-overflow: ellipsis;
            word-wrap: break-word;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        .total{
            font-size: 12px;
            line-height: 17px;
            margin-left: 10px;
            margin-top: 10px;
            color: #ff410e;
        }
        .state{
            font-size: 12px;
            line-height: 17px;
            margin-left: 10px;
            margin-top: 10px;
            color: #999;
        }

        .payMoney{
            font-size: 12px;
            line-height: 17px;
            margin-left: 10px;
            margin-top: 20px;
            color: #999;
        }

    </style>

</head>
<body bgcolor="#f5f5f5" style="height: 900px">
<input type="hidden" id="pageCounts" value="0">
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<input type="hidden" id="stateId" value="">
<div class="header-top-warp-v1" style="background-color: white">
    <div class="header-top">
        <div class="page-main header-top-main">
            <ul class="header-top-left">
                <%--                首页URL--%>
                <li class="item-homeurl">
                    <a><i class="layui-icon layui-icon-home" style="color:#44D0C7;font-size:1.4em"></i>钱程无忧首页</a>
                </li>
            </ul>
            <%--            用户信息，项目--%>
            <div class="header-top-right">
                <ul class="header-top-user">
                    <c:if test="${not empty qUser}">
                        <li style="float: left;position: relative;">
                            <span class="hover-title">${qUser.userName}</span>
                        </li>
                        <li style="float: left;position: relative;">
                            <span class="hover-title">我的项目</span>
                        </li>
                    </c:if>
                    <c:if test="${empty qUser}">
                        <li style="float: left;position: relative;">
                            <span class="hover-title">登录</span>
                        </li>
                        <li style="float: left;position: relative;">
                            <span class="hover-title">注册</span>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
    <%-- logo   和 搜索--%>
    <div id="headerbody" class="header-body">
        <div class="page-main header-body-main" style="background-color: white;">
            <%--                头部 logo--%>
            <div class="header-body-logotitle" style="vertical-align: middle">
                <img src="${pageContext.request.contextPath}/style/images/logo.png" style="margin-left: 0px" width="150" height="60" alt="钱程无忧-关注你的钱程"/>
                <i class="i1"></i>
                <span style="font-size: 2em;font-family:'华文楷体';color:#44D0C7 ">我的项目</span>
            </div>
            <%--  搜索--%>
            <div class="search">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="输入项目名称，如“App开发”" id="projectName" name="projectName">
                    <div class="input-group-append">
                        <button class="btn-sm input-group-text" style="background-color: #0ae5eb;padding:0px 20px;color: white" onclick="findProject()">搜&nbsp;&nbsp;&nbsp;索</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-main main-div task-desc-container" style="background-color:white;margin-top: 10px;padding:0px;" >
        <div style="background-color: #eff1ff;">
            <ul class="layui-nav layui-input-inline" lay-filter="param"  style="background-color: #eff1ff;height: 40px;margin-bottom:5px;vertical-align: middle;width: 800px">
                <li class="layui-nav-item" style="line-height: 40px"><a class="params" href="javascript:;" style="text-decoration: none;color: #414141" onclick="chooseState('')">全部订单</a></li>
                <c:if test="${not empty parameters}">
                    <c:forEach items="${parameters}" var="parameter">
                        <li class="layui-nav-item" style="line-height: 40px"><a  class="params" href="javascript:;" style="text-decoration: none;color: #414141" onclick="chooseState('${parameter.paramId}')">${parameter.paramName}</a></li>
                    </c:forEach>
                </c:if>
            </ul>
            <div   style="vertical-align:middle;height: 40px;margin-left: 20px;display: inline-block;">
                <div class="layui-input-inline" style="float: left;margin-top: 5px">
                    <input class="layui-input" id="orderNum" style="width: 160px;height: 30px;" placeholder="订单号搜索">
                </div>
                <a style="float:left;margin-top:10px;margin-left:5px;font-size: 30px;" onclick="chooseState('')"> <i class="layui-icon layui-icon-search" ></i></a>


            </div>
        </div>

        <div class="order-info" style="margin-top: 10px">
            <div class="order-title fl" style="width: 435px;"><span style="margin-left: 40px;font-size: 14px;">订单详情</span></div>
            <div class="order-amount fl">金额</div>
            <div class="order-state fl">订单状态</div>
            <div class="order-ctrl fl">操作</div>
        </div>

        <div id="order_list">
        </div>
        <div style="width: 100%;text-align: right;display: block;clear: both;padding-top: 20px">
            <div id="projectPage" style="display: block;margin-left: auto;"></div>

        </div>

    </div>
</div>


<div class="layui-row" id="uploadUpdateTest" style="display: none">
    <div class="layui-col-md10">
        <form class="layui-form">
            <div style="display:block;text-align: center">
                <button type="button" class="layui-btn" id="upload">
                    <i class="layui-icon">&#xe67c;</i>选择文件
                </button>
                <span>只能上传压缩文件！</span>
            </div>
            <div class="layui-progress layui-progress-big" id="progress"  lay-filter="progress" lay-showPercent="true" style="display: inline-block; width: 270px;margin-top:10px;margin-left: 30px">
                <div class="layui-progress-bar layui-bg-green" lay-percent="0%" style="margin:auto"></div>
            </div>
            <div id="uploadState" class="layui-input-inline layui-word-aux"> </div>
<%--            上传后文件路径 value--%>
            <input type="hidden" id="docUrl" name="docUrl" value="">
            <input type="hidden" id="projectId" value="">
            <input type="hidden" id="id" value="">

            <div class="layui-form-item" style="margin-top:20px">
                <div class="layui-input-block" style="margin-left: 100px">
                    <button class="layui-btn " type="button" onclick="updateProjectFile()">保存</button>
                    <input type="button" style="margin-left: 50px" value="取消" class="layui-btn" onclick="closeUp()">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
