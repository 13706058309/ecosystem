<%--
  Created by IntelliJ IDEA.
  User: WUWX
  Date: 2020/11/18
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <style>

    </style>
<%--    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">--%>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">

<%--    <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">--%>

    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <title>找工作</title>
    <script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/findJob.js" charset="utf-8"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">

    <script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js"></script>
    <script src="https://static.zhipin.com/zhipin-geek/v334/web/geek/js/main.js"></script>

    <style>

        .clearfix:after{display:block;clear:both;content:"";visibility:hidden;height:0}
        .clearfix{zoom:1}
        ul,li{
            list-style:none;
        }
        .qrm-input{
            outline: none;
            border:none;
            height: 38px;

            position: absolute;
            left: 4px;
            top: 0;
            padding: 0 10px;
        }
        .qrm-input-border{
            position: relative;
        }
        .qrm-pinming{
            height: 30px;
            line-height: 40px;
            border:1px solid #dddddd;
            border-radius: 5px;
            position: relative;
            width: 250px;
            /*background-image: url("../images/qrm-arrow-down.png");*/
            background-repeat: no-repeat;
            background-position: 275px;
        }
        .qrm-pinming:hover{
            cursor: pointer;
        }
        .qrm-pinming input:hover{
            cursor: pointer;
        }
        .qrm-pinming-panel{
            position: absolute;
            top: 52px;
            left: -1px;
            z-index: 99999;
            width: 250px;
            height: 210px;
            /*border: 1px solid #409EFF;*/
            background: #ffffff;
        }
        .qrm-border1{
            background-color: #eaecf0;
            float: left;
            width: 33%;
            height: 208px;
            /*overflow-y: scroll;*/
            border-right: 1px solid #f1f1f1;
            box-shadow: 0 0px 5px #f1f1f1;
            position: absolute;
            top: 50px;
            overflow:auto
            /*margin-left: 5px;*/
        }
        .qrm-border2{
            background-color: #eaecf0;
            float: left;
            width: 33%;
            height: 208px;
            /*overflow-y: scroll;*/
            border-right: 1px solid #f1f1f1;
            box-shadow: 0 0px 5px #f1f1f1;
            position: absolute;
            top: 50px;
            left: 100px;
            overflow:auto
            /*margin-left: 5px;*/
        }
        .qrm-border3{
            background-color: #eaecf0;
            float: left;
            width: 33%;
            height: 208px;
            /*overflow-y: scroll;*/
            border-right: 1px solid #f1f1f1;
            box-shadow: 0 0px 5px #f1f1f1;
            position: absolute;
            top: 50px;
            left: 200px;
            overflow:auto
            /*margin-left: 5px;*/
        }
        .qrm-lev{
            float: left;
            width: 96.5%;
            margin:0;
            padding:0;
            font-size: 12px;
        }
        .qrm-lev>li{
            width: 95%;
            position: relative;
            display: block;
            padding-left: 10px;
            height: 35px;
            line-height: 35px;
        }
        .qrm-lev>li:hover{
            background: #F5F7FA;
            /*color: #409EFF;*/
        }

        .qrm-arrow-right{
            display: inline-block;
            width: 4px;
            height: 7px;
            /*background: url("../images/qrm-arrow-right.png") no-repeat;*/
            position: absolute;
            right: 7px;
            top: 14px;
        }

        .qrm-lev-1>li.active{
            background: #F5F7FA;
            color: #409EFF;

        }
        .qrm-lev-2>li.active{
            background: #F5F7FA;
            color: #409EFF;

        }
        .qrm-lev-3>li.active{
            background: #F5F7FA;
            color: #409EFF;

        }
        .qrm-lev-4>li.active{
            background: #F5F7FA;
            color: #409EFF;
        }
        .box{
            width: 250px;
            height: 300px;
            margin: 0 auto;
        }
    </style>


</head>
<body>
<input type="hidden" id="count" value="${count}">
<input type="hidden" id="limit" value="${limit}">
<input type="hidden" id="curr" value="${curr}">


<div id="header" style="background-color:#00c2b3;height: 80px" >
    <div class="inner home-inner" >
        <div class="logo" style="width: 150px;height: 70px">

            <a  ka="header-home-logo" title="钱程无忧" style="background: url(${pageContext.request.contextPath}/imgs/logo12.jpg) 3px 7px no-repeat;background-size:150px 70px;width: 150px;height: 70px"><span>钱程无忧</span></a>
        </div>
        <div class="nav" style="margin-top: 20px">
            <ul>
                <li class=""><a ka="header-home" href="${pageContext.request.contextPath}/homePage/home">首页</a></li>
                <li class="cur"><a ka="header-job" href="${pageContext.request.contextPath}/center/job">职位</a></li>
                <li class=""><a class="nav-school" ka="header-school" href="${pageContext.request.contextPath}/homePage/companylist">公司</a></li>
                <%--                <li class=""><a ka="header_brand" href="https://www.zhipin.com/gongsi/">校招</a></li>--%>
                <li><a href="${pageContext.request.contextPath}/project" >项目</a></li>
                <li class=""><a ka="header-app" href="${pageContext.request.contextPath}/course/homePage">课程</a></li>
                <li class=""><a ka="header-article" href="${pageContext.request.contextPath}/zhengshu/cshouye">证书</a></li>
            </ul>
        </div>

        <div class="user-nav" style="margin-top: 20px">
            <c:if test="${empty qUser}">
                <div class="btns" style="margin-top: 10%">
                    <a href="${pageContext.request.contextPath}/golog/reg" ka="header-register" class="btn btn-outline">注册</a>
                    <a href="${pageContext.request.contextPath}/golog/login" class="btn btn-outline">登录</a>
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


