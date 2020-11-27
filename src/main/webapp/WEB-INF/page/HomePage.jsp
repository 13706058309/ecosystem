<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/11/10
  Time: 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script id="allmobilize" charset="utf-8" src="../style/js/allmo8bilize.min.js"></script>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=g7rHhDj9qFSGZF3qr9ZDOc7xLix7MLDo"></script>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="alternate" media="handheld"/>
    <!-- end 云适配 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>前端首页</title>
    <meta property="qc:admins" content="23635710066417756375"/>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <meta name="baidu-site-verification" content="QIQ6KC1oZ6"/>
    <script type="text/javascript"></script>
    <link rel="Shortcut Icon" href="h/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../style/css/style.css"/>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
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
    <script src="../js/homePage.js"></script>
</head>
<body style="background-color: #f6f6f8">
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<%--切换城市弹窗--%>
<div id="choiceCity" style="display: none">
    <div style="padding: 20px 20px">
        <b style="font-size: 15px">亲爱的用户您好：</b>
        <br/>
        <br/>
        <h4>切换城市分站，让我们为您提供更准确的信息</h4>
        <br/>
        <hr>
        <br/>
        <h4>当前定位：</h4>
        <button type="button" class="layui-btn layui-btn-primary" id="bCity" style="margin: 13px 8px;color: #44D0C7">
            <i class="layui-icon">&#xe715;</i>
            当前城市
        </button>
        <br/>
        点击返回"全国站"或切换到以下城市
        <hr>
        <c:forEach items="${cityList}" var="city">
            <button type="button" class="layui-btn layui-btn-primary" style="margin: 13px 8px;"
                    onmouseover="this.style.backgroundColor='#44D0C7',this.style.color='#fafafa'" ;
                    onmouseout="this.style.backgroundColor='#fafafa',this.style.color='#0e1726'" ;
                    onclick="City(this)">
                    ${city.cityName}
            </button>
        </c:forEach>
    </div>
</div>
<div id="body">
    <div id="header">
        <div class="wrapper">
            <a class="logo">
                <img src="../style/images/logo.png" width="230" height="85"/>
            </a>
            <ul class="reset" id="navheader">
                <li class="current"><a href="${pageContext.request.contextPath}/homePage/home">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/homePage/companylist">公司</a></li>
                <li><a href="${pageContext.request.contextPath}/course/homePage" target="_blank">课程</a></li>
                <li><a href="${pageContext.request.contextPath}/project" target="_blank">项目</a></li>
                <li><a href="${pageContext.request.contextPath}/center/job?findWorkCity=${nowCity}" rel="nofollow">职位</a></li>
                <li><a href="${pageContext.request.contextPath}/zhengshu/cshouye" rel="nofollow">我的证书</a></li>
            </ul>
            <ul class="loginTop" style="font-size: 18px;height: 68px;">
                <c:if test="${qUser==null}">
                    <li><a href="${pageContext.request.contextPath}/golog/login" rel="nofollow">登录</a></li>
                    <li>|</li>
                    <li><a href="${pageContext.request.contextPath}/golog/reg" rel="nofollow">注册</a></li>
                </c:if>
                <c:if test="${qUser!=null}">
                    <div style="margin: 10px 0px 20px 350px">
                        <div style="float: left;margin: 0px -90px;">
                            <div>
                                    ${qUser.userName}
                            </div>
