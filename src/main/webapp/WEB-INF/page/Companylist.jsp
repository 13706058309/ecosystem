<%--  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/11/11
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="../js/jquery-3.5.1.js"></script>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="alternate" media="handheld"/>
    <!-- end 云适配 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>公司主页</title>
    <meta property="qc:admins" content="23635710066417756375"/>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <meta name="baidu-site-verification" content="QIQ6KC1oZ6"/>
    <link rel="stylesheet" type="text/css" href="../style/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="../style/css/external.min.css"/>
    <link rel="stylesheet" type="text/css" href="../style/css/popup.css"/>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
    <script src="../js/companylist.js"></script>
</head>
<body style="background-color: #f6f6f8">
<div id="body">
    <div id="header">
        <div class="wrapper">
            <a class="logo">
                <img src="../style/images/logo.png" width="200" height="80">
            </a>
            <ul class="reset" id="navheader">
                <li><a href="${pageContext.request.contextPath}/homePage/home">首页</a></li>
                <li class="current"><a href="${pageContext.request.contextPath}/homePage/companylist">公司</a></li>
                <li><a href="h/toForum.html" target="_blank">校招</a></li>
                <li><a href="h/toForum.html" target="_blank">课程</a></li>
                <li><a href="jianli.html" rel="nofollow">我的简历</a></li>
                <li><a href="create.html" rel="nofollow">发布职位</a></li>
            </ul>
            <ul class="loginTop">
                <li><a href="${pageContext.request.contextPath}/golog/login" rel="nofollow">登录</a></li>
                <li>|</li>
                <li><a href="${pageContext.request.contextPath}/golog/reg" rel="nofollow">注册</a></li>
            </ul>
        </div>
    </div>
    <div id="container">
        <div class="clearfix">
            <div class="content_l">
                <form id="companyListForm" name="companyListForm" method="get">
                    <dl class="hc_tag">
                        <dd>
                            <dl>
                                <dt>公司地点：</dt>
                                <dd>
                                    <input type="hidden" value="${chooseCity}" id="a1">
                                    <a id="chooseCity" style="color: #FFFFFF;background-color: #44d0c7">${chooseCity}</a>
                                </dd>
                                <dd>
                                    <a onclick="CityList(this)" >全国</a>
                                </dd>
                                <c:forEach items="${cityList}" var="city">
                                    <dd>
                                        <a class="" onclick="CityList(this)">${city.cityName}</a>
                                    </dd>
                                </c:forEach>
                            </dl>
                            <dl>
                                <dt>行业类型：</dt>
                                <dd>
                                    <input type="hidden" value="${chooseType}" id="a2">
                                    <a  id="chooseType" style="color: #FFFFFF;background-color: #44d0c7">${chooseType}</a>
                                    <a onclick="Type(this)">不限</a>
                                    <a onclick="Type(this)">技术</a>
                                    <a onclick="Type(this)">设计</a>
                                    <a onclick="Type(this)">销售</a>
                                    <a onclick="Type(this)">传媒</a>
                                    <a onclick="Type(this)">金融</a>
                                    <a onclick="Type(this)">教育培训</a>
                                    <a onclick="Type(this)">医疗健康</a>
                                    <a onclick="Type(this)">生产制造</a>
                                    <a onclick="Type(this)">产品/运营/市场</a>
                                    <a onclick="Type(this)">人事/财务/行政</a>
                                    <a onclick="Type(this)">采购/贸易</a>
                                    <a onclick="Type(this)">供应链/物流</a>
                                    <a onclick="Type(this)">房地产/建筑</a>
                                    <a onclick="Type(this)">咨询/翻译/法律</a>
                                    <a onclick="Type(this)">旅游/服务业</a>
                                </dd>
                            </dl>
                            <dl>
                                <dt>融资阶段：</dt>
                                <dd>
                                    <a  id="chooseFinan" style="color: #FFFFFF;background-color: #44d0c7">${chooseFinan}</a>
                                    <a onclick="Finan(this)">不限</a>
                                    <a onclick="Finan(this)">未融资</a>
                                    <a onclick="Finan(this)">天使轮</a>
                                    <a onclick="Finan(this)">A轮</a>
                                    <a onclick="Finan(this)">B轮</a>
                                    <a onclick="Finan(this)">C轮</a>
                                    <a onclick="Finan(this)">D轮及以上</a>
                                    <a onclick="Finan(this)">以上市</a>
                                    <a onclick="Finan(this)">不需要融资</a>
                                </dd>
                            </dl>
                            <dl>
                                <dt>公司规模：</dt>
                                <dd>
                                    <a  id="chooseScale" style="color: #FFFFFF;background-color: #44d0c7">${chooseScale}</a>
                                    <a onclick="Scale(this)">不限</a>
                                    <a onclick="Scale(this)">0-20人</a>
                                    <a onclick="Scale(this)">20-99人</a>
                                    <a onclick="Scale(this)">100-499人</a>
                                    <a onclick="Scale(this)">500-999人</a>
                                    <a onclick="Scale(this)">1000-9999人</a>
                                    <a onclick="Scale(this)">10000人以上</a>
                                </dd>
                            </dl>
                        </dd>
                    </dl>
                    <input type="hidden" id="size" value="${companyList}">
                    <input type="hidden" id="curr" value="${curr}">
                    <div style="font-size: 18px;color: #44D0C7;font-family: 华文新魏;margin: 18px 30px" align="right" >
                        共&nbsp;${companyList}&nbsp;家公司
                    </div>
                    <ul class="hc_list reset" style="width: 100%;margin: 0px 22px">
                        <c:forEach items="${backUserList}" var="company">
                            <li style="margin: 3px 5px;width: 264px;height: 120px" onclick="companyProfile(${company.backUser.bUserId})">
                                <div class="comLogo" style="float: left">
                                    <img src="${pageContext.request.contextPath}/uploadLogo${company.backUser.logo}" width="60"
                                         height="60" alt="CCIC"/>
                                </div>
                                <div style="float: right">
                                    <h3 title="CCIC" style="margin: 2px 5px;width: 183px;text-overflow:ellipsis;" align="center"><b>${company.backUser.compName}</b>
                                    </h3>
                                    <a  target="_blank" style="font-size: 13px;color: darkgrey">
                                            ${company.backUser.finanStage}&nbsp;|&nbsp;${company.backUser.city}
                                    </a>
                                </div>
                                <ul class="reset ctags" style="margin-top: 73px;">
                                    <li>${company.backUser.scale}</li>
                                    <li>${company.backUser.product}</li>
                                </ul>
                            </li>
                        </c:forEach>
                    </ul>
                    <div class="Pagination"></div>
                </form>
            </div>
        </div>
    </div>
    <a id="backtop" title="回到顶部" rel="nofollow"></a>
</div>
<div id="paging" style="text-align: center"></div>

<div id="footer">
    <div class="wrapper">
        <a href="h/about.html" target="_blank" rel="nofollow">联系我们</a>
        <a href="h/af/zhaopin.html" target="_blank">互联网公司导航</a>
        <a href="http://e.weibo.com/lagou720" target="_blank" rel="nofollow">钱程微博</a>
        <a class="footer_qr" href="javascript:void(0)" rel="nofollow">钱程微信<i></i></a>
        <div class="copyright">&copy;2013-2014 Lagou <a target="_blank"
            href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action">京ICP备14023790号-2</a>
        </div>
    </div>
</div>
</div><%--  id=body  end  --%>

<script type="text/javascript" src="../style/js/core.min.js"></script>

</body>
</html>