<div id="wrap" class="search-job-list-wrap">
    <div id="filter-box" class="">
        <div class="inner home-inner">
            <div class="search-box" >
                <div class="search-form " >
                    <form action="/job_detail/" method="get" class="">
                        <div class="search-form-con" >
                            <div class="city-sel"  >
                                <i class="line"></i>
                                <span class="label-text" onclick="showCityDialog()"><b>${workCity}</b><i class="icon-arrow-down"></i></span>
                            </div>
                            <div class="industry-sel" ka="search_bos_sel_industry" style="width: 250px">
                                <i class="line"></i>
                                <input type="hidden" id="findPosition" value="${position}">
                                <span class="label-text" id="position9" style="width: 250px" >
<%--                                    <b>${position}</b><i class="icon-arrow-down"></i>  onclick="industryBoxToggle()"--%>
                                </span>

                                <div class="box" style="height: 15px">
                                    <div class="qrm-pinming">
                                        <div class="qrm-input-border">
                                            <!--<span class="title">品名</span>-->
                                            <input type="text" id="position" value="${position}" class="qrm-input" style="width: 250px;height: 30px">
                                        </div>
                                        <!--<div class="qrm-pinming-panel" style="display:none">-->
                                        <div class="qrm-border1" style="display:none">
                                            <ul class="qrm-lev-1 qrm-lev">
                                                <!--统料-->
                                                <c:if test="${not empty industrys}">
                                                    <c:forEach var="industrys" items="${industrys}">
                                                        <li class="active">
                                                            <span>${industrys.industryName}</span><i class="qrm-arrow-right"></i>
                                                            <ul class="li-zi-1" style="display: none">
                                                                <c:if test="${not empty industrys.departs}">
                                                                    <c:forEach var="departs" items="${industrys.departs}">
                                                                        <li>
                                                                            <span>${departs.departName}</span><i class="qrm-arrow-right"></i>
                                                                            <ul class="li-zi-2" style="display: none">
                                                                                <c:if test="${not empty departs.positions}">
                                                                                    <c:forEach var="positions" items="${departs.positions}">
                                                                                        <li>
                                                                                            <span>${positions.postName}</span>
                                                                                        </li>

                                                                                    </c:forEach></c:if>

                                                                            </ul>
                                                                        </li>
                                                                    </c:forEach></c:if>
                                                            </ul>
                                                        </li>
                                                    </c:forEach>
                                                </c:if>

                                            </ul>
                                            <p class="clearfix"></p>
                                        </div>
                                        <div class="qrm-border2" style="display:none">
                                            <ul class="qrm-lev-2 qrm-lev">

                                            </ul>
                                            <p class="clearfix"></p>
                                        </div>
                                        <div class="qrm-border3" style="display:none">
                                            <ul class="qrm-lev-3 qrm-lev">

                                            </ul>
                                            <p class="clearfix"></p>
                                        </div>
                                        <div class="qrm-border4" style="display:none">
                                            <ul class="qrm-lev-4 qrm-lev">

                                            </ul>
                                            <p class="clearfix"></p>
                                        </div>
                                        <p class="clearfix"></p>
                                        <!--</div>-->
                                        <p class="clearfix"></p>
                                    </div>
                                </div>

                            </div>
                            <p class="ipt-wrap"><input type="text" id="search" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" name="query" ka="search-keyword" value="${search}"
                                                       autocomplete="off" class="ipt-search" maxlength="50" placeholder="搜索职位"></p>
                        </div>
                        <input type="hidden" name="city" class="city-code" value="101230200">
                        <input type="hidden" name="industry" class="industry-code" value="">
                        <input type="hidden" name="position" class="position-code" value="100901">
                        <input type="button" class="btn btn-search" onclick="findsearch()" value="搜索">
                        <div class="city-box">
                            <ul class="dorpdown-province">
                            </ul>
                            <div class="dorpdown-city">
                            </div>
                        </div>
<%--                        <div class="industry-box" id="positionsShow"  >--%>
<%--                            <ul >--%>
<%--                                <li data-val=""><a onclick="findPosition(this)">不限</a></li>--%>
<%--                                <c:if test="${not empty positions}">--%>
<%--                                    <c:forEach var="position" items="${positions}">--%>
<%--                                        <li data-val="100001" ka="sel-industry-1"><a onclick="findPosition(this)">${position.postName}</a></li>--%>
<%--                                    </c:forEach>--%>
<%--                                </c:if>--%>

<%--&lt;%&ndash;                                <li data-val="100002" ka="sel-industry-2"><a href="javascript:;">游戏</a></li>&ndash;%&gt;--%>



