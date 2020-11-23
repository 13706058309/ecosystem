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

    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <title>找工作</title>
    <script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/findJob.js" charset="utf-8"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">





</head>
<body>
<input type="hidden" id="count" value="${count}">
<input type="hidden" id="limit" value="${limit}">
<input type="hidden" id="curr" value="${curr}">


<div id="header" style="background-color: #0d98ff">
    <div class="inner home-inner" >
        <div class="logo">
            <a href="https://www.zhipin.com/" ka="header-home-logo" title="BOSS直聘"><span>BOSS直聘</span></a>
        </div>
        <div class="nav">
            <ul>
                <li class=""><a ka="header-home" href="https://www.zhipin.com/">首页</a></li>
                <li class="cur"><a ka="header-job" href="https://www.zhipin.com/job_detail/">职位</a></li>
                <li class=""><a class="nav-school" ka="header-school" href="https://www.zhipin.com/xiaoyuan/">公司</a></li>
                <li class=""><a ka="tab_overseas_click" href="https://www.zhipin.com/returnee_jobs/">简历</a></li>
                <li class=""><a ka="header_brand" href="https://www.zhipin.com/gongsi/">校招</a></li>
                <li class=""><a ka="header-app" href="https://app.zhipin.com/">课程</a></li>
                <li class=""><a ka="header-article" href="https://news.zhipin.com/">资讯</a></li>
            </ul>
        </div>
        <div class="nav-search search-box">
            <form action="https://www.zhipin.com/job_detail/" method="get" target="_blank">
<%--                <div class="search-form-con">--%>
<%--                    <p class="ipt-wrap"><input ka="search-job-query" name="query" type="text" class="ipt-search" autocomplete="off" maxlength="50" placeholder="搜索职位、公司"/></p>--%>
<%--                </div>--%>
                <input type="hidden" name="city" class="city-code" value="101230200"/>
                <input type="hidden" name="source" value="8">
<%--                <button type="submit" ka="search-job-top" class="btn btn-search">搜索</button>--%>
                <div class="suggest-result">
                    <ul></ul>
                </div>
            </form>
        </div>
        <div class="user-nav">
            <ul>
                <li class=""><a ka="header-message" href="https://www.zhipin.com/web/geek/chat">消息<span class="nav-chat-num"></span></a></li>
<%--                <li class=""><a ka="header-resume" href="https://www.zhipin.com/web/geek/resume">简历</a></li>--%>
<%--                <li class="nav-dot">·</li>--%>
<%--                <li class="nav-up-file"><a class="header-resume-upload" ka="header-resume-upload-2" href="javascript:;">上传</a></li>--%>
                <li class="nav-figure">
                    <a href="https://www.zhipin.com/web/geek/recommend" ka="header-username">
                        <span class="label-text">吴世泽</span><img src="https://img.bosszhipin.com/beijin/upload/avatar/20191127/983522633b91a32d3c06c43f75dcc8e5d28c90069eead34e1450918b517a0c3b_s.png" alt=""/>
                    </a>
                    <div class="dropdown">
                        <a href="https://www.zhipin.com/web/geek/recommend" ka="header-personal">个人中心<span>推荐职位、编辑在线简历</span></a>
                        <a href="https://www.zhipin.com/web/geek/account?type=mobile" ka="account_manage">账号设置<span>修改密码、打招呼语和常用语</span></a>
                        <a href="https://www.zhipin.com/web/geek/account?type=privacySet" ka="privacy_set">隐私设置</a>
                        <a href="https://www.zhipin.com/web/geek/mall" class="link-mall" ka="recruit_assistant">求职助手</a>
                        <a href="javascript:;" class="link-recruit" ka="header-recruit">切换为招聘者</a>
                        <a href="javascript:;" class="link-logout" ka="header-logout">退出登录</a>
                        <p class="recruit-tip"><img src="https://static.zhipin.com/v2/web/geek/images/recruit-tip.gif" alt=""><span>在 APP 端“我的 - 设置”中切换为Boss身份后，刷新本页面即可进行招聘</span></p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>


