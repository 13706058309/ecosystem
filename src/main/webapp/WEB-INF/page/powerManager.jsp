<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/16
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>权限管理</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/userManager.js"></script>
    <script src="${pageContext.request.contextPath}/js/powerManager.js" charset="UTF-8"></script>

    <style>
        .transfer-box{
            width: 660px;
            height: 400px;
        }
        .transfer-box-item{
            width: 250px;
            height: 450px;
            /*background-color: #ffa9bb;*/
            float: left;
            border:1px solid black;
        }
        .transfer-box-title{
            width:100%;
            /*background-color: cornflowerblue;*/
            font-family:'华文楷体';
            font-size: 1.2em;
            text-align: center;
            padding:20px 0px;
            border-bottom:1px solid black;
        }
        .transfer-btnBox{
            width: 100px;
            height: 450px;
            /*background-color: #ffc45f;*/
            float: left;
        }
        .transfer-box-item{
            /*background-color: darkcyan;*/
            font-family:'华文楷体';
        }
        .transfer-btnBox-button{
            width: 80px;
            margin: 20px auto;
            display: block;
            background-color: darkcyan;
        }
    </style>
</head>
<body>
<input id="path" type="hidden" value="${pageContext.request.contextPath}">
<div><select class="layui-form-item" id="roleId" onchange="changeRole()" style="width: 200px"></select></div>
    <div class="transfer-box">
        <div class="transfer-box-item">
            <div class="transfer-box-title">
                已分配菜单
            </div>
            <div class="transfer-box-main">
                <div id="tree1"></div>
            </div>
        </div>
        <div class="transfer-btnBox">
            <button class="layui-btn  transfer-btnBox-button" style="margin-top: 100px" lay-demo="allToRight" id="allToRight" > >> </button>
            <button class="layui-btn  transfer-btnBox-button" lay-demo="toRight" id="toRight"> > </button>
            <button class="layui-btn  transfer-btnBox-button" lay-demo="allToLeft" id="allToLeft"> << </button>
            <button class="layui-btn  transfer-btnBox-button"  lay-demo="toLeft" id="toLeft"> < </button>
        </div>
        <div class="transfer-box-item">
            <div class="transfer-box-title">
                未分配菜单
            </div>
            <div class="transfer-box-main">
                <div id="tree2"></div>
            </div>
        </div>
    </div>
</body>
</html>