<%--                            </ul>--%>
<%--                        </div>--%>
<%--                        <div class="industry-box" id="citysShow">--%>
<%--                            <ul>--%>
<%--                                <li data-val=""><a href="javascript:;">不限</a></li>--%>
<%--                                <c:if test="${not empty citys}">--%>
<%--                                    <c:forEach var="city" items="${citys}">--%>
<%--                                        <li data-val="100001" ka="sel-industry-1"><a onclick="findCity(this)">${city.cityName}</a></li>--%>
<%--                                    </c:forEach>--%>
<%--                                </c:if>--%>

<%--                                &lt;%&ndash;                                <li data-val="100002" ka="sel-industry-2"><a href="javascript:;">游戏</a></li>&ndash;%&gt;--%>



<%--                            </ul>--%>
<%--                        </div>--%>
                    </form>
                </div>
                <!-- 广告 -->
                <!--
                <div class="search-banner">
                    <img src="http://172.16.24.210/v2/web/geek/images/listbanner.png" alt="">
                </div>
                -->
            </div>
            <div class="condition-box">
                <dl class="condition-city show-condition-district">
                    <dd class="city-wrapper">
                        <input type="hidden" value="${workCity}" id="workCity">
                        <a href="javascript:;" class="disabled" title="厦门web前端招聘" id="findWorkCity" >${workCity}</a>

                        <em class="icon-arrow-right"></em>
<%--                        <a href="javascript:;" class="link-district selected">--%>
<%--                            不限</a>--%>
<%--                        <em class="icon-arrow-right"></em>--%>
                        <span class="hot-text">热门城市：</span>
                        <a onclick="findCity(this)">全国</a>
                        <a onclick="findCity(this)">北京市</a>
                        <a onclick="findCity(this)">上海市</a>
                        <a onclick="findCity(this)">广州市</a>
                        <a onclick="findCity(this)">深圳市</a>
                        <a onclick="findCity(this)">杭州市</a>
                        <a onclick="findCity(this)">天津市</a>
                        <a onclick="findCity(this)">西安市</a>
                        <a onclick="findCity(this)">福州市</a>
                        <a onclick="findCity(this)">武汉市</a>
                        <a onclick="findCity(this)">厦门市</a>
                        <a onclick="findCity(this)">成都市</a>
                        <a onclick="findCity(this)">重庆市</a>
                        <a href="javascript:;" class="btn-allcity" onclick="updateCityDialog()">全部城市</a>
                    </dd>
                </dl>
            </div>
            <div class="box-shadow-box"></div>
            <div class="filter-select-box">
                <div class="dropdown-wrap">

                        <span class="dropdown-select">
                            <input type="text" ka="sel-exp" id="findworkYear"  value="${findworkYear}" class="ipt" readonly="">
                            <i class="icon-select-arrow"></i>
                            <div class="dropdown-menu">
                                <ul>
                                    <li><a  onclick="workYear(this)" >不限</a></li>
                                    </li>
                                    <li><a  onclick="workYear(this)" >应届毕业生</a>