<%--                            <div style="margin: 100px;margin: -40px -50px;">--%>
<%--                                <img src="../style/images/logo.png" width="50px" height="50px"/>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                    <div style="margin: 35px 230px;width: 200px;">
                        <button type="button" class="layui-btn layui-btn-sm layui-btn-radiu layui-btn-primary" style="width: 70px;height: 27px" onclick="window.open('${pageContext.request.contextPath}/center/jianli')">个人中心</button>
                        <button type="button" class="layui-btn layui-btn-sm" style="width: 70px;height: 27px;background-color: #e46a4a">退出</button>
                    </div>
                </c:if>
            </ul>
        </div>
        <div style="float: right" onclick="cutCity()">
            <a id="city" class="layui-icon layui-icon-location" style="font-size: 15px; color: #0C0C0C;"></a>
            <a style="font-size: 15px">[切换城市]</a>
        </div>
    </div><!-- end #header -->

    <%-----------------------------------------------------------------------------------------搜索框--%>

    <div class="content" style="margin-bottom: 20px;margin-left: 23%">
        <div id="search_box">
            <form id="searchForm" method="get">
                <ul id="searchType">
                    <li data-searchtype="1" class="type_selected">职位</li>
                </ul>
                <input type="text" id="search_input" name="kd" tabindex="1" value="" placeholder="请输入职位名称，如：产品经理"/>
                <input type="button" id="search_button" value="搜索" onclick="searchBut()"/>

            </form>
        </div>
    </div>

    <%--------------------------------------------------------------------------------   左侧三级菜单--%>
    <div id="container">
        <div id="sidebar" style="top: 205px">
            <div class="mainNavs" id="hidden">
                <c:forEach items="${industry}" var="industry">
                    <div class="menu_box">
                        <div class="menu_main" onmouseover="menu_box(${industry.industryId},this)">
                            <h2><b>${industry.industryName}<span></span></b></h2>
                        </div>
                        <div class="menu_sub dn">
                            <dl class="reset">
                                <dt id="dt"></dt>
                                <dd></dd>
                            </dl>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="menu_box" id="aShow" STYLE="background-color: #FFFFFF;">
                <div class="menu_main">
                    <a onmouseover="show()" style="color: #44D0C7;margin: 8px 0px;font-size: 15px;">显示全部职位</a>
                </div>
            </div>

        </div>
    </div>

    <%-------------------------------------------------------------------------------轮播图--%>
    <div class="content">
        <script type="text/javascript" src="../style/js/search.min.js"></script>
        <style>
            .ui-menu-item a {
                display: block;
                overflow: hidden;
            }
        </style>
        <div id="home_banner">
            <ul class="banner_bg" style="height: 1020px; margin-top: 0px;">
                <li class="banner_bg_1 current" style="height: 340px" >
                    <a target="_blank"><img src="../style/images/d05a2cc6e6c94bdd80e074eb05e37ebd.jpg" width="646" height="340" /></a>
                </li>
                <li class="banner_bg_2" style="height: 340px" >
                    <a target="_blank"><img src="../style/images/c9d8a0756d1442caa328adcf28a38857.jpg" width="646" height="340" ></a>
                </li>
                <li class="banner_bg_3" style="height: 340px" >
                    <a target="_blank"><img src="../style/images/d03110162390422bb97cebc7fd2ab586.jpg" width="646" height="340" /></a>
                </li>
            </ul>

            <div class="banner_control">
                <em></em>
                <ul class="thumbs">
                    <li class="thumbs_1 current">
                        <i></i>
                        <img src="../style/images/4469b1b83b1f46c7adec255c4b1e4802.jpg" width="113" height="65"/>
                    </li>
                    <li class="thumbs_2">
                        <i></i>
                        <img src="../style/images/381b343557774270a508206b3a725f39.jpg" width="113" height="65"/>
                    </li>
                    <li class="thumbs_3">
                        <i></i>
                        <img src="../style/images/354d445c5fd84f1990b91eb559677eb5.jpg" width="113" height="65"/>
                    </li>
                </ul>
            </div>
        </div><!--/#main_banner-->

        <%-----------------------------------------------------------------------企业小方块--%>

        <ul id="da-thumbs" class="da-thumbs">
            <li>
                <a href="h/c/1650.html" target="_blank">
                    <img src="../style/images/a254b11ecead45bda166afa8aaa9c8bc.jpg" width="113" height="113"
                         alt="联想"/>
                    <div class="hot_info">
                        <h2 title="联想">联想</h2>
                        <em></em>
                        <p title="世界因联想更美好">
                            世界因联想更美好
                        </p>
                    </div>
                </a>
            </li>
            <li>
                <a href="h/c/9725.html" target="_blank">
                    <img src="../style/images/c75654bc2ab141df8218983cfe5c89f9.jpg" width="113" height="113"
                         alt="淘米"/>
                    <div class="hot_info">
                        <h2 title="淘米">淘米</h2>
                        <em></em>
                        <p title="将心注入 追求极致">
                            将心注入 追求极致
                        </p>
                    </div>
                </a>
            </li>
            <li>
                <a href="h/c/1914.html" target="_blank">
                    <img src="../style/images/2bba2b71d0b0443eaea1774f7ee17c9f.png" width="113" height="113"
                         alt="优酷土豆"/>
                    <div class="hot_info">
                        <h2 title="优酷土豆">优酷土豆</h2>
                        <em></em>
                        <p title="专注于视频领域，是中国网络视频行业领军企业">
                            专注于视频领域，是中国网络视频行业领军企业
                        </p>
                    </div>
                </a>
            </li>
            <li>
                <a href="h/c/6630.html" target="_blank">
                    <img src="../style/images/f4822a445a8b495ebad81fcfad3e40e2.jpg" width="113" height="113"
                         alt="思特沃克"/>
                    <div class="hot_info">
                        <h2 title="思特沃克">思特沃克</h2>
                        <em></em>
                        <p title="一家全球信息技术服务公司">
                            一家全球信息技术服务公司
                        </p>
                    </div>
                </a>
            </li>
            <li>
                <a href="h/c/2700.html" target="_blank">
                    <img src="../style/images/5caf8f9631114bf990f87bb11360653e.png" width="113" height="113"
                         alt="奇猫"/>
                    <div class="hot_info">
                        <h2 title="奇猫">奇猫</h2>
                        <em></em>
                        <p title="专注于移动互联网、互联网产品研发">
                            专注于移动互联网、互联网产品研发
                        </p>
                    </div>
                </a>
            </li>
            <li class="last">
                <a href="h/c/1335.html" target="_blank">
                    <img src="../style/images/c0052c69ef4546c3b7d08366d0744974.jpg" width="113" height="113"
                         alt="堆糖网"/>
                    <div class="hot_info">
                        <h2 title="堆糖网">堆糖网</h2>
                        <em></em>
                        <p title="分享收集生活中的美好，遇见世界上的另外一个你">
                            分享收集生活中的美好，遇见世界上的另外一个你
                        </p>
                    </div>
                </a>
            </li>
        </ul>
    </div>
