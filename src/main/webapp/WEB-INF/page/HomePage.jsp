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
<body>
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
                    onmouseover="this.style.backgroundColor='#44D0C7',this.style.color='#fafafa'";
                    onmouseout="this.style.backgroundColor='#fafafa',this.style.color='#0e1726'";
                    onclick="City(this)" >
                    ${city.cityName}
            </button>
        </c:forEach>
    </div>
</div>
<div id="body">
    <div id="header">
        <div class="wrapper">
            <a class="logo">
                <img src="../style/images/logo.png" width="230" height="85" alt="钱程无忧-关注你的钱程"/>
            </a>
            <ul class="reset" id="navheader">
                <li class="current"><a href="${pageContext.request.contextPath}/homePage/home">首页</a></li>
                <li><a href="">公司</a></li>
                <li><a href="" target="_blank">校招</a></li>
                <li><a href="" target="_blank">课程</a></li>
                <li><a href="${pageContext.request.contextPath}/center/jianli"  rel="nofollow">我的简历</a></li>
                <li><a href="" rel="nofollow">发布职位</a></li>
                <li><a href="${pageContext.request.contextPath}/homePage/companylist">公司</a></li>
                <li><a href="h/toForum.html" target="_blank">校招</a></li>
                <li><a href="h/toForum.html" target="_blank">课程</a></li>
                <li><a href="jianli.html" rel="nofollow">我的简历</a></li>
                <li><a href="create.html" rel="nofollow">发布职位</a></li>
            </ul>
            <ul class="loginTop" style="font-size: 18px">
                <li><a href="${pageContext.request.contextPath}/golog/login" rel="nofollow">登录</a></li>
                <li>|</li>
                <li><a href="${pageContext.request.contextPath}/golog/reg" rel="nofollow">注册</a></li>
            </ul>
        </div>
        <div style="float: right" onclick="cutCity()">
            <a id="city" class="layui-icon layui-icon-location" style="font-size: 15px; color: #0C0C0C;"></a>
            <a style="font-size: 15px" >[切换城市]</a>
        </div>
    </div><!-- end #header -->

    <%-----------------------------------------------------------------------------------------搜索框--%>
    <div id="search_box">
        <form id="searchForm" name="searchForm" action="list.html" method="get">
            <ul id="searchType">
                <li data-searchtype="1" class="type_selected">职位</li>
                <li data-searchtype="4">公司</li>
            </ul>
            <div class="searchtype_arrow"></div>
            <input type="text" id="search_input" name="kd" tabindex="1" value="" placeholder="请输入职位名称，如：产品经理"/>
            <input type="submit" id="search_button" value="搜索"/>
        </form>
    </div>

    <script type="text/javascript" src="../style/js/search.min.js"></script>
    <dl class="hotSearch">
        <dt>热门搜索：</dt>
        <dd><a href="list.htmlJava?labelWords=label&city=">Java</a></dd>
        <dd><a href="list.htmlPHP?labelWords=label&city=">PHP</a></dd>
        <dd><a href="list.htmlAndroid?labelWords=label&city=">Android</a></dd>
        <dd><a href="list.htmliOS?labelWords=label&city=">iOS</a></dd>
        <dd><a href="list.html前端?labelWords=label&city=">前端</a></dd>
        <dd><a href="list.html产品经理?labelWords=label&city=">产品经理</a></dd>
        <dd><a href="list.htmlUI?labelWords=label&city=">UI</a></dd>
        <dd><a href="list.html运营?labelWords=label&city=">运营</a></dd>
        <dd><a href="list.htmlBD?labelWords=label&city=">BD</a></dd>
        <dd><a href="list.html?gx=实习&city=">实习</a></dd>
    </dl>

    <%--------------------------------------------------------------------------------   左侧三级菜单--%>
    <div id="container">
        <div id="sidebar" style="top: 240px">

            <div class="mainNavs">
                <c:forEach items="${industry}" var="industry">
                    <div class="menu_box" >
                        <div class="menu_main" onmouseover="menu_box(${industry.industryId})">
                            <h2>${industry.industryName}<span></span></h2 >
                            <a href="h/jobs/list_Java?labelWords=label">Java</a>
                            <a href="h/jobs/list_PHP?labelWords=label">PHP</a>
                            <a href="h/jobs/list_C?labelWords=label">C</a>
                        </div>
                        <div class="menu_sub dn">
                            <dl class="reset">
                                <dt id="dt">
                                    <a>
                                        dfghj
                                    </a>

                                </dt>
                                <dd>
                                    <a href="h/jobs/list_Java?labelWords=label" class="curr">
                                        esrtyt6y7ui
                                    </a>
                                </dd>
                            </dl>
                        </div>
                    </div>
                </c:forEach>
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
            <ul class="banner_bg">
                <li class="banner_bg_1 current">
                    <a href="h/subject/s_buyfundation.html?utm_source=DH__lagou&utm_medium=banner&utm_campaign=haomai"
                       target="_blank"><img src="../style/images/d05a2cc6e6c94bdd80e074eb05e37ebd.jpg" width="646"
                                            height="160" alt="好买基金——来了就给100万"/></a>
                </li>
                <li class="banner_bg_2">
                    <a href="h/subject/s_worldcup.html?utm_source=DH__lagou&utm_medium=home&utm_campaign=wc"
                       target="_blank"><img src="../style/images/c9d8a0756d1442caa328adcf28a38857.jpg" width="646"
                                            height="160" alt="世界杯放假看球，老板我也要！"/></a>
                </li>
                <li class="banner_bg_3">
                    <a href="h/subject/s_xiamen.html?utm_source=DH__lagou&utm_medium=home&utm_campaign=xiamen"
                       target="_blank"><img src="../style/images/d03110162390422bb97cebc7fd2ab586.jpg" width="646"
                                            height="160" alt="出北京记——第一站厦门"/></a>
                </li>
                <li class="banner_bg_4">
                    <a href="h/subject/s_xiamen.html?utm_source=DH__lagou&utm_medium=home&utm_campaign=xiamen"
                       target="_blank"><img src="../style/images/d03110162390422bb97cebc7fd2ab586.jpg" width="646"
                                            height="160" alt="出北京记——第一站厦门"/></a>
                </li>
                <li class="banner_bg_4">
                    <a href="h/subject/s_xiamen.html?utm_source=DH__lagou&utm_medium=home&utm_campaign=xiamen"
                       target="_blank"><img src="../style/images/d03110162390422bb97cebc7fd2ab586.jpg" width="646"
                                            height="160" alt="出北京记——第一站厦门"/></a>
                </li>
            </ul>
            <%-----------------------------------------------------------------------企业小方块--%>
            <div class="banner_control">
                <em></em>
                <ul class="thumbs">
                    <li class="thumbs_1 current">
                        <i></i>
                        <img src="../style/images/4469b1b83b1f46c7adec255c4b1e4802.jpg" width="113" height="42"/>
                    </li>
                    <li class="thumbs_2">
                        <i></i>
                        <img src="../style/images/381b343557774270a508206b3a725f39.jpg" width="113" height="42"/>
                    </li>
                    <li class="thumbs_3">
                        <i></i>
                        <img src="../style/images/354d445c5fd84f1990b91eb559677eb5.jpg" width="113" height="42"/>
                    </li>
                    <li class="thumbs_3">
                        <i></i>
                        <img src="../style/images/354d445c5fd84f1990b91eb559677eb5.jpg" width="113" height="42"/>
                    </li>
                </ul>
            </div>
        </div><!--/#main_banner-->

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

