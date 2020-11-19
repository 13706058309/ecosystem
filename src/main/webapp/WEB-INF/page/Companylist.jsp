
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
    <script id="allmobilize" charset="utf-8" src="../style/js/allmobilize.min.js"></script>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="alternate" media="handheld"/>
    <!-- end 云适配 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>公司主页</title>
    <meta property="qc:admins" content="23635710066417756375"/>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <meta name="baidu-site-verification" content="QIQ6KC1oZ6"/>

    <script type="text/javascript">
        var ctx = "h";
        console.log(1);
    </script>
    <link rel="Shortcut Icon" href="h/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../style/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="../style/css/external.min.css"/>
    <link rel="stylesheet" type="text/css" href="../style/css/popup.css"/>
    <script src="../style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../style/js/jquery.lib.min.js"></script>
    <script src="../style/js/ajaxfileupload.js" type="text/javascript"></script>
    <script type="text/javascript" src="../style/js/additional-methods.js"></script>
    <!--[if lte IE 8]>
    <script type="text/javascript" src="../style/js/excanvas.js"></script>
    <![endif]-->
    <script type="text/javascript"></script>
    <script type="text/javascript" src="../style/js/conv.js"></script>
</head>
<body style="background-color: #f6f6f8">
<div id="body">
    <div id="header">
        <div class="wrapper">
            <a class="logo">
                <img src="../style/images/logo.png" width="200" height="80" alt="钱程无忧-关注你的钱程"/>
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
                <form id="companyListForm" name="companyListForm" method="get" action="h/c/companylist.html">
                    <dl class="hc_tag">
                        <dd>
                            <dl>
                                <dt>公司地点：</dt>
                                <c:forEach items="${cityList}" var="city">
                                    <dd>
                                        <a href="javascript:void(0)">${city.cityName}</a>
                                    </dd>
                                </c:forEach>
                            </dl>
                            <dl>
                                <dt>行业类型：</dt>
                                <dd>
                                    <a href="javascript:void(0)">技术</a>
                                    <a href="javascript:void(0)">设计</a>
                                    <a href="javascript:void(0)">销售</a>
                                    <a href="javascript:void(0)">传媒</a>
                                    <a href="javascript:void(0)">金融</a>
                                    <a href="javascript:void(0)">教育培训</a>
                                    <a href="javascript:void(0)">医疗健康</a>
                                    <a href="javascript:void(0)">生产制造</a>
                                    <a href="javascript:void(0)">产品/运营/市场</a>
                                    <a href="javascript:void(0)">人事/财务/行政</a>
                                    <a href="javascript:void(0)">采购/贸易</a>
                                    <a href="javascript:void(0)">供应链/物流</a>
                                    <a href="javascript:void(0)">房地产/建筑</a>
                                    <a href="javascript:void(0)">咨询/翻译/法律</a>
                                    <a href="javascript:void(0)">旅游/服务业</a>
                                </dd>
                            </dl>
                            <dl>
                                <dt>融资阶段：</dt>
                                <dd>
                                    <a href="javascript:void(0)">不限</a>
                                    <a href="javascript:void(0)">未融资</a>
                                    <a href="javascript:void(0)">天使轮</a>
                                    <a href="javascript:void(0)">A轮</a>
                                    <a href="javascript:void(0)">B轮</a>
                                    <a href="javascript:void(0)">C轮</a>
                                    <a href="javascript:void(0)">D轮及以上</a>
                                    <a href="javascript:void(0)">以上市</a>
                                    <a href="javascript:void(0)">不需要融资</a>
                                </dd>
                            </dl>
                            <dl>
                                <dt>公司规模：</dt>
                                <dd>
                                    <a href="javascript:void(0)">不限</a>
                                    <a href="javascript:void(0)">0-20人</a>
                                    <a href="javascript:void(0)">20-99人</a>
                                    <a href="javascript:void(0)">100-499人</a>
                                    <a href="javascript:void(0)">500-999人</a>
                                    <a href="javascript:void(0)">1000-9999人</a>
                                    <a href="javascript:void(0)">10000人以上</a>
                                </dd>
                            </dl>
                        </dd>
                    </dl>
                    <div style="font-size: 18px;color: #44D0C7;font-family: 华文新魏;margin: 18px 30px" align="right">
                        共&nbsp;xx&nbsp;家公司
                    </div>
                    <ul class="hc_list reset" style="width: 100%">
                        <c:forEach items="${backUserList}" var="company">
                            <li style="clear:both;margin: 3px 20px;width: 284px;height: 120px">
                                <div class="comLogo" style="float: left">
                                    <img src="${pageContext.request.contextPath}/uploadLogo/${company.logo}" width="60" height="60" alt="CCIC"/>
                                </div>
                                <div style="float: right">
                                    <h3 title="CCIC" style="margin: 2px 5px" align="center"><b>CCIC</b></h3>
                                    <a href="h/jobs/148928.html" target="_blank"
                                       style="font-size: 13px;color: darkgrey">
                                        ${company.finanStage}&nbsp;|&nbsp;${company.city}
                                    </a>
                                </div>
                                <ul class="reset ctags" style="margin-top: 73px;">
                                    <li>${company.scale}</li>
                                    <li>${company.product}</li>
                                </ul>
                            </li>
                        </c:forEach>
                    </ul>

                    <div class="Pagination"></div>
                </form>
            </div>
        </div>
    </div>

    <input type="hidden" value="" name="userid" id="userid"/>

    <script type="text/javascript" src="../style/js/company_list.min.js"></script>
    <script>
        $(function () {
            /*分页 */
            $('.Pagination').pager({
                currPage: 1,
                pageNOName: "pn",
                form: "companyListForm",
                pageCount: 20,
                pageSize: 5
            });
        })
    </script>
    <div class="clear"></div>
    <input type="hidden" id="resubmitToken" value=""/>
    <a id="backtop" title="回到顶部" rel="nofollow"></a>
</div><!-- end #container -->
</div><!-- end #body -->
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
<script type="text/javascript" src="../style/js/popup.min.js"></script>

<!--  -->

</body>
</html>
