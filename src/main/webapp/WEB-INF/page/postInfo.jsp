<%--
  Created by IntelliJ IDEA.
  User: WUWX
  Date: 2020/11/20
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6"><![endif]-->
<!--[if IE 7 ]><html class="ie ie7"><![endif]-->
<!--[if IE 8 ]><html class="ie ie8"><![endif]-->
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="standard"><!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>${post.postName}</title>
<%--    <meta name="keywords" content="资产负债_软件开发岗（应届）,资产负债_软件开发岗（应届）招聘,建信金科资产负债_软件开发岗（应届）招聘"/>--%>
<%--    <meta name="description" content="建信金科资产负债_软件开发岗（应届）招聘，薪资：8-13K，地点：厦门，要求：1年以内，学历：本科，福利：五险一金、补充医疗保险、定期体检、年终奖、带薪年假、餐补、节日福利、员工关怀、工会福利，资产负债业务高级经理刚刚在线，随时随地直接开聊。"/>--%>
    <link rel="alternate" media="only screen and (max-width: 640px)" href="https://m.zhipin.com/job_detail/d5632e1152a89f521nV639m9F1FZ.html">
    <link rel="canonical" href="https://www.zhipin.com/job_detail/d5632e1152a89f521nV639m9F1FZ.html">
    <meta name="applicable-device" content="pc">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=7c1d325554fabccbfb414e1ec058cf40&plugin=AMap.Autocomplete"></script>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=85f285069a023533ccfb926369538910&plugin=AMap.Geocoder"></script>
    <script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
    <link href="${pageContext.request.contextPath}/css/main.css" type="text/css" rel="stylesheet">


</head>
<body class="page-white">
<input type="hidden" id="lng" value="${post.backUser.lng}">
<input type="hidden" id="lat" value="${post.backUser.lat}">
<div id="wrap">
    <div id="header" style="background-color: #00c2b3;height: 80px" >
        <div class="inner home-inner" >
            <div class="logo" style="width: 150px;height: 70px">

                <a href="https://www.zhipin.com/" ka="header-home-logo" title="钱程无忧" style="background: url(${pageContext.request.contextPath}/imgs/logo12.jpg) 3px 7px no-repeat;background-size:150px 70px;width: 150px;height: 70px"><span>钱程无忧</span></a>
            </div>
            <div class="nav" style="margin-top: 20px">
                <ul>
                    <li class=""><a ka="header-home" href="${pageContext.request.contextPath}/homePage/home">首页</a></li>
                    <li class=""><a ka="header-job" href="${pageContext.request.contextPath}/center/job">职位</a></li>
                    <li class=""><a class="nav-school" ka="header-school" href="${pageContext.request.contextPath}/homePage/companylist">公司</a></li>
<%--                    <li class=""><a ka="header_brand" href="https://www.zhipin.com/gongsi/">校招</a></li>--%>
                    <li><a href="${pageContext.request.contextPath}/project" target="_blank">项目</a></li>
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
<%--                        <li class=""><a ka="header-message" href="https://www.zhipin.com/web/geek/chat">消息<span class="nav-chat-num"></span></a></li>--%>
                        <li class="nav-figure">
                            <a >
                                <span class="label-text">${qUser.userName}</span><img src="${pageContext.request.contextPath}${qUser.headImgUrl}" alt=""/>
                            </a>
                            <div class="dropdown">
                                <a href="${pageContext.request.contextPath}/center/jianli" ka="header-personal">个人中心<span>编辑简历</span></a>
                                <a href="${pageContext.request.contextPath}/center/accountSet" ka="account_manage">账号设置<span>重置密码|更换手机号|隐私设置|修改用户名</span></a>
                                <a href="${pageContext.request.contextPath}/homePage/quitAccount?city=${workCity}"  ka="header-logout">退出登录</a>
                            </div>
                        </li>
                    </ul></c:if>
            </div>
        </div>
    </div>
    <div id="main">
    <div class="job-banner" style="background-color: #00c2b3;">
        <div class="inner home-inner" >
            <div class="job-primary detail-box">
<%--                <div class="pos-bread">--%>
<%--                    <a href="/" ka="job-breadcrumb-top1">首页</a>--%>
<%--                    <i class="icon-arrow-right"></i>--%>
<%--                    <a href="/c101230200/" ka="job-breadcrumb-top2">厦门招聘</a>·<a href="/p100123/" ka="job-breadcrumb-top21">全栈工程师招聘</a>--%>
<%--                    <i class="icon-arrow-right"></i>--%>
<%--                    <a href="/c101230200-p100123/" ka="job-breadcrumb-top3">厦门全栈工程师招聘</a>--%>
<%--                    <i class="icon-arrow-right"></i>--%>
<%--&lt;%&ndash;                    <a href="/job_detail/d5632e1152a89f521nV639m9F1FZ.html" ka="job-breadcrumb-top4">建信金科资产负债_软件开发岗（应届）招聘</a>&ndash;%&gt;--%>
<%--                </div>--%>
                <div class="info-primary">