<div id="wrap" class="search-job-list-wrap">
    <div id="filter-box" class="">
        <div class="inner home-inner">
            <div class="search-box">
                <div class="search-form ">
                    <form action="/job_detail/" method="get" class="">
                        <div class="search-form-con">
                            <div class="city-sel">
                                <i class="line"></i>
                                <span class="label-text" onclick="showCityDialog()"><b>${workCity}</b><i class="icon-arrow-down"></i></span>
                            </div>
                            <div class="industry-sel" ka="search_bos_sel_industry">
                                <i class="line"></i>
                                <span class="label-text" id="position9" onclick="industryBoxToggle()"><b>${position}</b><i class="icon-arrow-down"></i></span>
                            </div>
                            <p class="ipt-wrap"><input type="text" id="search" name="query" ka="search-keyword" value="${search}"
                                                       autocomplete="off" class="ipt-search" maxlength="50" placeholder="搜索职位、公司"></p>
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
                        <div class="industry-box" id="positionsShow">
                            <ul>
                                <li data-val=""><a href="javascript:;">不限</a></li>
                                <c:if test="${not empty positions}">
                                    <c:forEach var="position" items="${positions}">
                                        <li data-val="100001" ka="sel-industry-1"><a href="javascript:;">${position.postName}</a></li>
                                    </c:forEach>
                                </c:if>

<%--                                <li data-val="100002" ka="sel-industry-2"><a href="javascript:;">游戏</a></li>--%>



                            </ul>
                        </div>
                        <div class="industry-box" id="citysShow">
                            <ul>
                                <li data-val=""><a href="javascript:;">不限</a></li>
                                <c:if test="${not empty citys}">
                                    <c:forEach var="city" items="${citys}">
                                        <li data-val="100001" ka="sel-industry-1"><a href="javascript:;">${city.cityName}</a></li>
                                    </c:forEach>
                                </c:if>

                                <%--                                <li data-val="100002" ka="sel-industry-2"><a href="javascript:;">游戏</a></li>--%>



                            </ul>
                        </div>
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
<%--                <dl class="condition-district  show-condition-district ">--%>
<%--                    <dd>--%>
<%--                        <a class="selected" href="/c101230200-p100901/" ka="sel-business-0">不限</a>--%>
<%--                        <a href="/c101230200-p100901/b_%E6%80%9D%E6%98%8E%E5%8C%BA/" ka="sel-business-0">思明区</a>--%>
<%--                        <a href="/c101230200-p100901/b_%E6%B9%96%E9%87%8C%E5%8C%BA/" ka="sel-business-1">湖里区</a>--%>
<%--                        <a href="/c101230200-p100901/b_%E9%9B%86%E7%BE%8E%E5%8C%BA/" ka="sel-business-2">集美区</a>--%>
<%--                        <a href="/c101230200-p100901/b_%E6%B5%B7%E6%B2%A7%E5%8C%BA/" ka="sel-business-3">海沧区</a>--%>
<%--                        <a href="/c101230200-p100901/b_%E7%BF%94%E5%AE%89%E5%8C%BA/" ka="sel-business-4">翔安区</a>--%>
<%--                        <a href="/c101230200-p100901/b_%E5%90%8C%E5%AE%89%E5%8C%BA/" ka="sel-business-5">同安区</a>--%>
<%--                    </dd>--%>
<%--                </dl>--%>
<%--                <dl class="condition-area ">--%>
<%--                    <dd>--%>
<%--                        <a class="selected" href="/c101230200-p100901/" ka="sel-area-0">不限</a>--%>
<%--                    </dd>--%>
<%--                </dl>--%>
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
                <a href="clearjob">清空筛选条件</a>
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
                                            <div class="primary-box" href="/job_detail/ef44ec169fb734ba33J53dy_EVo~.html"
                                                 data-jid="ef44ec169fb734ba33J53dy_EVo~" data-itemid="1"
                                                 data-lid="8YjKaEC3M3L.search.1" data-jobid="86361218" data-index="0"
                                                 ka="search_list_1" target="_blank">
                                                <div class="job-title">
                                                <span class="job-name"><a
                                                        href="postInfo?pPostId=${job.pPostId}"
                                                        title="资深前端开发工程师" target="_blank" ka="search_list_jname_1"
                                                        data-jid="ef44ec169fb734ba33J53dy_EVo~" data-itemid="1"
                                                        data-lid="8YjKaEC3M3L.search.1" data-jobid="86361218"
                                                        data-index="0">${job.postName}</a></span>
                                                    <span class="job-area-wrapper">
                                                    <span class="job-area">${job.detailAddress}</span>

                                                </span>
                                                    <span class="job-pub-time">发布于:${job.releaseTime}</span>

                                                </div>
                                                <div class="job-limit clearfix">
                                                    <span class="red">${job.minSalary}-${job.maxSalary}k</span>
                                                    <p>${job.workYear}<em class="vline"></em>${job.education}</p>