<%--                                    <li><a  onclick="qqq(this)" href="" ka="sel-exp-102" rel="nofollow">应届生</a>--%>
                                    </li>
                                    <li><a  onclick="workYear(this)" >1年以下</a>
                                    </li>
                                    <li><a  onclick="workYear(this)" >1-3年</a>
                                    </li>
                                    <li><a   onclick="workYear(this)">3-5年</a>
                                    </li>
                                    <li><a   onclick="workYear(this)">5-10年</a>
                                    </li>
                                    <li><a   onclick="workYear(this)">10年以上</a>
                                    </li>
                                </ul>
                            </div>
                        </span>
                </div>
                <div class="dropdown-wrap">

                        <span class="dropdown-select">
                            <input type="text" id="findEducation"  value="${findEducation}" ka="sel-degree" class="ipt" readonly="">
                            <i class="icon-select-arrow"></i>
                            <div class="dropdown-menu">
                                <ul>
                                    <li><a onclick="education(this)">不限</a></li>
                                    <li><a onclick="education(this)">高中</a>
                                    </li>
                                    <li><a onclick="education(this)">大专</a>
                                    </li>
                                    <li><a onclick="education(this)">本科</a>
                                    </li>
                                    <li><a onclick="education(this)">硕士</a>
                                    </li>
                                    <li><a onclick="education(this)">博士</a>
                                    </li>
                                </ul>
                            </div>
                        </span>
                </div>
                <div class="dropdown-wrap">

                        <span class="dropdown-select">
                            <input type="text" id="findSalary" ka="sel-salary" value="${findSalary}" class="ipt" readonly="">
                            <i class="icon-select-arrow"></i>
                            <div class="dropdown-menu">
                                <ul>
                                    <li><a onclick="salary(this)">不限</a></li>
                                    <li><a onclick="salary(this)">3K及以下</a>
                                    </li>
                                    <li><a onclick="salary(this)">3-5K</a>
                                    </li>
                                    <li><a onclick="salary(this)">5-10K</a>
                                    </li>
                                    <li><a onclick="salary(this)">10-15K</a>
                                    </li>
                                    <li><a onclick="salary(this)">15-20K</a>
                                    </li>
                                    <li><a onclick="salary(this)">20-30K</a>
                                    </li>
                                    <li><a onclick="salary(this)">30-50K</a>
                                    </li>
                                    <li><a onclick="salary(this)">50K及以上</a>
                                    </li>
                                </ul>
                            </div>
                        </span>
                </div>
                <div class="dropdown-wrap">

                        <span class="dropdown-select">
                            <input type="text" id="findFinanStage" ka="sel-stage" value="${findFinanStage}" class="ipt" readonly="">
                            <i class="icon-select-arrow"></i>
                            <div class="dropdown-menu">
                                <ul>
                                    <li><a onclick="financing(this)">不限</a></li>
                                    <li><a  onclick="financing(this)">未融资</a>
                                    </li>
                                    <li><a  onclick="financing(this)">天使轮</a>
                                    </li>
                                    <li><a  onclick="financing(this)">A轮</a>
                                    </li>
                                    <li><a  onclick="financing(this)">B轮</a>
                                    </li>
                                    <li><a  onclick="financing(this)">C轮</a>
                                    </li>
                                    <li><a  onclick="financing(this)">D轮及以上</a>
                                    </li>
                                    <li><a  onclick="financing(this)">上市公司</a>
                                    </li>
                                </ul>
                            </div>
                        </span>
                </div>
                <div class="dropdown-wrap">
                        <span class="dropdown-select">
                            <input type="text" id="findScale" ka="sel-scale" value="${findScale}" class="ipt" readonly="">
                            <i class="icon-select-arrow"></i>
                            <div class="dropdown-menu">
                                <ul>
                                    <li><a onclick="scale(this)">不限</a></li>
                                    <li><a onclick="scale(this)">少于15人</a>
                                    </li>
                                    <li><a onclick="scale(this)">15-50人</a></li>
                                    <li><a onclick="scale(this)">50-150人</a></li>
                                    <li><a onclick="scale(this)">150-500人</a></li>
                                    <li><a onclick="scale(this)">500-999人</a></li>
                                    <li><a onclick="scale(this)">1000人以上</a></li>
                                </ul>
                            </div>
                        </span>
                </div>
                <div class="dropdown-wrap">
                        <span class="dropdown-select">
                            <input type="text" id="findReleaseTime" ka="sel-scale" value="${findReleaseTime}" class="ipt" readonly="">
                            <i class="icon-select-arrow"></i>
                            <div class="dropdown-menu">
                                <ul>
                                    <li><a onclick="releaseTime(this)">不限</a></li>
                                    <li><a onclick="releaseTime(this)" >一天以内</a></li>
                                    <li><a onclick="releaseTime(this)">三天以内</a></li>
                                    <li><a onclick="releaseTime(this)">七天以内</a></li>
                                    <li><a onclick="releaseTime(this)">十五天以内</a></li>
                                    <li><a onclick="releaseTime(this)">一个月以内</a></li>
                                </ul>
                            </div>
                        </span>
                </div>
                <a href="job">清空筛选条件</a>
            </div>
        </div>
    </div>

    <div id="main" class="inner home-inner">
        <div class="job-box">

            <div class="job-list">
                <div class="job-tab" style="display: none" data-filter="" data-keyword="" data-l3code="100901"
                     data-rescount="375" data-page="1" data-source="2">
                    <a href="javascript:;" class="cur" ka="recommend-job-list">热门职位</a><a href="javascript:;"
                                                                                          ka="new-job-list">最新职位</a>
                </div>

                <div class="company-list">
                </div>
                <ul>
                    <c:if test="${not empty jobs}">
                        <c:forEach var="job" items="${jobs}">
                            <li>
                                <div class="job-primary">
                                    <div class="info-primary">
                                        <div class="primary-wrapper">
                                            <div class="primary-box"
                                                 href="postInfo?pPostId=${job.pPostId}"
                                                 data-jid="ef44ec169fb734ba33J53dy_EVo~" data-itemid="1"
                                                 data-lid="${job.pPostId}" data-jobid="86361218" data-index="0"
                                                 ka="search_list_1" target="_blank">
                                                <div class="job-title">
                                                <span class="job-name"><a
                                                        href="postInfo?lid=${job.pPostId}"
                                                        title="${job.postName}" target="_blank" ka="search_list_jname_1"
                                                        data-jid="ef44ec169fb734ba33J53dy_EVo~" data-itemid="1"
                                                        data-lid="${job.pPostId}" data-jobid="86361218"
                                                        data-index="0">${job.postName}</a></span>
                                                    <span class="job-area-wrapper" onclick="postInfo(${job.pPostId})">
                                                    <span class="job-area" >${job.detailAddress}</span>

                                                </span>
                                                    <span class="job-pub-time" title="发布于:${job.releaseTime}">发布于:${job.releaseTime}</span>

                                                </div>
                                                <div class="job-limit clearfix">
                                                    <a><span class="red">${job.minSalary}-${job.maxSalary}k</span>
                                                    <p>${job.workYear}<em class="vline"></em>${job.education}</p>
<%--                                                    <span class="job-area"><a>投递简历</a></span>--%>
                                                    <div class="info-publis">
                                                        <h3 class="name"><img class="icon-chat"
                                                                              src="https://z.zhipin.com/web/geek/resource/icon-chat-v2.png">${job.backUser.bUserName}
