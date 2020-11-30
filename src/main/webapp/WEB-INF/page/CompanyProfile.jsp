<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/11/24
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>${backUser.compName}</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="https://static.zhipin.com/zhipin-geek/v334/web/geek/css/main.css" type="text/css" rel="stylesheet">
    <meta name="applicable-device" content="pc">
    <script type="text/javascript"
            src="https://webapi.amap.com/maps?v=1.4.15&key=7c1d325554fabccbfb414e1ec058cf40&plugin=AMap.Autocomplete"></script>
    <script type="text/javascript"
            src="https://webapi.amap.com/maps?v=1.4.15&key=85f285069a023533ccfb926369538910&plugin=AMap.Geocoder"></script>
    <script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
    <style type="text/css">.amap-container {
        cursor: url(https://webapi.amap.com/theme/v1.3/openhand.cur), default;
    }
    </style>
</head>
<body class="page-white">

<div id="wrap">
    <%--    <script>--%>
    <%--        var staticPath = 'https://static.zhipin.com/v2';--%>
    <%--        _PAGE = {--%>
    <%--            checkMobileUrl: "/registe/sendSms.json",--%>
    <%--            regMobileUrl: "/registe/save.json",--%>
    <%--            loginMobileUrl: "/login/phone.json",--%>
    <%--            loginAccountUrl: "/login/account.json",--%>
    <%--            getRandomKeyUrl: "/captcha/randkey.json",--%>
    <%--            verifyImgUrl: "/captcha/?randomKey={randomKey}",--%>
    <%--            getPositionUrl: "/user/position.json",--%>
    <%--            citySiteName: "全国站",--%>
    <%--            citySiteCode: "100010000",--%>
    <%--            skillsUrl: "/common/data/positionSkill"--%>
    <%--        }--%>
    <%--    </script>--%>
    <div id="header" style="background-color: #00c2b3;height: 95px">
        <div class="inner home-inner">
            <div class="logo" style="width: 150px;height: 70px">
                <a ka="header-home-logo" title="钱程无忧"
                   style="background: url(${pageContext.request.contextPath}/imgs/logo12.jpg) 3px 7px no-repeat;background-size:150px 70px;width: 150px;height: 70px"><span>钱程无忧</span></a>
            </div>
            <div class="nav" style="margin-top: 45px">
                <ul>
                    <li class=""><a ka="header-home" href="${pageContext.request.contextPath}/homePage/home">首页</a></li>
                    <li class=""><a ka="header-job" href="${pageContext.request.contextPath}/center/job">职位</a></li>
                    <li class=""><a class="nav-school" ka="header-school"
                                    href="${pageContext.request.contextPath}/homePage/companylist">公司</a></li>
                    <%--                    <li class=""><a ka="header_brand" href="https://www.zhipin.com/gongsi/">校招</a></li>--%>
                    <li><a href="${pageContext.request.contextPath}/project" target="_blank">项目</a></li>
                    <li class=""><a ka="header-app" href="${pageContext.request.contextPath}/course/homePage">课程</a>
                    </li>
                    <li class=""><a ka="header-article"
                                    href="${pageContext.request.contextPath}/zhengshu/cshouye">证书</a></li>
                </ul>
            </div>

            <div class="user-nav" style="margin-top: 20px">
                <c:if test="${empty qUser}">
                    <div class="btns" style="margin-top: 10%">
                        <a href="${pageContext.request.contextPath}/golog/reg" ka="header-register"
                           class="btn btn-outline">注册</a>
                        <a href="${pageContext.request.contextPath}/golog/login" class="btn btn-outline">登录</a>
                    </div>
                </c:if>
                <c:if test="${not empty qUser}">
                    <ul>
                        <li class="nav-figure">
                            <a>
                                <span class="label-text">${qUser.userName}</span><img
                                    src="${pageContext.request.contextPath}${qUser.headImgUrl}" alt=""/>
                            </a>
                            <div class="dropdown">
                                <a href="${pageContext.request.contextPath}/center/jianli"
                                   ka="header-personal">个人中心<span>编辑简历</span></a>
                                <a href="${pageContext.request.contextPath}/center/accountSet"
                                   ka="account_manage">账号设置<span>重置密码|更换手机号|隐私设置|修改用户名</span></a>
                                <a href="${pageContext.request.contextPath}/homePage/quitAccount?city=${workCity}"
                                   ka="header-logout">退出登录</a>
                            </div>
                        </li>
                    </ul>
                </c:if>
            </div>
        </div>
    </div>
    <div class="company-banner" style="background-color: #ffffff">
        <div class="inner home-inner">
            <div>
                <div class="company-stat" style="color: #00c7b1">
                    <em class="vline"></em><span><b style="color: #00c7b1">${size}</b>在招职位</span>
                </div>
                <div class="info-primary">
                    <img src="${pageContext.request.contextPath}/uploadLogo${backUser.logo}" class="fl">
                    <div class="info">
                        <h1 class="name" style="color: #00c7b1">${backUser.compName}<i class="icon-brand"></i></h1>
                        <p style="color: #00c7b1">${backUser.finanStage}<em class="dolt"></em>${backUser.scale}<em class="dolt"></em>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="job-box" style="width: 1250px ;margin: 0 auto">
        <div class="inner home-inner" style="float: left;margin-left: 4%;width: 870px">
            <div class="job-detail" style="width: 870px">
                <div class="detail-content">
                    <div class="job-sec">
                        <h3>${backUser.compName}简介</h3>
                        <div class="text fold-text">
                            ${backUser.infoIntr}
                            <a href="javascript:;" class="more-view" ka="company-intro-more" style="display: inline;">展开<i
                                    class="fz fz-slidedown"></i></a>
                        </div>
                    </div>
                    <div class="job-sec company-products">
                        <h3>产品介绍</h3>
                        <div class="text fold-text">
                            ${backUser.product}
                        </div>
                    </div>
                    <div class="job-sec">
                        <h3>公司地址</h3>
                        <div class="text fold-text">
                            ${backUser.address}
                        </div>
                        <input type="hidden" id="lat" value="${backUser.lat}">
                        <input type="hidden" id="lng" value="${backUser.lng}">
                        <div id="container" style="height: 300px">

                        </div>
                    </div>
                    <div class="job-sec company-job company-desc">
                        <h3>在招职位</h3>
                        <div class="job-list">
                            <ul>
                                <c:forEach items="${postPositions}" var="pps">
                                    <li  onclick="window.open('${pageContext.request.contextPath}/center/postInfo?lid=${pps.pPostId}')">
                                        <div data-lid="${pps.pPostId}" data-jid="5c76e78924d36df41nN40927F1I~"
                                             ka="comp_desc_joblist_7">
                                            <div class="job-primary">
                                                <div class="info-primary">
                                                    <h3 class="name">
                                                        <div class="title-box">
                                                            <a target="_blank" class="job-title">${pps.postName}</a>
                                                            <span class="job-area">[${pps.workCity}]</span>
                                                            <span class="job-pub-time"></span>
                                                        </div>
                                                        <div class="info-detail"></div>
                                                    </h3>
                                                    <p>
                                                        <span class="red">${pps.minSalary}-${pps.maxSalary}K</span>
                                                            ${pps.workYear}<em class="vline"></em>${pps.education}
                                                    </p>
                                                </div>
                                                <div class="info-publis">
                                                 <span class="name">
                                                           需${pps.recruitsNum}<em class="vline"></em>${pps.releaseTime}
                                                  </span>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${not empty qUser}">
                                            <div class="startchat-box">
                                                <a ka="job-7-chat" href="javascript:;" class="btn btn-startchat"
                                                   onclick="window.open('${pageContext.request.contextPath}/rec/userChat?compID=${backUser.bUserId}')">
                                                    立即沟通</a>
                                            </div>
                                        </c:if>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="float: right">
            <div>
                公司高管：
                <br>啦啦啦
            </div>

        </div>
    </div>
</div>

<div class="links links-friends" style="height: 27px;">
    <dl class="links-item">
        <dt>友情链接：</dt>
        <dd>
            <a href="http://www.3158.cn/zt/zhaorufeijm/" target="_blank" ka="friendly-link-1">赵汝飞练字官网</a>
            <a href="https://www.kanzhun.com/gsm11514.html" target="_blank" ka="friendly-link-2">百度面试</a>
            <a href="https://www.kanzhun.com/gsx11514.html" target="_blank" ka="friendly-link-3">百度工资</a>
            <a href="https://www.51credit.com/Banks/ZhaDa.shtml" target="_blank" ka="friendly-link-4">渣打银行信用卡中心</a>
            <a href="http://www.trjcn.com/lp/69927.html" target="_blank" ka="friendly-link-5">国家平台项目</a>
            <a href="https://www.liketalk.com/baike/tuofu/" target="_blank" ka="friendly-link-6">托福</a>
            <a href="https://www.tiebaobei.com/ue/wendingtubanhezhan/haizhoumachinery-qinghai/" target="_blank"
               ka="friendly-link-7">青海海州稳定土拌合站</a>
            <a href="https://www.kanzhun.com/gsr11514.html" target="_blank" ka="friendly-link-8">百度怎么样</a>
            <a href="http://www.kanzhun.com/gso11363.html" target="_blank" ka="company_link_seo1">瑞杰科技</a>
            <a href="http://www.kanzhun.com/gso2080138.html" target="_blank" ka="company_link_seo2">好丽友it部门</a>
        </dd>
    </dl>
    <label><span>展开</span><i class="fz fz-slidedown"></i></label>
    <input id="user" value="${qUser}" type="hidden">
</div>


<script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js"></script>
<script src="https://static.zhipin.com/zhipin-geek/v334/web/geek/js/main.js"></script>
<iframe style="display: none;" name="zhipinFrame"></iframe>
<%--<script src="https://webapi.amap.com/maps?v=1.3&amp;key=60085a6ee91616cf689ce0321e1f30c4&amp;plugin=AMap.Geocoder"></script>--%>
<input type="hidden" id="page_key_name" value="cpc_company_intro">
<script>

    $(function () {
        var lng = $("#lng").val();
        var lat = $("#lat").val();
        var map = new AMap.Map('container', {
            center: [lng, lat],
            zoom: 15
        });
        map.plugin(["AMap.ToolBar"], function () {
            map.addControl(new AMap.ToolBar());
        });
        <!-- 上面是定位，下面是打上标记 -->

        var marker;
        var icon = new AMap.Icon({
            image: 'http://vdata.amap.com/icons/b18/1/2.png',
            size: new AMap.Size(24, 24)
        });
        marker = new AMap.Marker({
            offset: new AMap.Pixel(-12, -12),
            zIndex: 101,
            map: map
        });
    })

    function get_share_datas_from_html_inapp() {
        var shid = "shdefault",
            urlShid,
            urlSid,
            pk = "pkdefault",
            pp = "ppdefault",
            pkn = (typeof _PK != 'undefined' ? _PK : document.getElementById("page_key_name")),
            getQueryString = function (name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"),
                    r = window.location.search.substr(1).match(reg);
                if (r != null) {
                    return unescape(r[2])
                }
                return null;
            };
        urlShid = getQueryString("shid");
        urlSid = getQueryString("sid");
        if (urlShid) {
            shid = urlShid;
        } else if (urlSid) {
            shid = urlSid;
        }
        if (pkn) {
            var pknVal = pkn.value;
            if (pknVal) {
                var pkArray = pknVal.split("|");
                if (pkArray.length == 1) {
                    pk = pkArray[0];
                } else if (pkArray.length >= 2) {
                    pk = pkArray[0];
                    pp = pkArray[1];
                }
            }
        }
        var ret = [];
        ret["shid"] = shid;
        ret["pk"] = pk;
        ret["pp"] = pp;
        return ret;
    }

    function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    }


</script>
<script>
    var _T = _T || [];
    (function () {
        var script = document.createElement("script");
        script.src = "https://static.zhipin.com/library/js/analytics/ka.zhipin.min.js";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(script, s);
    })();

    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?194df3105ad7148dcf2b98a91b5e727a";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>

</body>
</html>