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
    <title>我的项目</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
<%--    <script src="${pageContext.request.contextPath}/js/project/projectManage.js" charset="UTF-8"></script>--%>
    <style>
        .demand-main {
            position: relative;
            /*width: 800px;*/
            /*background: #fff;*/
            margin:15px auto;
            background-color: coral;
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
            padding-top: 24px;
            font-weight: 700;
            font-size: 16px;
            color: #333;
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
    </style>
</head>
<body>
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
    <div class="demand-main fl left-message J--message">
        <p class="demand-title">
            <i></i>
            <span class="message">
                需求信息
            </span>
        </p>
        <div class="demand-content J-show-hide" style="max-height: none;">
            <p class="up clearfix order-title J-order-title">
                <span class="fl title">需求标题</span>
                <span class="fr description">
                <span class="J-description-ordertitle">需要人物取名</span>
                </span>
            </p>
            <div class="clearfix J-order-price">
                <span class="fl title">预算金额</span>
                <p class="fr description">
                    <span class="orange-color">1<em>元</em></span>
                </p>
            </div>
            <p class="clearfix">
                <span class="fl title">需求类型</span>
                <span class="fr description task-addtional">
                     <label>人物取名</label>
                </span>
            </p>
            <p class="clearfix">
                <span class="fl title">需求描述</span>
                <span class="fr description">
                    啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
            </span>
            <p class="clearfix">
                <span class="fl title">需求文件</span>
                <span class="fr description">
                    <a>下载需求</a>
            </span>
            </p>
        </div>
    </div>
<%--    承接人信息/选择承接人--%>
    <div class="demand-main fl left-message J--message">
        <table id="userTable" lay-filter="userTable" style="margin-top: 10px"></table>
    </div>

<%--    查看进度--%>
    <div class="demand-main fl left-message J--message">
        <p class="demand-title">
            <i></i>
            <span class="message">
                    需求信息
            </span>
        </p>
        <div class="demand-content J-show-hide" style="max-height: none;">
            <p class="up clearfix order-title J-order-title">
                <span class="fl title">需求标题</span>
                <span class="fr description">
                    <span class="J-description-ordertitle">需要人物取名</span>
                    </span>
            </p>
            <div class="clearfix J-order-price">
                <span class="fl title">预算金额</span>
                <p class="fr description">
                    <span class="orange-color">1<em>元</em></span>
                </p>
            </div>
            <p class="clearfix">
                <span class="fl title">需求类型</span>
                <span class="fr description task-addtional">
                         <label>人物取名</label>
                    </span>
            </p>
            <p class="clearfix">
                <span class="fl title">需求描述</span>
                <span class="fr description">
                        啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                </span>
            <p class="clearfix">
                <span class="fl title">需求文件</span>
                <span class="fr description">
                        <a>下载需求</a>
                </span>
            </p>
        </div>
    </div>
<%--    查看进度--%>
    <div class="demand-main fl left-message J--message">
        <p class="demand-title">
            <i></i>
            <span class="message">
                        需求信息
                    </span>
        </p>
        <div class="demand-content J-show-hide" style="max-height: none;">
            <p class="up clearfix order-title J-order-title">
                <span class="fl title">需求标题</span>
                <span class="fr description">
                        <span class="J-description-ordertitle">需要人物取名</span>
                        </span>
            </p>
            <div class="clearfix J-order-price">
                <span class="fl title">预算金额</span>
                <p class="fr description">
                    <span class="orange-color">1<em>元</em></span>
                </p>
            </div>
            <p class="clearfix">
                <span class="fl title">需求类型</span>
                <span class="fr description task-addtional">
                             <label>人物取名</label>
                        </span>
            </p>
            <p class="clearfix">
                <span class="fl title">需求描述</span>
                <span class="fr description">
                            啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                    </span>
            <p class="clearfix">
                <span class="fl title">需求文件</span>
                <span class="fr description">
                            <a>下载需求</a>
                    </span>
            </p>
        </div>
    </div>
<%--    评价--%>
    <div class="demand-main fl left-message J--message">
        <p class="demand-title">
            <i></i>
            <span class="message">
                            需求信息
                        </span>
        </p>
        <div class="demand-content J-show-hide" style="max-height: none;">
            <p class="up clearfix order-title J-order-title">
                <span class="fl title">需求标题</span>
                <span class="fr description">
                            <span class="J-description-ordertitle">需要人物取名</span>
                            </span>
            </p>
            <div class="clearfix J-order-price">
                <span class="fl title">预算金额</span>
                <p class="fr description">
                    <span class="orange-color">1<em>元</em></span>
                </p>
            </div>
            <p class="clearfix">
                <span class="fl title">需求类型</span>
                <span class="fr description task-addtional">
                                 <label>人物取名</label>
                            </span>
            </p>
            <p class="clearfix">
                <span class="fl title">需求描述</span>
                <span class="fr description">
                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                        </span>
            <p class="clearfix">
                <span class="fl title">需求文件</span>
                <span class="fr description">
                                <a>下载需求</a>
                        </span>
            </p>
        </div>
    </div>
</body>
</html>