<%--                                                            <em class="vline"></em>技术总监--%>
                                                        </h3>
                                                    </div></a>
                                                    <c:if test="${not empty qUser}">
                                                    <button class="btn btn-startchat" href="javascript:;" onclick="window.open('${pageContext.request.contextPath}/rec/userChat?compID=${job.backUser.bUserId}')"
                                                            data-url="/wapi/zpgeek/friend/add.json?jobId=ef44ec169fb734ba33J53dy_EVo~&amp;lid=8YjKaEC3M3L.search.1"
                                                            redirect-url="/web/geek/chat?id=73a464069ec2b4ca0XZ93928EVo~">
                                                        <img class="icon-chat icon-chat-hover"
<%--                                                             src="https://z.zhipin.com/web/geek/resource/icon-chat-hover-v2.png"--%>
                                                             alt="">
                                                        <span>立即沟通</span>
                                                    </button>
                                                    </c:if>
                                                </div>

                                                <div class="info-detail" style="top: 0px;"></div>
                                            </div>
                                        </div>
                                        <div class="info-company">
                                            <div class="company-text">
                                                <h3 class="name"><a href="${pageContext.request.contextPath}/homePage/compProfile?bUserId=${job.backUser.bUserId}"
                                                                     ka="search_list_company_1_custompage"
                                                                    target="_blank">${job.backUser.compName}</a></h3>
                                                <p><a href="/i100020/" class="false-link" target="_blank"
                                                      ka="search_list_company_industry_1_custompage"
                                                      title="">
                                                <c:if test="${not empty job.industryList}">
                                                    <c:forEach var="industry" items="${job.industryList}">
                                                        &ensp;${industry.industryName}
                                                    </c:forEach>
                                                    </c:if>
                                                </a><em class="vline"></em>${job.backUser.finanStage}<em
                                                        class="vline"></em>${job.backUser.scale}</p>
                                            </div>
                                            <a
<%--                                                    href="/gongsi/60272326a766224f1nBy3do~.html"--%>
                                               ka="search_list_company_1_custompage_logo" target="_blank"><img
                                                    class="company-logo"
                                                    src="${pageContext.request.contextPath}/uploadLogo/${job.backUser.logo}"
                                                    alt=""></a>
<%--                                                ${pageContext.request.contextPath}${job.backUser.logo}--%>
                                        </div>
                                    </div>
                                    <div class="info-append clearfix">
                                        <div class="tags">
                                            <c:if test="${not empty qUser}">
                                            <span class="tag-item"><a onclick="sendResume(${job.pPostId})">投递简历</a></span>
                                            </c:if>
                                        </div>
                                        <div class="info-desc">${job.jobBenefits}</div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </c:if>

                </ul>
                <div id="fenye" style="text-align: center"></div>
<%--                <div class="page">--%>
<%--                    <a href="/c101230200-p100901/?page=0" ka="page-prev" class="prev"></a>--%>
<%--                    <a href="javascript:;" class="cur" ka="page-cur">1</a>--%>
<%--                    <a href="/c101230200-p100901/?page=2" ka="page-2">2</a>--%>
<%--                    <a href="/c101230200-p100901/?page=3" ka="page-3">3</a>--%>
<%--                    <span>...</span>--%>
<%--                    <a href="/c101230200-p100901/?page=2" ka="page-next" class="next"></a>--%>
<%--                </div>--%>
            </div>
        </div>
    </div>
</div>

<div id="city-dialog" class="dialog-wrap city-dialog city-letter-show" style="display: none;">
    <div class="dialog-layer"></div>
    <div class="dialog-container">
        <div class="dialog-title">
            <h3 class="title"></h3><a href="javascript:;" class="close" ka="dialog_close"><i
                class="icon-close" onclick="$('#city-dialog').hide()"></i></a>
        </div>
        <div class="dialog-con">
            <h4>请选择城市</h4>
            <div class="layui-tab" >
                <ul class="layui-tab-title">
                    <li class="layui-this">ABCDE</li>
                    <li>FGHJ</li>
                    <li>KLMNO</li>
                    <li>PQRST</li>
                    <li>WXYZ</li>
                </ul>
                <div class="layui-tab-content" >
                    <div class="layui-tab-item layui-show" >
                        <c:if test="${not empty ae}">
                            <c:forEach var="ae" items="${ae}">
                                <a style="margin-left: 5%" onclick="findCity(this)">${ae.cityName}</a>
                            </c:forEach></c:if>
                    </div>
                    <div class="layui-tab-item">
                        <div class="layui-tab-item layui-show" >
                            <c:if test="${not empty fj}">
                                <c:forEach var="fj" items="${fj}">
                                    <a style="margin-left: 5%" onclick="findCity(this)">${fj.cityName}</a>
                                </c:forEach></c:if>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <div class="layui-tab-item layui-show" >
                            <c:if test="${not empty ko}">
                                <c:forEach var="ko" items="${ko}">
                                    <a style="margin-left: 5%" onclick="findCity(this)">${ko.cityName}</a>
                                </c:forEach></c:if>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <div class="layui-tab-item layui-show" >
                            <c:if test="${not empty pt}">
                                <c:forEach var="pt" items="${pt}">
                                    <a style="margin-left: 5%" onclick="findCity(this)">${pt.cityName}</a>
                                </c:forEach></c:if>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <div class="layui-tab-item layui-show" >
                            <c:if test="${not empty wz}">
                                <c:forEach var="wz" items="${wz}">
                                    <a style="margin-left: 5%"  onclick="findCity(this)">${wz.cityName}</a>
                                </c:forEach></c:if>
                        </div>
                    </div>

                </div>

            </div>

