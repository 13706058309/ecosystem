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
    <title>发布项目</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/project/findProject.css">
    <script src="${pageContext.request.contextPath}/js/project/publishProject.js" charset="UTF-8"></script>
    <style>
        .task-desc-container{
            padding: 0px 30px;
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
<body>
<div>
    <input type="hidden" id="path" value="${pageContext.request.contextPath}">
    <div class="page-main main-div task-desc-container" style="width:800px;height:40px;background-color: #0ad3d9;margin:0px auto">
        <span style="color: cornsilk;font-size: 2em;font-family:'华文楷体';">发布项目</span>
    </div>
    <div class="page-main main-div task-desc-container" style="width:800px;background-color: white;margin:0px auto" >
        <form  class="layui-form" method="POST">
        <div class="content-item">
                <span class="item-title">
                    项目标题
                </span>
            <div class="item-value value">
                <div class="layui-input-inline">
                    <input class="layui-input" name="projectName" id="projectName" type="text" style="width: 300px">
                </div>
            </div>
        </div>
        <div class="content-item">
                <span class="item-title">
                    预算金额
                </span>
            <div class="item-value value">
                <div class="layui-input-inline">
                    <input class="layui-input" type="text" name="money" id="money" style="width:100px">
                </div>
                元
            </div>
        </div>
        <div class="content-item">
                <span class="item-title">
                    需求描述
                </span>
            <div class="item-value value" style="padding-bottom: 0px;">
                <div class="layui-input-inline">
                     <textarea class="layui-textarea" id="projectSynopsis" name="projectSynopsis" style=" resize: none;width: 600px;height: 100px;color: #737070"></textarea>
                </div>
                <div class="content-item">
                    <button type="button" class="layui-btn" id="upload">
                        <i class="layui-icon">&#xe67c;</i>添加附件
                    </button>
                    <span>只能上传压缩文件！</span>
                    <div class="layui-progress layui-progress-big" id="progress"  lay-filter="progress" lay-showPercent="true" style="display: inline-block; width: 300px;">
                        <div class="layui-progress-bar layui-bg-green" lay-percent="0%"></div>
                    </div>
                    <div id="uploadState" class="layui-input-inline layui-word-aux"> </div>
                    <input type="hidden" id="docUrl" name="docUrl" value="">
                </div>
            </div>
        </div>
        <div class="content-item">
            <span class="item-title">
                申请要求
            </span>
            <div class="item-value value">
                <div class="layui-input-inline">
             <textarea class="layui-textarea" id="projectCondition" name="projectCondition" style="resize: none;width: 600px;height:100px;color: #737070"></textarea>
                </div>
            </div>
        </div>
        <div class="content-item">
                <span class="item-title">
                    项目类型
                </span>
            <div class="item-value value">
                <select class="layui-form-select" id="fieldId"  name="fieldId" lay-verify="" >
                    <option value="">请选择项目类型</option>
                    <c:if test="${not empty parameters}">--%>
                        <c:forEach items="${parameters}" var="parameter">
                            <option value="${parameter.paramId}">${parameter.paramName}</option>
                        </c:forEach>
                    </c:if>
                </select>

                <div style="margin-top: 5px">
                    <input type="checkbox" id="xieYi" lay-skin="primary"><span style="color: red">我已阅读并接受</span><a style="color: #2780eb" href="javascript:;">《人才生态圈交易规则》</a>
                </div>
            </div>
        </div>
        <div class="bottom-opts">
            <div style="text-align: center">
                <a class="layui-btn layui-btn-lg layui-btn-primary" style="border-color: #ff410e; color: #ff410e" href="${pageContext.request.contextPath}/project/projectManage" target="_self">我的项目</a>
                <a class="layui-btn layui-btn-lg layui-btn-danger" onclick="addProject()">立即发布</a>
            </div>
        </div>
        </form>
    </div>
</div>
</body>
</html>