</div>

<%------------------------------------------------------------------热门职业、最新职业-------------%>
<div id="hotList" align="center">
    <ul class="hc_list reset" style="width: 87%;margin: 0px 45px;margin-left: 10%;">
        <div style="font-size: 30px;color:#dddfe4;margin: 45px;font-family: 楷体">
            ——&nbsp;&nbsp;<b style="color: #414a60">最新职位</b>&nbsp;&nbsp;——
        </div>
        <c:forEach items="${postList}" var="post">
            <li style="margin: 8px 15px;width: 280px;height: 120px" onclick="post(${post.pPostId})">
                <div style="float: left">
                    <div class="comLogo" style="font-size: 18px">
                            ${post.postName}
                    </div>
                    <div>
                        <a target="_blank" style="font-size: 13px;color: darkgrey">
                                ${post.workCity}&nbsp;|&nbsp;${post.workYear}|&nbsp;${post.education}
                        </a>
                    </div>
                </div>
                <div style="float: right;color: #fd7240;font-size: 16px" align="center">
                    ${post.minSalary}K&nbsp;-&nbsp; ${post.maxSalary}K
                </div>
                <ul class="reset ctags" style="margin-top: 73px;">
                    <div style="float: left">
                        <img src="${pageContext.request.contextPath}/uploadLogo${post.backUser.logo}" width="40"
                             height="39" alt="CCIC"/>
                    </div>
                    <div style="float: right" align="center">
                            ${post.backUser.finanStage}&nbsp;|&nbsp;${post.backUser.scale}
                    </div>
                </ul>
            </li>
        </c:forEach>
    </ul>
    <div>
        <button type="button" class="layui-btn layui-btn-primary"
                style="width: 240px;margin-top: 25px;margin-bottom: 35px;background-color: #44d0c7;font-size: 16px;color: white;"
                onclick="window.open('${pageContext.request.contextPath}/center/job?findWorkCity=${nowCity}')">
            查看更多
        </button>
    </div>
</div>

<%-----------------------------------------------------------------------------热门企业--------------%>
<div id="hotList" align="center">
    <ul class="hc_list reset" style="width: 100%;margin: 0px 22px">
        <div style="font-size: 30px;color: #dddfe4;margin: 45px;font-family: 楷体">
            ——&nbsp;&nbsp;<b style="color: #414a60">热门企业</b>&nbsp;&nbsp;——
        </div>
        <c:forEach items="${homeCompany}" var="hc">
            <li style="margin: 3px 5px;width: 264px;height: 120px" onclick="compName(${hc.bUserId})">
                <div class="comLogo" style="float: left">
                    <img src="${pageContext.request.contextPath}/uploadLogo${hc.logo}" width="60"
                         height="60" alt="CCIC"/>
                </div>
                <div style="float: right">
                    <h3 title="CCIC" style="margin: 2px 5px;width: 183px;text-overflow:ellipsis;" align="center">
                        <b>${hc.compName}</b>
                    </h3>
                    <a  target="_blank" style="font-size: 13px;color: darkgrey">
                            ${hc.finanStage}&nbsp;|&nbsp;${hc.city}
                    </a>
                </div>
                <ul class="reset ctags" style="margin-top: 73px;">
                    <li>${hc.scale}</li>
                    <li>${hc.product}</li>
                </ul>
            </li>
        </c:forEach>
    </ul>
    <div>
        <button type="button" class="layui-btn layui-btn-primary"
                style="width: 240px;margin-top: 25px;margin-bottom: 35px;background-color: #44d0c7;font-size: 16px;color: white;"
                onclick="window.open('${pageContext.request.contextPath}/homePage/companylist')">
            查看更多
        </button>
    </div>
