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
    <title>找项目</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/project/findProject.css">

    <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jianli.css" rel="stylesheet">
    <script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js" crossorigin="anonymous"></script>
    <script src="https://static.zhipin.com/zhipin-geek/v334/web/geek/js/main.js"></script>

    <script src="${pageContext.request.contextPath}/js/project/findProject.js" charset="UTF-8"></script>
</head>
<body bgcolor="#f5f5f5" style="height: 900px">
<input type="hidden" id="pageCounts" value="0">
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<div class="header-top-warp-v1">
<%--    <div class="header-top">--%>
<%--        <div class="page-main header-top-main">--%>
<%--            <ul class="header-top-left">--%>
<%--&lt;%&ndash;                首页URL&ndash;%&gt;--%>
<%--                <li class="item-homeurl">--%>
<%--                    <a href="${pageContext.request.contextPath}/homePage/home"><i class="layui-icon layui-icon-home" style="color:#44D0C7;font-size:1.4em"></i>钱程无忧首页</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--&lt;%&ndash;            用户信息，项目&ndash;%&gt;--%>
<%--            <div class="header-top-right">--%>
<%--                <ul class="header-top-user">--%>
<%--                    <c:if test="${not empty qUser}">--%>
<%--                        <li style="float: left;position: relative;">--%>
<%--                            <span class="hover-title">${qUser.userName}</span>--%>
<%--                        </li>--%>
<%--                        <li style="float: left;position: relative;">--%>
<%--                            <span class="hover-title"><a href="${pageContext.request.contextPath}/userProject/projectOfUser">我的项目</a></span>--%>
<%--                        </li>--%>
<%--                        <li style="float: left;position: relative;">--%>
<%--                            <span class="hover-title"><a href="javaScript:;" onclick="userExit()">注销</a></span>--%>
<%--                        </li>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${empty qUser}">--%>
<%--                        <li style="float: left;position: relative;">--%>
<%--                            <span class="hover-title"><a href="${pageContext.request.contextPath}/golog/login" >登录</a></span>--%>
<%--                        </li>--%>
<%--                        <li style="float: left;position: relative;">--%>
<%--                            <span class="hover-title"><a href="${pageContext.request.contextPath}/golog/reg">注册</a></span>--%>
<%--                        </li>--%>
<%--                    </c:if>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%-- logo   和 搜索--%>

    <div id="header" style="background-color:#00c2b3;height: 80px" >
        <div class="inner home-inner" >
            <div class="logo" style="width: 150px;height: 70px">
                <a  ka="header-home-logo" title="钱程无忧" style="background: url(${pageContext.request.contextPath}/imgs/logo12.jpg) 3px 7px no-repeat;background-size:150px 70px;width: 150px;height: 70px;margin-top: 0px"><span>钱程无忧</span></a>
            </div>
            <div class="nav" style="margin-top: 20px">
                <ul>
                    <li class=""><a ka="header-home" href="${pageContext.request.contextPath}/homePage/home">首页</a></li>
                    <li class=""><a ka="header-job" href="${pageContext.request.contextPath}/center/job">职位</a></li>
                    <li class=""><a class="nav-school" ka="header-school" href="${pageContext.request.contextPath}/homePage/companylist">公司</a></li>
                    <li><a class="cur" href="${pageContext.request.contextPath}/project" >项目</a></li>
                    <li class=""><a ka="header-app" href="${pageContext.request.contextPath}/course/homePage">课程</a></li>
                    <li class=""><a ka="header-article" href="${pageContext.request.contextPath}/zhengshu/cshouye">证书</a></li>
                </ul>
            </div>

            <div class="user-nav" style="margin-top: 20px">
                <c:if test="${empty qUser}">
                    <div class="btns" style="margin-top: 10%">
                        <a href="${pageContext.request.contextPath}/golog/reg" style="background: #202329" ka="header-register" class="btn btn-outline">注册</a>
                        <a href="${pageContext.request.contextPath}/golog/login" style="background: #202329" class="btn btn-outline">登录</a>
                    </div>
                </c:if>
                <c:if test="${not empty qUser}">
                    <ul>
                            <%--                <li class=""><a ka="header-message" href="https://www.zhipin.com/web/geek/chat">消息<span class="nav-chat-num"></span></a></li>--%>
                        <li class="nav-figure">
                            <a >
                                <span class="label-text">${qUser.userName}</span><img src="${pageContext.request.contextPath}${qUser.headImgUrl}" alt=""/>
                            </a>
                            <div class="dropdown">
                                <a href="${pageContext.request.contextPath}/center/jianli" ka="header-personal">个人中心<span>编辑简历</span></a>
                                <a href="${pageContext.request.contextPath}/userProject/projectOfUser" ka="header-personal">我的项目<span>项目订单</span></a>
                                <a href="${pageContext.request.contextPath}/center/accountSet" ka="account_manage">账号设置<span>重置密码|更换手机号|隐私设置|修改用户名</span></a>
                                <a href="${pageContext.request.contextPath}/homePage/quitAccount?city=${workCity}"  ka="header-logout">退出登录</a>
                            </div>
                        </li>
                    </ul></c:if>
            </div>
        </div>
    </div>






    <div id="headerbody" class="header-body">
        <div class="page-main header-body-main">
            <%--                头部 logo--%>
            <div class="header-body-logotitle" style="vertical-align: middle">
                <img src="${pageContext.request.contextPath}/style/images/logo.png"  style="margin-left: 0px" width="150" height="60" alt="钱程无忧-关注你的钱程"/>
                <i class="i1"></i>
                <span style="font-size: 2em;font-family:'华文楷体';color:#44D0C7 ">找项目</span>
            </div>
            <%--                搜索--%>
            <div class="search">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="输入项目名称，如“App开发”" id="projectName" name="projectName" value="${projectName}">
                    <div class="input-group-append">
                        <button class="btn-sm input-group-text" style="background-color: #0ae5eb;padding:0px 20px;color: white" onclick="findProject(1,9)">搜&nbsp;&nbsp;&nbsp;索</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-main main-div">