<%--                    <div class="job-status"><span>最新</span>--%>

                    </div>
                    <div class="name">
                        <h1 style="color: #0b2e13">${post.postName}</h1>
                        <span class="salary">${post.minSalary}-${post.maxSalary}K</span>
                    </div>
                    <p style="color: #f0ad4e"><a class="text-city" href="/xiamen/" style="color:#f0ad4e">${post.workCity}</a><em class="dolt"></em>${post.workYear}<em class="dolt"></em>${post.education}</p>
                    <div class="tag-container">

                        <div class="job-tags">
                            <span style="color: #0b2e13">${post.jobBenefits}</span>
                        </div>
                    </div>
                </div>
                <div class="job-op">
                    <div class="btn-container">
                        <!-- 未登录 -->
                        <c:if test="${not empty qUser}">
                        <a class="btn btn-startchat" onclick="window.open('${pageContext.request.contextPath}/rec/userChat?compID=${post.backUser.bUserId}')" style="background-color: #0C0C0C">立即沟通</a>
                        </c:if>
                    </div>

                </div>
            </div>
        </div>
    </div>
<%--    <div class="smallbanner">--%>
<%--        <div class="inner home-inner">--%>
<%--            <div class="detail-op">--%>
<%--                <div class="btns">--%>
<%--                    <c:if test="${not empty qUser}">--%>
<%--                    <a class="btn btn-startchat" onclick="window.open('${pageContext.request.contextPath}/rec/userChat?compID=${post.backUser.bUserId}')">立即沟通</a>--%>
<%--                    </c:if>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="company-info">--%>
<%--                <div class="name">--%>
<%--                    <h1>${post.postName}</h1>--%>
<%--                    <span class="badge">${post.minSalary}-${post.maxSalary}K</span></div>--%>
<%--                <div class="tag-container">--%>
<%--                    <div class="tag-more" style="opacity: 1;">--%>
<%--                        <span class="link-more">...</span>--%>
<%--                        <div class="tag-all job-tags">--%>
<%--                            <span>${post.jobBenefits}</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="job-tags">--%>
<%--                        <span>${post.jobBenefits}</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="info">--%>
<%--                    ${post.backUser.compName}--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="job-box">
        <div class="inner home-inner">
            <div class="job-sider">


                <div class="sider-company">
                    <p class="title">公司基本信息</p>
                    <div class="company-info">
                        <a >
                            <img src="${pageContext.request.contextPath}/uploadLogo/${post.backUser.logo}" alt=""/>
                        </a>
                        <a >
                            ${post.backUser.compName}

                        </a>
                    </div>
                    <p><i class="icon-stage"></i>${post.backUser.finanStage}</p>
                    <p><i class="icon-scale"></i>${post.backUser.scale}</p>
                    <p><i class="icon-scale"></i>${post.backUser.address}</p>
<%--                    <p><i class="icon-industry"></i><a ka="job-detail-brandindustry" href="/i100201/">银行</a></p>--%>
                    <p><i class="icon-net"></i>${post.backUser.homePage}</p>
<%--                    <p class="gray">更新于：2020-11-19</p>--%>
                </div>

            </div>
            <div class="job-detail">
                <div class="detail-op">
                    <div class="btns">
                        <div class="op-links">
                            <c:if test="${not empty qUser}">
<%--                            <a ka="job_detail_wechat_share" href="javascript:;" class="link-wechat-share" data-url="/boss/share/job.json?jobId=d5632e1152a89f521nV639m9F1FZ&source=2">微信扫码分享</a>--%>
                            <c:if test="${not empty postCellec}"><a onclick="postDel(${post.pPostId})" class="link-wechat-share">取消感兴趣</a></c:if>
                            <c:if test="${empty postCellec}"><a onclick="postInsert(${post.pPostId})" class="link-wechat-share">感兴趣</a></c:if>