<%----------------------------------------------------------------------------热门职业、最新职业--%>
<div id="hotList" align="center">
    <ul class="hot_pos reset">
        <div style="font-size: 25px;color:#44D0C7">——热门企业——</div>
        <li class="clearfix">
            <div class="hot_pos_l">
                <div class="mb10">
                    <a href="h/jobs/147822.html" target="_blank">运营总监</a>
                    &nbsp;
                    <span class="c9">[北京]</span>
                </div>
                <span><em class="c7">月薪： </em>15k-20k</span>
                <span><em class="c7">经验：</em> 3-5年</span>
                <span><em class="c7">最低学历： </em>本科</span>
                <br/>
                <span><em class="c7">职位诱惑：</em>发展前景</span>
                <br/>
                <span>1天前发布</span>
                <!-- <a  class="wb">分享到微博</a> -->
            </div>
            <div class="hot_pos_r">
                <div class="mb10 recompany"><a href="h/c/399.html" target="_blank">节操精选</a></div>
                <span><em class="c7">领域：</em> 移动互联网</span>
                <span><em class="c7">创始人：</em>陈桦</span>
                <br/>
                <span><em class="c7">阶段：</em> 初创型(天使轮)</span>
                <span><em class="c7">规模：</em>少于15人</span>
                <ul class="companyTags reset">
                    <li>移动互联网</li>
                    <li>五险一金</li>
                    <li>扁平管理</li>
                </ul>
            </div>
        </li>
        <li class="odd clearfix">
            <div class="hot_pos_l">
                <div class="mb10">
                    <a href="h/jobs/148429.html" target="_blank">葡萄酒内容运营专员</a>
                    &nbsp;
                    <span class="c9">[广州]</span>
                </div>
                <span><em class="c7">月薪： </em>5k-8k</span>
                <span><em class="c7">经验：</em> 1-3年</span>
                <span><em class="c7">最低学历： </em>本科</span>
                <br/>
                <span><em class="c7">职位诱惑：</em>喝着世界美酒快乐地工作！</span>
                <br/>
                <span>1天前发布</span>
                <!-- <a  class="wb">分享到微博</a> -->
            </div>
            <div class="hot_pos_r">
                <div class="mb10 recompany"><a href="h/c/4474.html" target="_blank">酒咔嚓</a></div>
                <span><em class="c7">领域：</em> 移动互联网,生活服务</span>
                <br/>
                <span><em class="c7">阶段：</em> 初创型(天使轮)</span>
                <span><em class="c7">规模：</em>15-50人</span>
                <ul class="companyTags reset">
                    <li>五险一金</li>
                    <li>股票期权</li>
                    <li>带薪年假</li>
                </ul>
            </div>
        </li>
        <li class="clearfix">
            <div class="hot_pos_l">
                <div class="mb10">
                    <a href="h/jobs/1221.html" target="_blank">百度移动游戏UI designer</a>
                    &nbsp;
                    <span class="c9">[北京]</span>
                </div>
                <span><em class="c7">月薪： </em>7k-14k</span>
                <span><em class="c7">经验：</em> 1-3年</span>
                <span><em class="c7">最低学历： </em>本科</span>
                <br/>
                <span><em class="c7">职位诱惑：</em>喜欢游戏，喜欢生活，游戏生活~</span>
                <br/>
                <span>1天前发布</span>
                <!-- <a  class="wb">分享到微博</a> -->
            </div>
            <div class="hot_pos_r">
                <div class="mb10 recompany"><a href="h/c/323.html" target="_blank">百度移动游戏</a></div>
                <span><em class="c7">领域：</em> 移动互联网</span>
                <span><em class="c7">创始人：</em>李彦宏</span>
                <br/>
                <span><em class="c7">阶段：</em> 上市公司</span>
                <span><em class="c7">规模：</em>2000人以上</span>
                <ul class="companyTags reset">
                    <li>年终分红</li>
                    <li>绩效奖金</li>
                    <li>股票期权</li>
                </ul>
            </div>
        </li>
        <a href="list.html?city=%E5%85%A8%E5%9B%BD" class="btn fr" target="_blank">查看更多</a>
    </ul>
</div>
<div class="clear"></div>


<%------------------------------------------------------------------------------------友情连接--%>
<div id="linkbox">
    <dl>
        <dt>友情链接</dt>
        <dd>
            <a href="http://www.zhuqu.com/" target="_blank">住趣家居网</a> <span>|</span>
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

</body>
</html>