</div>


<%------------------------------------------------------------------------------------友情连接--%>
<div id="linkbox">
    <dl style="margin-left: 25%">
        <dt>友情链接</dt>
        <dd>
            <a href="http://lieyunwang.com/" target="_blank">猎云网</a> <span>|</span>
            <a href="http://www.chuanke.com/" target="_blank">传课网</a> <span>|</span>
            <a href="http://se.360.cn/" target="_blank">360安全浏览器</a> <span>|</span>
            <a href="http://www.zhongchou.cn" target="_blank">众筹网</a><span>|</span>
            <a href="http://www.zhubajie.com/" target="_blank">创意服务外包</a><span>|</span>
            <a href="http://www.thinkphp.cn/" target="_blank">thinkphp</a><span>|</span>
            <a href="http://www.meitu.com/" target="_blank">美图公司</a><span>|</span>
            <a href="http://iwebad.com/" target="_blank">网络广告人社区</a>
            <a href="h/af/flink.html" target="_blank" class="more">更多</a>
        </dd>
    </dl>
</div>
</div>
<input type="hidden" value="" name="userid" id="userid"/>

<!-------------------------------------弹窗lightbox  ----------------------------------------->
<div style="display:none;">
    <!-- 登录框 -->
    <div id="loginPop" class="popup" style="height:240px;">
        <form id="loginForm">
            <input type="text" id="email" name="email" tabindex="1" placeholder="请输入登录邮箱地址"/>
            <input type="password" id="password" name="password" tabindex="2" placeholder="请输入密码"/>
            <span class="error" style="display:none;" id="beError"></span>
            <label class="fl" for="remember"><input type="checkbox" id="remember" value="" checked="checked"
                                                    name="autoLogin"/> 记住我</label>
            <a href="h/reset.html" class="fr">忘记密码？</a>
            <input type="submit" id="submitLogin" value="登 &nbsp; &nbsp; 录"/>
        </form>
        <div class="login_right">
            <div>还没有钱程帐号？</div>
            <a href="register.html" class="registor_now">立即注册</a>
            <div class="login_others">使用以下帐号直接登录:</div>
            <a href="h/ologin/auth/sina.html" target="_blank" id="icon_wb" class="icon_wb"
               title="使用新浪微博帐号登录"></a>
            <a href="h/ologin/auth/qq.html" class="icon_qq" id="icon_qq" target="_blank" title="使用腾讯QQ帐号登录"></a>
        </div>
    </div><!--/#loginPop-->
</div>
<!------------------------------------- end ----------------------------------------->
<script type="text/javascript" src="../style/js/Chart.min.js"></script>
<script type="text/javascript" src="../style/js/home.min.js"></script>
<script type="text/javascript" src="../style/js/count.js"></script>
<div class="clear"></div>
<input type="hidden" id="resubmitToken" value=""/>
<a id="backtop" title="回到顶部" rel="nofollow"></a>
</div><!-- end #container -->
</div><!-- end #body -->


<script type="text/javascript" src="../style/js/core.min.js"></script>
<script type="text/javascript" src="../style/js/popup.min.js"></script>
<script>
    var flag = "";
    <%
        String flag = (String) request.getAttribute("flag");
        if(flag!=null){
            out.write("flag='"+flag.trim()+"'");
            request.removeAttribute("flag");
        }

    %>
    $(function () {
        if(flag.length==0){
            var position = new BMap.Geolocation();
            position.getCurrentPosition(function (r) {
//    判断定位是否成功
                if (this.getStatus() == BMAP_STATUS_SUCCESS) {
                    //    获取经度，维度，省份
                    lat = r.positionLat;
                    lng = r.positionLng;
                    city = r.address.city;
                    $("#city").text(city);
                    $("#bCity").text(city);
                    location.href="homes?city="+$("#city").text();
                }
            });
        }else{
            $("#city").text(flag);
            $("#bCity").text(flag);
        }
    })
</script>
</body>
</html>
