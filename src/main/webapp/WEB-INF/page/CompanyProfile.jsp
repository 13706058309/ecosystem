<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/11/24
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="standard"><!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>${backUser.compName}</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="https://static.zhipin.com/zhipin-geek/v334/web/geek/css/main.css" type="text/css" rel="stylesheet">
    <meta name="applicable-device" content="pc">
    <style type="text/css">.amap-container {
        cursor: url(https://webapi.amap.com/theme/v1.3/openhand.cur), default;
    }
    </style>
</head>
<body class="page-white">

<div id="wrap">
    <script>
        var staticPath = 'https://static.zhipin.com/v2';
        _PAGE = {
            checkMobileUrl: "/registe/sendSms.json",
            regMobileUrl: "/registe/save.json",
            loginMobileUrl: "/login/phone.json",
            loginAccountUrl: "/login/account.json",
            getRandomKeyUrl: "/captcha/randkey.json",
            verifyImgUrl: "/captcha/?randomKey={randomKey}",
            getPositionUrl: "/user/position.json",
            citySiteName: "全国站",
            citySiteCode: "100010000",
            skillsUrl: "/common/data/positionSkill"
        }
    </script>

    <div class="company-banner" style="">
        <div class="inner home-inner">
            <div>
                <div class="company-stat">
                    <em class="vline"></em><span><b>${size}</b>在招职位BOSS</span>
                </div>
                <div class="info-primary">
                    <img src="${pageContext.request.contextPath}/uploadLogo${backUser.logo}" class="fl">
                    <div class="info">
                        <h1 class="name">${backUser.compName}<i class="icon-brand"></i></h1>
                        <p>${backUser.finanStage}<em class="dolt"></em>${backUser.scale}<em class="dolt"></em>
                    </div>
                </div>
            </div>

            <div class="smallbanner notag" style="display: none;">
                <div class="smallbanner-content">
                    <div class="info-primary">
                        <img src="${pageContext.request.contextPath}/uploadLogo${backUser.logo}" class="fl">
                        <div class="info">
                            <span class="name">${backUser.compName}<i class="icon-brand"></i></span>
                        </div>
                    </div>
                    <div class="company-tab">
                        <a ka="company-intro" class="cur">公司简介</a>
                    </div>
                </div>
            </div>

            <div class="company-tab">
                <a ka="company-intro" class="cur">公司简介</a>
            </div>

        </div>
    </div>

    <div class="job-box">
        <div class="inner home-inner">
            <div class="job-detail">
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
                    </div>
                    <div class="job-sec company-job company-desc">
                        <h3>在招职位</h3>
                        <div class="job-list">
                            <ul>
                                <c:forEach items="${postPositions}" var="pps">
                                    <li onclick="details(${pps.pPostId})">
                                        <div data-lid="a3RHnJumGtK.search.10" data-jid="5c76e78924d36df41nN40927F1I~"
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
                                        <div class="startchat-box">
                                            <a ka="job-7-chat" href="javascript:;"
                                               data-url="/wapi/zpgeek/friend/add.json?jobId=5c76e78924d36df41nN40927F1I~&amp;lid=a3RHnJumGtK.search.10"
                                               redirect-url="/web/geek/chat?id=622ae9145e69b5af1HV739i8GFo~&amp;lid=a3RHnJumGtK.search.10"
                                               class="btn btn-startchat">立即沟通</a>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="footer" class="">
    <div class="inner home-inner">
        <div class="footer-social">
            <img src="https://static.zhipin.com/v2/web/geek/images/footer-logo.png" alt="">
            <p>企业服务热线和举报投诉 <span>400 065 5799</span></p>
            <p>工作日 <span>8:00 - 22:00</span></p>
            <p>休息日 <span>9:30 - 18:30</span></p>
            <p class="footer-icon">
                <a href="http://www.weibo.com/bosszhipin" rel="nofollow" ka="link-weibo" target="_blank"
                   class="icon-weibo"><span>官方微博</span></a>
                <a href="javascript:;" class="icon-weixin" ka="link-weixin"><span>微信公众号</span><img
                        src="https://static.zhipin.com/v2/web/geek/images/we_chat_qr.jpg" class="qrcode-weixin"></a>
                <a href="https://app.zhipin.com" class="icon-app" ka="link-downloadapp"><span>下载</span></a>
            </p>
        </div>
        <div class="footer-about clear-fix">
            <dl>
                <dt>企业服务</dt>
                <dd>
                    <a href="https://www.zhipin.com/job_detail/" ka="link-search">职位搜索</a>
                    <a href="https://news.zhipin.com/" ka="link-news">新闻资讯</a>
                    <a href="https://app.zhipin.com/" ka="link-app">BOSS直聘APP</a>
                </dd>
            </dl>
            <dl>
                <dt>使用与帮助</dt>
                <dd>
                    <a href="https://www.zhipin.com/web/common/protocol/index.html" rel="nofollow" ka="link-privacy"
                       target="_blank">平台协议</a>
                    <a href="https://www.zhipin.com/activity/cc/anticheatguide.html" rel="nofollow"
                       ka="link-anticheatguide" target="_blank">防骗指南</a>
                    <a href="https://www.zhipin.com/activity/cc/usehelp.html" rel="nofollow" ka="link-usehelp"
                       target="_blank">使用帮助</a>
                </dd>
            </dl>
            <dl>
                <dt>联系BOSS直聘</dt>
                <dd>
                    <p>北京华品博睿网络技术有限公司</p>
                    <p>公司地址 北京市朝阳区太阳宫中路16号院1号楼18层1801内09</p>
                    <p>联系电话 010-84150633</p>
                    <p>违法和不良信息举报邮箱 <a class="report-mail" href="mailto:jubao@kanzhun.com" rel="nofollow">jubao@kanzhun.com</a>
                    </p>
                </dd>
            </dl>
        </div>
        <div class="copyright">
            <p>
                <span>Copyright © 2020 BOSS直聘</span><span>京ICP备14013441号-5</span><span>京ICP证150923号</span><span>京网文[2020]0399-066 号</span>
                <span>
                     <a href="https://www.zhipin.com/activity/cc/businesslicense.html" rel="nofollow"
                        ka="link-businesslicense" target="_blank">
                         <img src="https://static.zhipin.com/v2/web/geek/images/icon-badge-1.png" alt="">
                         电子营业执照
                     </a>
                </span>
                <span><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010502032801"
                         rel="nofollow" ka="link-beian" target="_blank"><img
                        src="https://static.zhipin.com/v2/web/geek/images/icon-beian.png"
                        alt=""> 京公网安备11010502032801</a></span>
                <span><a href="http://sdwj.zhipin.com/web/index.html" rel="nofollow" ka="link-sdwj"
                         target="_blank">朝阳网警</a></span>
                <span><a href="/web/common/protocol/hr-service.html" rel="nofollow" ka="link-hr-service"
                         target="_blank">人力资源服务许可证</a></span>
                <span><a href="https://www.12377.cn" rel="nofollow" ka="link-12377"
                         target="_blank">网上有害信息举报专区</a></span>
            </p>
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
            <a href="http://www.kanzhun.com/gso6978107.html" target="_blank" ka="company_link_seo3">百度东莞分公司</a>
            <a href="http://www.kanzhun.com/gso2070269.html" target="_blank" ka="company_link_seo4">百度深圳分公司</a>
            <a href="http://www.kanzhun.com/gso1820460.html" target="_blank" ka="company_link_seo5">百度广州分公司</a>
            <a href="http://www.kanzhun.com/gso2083261.html" target="_blank" ka="company_link_seo6">百度北京分公司</a>
            <a href="http://www.kanzhun.com/gso6652254.html" target="_blank" ka="company_link_seo7">百度上海研发中心</a>
            <a href="http://www.kanzhun.com/gso4166403.html" target="_blank" ka="company_link_seo8">北京百度网讯科技有限公司</a>
            <a href="http://www.kanzhun.com/gso5736034.html" target="_blank" ka="company_link_seo9">百度国际科技深圳有限公司</a>
            <a href="http://www.kanzhun.com/gso248683.html" target="_blank" ka="company_link_seo10">百度ktv</a>
        </dd>
    </dl>
    <label><span>展开</span><i class="fz fz-slidedown"></i></label>
</div>


<script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js"></script>
<script src="https://static.zhipin.com/zhipin-geek/v334/web/geek/js/main.js"></script>
<iframe style="display: none;" name="zhipinFrame"></iframe>
<div class="guide-download-app-v62" style="display:none">
    <div class="app-icon-arrow"></div>
    <div class="app-icon-v62"></div>
    <div class="app-icon-des-v62">一键扫码 随时沟通</div>
</div>
<script src="https://webapi.amap.com/maps?v=1.3&amp;key=60085a6ee91616cf689ce0321e1f30c4&amp;plugin=AMap.Geocoder"></script>
<input type="hidden" id="page_key_name" value="cpc_company_intro">
<script>
    function details(pPostId) {
        location.href="center/postInfo?pPostId="+pPostId;
    }
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