<%--                            <a ka="job_detail_report" href="javascript:;" class="link-report">举报</a>--%>
                            </c:if>
                        </div>
                    </div>

                    <div class="detail-figure">
                        <img src="https://img.bosszhipin.com/beijin/upload/tmp/20201111/fc8b5a3333d3a69e01fcaf63633dce41839d4521942b5b4a0b31b099124b8086_s.jpg?x-oss-process=image/resize,w_100,limit_0" alt="" />
                    </div>
                    <h2 class="name">${post.backUser.bUserName}<i class="icon-vip"></i>

                    </h2>
                </div>
                <div class="detail-content">
                    <!--已关闭职位-->

                    <div class="job-sec">
                        <h3>职位描述</h3>
                        <div class="text">
<%--                            (一)	职务职责<br/>1、参与产品的编码开发、测试优化、运行维护等工作； <br/>2、完成软件系统开发设计等相关技术文档的编写； <br/>3、负责解决产品运行过程中遇到的技术问题。<br/>(二)	职位要求<br/>1、境内外高等院校全日制大学本科及以上学历的应届毕业生，计算机类、软件工程类等相关专业。<br/>2、有相关计算机软件技术基础，至少精通一种主流开发语言；熟悉至少一种常用的开发技术框架。<br/>3、有相关项目开发经验者优先； <br/>4、有良好的沟通协作能力，注重责任感及团队合作。--%>
                            ${post.jobDescription}
                        </div>
                    </div>
                    <div class="job-sec company-info">
                        <h3>公司介绍</h3>
                        <div class="text">
<%--                            ■ 是中国建设银行股份有限公司旗下从事金融科技行业的全资子公司。<br/>■ 是国有大型商业银行设立的第一家金融科技公司，国内商业银行内部科研力量整体市场运作的第一家。<br/>■ 目前规模为4600人左右，注册资本16亿元。是迄今为止中国商业银行规模最大的科技公司。<br/>■ 经营范围包括软件科技、平台运营及金融信息服--%>
                        ${post.backUser.infoIntr}
                        </div>
                        <a ka="job-comintroduce" href="${pageContext.request.contextPath}/homePage/compProfile?bUserId=${post.backUser.bUserId}" target="_blank" class="look-all"><span>...</span>查看全部</a>
                    </div>


                    <div class="job-sec">
                        <h3>工作地址</h3>
                        <div class="job-location">

                            <div style="width: 100%;height: 50%" id="container">
                        </div>
                    </div>

              --%>
                </div>
            </div>
        </div>
    </div>
</div>




    <div class="container-tip">
        <div class="tip-box">
            <p class="tit">快速完善简历，与Boss开聊</p>
            <p>与在线Boss直接聊，最快当天拿offer</p>
            <a ka="job-detail-complete" href="javascript:;">快速完善信息</a>
            <i class="trangle"></i>
        </div>
        <div class="tip-bot"><a href="javascript:;" class="close"></a></div>
    </div>
    <div class="aladingtip">
        <img src="https://static.zhipin.com/zhipin-geek/v331/web/geek/images/tip.png">
    </div>
</div>

<script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js"></script>
<script src="https://static.zhipin.com/zhipin-geek/v331/web/geek/js/main.js"></script>
<script src="https://webapi.amap.com/maps?v=1.3&key=60085a6ee91616cf689ce0321e1f30c4&plugin=AMap.Geocoder"></script>
</body>
<input type="hidden" id="page_key_name" value="cpc_job_detail" />
<script>
    function postDel(id) {
        $.ajax({
            url: 'postDel',
            charset:"UTF-8",
            async: "true",
            type: "post",
            data: "pPostId="+id,
            dataType: "text",
            success: function (data) {
                if (data == "succes") {
                    //向服务端发送删除指令
                    // layer.msg('删除成功')
                    location.reload()
                } else if (data == "lose") {
                    // layer.msg("添加失败")
                }
            },
            error: function () {
                layer.msg('网络繁忙')
            }
        })
    }

    function postInsert(id) {
        $.ajax({
            url: 'postInsert',
            charset:"UTF-8",
            async: "true",
            type: "post",
            data: "pPostId="+id,
            dataType: "text",
            success: function (data) {
                if (data == "succes") {
                    //向服务端发送删除指令
                    // layer.msg('收藏成功')
                    location.reload()
                } else if (data == "lose") {
                    // layer.msg("收藏失败")
                }
            },
            error: function () {
                layer.msg('网络繁忙')
            }
        })
    }
</script>

<script>
    window.onload=function () {
        // function postLocation() {
            var lng = $("#lng").val();
            var lat = $("#lat").val();
            console.log(lat+"!!!!!!!!!!!!1")
            console.log(lng+"??????????")
            var map = new AMap.Map('container', {
                center: [lng, lat],
                zoom: 15
            });
            map.plugin(["AMap.ToolBar"], function() {
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
        // }
    }



</script>

</html>