<%--            <div class="city-wrapper">--%>
<%--                <ul class="section-province">--%>
<%--                    <li class="active">热门城市</li>--%>
<%--                    <li ka="sel-province-1">ABCDE</li>--%>
<%--                    <li ka="sel-province-2">FGHJ</li>--%>
<%--                    <li ka="sel-province-3">KLMN</li>--%>
<%--                    <li ka="sel-province-4">PQRST</li>--%>
<%--                    <li ka="sel-province-5">WXYZ</li>--%>
<%--                    <li ka="sel-province-5">WXYZ</li>--%>
<%--                    <li ka="sel-province-5">WXYZ</li>--%>
<%--                    <li ka="sel-province-5">WXYZ</li>--%>
<%--                    <li ka="sel-province-5">WXYZ</li>--%>
<%--                </ul>--%>
<%--                <ul class="section-city">--%>
<%--                    <li class="hot-city"><span class="city-cur" data-val="100010000">全国</span></li>--%>
<%--                    <li class="hot-city"><span class="city-cur" data-val="101010100">北京</span></li>--%>
<%--                    <li class="hot-city"><span class="city-cur" data-val="101020100">上海</span></li>--%>
<%--                    <li class="hot-city"><span class="city-cur" data-val="101280100">广州</span></li>--%>
<%--                    <li class="hot-city"><span class="city-cur" data-val="101280600">深圳</span></li>--%>
<%--                    <li class="hot-city"><span class="city-cur" data-val="101210100">杭州</span></li>--%>
<%--                    <li class="hot-city"><span class="city-cur" data-val="101030100">天津</span></li>--%>
<%--                    <li class="hot-city"><span class="city-cur" data-val="101110100">西安</span></li>--%>
<%--                    <li class="hot-city"><span class="city-cur" data-val="101190400">苏州</span></li>--%>
<%--                    <li class="hot-city"><span class="city-cur" data-val="101200100">武汉</span></li>--%>
<%--                    <li class="hot-city"><span class="city-cur" data-val="101230200">厦门</span></li>--%>
<%--                    <li class="hot-city"><span class="city-cur" data-val="101250100">长沙</span></li>--%>
<%--                    <li class="hot-city"><span class="city-cur" data-val="101270100">成都</span></li>--%>
<%--                    <li class="hot-city"><span class="city-cur" data-val="101180100">郑州</span></li>--%>
<%--                    <li class="hot-city"><span class="city-cur" data-val="101040100">重庆</span></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
        </div>
    </div>

</div>
<div class="links links-friends">
    <dl class="links-item">
        <dt>友情链接：</dt>
        <dd>
            <a href="http://lieyunwang.com/" target="_blank">猎云网</a> <span>|</span>
            <a href="http://www.chuanke.com/" target="_blank">传课网</a> <span>|</span>
            <a href="http://se.360.cn/" target="_blank">360安全浏览器</a> <span>|</span>
            <a href="http://www.zhongchou.cn" target="_blank">众筹网</a><span>|</span>
            <a href="http://www.zhubajie.com/" target="_blank">创意服务外包</a><span>|</span>
            <a href="http://www.thinkphp.cn/" target="_blank">thinkphp</a><span>|</span>
            <a href="http://www.meitu.com/" target="_blank">美图公司</a><span>|</span>
            <a href="http://iwebad.com/" target="_blank">网络广告人社区</a>
        </dd>
    </dl>
</div>
<script>
    $(document).ready(function(){
        // 筛选条件事件
        $(".dropdown-select")
            .mouseover(function(){
                $(event.currentTarget).find(".dropdown-menu").show()
            })
            .mouseout(function(){
                $(event.currentTarget).find(".dropdown-menu").hide()
            });
    });

    // 全部城市弹出框
    function showCityDialog() {
        $("#city-dialog").show()
        // $("#citysShow").toggle()
    }



    // 公司行业切换 隐藏/显示
    // function industryBoxToggle() {
    //     $("#positionsShow").toggle()
    // }