<%--                                                    <span class="job-area"><a>投递简历</a></span>--%>
                                                    <div class="info-publis">
                                                        <h3 class="name"><img class="icon-chat"
                                                                              src="https://z.zhipin.com/web/geek/resource/icon-chat-v2.png">${job.backUser.bUserName}
<%--                                                            <em class="vline"></em>技术总监--%>
                                                        </h3>
                                                    </div>
                                                    <button class="btn btn-startchat" href="javascript:;"
                                                            data-url="/wapi/zpgeek/friend/add.json?jobId=ef44ec169fb734ba33J53dy_EVo~&amp;lid=8YjKaEC3M3L.search.1"
                                                            redirect-url="/web/geek/chat?id=73a464069ec2b4ca0XZ93928EVo~">
                                                        <img class="icon-chat icon-chat-hover"
                                                             src="https://z.zhipin.com/web/geek/resource/icon-chat-hover-v2.png"
                                                             alt="">
                                                        <span>立即沟通</span>
                                                    </button>

                                                </div>

                                                <div class="info-detail" style="top: 0px;"></div>
                                            </div>
                                        </div>
                                        <div class="info-company">
                                            <div class="company-text">
                                                <h3 class="name"><a href="/gongsi/60272326a766224f1nBy3do~.html"
                                                                    title="美图公司招聘" ka="search_list_company_1_custompage"
                                                                    target="_blank">${job.backUser.compName}</a></h3>
                                                <p><a href="/i100020/" class="false-link" target="_blank"
                                                      ka="search_list_company_industry_1_custompage"
                                                      title="互联网行业招聘信息">
                                                <c:if test="${not empty job.industryList}">
                                                    <c:forEach var="industry" items="${job.industryList}">
                                                        &ensp;${industry.industryName}
                                                    </c:forEach>
                                                    </c:if>
                                                </a><em class="vline"></em>${job.backUser.finanStage}<em
                                                        class="vline"></em>${job.backUser.scale}</p>
                                            </div>
                                            <a href="/gongsi/60272326a766224f1nBy3do~.html"
                                               ka="search_list_company_1_custompage_logo" target="_blank"><img
                                                    class="company-logo"
                                                    src="${pageContext.request.contextPath}/uploadLogo/${job.backUser.logo}"
                                                    alt=""></a>