<%--        已筛选标签--%>
        <div class="main-search" id="searched" style="display: none">
            <ul class="list-group" style="width: 100%; margin-top: 0px">
                <li class="list-group-item layui-inline text-left" style="border:0;border-bottom: 1px solid rgba(0,0,0,.125);">
                    <span style="font-size: 14px;">已筛选记录:</span>
                    <ul class="search-cates">
                        <li id="field" class="cate-name" style="display: none;border: 1px solid #ddd;border-radius: 2px;text-align: center;line-height: 23px;">
                            <span id="fieldName" value="fileId1" style="float: left;padding-right:10px; overflow: hidden;text-overflow: ellipsis;white-space: nowrap;color: #666;color: #ff410e">
                            </span>
                            <input id="fieldId" type="hidden" value="">
                            <span class="text-center" style="cursor: pointer;display: inline-block;border-left: 1px solid #ddd;">
                                <i class="layui-icon" style="margin-left: 10px" onclick="deleteField()">&#x1006;</i>
                            </span>
                        </li>
                        <li id="money" class="cate-name" style="display: none;border: 1px solid #ddd;border-radius: 2px;text-align: center;line-height: 23px;">
                            <span id="moneyName"  style="float: left;padding-right:10px; overflow: hidden;text-overflow: ellipsis;white-space: nowrap;color: #666;color: #ff410e">
                            </span>
                            <input id="moneyLower" type="hidden" value="">
                            <input id="moneyHigher" type="hidden" value="">
                            <span class="text-center" style="cursor: pointer;display: inline-block;border-left: 1px solid #ddd;">
                                <i class="layui-icon" style="margin-left: 10px" onclick="deleteMoney()">&#x1006;</i>
                            </span>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
<%--        标签查询--%>
        <div class="main-search">
            <ul class="list-group" style="width: 100%; margin-top: 0px">
                <li class="list-group-item layui-inline text-left" style="border:0;border-bottom: 1px solid rgba(0,0,0,.125);">
                    <span style="font-size: 14px;">领&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;域:</span>
                    <ul class="search-cates">
                        <li class="cate-name" ><a id="fieldAll" class="cate-name-select" href="javascript:void(0);" onclick="chooseField(this,null)">全部</a></li>
                        <c:if test="${not empty parameterList}">
                            <c:forEach items="${parameterList}" var="parameter">
                                <li class="cate-name "><a href="javascript:void(0);" onclick="chooseField(this,${parameter.paramId})">${parameter.paramName}</a></li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </li>
                <li class="list-group-item layui-inline text-left" style="border:0;border-bottom: 1px solid rgba(0,0,0,.125);">
                    <span style="font-size: 14px;">预算金额:</span>
                    <ul class="search-cates">
                        <li class="cate-name cate-name-select" ><a id="moneyAll" class="cate-name-select" href="javascript:void(0);" onclick="chooseMoney(this,null,null)">全部</a></li>
                        <li class="cate-name"><a href="javascript:void(0);" onclick="chooseMoney(this,0,1000)">1000以下</a></li>
                        <li class="cate-name"><a href="javascript:void(0);" onclick="chooseMoney(this,1000,5000)">1000~5000</a></li>
                        <li class="cate-name"><a href="javascript:void(0);" onclick="chooseMoney(this,5000,10000)">5000~10000</a></li>
                        <li class="cate-name"><a href="javascript:void(0);" onclick="chooseMoney(this,10000,50000)">10000~50000</a></li>
                        <li class="cate-name"><a href="javascript:void(0);" onclick="chooseMoney(this,50000,null)">50000以上</a></li>
                        <li class="cate-name" style="vertical-align: top">
                            <div onmouseover="onMouse()" onmouseout="outMouse()" id="searchMoney" style="display: inline-block;position: absolute; margin-top: 0px;vertical-align: top;width: 140px;height: 100px;height: 74px;">
                                <div style="" >
                                    <input class="money-input" type="number" id="lower-price" placeholder="￥" value="">
                                    ~
                                    <input class="money-input" type="number" id="higher-price" placeholder="￥" value="">
                                </div>
                                <div id="searchBtn" class="text-center price-act" style="margin-top: 8px">
                                    <button  class="layui-btn layui-btn-primary layui-btn-sm " style="background-color: white;margin-right:10px;" onclick="moneyClear()">清空</button>
                                    <button  class="layui-btn layui-btn-warm layui-btn-sm" onclick="moneySearch(this)">确认</button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
<%--        项目列表--%>
    <div id="projectList" class="project-list" style="width: 100%">
    </div>
<%--        分页--%>
    <div style="width: 100%;text-align: center;display: block;clear: both;padding-top: 20px">
        <div id="projectPage" style="display: block;margin-left: auto;"></div>
    </div>

</div>
</body>
</html>