</script>
<script>
    var findworkYear=$('#findworkYear').val();
    var findWorkCity=$('#workCity').val();
    var findEducation=$('#findEducation').val();
    var findSalary=$('#findSalary').val();
    var findFinanStage=$('#findFinanStage').val();
    var findScale=$('#findScale').val();
    var findReleaseTime=$('#findReleaseTime').val();
    var search=$('#search').val()
    var findposition=$('#findPosition').val();
    var count=$('#count').val();
    var limit=$('#limit').val();
    var curr=$('#curr').val();
    console.log(findWorkCity)
    console.log($('#findWorkCity').innerText)
    function workYear(condition) {
        findworkYear=condition.innerText;
        //+"&curr="+curr+"&limit="+limit+"&findPosition="+findposition
        location.href="clearjob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime+"&curr=1"+"&limit="+limit+"&findPosition="+findposition;
    }
    function workCity(condition) {
        findworkYear=condition.innerText;
        location.href="clearjob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime+"&curr=1"+"&limit="+limit+"&findPosition="+findposition;

    }
    function education(condition) {
        findEducation=condition.innerText;
        location.href="clearjob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime+"&curr=1"+"&limit="+limit+"&findPosition="+findposition;

    }
    function salary(condition) {
        findSalary=condition.innerText;
        location.href="clearjob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime+"&curr=1"+"&limit="+limit+"&findPosition="+findposition;
    }
    function financing(condition) {
        findFinanStage=condition.innerText;
        location.href="clearjob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime+"&curr=1"+"&limit="+limit+"&findPosition="+findposition;
    }
    function scale(condition) {
        findScale=condition.innerText;
        location.href="clearjob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime+"&curr=1"+"&limit="+limit+"&findPosition="+findposition;
    }
    function releaseTime(condition) {
        findReleaseTime=condition.innerText;
        location.href="clearjob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime+"&curr=1"+"&limit="+limit+"&findPosition="+findposition;
    }
    function findCity(condition) {
        findWorkCity=condition.innerText;
        location.href="clearjob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime+"&curr=1"+"&limit="+limit+"&findPosition="+findposition;
    }
    // function findPosition(condition) {
    //     findposition=condition.innerText;
    //     location.href="job?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime+"&curr="+curr+"&limit="+limit+"&findPosition="+findposition;
    // }
    function findsearch() {
        location.href="searchJob?findSearch="+$('#search').val()+"&findWorkCity="+findWorkCity+"&findPosition="+$('#position').val();
    }
    function updateCityDialog() {
        $("#city-dialog").show()
        // $("#citysShow").toggle()
    }
    function sendResume(pPostId) {
        $.ajax({
            url: 'sendResume',
            charset:"UTF-8",
            async: "true",
            type: "post",
            data: "pPostId="+pPostId,
            dataType: "text",
            success: function (data) {
                if (data == "succes") {
                    //向服务端发送删除指令
                    layer.msg('投递成功')
                } else if (data == "lose") {
                    layer.msg("简历不完善，无法投递。请先完善再重新投递简历")
                }else if (data == "repetition") {
                    layer.msg("已向该岗位投递过简历")
                }
            },
            error: function () {
                layer.msg('网络繁忙')
            }
        })
    }


    $(function () {
        //控制边框高亮
        $(".qrm-input-border").click(function () {
            if($(".qrm-pinming").css("background-image").indexOf("qrm-arrow-down")!==-1){
                if($(".qrm-input").val() == ''||$(".qrm-input").val()!=''){
                    $(".qrm-pinming").css("background-image","url(images/qrm-arrow-top.png)");
                    $(".qrm-pinming").css("border","1px solid #409EFF");
                    $(".qrm-border1").show();
                }else{
                    var s=$(".qrm-input").val()
                    console.log(s)
                    var n=(s.split('/')).length-1;
                    console.log(n)
                    if(n==1){
                        $(".qrm-border1").show();
                        $(".qrm-border2").show();
                    }else if (n==2){
                        $(".qrm-border1").show();
                        $(".qrm-border2").show();
                        $(".qrm-border3").show();
                    }
                    $(".qrm-pinming").css("background-image","url(images/qrm-arrow-top.png)");
                    $(".qrm-pinming").css("border","1px solid #409EFF");
                }
            }else {
                $(".qrm-border1").hide();
                $(".qrm-border2").hide();
                $(".qrm-border3").hide();
                $(".qrm-pinming").css("border","1px solid #ddd");
                $(".qrm-pinming").css("background-image","url(images/qrm-arrow-down.png)");
            }
        });
        //第一层
        var lev1;
        var lev2;
        var lev3;
        var lev4;
        //第一层 事件代理
        $("body").on("click",".qrm-lev-1>li",function () {
            //控制背景颜色高亮
            $(this).addClass("active").siblings("li").removeClass("active");
            // 先将input中的值置空
            lev1="";
            lev2="";
            lev3="";
            lev4="";
            // 获取当前点击的li的子元素的HTML节点 将获取的节点放到页面显示的第二级中
            var html1=$(this).children(".li-zi-1").html();
            $(".qrm-lev-2").html(html1);
            $(".qrm-border2").show();
            $(".qrm-border3").hide();
            $(".qrm-lev-3").html("");
//      $(".qrm-lev-4").html("");
            //获取当前点击的li的span中的值 将值传到input中
            lev1=$(this).children("span").html();
//      $(".qrm-input").val("");
//      $(".qrm-input").val(lev1);
        });
        //第二层 事件代理

        $("body").on("click",".qrm-lev-2>li",function () {
            $(this).addClass("active").siblings("li").removeClass("active");
//      console.log($(this).children(".li-zi-2").html())
            if($(this).children(".li-zi-2").html()== undefined){
                lev2=$(this).children("span").html();
                $(".qrm-input").val(lev1+"/"+lev2);
                $(".qrm-border1").hide();
                $(".qrm-border2").hide();
                $(".qrm-border3").hide();
                $(".qrm-pinming").css("border","1px solid #ddd");
                $(".qrm-pinming").css("background-image","url(images/qrm-arrow-down.png)");
            }else{
                var html2=$(this).children(".li-zi-2").html();
                lev2=$(this).children("span").html();
                $(".qrm-border3").show();
                $(".qrm-lev-3").html(html2);
            }
            if($(this).parent().parent().next().children(".qrm-lev").html()==""){
                // 去掉输入框的高亮状态
                $(".qrm-border1").hide();
                $(".qrm-border2").hide();
                $(".qrm-border3").hide();
                $(".qrm-pinming").css("border","1px solid #ddd");
                $(".qrm-pinming").css("background-image","url(images/qrm-arrow-down.png)");
            }
//      $(".qrm-lev-4").html("");
//      $(".qrm-input").val(lev1+"/"+lev2);
        });
        //第三层 事件代理
        $("body").on("click",".qrm-lev-3>li",function () {
            $(this).addClass("active").siblings("li").removeClass("active");
            var html3=$(this).children(".li-zi-3").html();
            lev3=$(this).children("span").html();
//      $(".qrm-lev-4").html(html3);
            $(".qrm-input").val(lev3);
            $(".qrm-border1").hide();
            $(".qrm-border2").hide();
            $(".qrm-border3").hide();
            $(".qrm-pinming").css("border","1px solid #ddd");
            $(".qrm-pinming").css("background-image","url(images/qrm-arrow-down.png)");
            lev3=lev3.replace(/\+/g,"%2B");
            lev3=lev3.replace(/\#/g,"%23");
            findposition=lev3;
            location.href="clearjob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime+"&curr=1"+"&limit="+limit+"&findPosition="+findposition+'';

            if($(this).parent().parent().next().children(".qrm-lev").html()==""){
                // 去掉输入框的高亮状态
                $(".qrm-input").val(lev1+"/"+lev2);
                $(".qrm-border1").hide();
                $(".qrm-border2").hide();
                $(".qrm-border3").hide();
                $(".qrm-pinming").css("border","1px solid #ddd");
                $(".qrm-pinming").css("background-image","url(images/qrm-arrow-down.png)");
            }
        });
        //第三层 事件代理
//  $("body").on("click",".qrm-lev-4>li",function () {
//      $(this).addClass("active").siblings("li").removeClass("active");
//      lev4=$(this).children("span").html();
//      $(".qrm-pinming-panel").hide();
//      $(".qrm-pinming").css("border","1px solid #ddd");
//      $(".qrm-pinming").css("background-image","url(images/qrm-arrow-down.png)");
//      $(".qrm-input").val(lev1+"/"+lev2+"/"+lev3+"/"+lev4);
//  });

//给四个区域绑定点击事件 判断当前的下一个区域 如果为空 点击当前区域 qrm-pinming-panel 隐藏 并且把input高亮去掉
        $("body").on("click",".qrm-lev>li",function () {
            if($(this).parent().parent().next().children(".qrm-lev").html()==""){
                // 去掉输入框的高亮状态
                $(".qrm-border1").hide();
                $(".qrm-border2").hide();
                $(".qrm-border3").hide();
                $(".qrm-pinming").css("border","1px solid #ddd");
                $(".qrm-pinming").css("background-image","url(images/qrm-arrow-down.png)");
            }
        })
    });
    //点击空白处隐藏div
    $(document).click(function(event){
        var x1 = $('.box');  // 设置目标区域
        if(!x1.is(event.target) && x1.has(event.target).length === 0){ // Mark 1
            $(".qrm-border1").hide();
            $(".qrm-border2").hide();
            $(".qrm-border3").hide();
            $(".qrm-pinming").css("border","1px solid #ddd");
            $(".qrm-pinming").css("background-image","url(images/qrm-arrow-down.png)");
            //$('#divTop').slideUp('slow');  //滑动消失
//         $('.qrm-pinming-panel').hide(300);     //淡出消失
        }
    });








    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
            ,layer = layui.layer;
        //自定义样式
        laypage.render({
            elem: 'fenye'
            ,count: count
            ,curr:curr
            ,theme: '#1E9FFF'
            ,limit:limit
            ,layout: ['count', 'prev', 'page', 'next']
            ,jump:function (obj,first) {
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数
                if(!first){
                    location.href="clearjob?findworkYear="+findworkYear+"&findPosition="+findposition+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime+"&curr="+obj.curr+"&limit="+obj.limit;
                }
            }
        });




    });

    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function(){
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: '新选项'+ (Math.random()*1000|0) //用于演示
                    ,content: '内容'+ (Math.random()*1000|0)
                    ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                })
            }
            ,tabDelete: function(othis){
                //删除指定Tab项
                element.tabDelete('demo', '44'); //删除：“商品管理”


                othis.addClass('layui-btn-disabled');
            }
            ,tabChange: function(){
                //切换到指定Tab项
                element.tabChange('demo', '22'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);

        element.on('tab(test)', function(elem){
            location.hash = 'test='+ $(this).attr('lay-id');
        });

    });

    // function gt() {
    //     location.href="/springboot/center/jianli"
    // }
</script>


<script type="text/javascript">

</script>

</body>

</html>
