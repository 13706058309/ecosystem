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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/project/findProject.css">
    <script src="${pageContext.request.contextPath}/js/project/projectDetail.js" charset="UTF-8"></script>
    <style>
        .task-desc-container{
            padding: 22px 30px;
            font-size: 14px;
        }
        .content-item{
            margin-top: 12px;
            color: #999;
        }
        .task-desc-container {
            font-size: 14px;
        }
        .item-title{
            margin-right: 30px;
            vertical-align: top;
        }

        .beforeSuccess {
            max-height: 206px;
        }
        .desc {
            position: relative;
            padding-bottom: 26px;
            width: 800px;
            box-sizing: border-box;
            overflow: hidden;
        }
        .value{
            color: #333;
        }
        .item-value{
            display: inline-block;
            max-width: 1020px;
        }
        .bottom-opts {
            position: relative;
            margin-top: 30px;
        }
    </style>

</head>
<body bgcolor="#f5f5f5">
<input type="hidden" id="pageCounts" value="0">
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<div class="header-top-warp-v1">
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
        <div class="page-main header-body-main">
            <%--                头部 logo--%>
            <div class="header-body-logotitle" style="vertical-align: middle">
                <img src="${pageContext.request.contextPath}/style/images/logo.png" style="margin-left: 0px" width="150" height="60" alt="钱程无忧-关注你的钱程"/>
                <i class="i1"></i>
                <span style="font-size: 2em;font-family:'华文楷体';color:#44D0C7 ">项目详情</span>
            </div>
            <%--  搜索--%>
            <div class="search">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="输入项目名称，如“App开发”" id="projectName" name="projectName">
                    <div class="input-group-append">
                        <button class="btn-sm input-group-text" style="background-color: cyan;padding:0px 30px" onclick="findProject()">搜索</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-main main-div task-desc-container" style="background-color: white;margin-top: 10px" >
        <div style="width: 1024px;margin:auto;font-size: 14px">
            需求内容
        </div>
        <div class="content-item">
            客户 ${projectDetail.backUser.bUserName} 于 ${projectDetail.publishTime} 发布该需求
        </div>
        <div class="content-item">
            <span class="item-title">
                项目标题
            </span>
            <div class="item-value value">
                    XXXXXXXXXXXXxxxxxxxxxxxxxxx
            </div>
        </div>
        <div class="content-item">
            <span class="item-title">
                预算金额
            </span>
            <div class="item-value value">
                ￥2000
            </div>
        </div>
        <div class="content-item">
            <span class="item-title">
                需求描述
            </span>
            <div class="item-value value desc beforeSuccess" style="padding-bottom: 0px;">
                ${projectDetail.projectSynopsis}
            </div>

        </div>
        <div class="content-item">
            <span class="item-title">
                需求文件
            </span>
            <div class="item-value value">
                <a>点击下载</a>
            </div>
        </div>
<%--        <div class="content-item">--%>
<%--            <span class="item-title">--%>
<%--                需求描述--%>

<%--            </span>--%>
<%--            <div class="item-value value">--%>
<%--                <textarea id="text">--%>
<%--                </textarea>--%>
<%--                <button onclick="showText()">啊</button>--%>
<%--                <script>--%>
<%--                    function showText(){--%>
<%--                        var texts=$("#text").val().trim();--%>
<%--                        texts=textareaTo(texts);--%>
<%--                        console.log(texts);--%>
<%--                        location.href=$("#path").val()+"/project/projectDetail?projectId=22&projectMiaoShu="+texts;--%>
<%--                    }--%>
<%--                    function textareaTo(str){--%>
<%--                        var reg=new RegExp("\n","g");--%>
<%--                        var regSpace=new RegExp(" ","g");--%>

<%--                        str = str.replace(reg,"<br>");--%>
<%--                        str = str.replace(regSpace,"&nbsp;");--%>

<%--                        return str;--%>
<%--                    }--%>
<%--                </script>--%>
<%--            </div>--%>
<%--        </div>--%>
        <div class="content-item">
            <span class="item-title">
                项目类型
            </span>
            <div class="item-value value">
                ${projectDetail.field.paramName}
            </div>
        </div>
        <div class="content-item">
            <span class="item-title">
                申请要求
            </span>
            <div class="item-value value desc beforeSuccess" style="padding-bottom: 0px;">
                申请要求1
                <br>
                申请要求2
                <br>
                申请要求3
                <br>
                申请要求4
            </div>
        </div>
        <div class="bottom-opts">
            <input type="checkbox">我已阅读并接受<a>《人才生态圈交易规则》</a>
            <a class="layui-btn layui-btn-lg layui-btn-danger">立即申请</a>
        </div>
    </div>

</div>
</body>
</html>