<%--                                                ${pageContext.request.contextPath}${job.backUser.logo}--%>
                                        </div>
                                    </div>
                                    <div class="info-append clearfix">
                                        <div class="tags">
                                            <span class="tag-item"><a onclick="sendResume(${job.pPostId})">投递简历</a></span>
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
            <div class="layui-tab">
                <ul class="layui-tab-title">
                    <li class="layui-this">网站设置</li>
                    <li>用户管理</li>
                    <li>权限分配</li>
                    <li>商品管理</li>
                    <li>订单管理</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <ul class="section-city">
                            <li class="hot-city"><span class="city-cur" data-val="100010000">全国</span></li>
                            <li class="hot-city"><span class="city-cur" data-val="101010100">北京</span></li>
                            <li class="hot-city"><span class="city-cur" data-val="101020100">上海</span></li>
                            <li class="hot-city"><span class="city-cur" data-val="101280100">广州</span></li>
                            <li class="hot-city"><span class="city-cur" data-val="101280600">深圳</span></li>
                            <li class="hot-city"><span class="city-cur" data-val="101210100">杭州</span></li>
                            <li class="hot-city"><span class="city-cur" data-val="101030100">天津</span></li>
                            <li class="hot-city"><span class="city-cur" data-val="101110100">西安</span></li>
                            <li class="hot-city"><span class="city-cur" data-val="101190400">苏州</span></li>
                            <li class="hot-city"><span class="city-cur" data-val="101200100">武汉</span></li>
                            <li class="hot-city"><span class="city-cur" data-val="101230200">厦门</span></li>
                            <li class="hot-city"><span class="city-cur" data-val="101250100">长沙</span></li>
                            <li class="hot-city"><span class="city-cur" data-val="101270100">成都</span></li>
                            <li class="hot-city"><span class="city-cur" data-val="101180100">郑州</span></li>
                            <li class="hot-city"><span class="city-cur" data-val="101040100">重庆</span></li>

                        </ul>
                    </div>
                    <div class="layui-tab-item">内容2</div>
                    <div class="layui-tab-item">内容3</div>
                    <div class="layui-tab-item">内容4</div>
                    <div class="layui-tab-item">内容5</div>
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
            </div>
        </div>
    </div>
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
        // $("#city-dialog").show()
        $("#citysShow").toggle()
    }



    // 公司行业切换 隐藏/显示
    function industryBoxToggle() {
        $("#positionsShow").toggle()
    }
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
    console.log(findWorkCity)
    console.log($('#findWorkCity').innerText)
    function workYear(condition) {
        findworkYear=condition.innerText;
        location.href="findJob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime;
    }
    function workCity(condition) {
        findworkYear=condition.innerText;
        location.href="findJob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime;
    }
    function education(condition) {
        findEducation=condition.innerText;
        location.href="findJob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime;
    }
    function salary(condition) {
        findSalary=condition.innerText;
        location.href="findJob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime;
    }
    function financing(condition) {
        findFinanStage=condition.innerText;
        location.href="findJob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime;
    }
    function scale(condition) {
        findScale=condition.innerText;
        location.href="findJob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime;
    }
    function releaseTime(condition) {
        findReleaseTime=condition.innerText;
        location.href="findJob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime;
    }
    function findCity(condition) {
        findWorkCity=condition.innerText;
        location.href="findJob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime;
    }
    function findsearch() {
        location.href="searchJob?findSearch="+$('#search').val()+"&findWorkCity="+findWorkCity
    }
    function updateCityDialog() {
        // $("#city-dialog").show()
        $("#citysShow").toggle()
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
                }
            },
            error: function () {
                layer.msg('网络繁忙')
            }
        })
    }

    var count=$('#count').val();
    var limit=$('#limit').val();
    var curr=$('#curr').val();
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
                    location.href="pageJob?findworkYear="+findworkYear+"&findSearch="+search+"&findWorkCity="+findWorkCity+"&findEducation="+findEducation+"&findSalary="+findSalary+"&findFinanStage="+findFinanStage+"&findScale="+findScale+"&findReleaseTime="+findReleaseTime+"&curr="+obj.curr+"&limit="+obj.limit;
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
</script>
</body>

</html>
