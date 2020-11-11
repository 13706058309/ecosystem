<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/11/11
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script id="allmobilize" charset="utf-8" src="../style/js/allmobilize.min.js"></script>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="alternate" media="handheld"/>
    <!-- end 云适配 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>首页</title>
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
<body>
<div id="body">
    <div id="header">
        <div class="wrapper">
            <a class="logo">
                <img src="../style/images/logo.png" width="350" height="130" alt="钱程无忧-关注你的钱程"/>
            </a>
            <ul class="reset" id="navheader">
                <li class="current"><a href="${pageContext.request.contextPath}/homePage/home">首页</a></li>
                <li><a href="">公司</a></li>
                <li><a href="" target="_blank">校招</a></li>
                <li><a href="" target="_blank">课程</a></li>
                <li><a href="" rel="nofollow">我的简历</a></li>
                <li><a href="" rel="nofollow">发布职位</a></li>
            </ul>
            <ul class="loginTop">
                <li><a href="${pageContext.request.contextPath}/golog/login" rel="nofollow">登录</a></li>
                <li>|</li>
                <li><a href="${pageContext.request.contextPath}/golog/reg" rel="nofollow">注册</a></li>
            </ul>
        </div>
    </div>
    <!-- end #header   class="current 不同的板块加上，比如公司或者论坛 -->



<%--添加你们那body的代码  上面头、下面尾--%>



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
</body>
</html>
