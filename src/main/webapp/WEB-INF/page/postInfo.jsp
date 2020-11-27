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

                <a href="https://www.zhipin.com/" ka="header-home-logo" title="钱程无忧" style="background: url(${pageContext.request.contextPath}/imgs/logo11.png) 3px 7px no-repeat;background-size:150px 70px;width: 150px;height: 70px"><span>钱程无忧</span></a>
            </div>
            <div class="nav" style="margin-top: 20px">
                <ul>
                    <li class=""><a ka="header-home" href="${pageContext.request.contextPath}/homePage/home">首页</a></li>
                    <li class="cur"><a ka="header-job" href="${pageContext.request.contextPath}/center/job">职位</a></li>
                    <li class=""><a class="nav-school" ka="header-school" href="${pageContext.request.contextPath}/homePage/companylist">公司</a></li>
                    <li class=""><a ka="header_brand" href="https://www.zhipin.com/gongsi/">校招</a></li>
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
                        <li class=""><a ka="header-message" href="https://www.zhipin.com/web/geek/chat">消息<span class="nav-chat-num"></span></a></li>
                        <li class="nav-figure">
                            <a href="https://www.zhipin.com/web/geek/recommend" ka="header-username">
                                <span class="label-text">${qUser.userName}</span><img src="${pageContext.request.contextPath}${qUser.headImgUrl}" alt=""/>
                            </a>
                            <div class="dropdown">
                                <a href="${pageContext.request.contextPath}/center/jianli" ka="header-personal">我的简历<span>编辑简历</span></a>
                                <a href="${pageContext.request.contextPath}/center/accountSet" ka="account_manage">账号设置<span>重置密码|更换手机号|隐私设置|修改用户名</span></a>
                                <a href="${pageContext.request.contextPath}/homePage/quitAccount"  ka="header-logout">退出登录</a>
                            </div>
                        </li>
                    </ul></c:if>
            </div>
        </div>
    </div>
    <div id="main">
    <div class="job-banner">
        <div class="inner home-inner">
            <div class="job-primary detail-box">
                <div class="pos-bread">
                    <a href="/" ka="job-breadcrumb-top1">首页</a>
                    <i class="icon-arrow-right"></i>
                    <a href="/c101230200/" ka="job-breadcrumb-top2">厦门招聘</a>·<a href="/p100123/" ka="job-breadcrumb-top21">全栈工程师招聘</a>
                    <i class="icon-arrow-right"></i>
                    <a href="/c101230200-p100123/" ka="job-breadcrumb-top3">厦门全栈工程师招聘</a>
                    <i class="icon-arrow-right"></i>
<%--                    <a href="/job_detail/d5632e1152a89f521nV639m9F1FZ.html" ka="job-breadcrumb-top4">建信金科资产负债_软件开发岗（应届）招聘</a>--%>
                </div>
                <div class="info-primary">
<%--                    <div class="job-status"><span>最新</span>--%>

                    </div>
                    <div class="name">
                        <h1>${post.postName}</h1>
                        <span class="salary">${post.minSalary}-${post.maxSalary}K</span>
                    </div>
                    <p style="color: #f0ad4e"><a class="text-city" href="/xiamen/" style="color:#f0ad4e">${post.workCity}</a><em class="dolt"></em>${post.workYear}<em class="dolt"></em>${post.education}</p>
                    <div class="tag-container">
<%--                        <div class="tag-more" style="opacity: 1;">--%>
<%--                            <span class="link-more">...</span>--%>
<%--                            <div class="tag-all job-tags">--%>
<%--                                <span>五险一金</span><span>补充医疗保险</span><span>定期体检</span><span>年终奖</span><span>带薪年假</span><span>餐补</span><span>节日福利</span><span>员工关怀</span><span>工会福利</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                        <div class="job-tags">
                            <span>${post.jobBenefits}</span>
                        </div>
                    </div>
                </div>
                <div class="job-op">
                    <div class="btn-container">
                        <!-- 未登录 -->
                        <a class="btn btn-startchat" ka="go_chat_done_110440739" href="javascript:;" redirect-url="/web/geek/chat?id=7bc0cc6a6ab2edf90nR92ty5FlBW"
                           data-url="/wapi/zpgeek/friend/add.json?jobId=d5632e1152a89f521nV639m9F1FZ&lid=a6k2lkE6id7.search.2">立即沟通</a>

                    </div>
<%--                    <div class="op-container">--%>
<%--                        <!-- 在线简历 -->--%>
<%--                        <a href="/web/geek/resume" class="fl icon-resume-login" ka="job_online_resume_1"><i class="icon"></i>完善在线简历</a>--%>
<%--                        <!-- 附件简历 -->--%>
<%--                        <a href="javascript:;" class="fr icon-upload-login attachment-resume-upload" ka="job_attach_resume_1"><i class="icon"></i>上传附件简历</a>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
    <div class="smallbanner">
        <div class="inner home-inner">
            <div class="detail-op">
                <div class="btns">
                    <a class="btn btn-startchat" ka="go_chat_done_110440739" href="javascript:;" redirect-url="/web/geek/chat?id=7bc0cc6a6ab2edf90nR92ty5FlBW"
                       data-url="/wapi/zpgeek/friend/add.json?jobId=d5632e1152a89f521nV639m9F1FZ&lid=a6k2lkE6id7.search.2">立即沟通</a>

                </div>
            </div>
            <div class="company-info">
                <div class="name">
                    <h1>${post.postName}</h1>
                    <span class="badge">${post.minSalary}-${post.maxSalary}K</span></div>
                <div class="tag-container">
                    <div class="tag-more" style="opacity: 1;">
                        <span class="link-more">...</span>
                        <div class="tag-all job-tags">
                            <span>${post.jobBenefits}</span>
                        </div>
                    </div>
                    <div class="job-tags">
                        <span>${post.jobBenefits}</span>
                    </div>
                </div>
                <div class="info">
                    ${post.backUser.compName}
<%--                    <a href="/gongsir/6e19637143bd80ad1HV_3N26GQ~~.html" target="_blank" class="link-more" ka="look-all-position">查看所有职位</a>--%>
<%--                    <div class="job-detail-guide-download-app">--%>
<%--                        <div class="job-detail-guide-download-app-icon"></div>--%>
<%--                        下载App, 不错过Boss每一条消息--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
    <div class="job-box">
        <div class="inner home-inner">
            <div class="job-sider">


                <div class="sider-company">
                    <p class="title">公司基本信息</p>
                    <div class="company-info">
                        <a ka="job-detail-company-logo_custompage" href="/gongsi/6e19637143bd80ad1HV_3N26GQ~~.html" title="                                    建信金科
" target="_blank">
                            <img src="${pageContext.request.contextPath}/uploadLogo/${post.backUser.logo}" alt=""/>
                        </a>
                        <a ka="job-detail-company_custompage" href="/gongsir/6e19637143bd80ad1HV_3N26GQ~~.html"  title="                                    建信金科
招聘" target="_blank">
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
<%--                <div class="promotion-job">--%>
<%--                    <h3><a href="/c101230200-p100123/e_103-y_3_4/" rel="nofollow" ka="more-similar-jobs2" class="more" target="_blank">更多相似职位</a>相似职位</h3>--%>
<%--                    <ul>--%>
<%--                        <li>--%>
<%--                            <div class="company-logo">--%>
<%--                                <a ka="job_sug_brand1_custompage" href="/gongsi/bf92cfacc78eb89533J409m0.html" target="_blank" title="盈趣科技">--%>
<%--                                    <img src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20180305/16dd809e13819933131ddb0fb3b893c6cfcd208495d565ef66e7dff9f98764da.jpg?x-oss-process=image/resize,w_100,limit_0" alt="" />--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info-primary">--%>
<%--                                <div class="name"><a ka="job_sug_1" href="/job_detail/acb61d800460f62a3nV70tu5EFI~.html" target="_blank">C++软件开发工程师 <span class="red">8-13K·13薪</span></a></div>--%>
<%--                                <p class="gray"><a ka="job_sug_brandjob1_custompage" href="/gongsir/bf92cfacc78eb89533J409m0.html" target="_blank" title="盈趣科技招聘">盈趣科技</a><em class="vdot">·</em>厦门</p>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <div class="company-logo">--%>
<%--                                <a ka="job_sug_brand2_custompage" href="/gongsi/a3759568d38a666a3ndy3N6-Ew~~.html" target="_blank" title="厦门贝壳找房">--%>
<%--                                    <img src="https://img.bosszhipin.com/beijin/mcs/bar/20200715/87dd60ca00b7c0aa5f98f79e3654a599be1bd4a3bd2a63f070bdbdada9aad826.jpg?x-oss-process=image/resize,w_100,limit_0" alt="" />--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info-primary">--%>
<%--                                <div class="name"><a ka="job_sug_2" href="/job_detail/b44cc5fa601185040XJ829u7F1c~.html" target="_blank">应届管培生/底薪5K/六险一金 <span class="red">8-12K</span></a></div>--%>
<%--                                <p class="gray"><a ka="job_sug_brandjob2_custompage" href="/gongsir/a3759568d38a666a3ndy3N6-Ew~~.html" target="_blank" title="厦门贝壳找房招聘">厦门贝壳找房</a><em class="vdot">·</em>厦门</p>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <div class="company-logo">--%>
<%--                                <a ka="job_sug_brand3_custompage" href="/gongsi/a8235544cebbb0361XVy2ti5.html" target="_blank" title="好实用">--%>
<%--                                    <img src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20190213/138287e80f2d5497d6449a2ca4016ea83273f1a53ba3fdd4e1a14ec85e41d22e.png?x-oss-process=image/resize,w_100,limit_0" alt="" />--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info-primary">--%>
<%--                                <div class="name"><a ka="job_sug_3" href="/job_detail/a3728ad6a62fa74803x63tS5FlU~.html" target="_blank">C#.net软件开发工程师 <span class="red">8-10K</span></a></div>--%>
<%--                                <p class="gray"><a ka="job_sug_brandjob3_custompage" href="/gongsir/a8235544cebbb0361XVy2ti5.html" target="_blank" title="好实用招聘">好实用</a><em class="vdot">·</em>厦门</p>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <div class="company-logo">--%>
<%--                                <a ka="job_sug_brand4_custompage" href="/gongsi/87ac5ba18e45db853nd_3dW0Fg~~.html" target="_blank" title="易鲸科技">--%>
<%--                                    <img src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20200818/c0df6389689a60106feca2677c66b8c37240c806d4645c3e3fafb48b8bb20d1e_s.jpg?x-oss-process=image/resize,w_100,limit_0" alt="" />--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info-primary">--%>
<%--                                <div class="name"><a ka="job_sug_4" href="/job_detail/0f5d2bf29e2b43be3nB62dm_EVQ~.html" target="_blank">JAVA软件开发工程师 <span class="red">8-13K</span></a></div>--%>
<%--                                <p class="gray"><a ka="job_sug_brandjob4_custompage" href="/gongsir/87ac5ba18e45db853nd_3dW0Fg~~.html" target="_blank" title="易鲸科技招聘">易鲸科技</a><em class="vdot">·</em>厦门</p>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <div class="company-logo">--%>
<%--                                <a ka="job_sug_brand5_custompage" href="/gongsi/a0369e6c312d9ad40nFz29y6.html" target="_blank" title="谷沃科技">--%>
<%--                                    <img src="https://img.bosszhipin.com/beijin/mcs/chatphoto/20190805/35507a8e4b4a104325e33695e3c3b54c22f25febb9f0805fc1637c251a9bb0ac_s.jpg?x-oss-process=image/resize,w_100,limit_0" alt="" />--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info-primary">--%>
<%--                                <div class="name"><a ka="job_sug_5" href="/job_detail/d54dcd6e78a78ab93nB82d64E1A~.html" target="_blank">数据资产评价岗 <span class="red">10-15K</span></a></div>--%>
<%--                                <p class="gray"><a ka="job_sug_brandjob5_custompage" href="/gongsir/a0369e6c312d9ad40nFz29y6.html" target="_blank" title="谷沃科技招聘">谷沃科技</a><em class="vdot">·</em>厦门</p>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                    <div class="view-more"><a href="/c101230200-p100123/e_103-y_3_4/" rel="nofollow" target="_blank" ka="more-similar-jobs3"><i class="more">更多相似职位</i></a></div>--%>
<%--                </div>--%>
<%--                <div class="promotion-img">--%>
<%--                    <a href="/app.html" ka="job-detail-app" target="_blank"><img src="https://static.zhipin.com/zhipin-geek/v331/web/geek/images/pro-1.png" alt=""></a>--%>
<%--                </div>--%>
            </div>
            <div class="job-detail">
                <div class="detail-op">
                    <div class="btns">
                        <div class="op-links">
<%--                            <a ka="job_detail_wechat_share" href="javascript:;" class="link-wechat-share" data-url="/boss/share/job.json?jobId=d5632e1152a89f521nV639m9F1FZ&source=2">微信扫码分享</a>--%>
                            <c:if test="${not empty postCellec}"><a onclick="postDel(${post.pPostId})" class="link-wechat-share">取消感兴趣</a></c:if>
                            <c:if test="${empty postCellec}"><a onclick="postInsert(${post.pPostId})" class="link-wechat-share">感兴趣</a></c:if>
<%--                            <a ka="job_detail_report" href="javascript:;" class="link-report">举报</a>--%>
                        </div>
                    </div>

                    <div class="detail-figure">
                        <img src="https://img.bosszhipin.com/beijin/upload/tmp/20201111/fc8b5a3333d3a69e01fcaf63633dce41839d4521942b5b4a0b31b099124b8086_s.jpg?x-oss-process=image/resize,w_100,limit_0" alt="" />
                    </div>
                    <h2 class="name">${post.backUser.bUserName}<i class="icon-vip"></i>

                    </h2>
<%--                    <p class="gray">--%>
<%--                        资产负债业务高级经理<em class="vdot">·</em>刚刚在线--%>
<%--                    </p>--%>
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
                        <a ka="job-comintroduce" href="/gongsi/6e19637143bd80ad1HV_3N26GQ~~.html" target="_blank" class="look-all"><span>...</span>查看全部</a>
                    </div>
<%--                    <div class="job-sec prop-item">--%>
<%--                        <h3>竞争力分析</h3>--%>
<%--                        <div class="prop-default">--%>
<%--                            <div class="title">综合竞争力评估</div>--%>
<%--                            <div class="prop-container">--%>
<%--                                <span class="level-1"></span>--%>
<%--                                <span class="level-2"><em>一般</em></span>--%>
<%--                                <span class="level-3"><em>良好</em></span>--%>
<%--                                <span class="level-4"><em>优秀</em></span>--%>
<%--                                <span class="level-5"><em>极好</em></span>--%>
<%--                            </div>--%>
<%--                            <div class="prop-detail">--%>
<%--                                <div class="pull-right">加载中...</div>--%>
<%--                                <div>个人综合排名：<span>在<img src="https://static.zhipin.com/zhipin-geek/v331/web/geek/images/pic-blur.png">人中排名第<img src="https://static.zhipin.com/zhipin-geek/v331/web/geek/images/pic-blur.png"></span></div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                    <div class="job-sec">
                        <h3>工作地址</h3>
                        <div class="job-location">
<%--                            <div class="location-address">${post.detailAddress}</div>--%>
<%--                            <div class="job-location-map js-open-map" data-content="${post.detailAddress}" data-lat="118.185824,24.484586"--%>
<%--                                 data-src="https://restapi.amap.com/v3/staticmap?size=836*174&markers=mid,0xFF0000,A:118.185824,24.484586&key=21b56a6cc83fad7668dbb0e9564759a7">--%>
<%--                                <div class="tip-inner"><p class="gray"><i class="ui-icon-loading"></i>正在加载中...</p ></div>--%>
<%--                            </div>--%>
                            <div style="width: 100%;height: 50%" id="container">
                        </div>
                    </div>

<%--                    <div class="search-box detail-search">--%>
<%--                        <div class="search-form">--%>
<%--                            <form action="/job_detail/" method="get" target="_blank">--%>
<%--                                <div class="search-form-con">--%>
<%--                                    <p class="ipt-wrap"><input ka="search-job-query" name="query" type="text" class="ipt-search" autocomplete="off" placeholder="搜索职位、公司" value="全栈工程师"></p>--%>
<%--                                    <div class="city-sel" ka="search-select-city">--%>
<%--                                        <i class="line"></i>--%>
<%--                                        <span class="label-text cur"><b data-val="101230200">厦门</b><i class="icon-arrow-down"></i></span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <input type="hidden" name="city" class="city-code" value="101230200"/>--%>
<%--                                <input type="hidden" name="source" value="9">--%>
<%--                                <button type="submit" ka="search-job" class="btn btn-search">搜索</button>--%>
<%--                                <div class="suggest-result">--%>
<%--                                    <ul></ul>--%>
<%--                                </div>--%>
<%--                                <div class="city-box">--%>
<%--                                    <ul class="dorpdown-province">--%>
<%--                                    </ul>--%>
<%--                                    <div class="dorpdown-city">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="recommend-box">--%>
<%--                        <h3>推荐职位</h3>--%>
<%--                        <div class="slider-main">--%>
<%--                            <ul>--%>
<%--                                <li class="cur">--%>
<%--                                    <a ka="job_recommend_1" href="/job_detail/24f8d23e08470f6b1HV72dy9EFY~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">销售精英+应届毕业生+薪资8k+高福利 <span class="red">8-12K</span></div>--%>
<%--                                        <p>优保集团</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_2" href="/job_detail/fcba17749d9f63160Xx_0tm6FVM~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">java中高级软件开发工程师 <span class="red">10-15K·13薪</span></div>--%>
<%--                                        <p>盈趣科技</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_3" href="/job_detail/7fd8aa5901c686dd1Hdz2tq0Elo~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">C#/.Net软件开发工程师 <span class="red">8-13K</span></div>--%>
<%--                                        <p>易维信息</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_4" href="/job_detail/1f710ec7e7ae2f450Xx529q_FFI~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">行政固定资产专员 <span class="red">5-8K</span></div>--%>
<%--                                        <p>朴朴</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_5" href="/job_detail/9366c9c86fa75e5533Rz0ty6GFM~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">嵌入式软件开发（单片机方向） <span class="red">8-13K</span></div>--%>
<%--                                        <p>厦门四信</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_6" href="/job_detail/55da97c55779937d0HFz0t2-F1M~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">Java软件开发工程师 <span class="red">10-11K</span></div>--%>
<%--                                        <p>厦门惟尔拓科技有...</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_7" href="/job_detail/127f0f9ab4c523511HR53t-9EFc~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">C#软件开发工程师 <span class="red">7-14K</span></div>--%>
<%--                                        <p>团队机器人</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_8" href="/job_detail/5a9189a6eda8538e3n1-2Nm9Elo~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">大专起招/实习生/应届毕业生/就近安排工作 <span class="red">8-13K</span></div>--%>
<%--                                        <p>厦门链家</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_9" href="/job_detail/1e3536785807c4d11nR629q1GFVT.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">资本市场专员（应届生亦可） <span class="red">8-12K</span></div>--%>
<%--                                        <p>厦门趣店科技有限公司</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_10" href="/job_detail/e81e8236107cccc80XV92t24FlU~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">市场策划（欢迎应届生） <span class="red">6-11K</span></div>--%>
<%--                                        <p>大道同行</p>--%>
<%--                                    </a>--%>
<%--                                </li>--%>
<%--                                <li class="">--%>
<%--                                    <a ka="job_recommend_11" href="/job_detail/425bd57968777a993nV42du-FVA~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">嵌入式软件开发工程师（模组开发） <span class="red">10-15K·14薪</span></div>--%>
<%--                                        <p>星宸科技</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_12" href="/job_detail/b2fde0255d40f0a433N_2tq9FFY~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">初、中、高级软件开发工程师/JAVA <span class="red">10-15K·13薪</span></div>--%>
<%--                                        <p>高伟达公司</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_13" href="/job_detail/6360e2a93c53e37f1HJ52tW6FFM~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">软件开发工程师 <span class="red">7-10K</span></div>--%>
<%--                                        <p>时代银软</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_14" href="/job_detail/cbdeb05114b0c87433153N-0EVE~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">资产负债管理专家 <span class="red">15-30K·14薪</span></div>--%>
<%--                                        <p>建信金科</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_15" href="/job_detail/ecb9efea131823cc0HJz3N25FlA~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">大数据研发工程师【应届生】 <span class="red">6-10K</span></div>--%>
<%--                                        <p>厦门卫星定位</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_16" href="/job_detail/14231f582fb7a9c8331_2968GVU~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">3D引擎（OpenGL）开发工程师（可应届硕士） <span class="red">10-15K</span></div>--%>
<%--                                        <p>同致电子科技(厦...</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_17" href="/job_detail/f806fb18d9331b861X1y2di_GVY~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">Unity3D程序/U3D程序（优秀应届生亦可） <span class="red">7-12K·14薪</span></div>--%>
<%--                                        <p>勇仕</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_18" href="/job_detail/7d53b0c9c6273ced3nR52tW_GVI~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">软件开发岗 <span class="red">15-30K·14薪</span></div>--%>
<%--                                        <p>建信金科</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_19" href="/job_detail/5ca3066234cc27900Hd50tq8EVE~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">资产保全专员 <span class="red">7-12K</span></div>--%>
<%--                                        <p>交通银行</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_20" href="/job_detail/b4a989c85f4f3b513nV92t-_EFQ~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">嵌入式软件开发工程师 <span class="red">8-13K·13薪</span></div>--%>
<%--                                        <p>厦门智瞳科技有限公司</p>--%>
<%--                                    </a>--%>
<%--                                </li>--%>
<%--                                <li class="">--%>
<%--                                    <a ka="job_recommend_21" href="/job_detail/71bbd4b0402fdccc1XV-29m5FlY~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">C++软件开发工程师 <span class="red">6-11K</span></div>--%>
<%--                                        <p>凤凰创壹软件</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_22" href="/job_detail/60db0a952e47affe03V63dy8E1Y~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">软件开发工程师（web方向） 厦门 <span class="red">11-22K·13薪</span></div>--%>
<%--                                        <p>网龙</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_23" href="/job_detail/bdfa9953e49f236303J52Ni7GVs~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">软件开发工程师 <span class="red">10-15K</span></div>--%>
<%--                                        <p>宇电自动化科技</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_24" href="/job_detail/4ad8edb249f0d3f60XV-3ti6F1c~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">游戏策划（欢迎应届生） <span class="red">6-10K</span></div>--%>
<%--                                        <p>大道同行</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_25" href="/job_detail/80412104d6f01b8a03B93du0GFA~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">软件开发工程师 <span class="red">9-14K</span></div>--%>
<%--                                        <p>视虹科技</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_26" href="/job_detail/f45916a7e71096ad1nZz292-EVY~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">Java软件开发工程师 <span class="red">7-12K</span></div>--%>
<%--                                        <p>投融汇</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_27" href="/job_detail/03922ffffbeef50b3nR629-0ElM~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">应届生 <span class="red">7-12K</span></div>--%>
<%--                                        <p>昱信泓</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_28" href="/job_detail/2b68228d229d84083nZ-3dm5GFU~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">数据资产评价岗 <span class="red">12-24K</span></div>--%>
<%--                                        <p>建信金科</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_29" href="/job_detail/8f011cb2168d456f33Fy3N-8FVQ~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">固定资产会计 <span class="red">5-6K</span></div>--%>
<%--                                        <p>厦门路达</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_30" href="/job_detail/d6cba7e28b7a730a33B40tq7GVI~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">软件开发工程师 <span class="red">6-10K</span></div>--%>
<%--                                        <p>微伦科技</p>--%>
<%--                                    </a>--%>
<%--                                </li>--%>
<%--                                <li class="">--%>
<%--                                    <a ka="job_recommend_31" href="/job_detail/03068832bf0c72050HZ-3dq0EVs~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">不良资产管理员 <span class="red">5-10K</span></div>--%>
<%--                                        <p>万乘金融服务集团</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_32" href="/job_detail/0eb0dbe9610cc39e0Hx72N-1EVc~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">上位机软件开发工程师/自动化工程师 <span class="red">10-13K</span></div>--%>
<%--                                        <p>大禾众邦</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_33" href="/job_detail/9fb6c01c455c73323nN60929GVI~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">软件开发岗 <span class="red">15-30K·14薪</span></div>--%>
<%--                                        <p>建信金科</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_34" href="/job_detail/4547e404ff0ddef23nN-2tW_E1o~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">商务代表（欢迎应届生） <span class="red">8-13K·13薪</span></div>--%>
<%--                                        <p>纳网科技</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_35" href="/job_detail/d2f1edfe1fbc61b21n1z2dS6.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">C/C++软件开发工程师 <span class="red">10-20K</span></div>--%>
<%--                                        <p>视源股份(CVTE)</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_36" href="/job_detail/1eea118d6ee9baa41HZ53N-8EFY~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">高级软件开发工程师 <span class="red">10-12K</span></div>--%>
<%--                                        <p>智慧图</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_37" href="/job_detail/22c8e3256d972cec0nR42dW8GFE~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">银行信用卡资产保全专员 <span class="red">7-10K</span></div>--%>
<%--                                        <p>联信集团</p>--%>
<%--                                    </a>--%>
<%--                                    <a ka="job_recommend_38" href="/job_detail/d096ea3f047a7b4d3n172dW_Flc~.html" target="_blank" class="recommend-li">--%>
<%--                                        <div class="name">C++软件开发工程师（算法实施/优化） <span class="red">7-12K</span></div>--%>
<%--                                        <p>兴联智控</p>--%>
<%--                                    </a>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="pos-bread city-job-guide">--%>
<%--                        <a href="/" ka="job-breadcrumb-bottom1">首页</a>&nbsp;>&nbsp;<a href="/c101230200/" ka="job-breadcrumb-bottom2">厦门招聘</a>·<a href="/p100123/" ka="job-breadcrumb-bottom21">全栈工程师招聘</a>&nbsp;>&nbsp;<a href="/c101230200-p100123/" ka="job-breadcrumb-bottom3">厦门全栈工程师招聘</a>&nbsp;>&nbsp;<a href="/job_detail/d5632e1152a89f521nV639m9F1FZ.html" ka="job-breadcrumb-bottom4">建信金科全栈工程师招聘</a>--%>
<%--                    </div>--%>
                    <!-- SEO  -->
<%--                    <div class="links-container links-container-new">--%>
<%--                        <div class="links-box">--%>
<%--                            <div class="title-box">--%>
<%--                                <span class="title-item cur">城市招聘</span>--%>
<%--                                <span class="title-item">热门职位</span>--%>
<%--                                <span class="title-item">推荐公司</span>--%>
<%--                                <span class="title-item">热门企业</span>--%>
<%--                            </div>--%>
<%--                            <div class="links-wrapper">--%>
<%--                                <div class="links-content cur">--%>
<%--                                    <a href="/c101301200/" target="_blank" ka="seo-city-1">河池招聘</a>--%>
<%--                                    <a href="/c101040100/" target="_blank" ka="seo-city-2">重庆招聘</a>--%>
<%--                                    <a href="/c101282200/" target="_blank" ka="seo-city-3">东沙群岛招聘</a>--%>
<%--                                    <a href="/c101281800/" target="_blank" ka="seo-city-4">阳江招聘</a>--%>
<%--                                    <a href="/c101301000/" target="_blank" ka="seo-city-5">百色招聘</a>--%>
<%--                                    <a href="/c101280700/" target="_blank" ka="seo-city-6">珠海招聘</a>--%>
<%--                                    <a href="/c101170200/" target="_blank" ka="seo-city-7">石嘴山招聘</a>--%>
<%--                                    <a href="/c101240900/" target="_blank" ka="seo-city-8">萍乡招聘</a>--%>
<%--                                    <a href="/c101290800/" target="_blank" ka="seo-city-9">临沧招聘</a>--%>
<%--                                    <a href="/c101120900/" target="_blank" ka="seo-city-10">临沂招聘</a>--%>
<%--                                </div>--%>
<%--                                <div class="links-content">--%>
<%--                                    <a href="/p190706/" target="_blank" ka="seo-position-1">篮球/羽毛球教练招聘</a>--%>
<%--                                    <a href="/p250108/" target="_blank" ka="seo-position-2">供应商质量工程师招聘</a>--%>
<%--                                    <a href="/p100601/" target="_blank" ka="seo-position-3">项目经理招聘</a>--%>
<%--                                    <a href="/p170302/" target="_blank" ka="seo-position-4">媒介专员招聘</a>--%>
<%--                                    <a href="/p100203/" target="_blank" ka="seo-position-5">iOS招聘</a>--%>
<%--                                    <a href="/p100404/" target="_blank" ka="seo-position-6">系统工程师招聘</a>--%>
<%--                                    <a href="/p290801/" target="_blank" ka="seo-position-7">养发师招聘</a>--%>
<%--                                    <a href="/p130309/" target="_blank" ka="seo-position-8">咨询热线/呼叫中心客服招聘</a>--%>
<%--                                    <a href="/p190199/" target="_blank" ka="seo-position-9">教育产品研发招聘</a>--%>
<%--                                    <a href="/p100512/" target="_blank" ka="seo-position-10">数据架构师招聘</a>--%>
<%--                                    <a href="/p100209/" target="_blank" ka="seo-position-11">U3D招聘</a>--%>
<%--                                    <a href="/p100117/" target="_blank" ka="seo-position-12">自然语言处理招聘</a>--%>
<%--                                    <a href="/p101016/" target="_blank" ka="seo-position-13">光通信工程师招聘</a>--%>
<%--                                    <a href="/p101011/" target="_blank" ka="seo-position-14">通信项目专员招聘</a>--%>
<%--                                    <a href="/p100405/" target="_blank" ka="seo-position-15">IT技术支持招聘</a>--%>
<%--                                    <a href="/p290118/" target="_blank" ka="seo-position-16">产后康复师招聘</a>--%>
<%--                                    <a href="/p100113/" target="_blank" ka="seo-position-17">Ruby招聘</a>--%>
<%--                                    <a href="/p100307/" target="_blank" ka="seo-position-18">游戏测试招聘</a>--%>
<%--                                    <a href="/p140201/" target="_blank" ka="seo-position-19">媒介经理招聘</a>--%>
<%--                                    <a href="/p100207/" target="_blank" ka="seo-position-20">html5招聘</a>--%>
<%--                                    <a href="/p101101/" target="_blank" ka="seo-position-21">其他技术职位招聘</a>--%>
<%--                                    <a href="/p190701/" target="_blank" ka="seo-position-22">舞蹈老师招聘</a>--%>
<%--                                    <a href="/p100116/" target="_blank" ka="seo-position-23">Golang招聘</a>--%>
<%--                                    <a href="/p300316/" target="_blank" ka="seo-position-24">注塑工程师招聘</a>--%>
<%--                                    <a href="/p100110/" target="_blank" ka="seo-position-25">Delphi招聘</a>--%>
<%--                                    <a href="/p260104/" target="_blank" ka="seo-position-26">IT咨询顾问招聘</a>--%>
<%--                                    <a href="/p290212/" target="_blank" ka="seo-position-27">餐饮学徒招聘</a>--%>
<%--                                    <a href="/p290217/" target="_blank" ka="seo-position-28">洗碗工招聘</a>--%>
<%--                                    <a href="/p100509/" target="_blank" ka="seo-position-29">数据挖掘招聘</a>--%>
<%--                                    <a href="/p100409/" target="_blank" ka="seo-position-30">DBA招聘</a>--%>
<%--                                </div>--%>
<%--                                <div class="links-content">--%>
<%--                                    <a href="/gongsi/dbef95f0650eca2e1HV_3N21EA~~.html" target="_blank" ka="seo-brand-1">卓匠网络</a>--%>
<%--                                    <a href="/gongsi/d30803b4e74e1be51HV_3N21GQ~~.html" target="_blank" ka="seo-brand-2">仁述商贸</a>--%>
<%--                                    <a href="/gongsi/2894b3e9d5239beb1HV_3N20FQ~~.html" target="_blank" ka="seo-brand-3">中邦干细胞</a>--%>
<%--                                    <a href="/gongsis/9a04a38fb7d646f2i3V50t--ElBVxQ~~.html" target="_blank" ka="seo-brand-4">汝阳县陶营向渊美丽１+１日化店</a>--%>
<%--                                    <a href="/zhaopin/d00d1c13d3fd61571nNy0tu1GA~~/" target="_blank" ka="seo-brand-5">桥梁第三方检测公司</a>--%>
<%--                                    <a href="/gongsis/cb60740893f1d4d6i3Vz09u0FlRV.html" target="_blank" ka="seo-brand-6">淮安市楚州区淮城镇上坂街时装店</a>--%>
<%--                                    <a href="/gongsis/d6eec1100eedb59bi3V-2tS9EFRXwQ~~.html" target="_blank" ka="seo-brand-7">咸阳市秦都区新荣欣电子经营部</a>--%>
<%--                                    <a href="/zhaopin/c35deed01749325d1nx62d68FA~~/" target="_blank" ka="seo-brand-8">厦门昔酒酩庄</a>--%>
<%--                                    <a href="/gongsis/df80621599d5c4b2i3V40tu9FFpUww~~.html" target="_blank" ka="seo-brand-9">建水县面甸兴隆通信经营部</a>--%>
<%--                                    <a href="/zhaopin/3d34b124c2a07e441n193NW8EQ~~/" target="_blank" ka="seo-brand-10">韶关比亚迪股份有限公司</a>--%>
<%--                                    <a href="/zhaopin/cc3a06b6dbbd6fba0Xx93Nq4/" target="_blank" ka="seo-brand-11">阿姨来了产品经理</a>--%>
<%--                                    <a href="/zhaopin/4c7e7b3a02d5c4421HVy3di5/" target="_blank" ka="seo-brand-12">北京小子科技有限公司</a>--%>
<%--                                    <a href="/gongsis/c73d5db81b3beee9i3V43N68EVdYxw~~.html" target="_blank" ka="seo-brand-13">苏尼特左旗永久自行车</a>--%>
<%--                                    <a href="/zhaopin/fab08dbfc609df521n140tq6Ew~~/" target="_blank" ka="seo-brand-14">锦绣大唐摄影</a>--%>
<%--                                    <a href="/gongsis/d463ffaa42f74304i3V509q_GVtWyw~~.html" target="_blank" ka="seo-brand-15">霸州市霸州镇苓苓超市</a>--%>
<%--                                    <a href="/gongsis/8623b132bb6289ddi3V52NW7ElZVxQ~~.html" target="_blank" ka="seo-brand-16">莒县招贤彦永综合商店</a>--%>
<%--                                    <a href="/gongsis/6f25d0fd6909c1aei3V52967GVZYww~~.html" target="_blank" ka="seo-brand-17">山西凯佳电子科技有限公司</a>--%>
<%--                                    <a href="/gongsis/53eec77a55e672e5i3V42ti9ElNX.html" target="_blank" ka="seo-brand-18">北京宏莲顺商贸有限公司</a>--%>
<%--                                    <a href="/companys/a0b631d91a52b8f21XB609S0Ew~~.html" target="_blank" ka="seo-brand-19">简悦创新科技（深圳）有限公司招聘</a>--%>
<%--                                    <a href="/gongsis/68d21e95526ced5bi3V72Ny0FVVUxw~~.html" target="_blank" ka="seo-brand-20">拉萨才友广告有限公司</a>--%>
<%--                                    <a href="/companys/6804935b860634611Xx73dq1Fg~~.html" target="_blank" ka="seo-brand-21">宁德市蕉城区蕉南纮鼎轻井泽火锅店招聘</a>--%>
<%--                                    <a href="/gongsis/127e2266dd78ebfbi3V_3t-1GFRV.html" target="_blank" ka="seo-brand-22">广州南地信息科技有限公司</a>--%>
<%--                                    <a href="/gongsis/83b9bbfb894fb47ai3V42Nm_F1FXxQ~~.html" target="_blank" ka="seo-brand-23">上林县艾尔丽斯服装店</a>--%>
<%--                                    <a href="/gongsis/5a9f4bfd95d375abi3V53dm-GFdSww~~.html" target="_blank" ka="seo-brand-24">承德市双滦区宏达肉鸡养殖厂</a>--%>
<%--                                    <a href="/gongsis/62957fed1cfe6ffbi3V429-_FFZRxQ~~.html" target="_blank" ka="seo-brand-25">保定市华粮购销公司</a>--%>
<%--                                    <a href="/gongsis/67e9abb458f39ffei3V-3925E1ZUww~~.html" target="_blank" ka="seo-brand-26">吴江市松陵镇雨神干洗店</a>--%>
<%--                                    <a href="/gongsis/064607f9eb2285d2i3V729i7GFpZxQ~~.html" target="_blank" ka="seo-brand-27">重庆双欣制冷设备有限公司</a>--%>
<%--                                    <a href="/gongsis/0057ba4747ab652ei3V-2tq4FltSyw~~.html" target="_blank" ka="seo-brand-28">沧县万林农业专业合作社</a>--%>
<%--                                    <a href="/gongsis/953bf0c476e76c3fi3V_3tS1F1RZ.html" target="_blank" ka="seo-brand-29">上海叶汇化工有限公司</a>--%>
<%--                                    <a href="/companys/ff56fecf28741b8e1n1909i1Fw~~.html" target="_blank" ka="seo-brand-30">保定市拓远知识产权代理有限公司招聘</a>--%>
<%--                                </div>--%>
<%--                                <div class="links-content">--%>
<%--                                    <a href="/gongsi/62539dee0c4c171f0HN42g~~.html" target="_blank" ka="seo-company-1">飞博共创</a>--%>
<%--                                    <a href="/gongsi/60272326a766224f1nBy3do~.html" target="_blank" ka="seo-company-2">美图公司</a>--%>
<%--                                    <a href="/gongsi/f5459f8f93341e461nZ92N6-.html" target="_blank" ka="seo-company-3">海底捞火锅</a>--%>
<%--                                    <a href="/gongsi/bbd3ec37599d66c91HRy394~.html" target="_blank" ka="seo-company-4">厦门链家</a>--%>
<%--                                    <a href="/gongsi/fa2f92669c66eee31Hc~.html" target="_blank" ka="seo-company-5">BOSS直聘</a>--%>
<%--                                    <a href="/gongsi/ea7d3fa5ae83526e1Xx409g~.html" target="_blank" ka="seo-company-6">乔氏车品</a>--%>
<%--                                    <a href="/gongsi/09fad0ef15edd3f403V62Ng~.html" target="_blank" ka="seo-company-7">4399游戏</a>--%>
<%--                                    <a href="/gongsi/f24ec0c4ee1e997d1HVy0w~~.html" target="_blank" ka="seo-company-8">掌门1对1</a>--%>
<%--                                    <a href="/gongsi/7b3f695df780b16e1XJy3dg~.html" target="_blank" ka="seo-company-9">易联众</a>--%>
<%--                                    <a href="/gongsi/651600e34022f69e1nR529y-.html" target="_blank" ka="seo-company-10">锐特信息</a>--%>
<%--                                    <a href="/gongsi/5d627415a46b4a750nJ9.html" target="_blank" ka="seo-company-11">阿里巴巴集团</a>--%>
<%--                                    <a href="/gongsi/91d03cd7f22bbfbb3nZ62w~~.html" target="_blank" ka="seo-company-12">神州鹰</a>--%>
<%--                                    <a href="/gongsi/59d4ed448adfd7db1HV42No~.html" target="_blank" ka="seo-company-13">九牧厨卫</a>--%>
<%--                                    <a href="/gongsi/a67b361452e384e71XV82N4~.html" target="_blank" ka="seo-company-14">今日头条</a>--%>
<%--                                    <a href="/gongsi/2c9fa6c6ba1068281HB43t4~.html" target="_blank" ka="seo-company-15">李宁公司</a>--%>
<%--                                    <a href="/gongsi/0a960d0216b58ea31nx-2w~~.html" target="_blank" ka="seo-company-16">创元邦达软件</a>--%>
<%--                                    <a href="/gongsi/5e139930da054b4233R43w~~.html" target="_blank" ka="seo-company-17">平安普惠</a>--%>
<%--                                    <a href="/gongsi/fbba8ee602719fe11nR_2tS_.html" target="_blank" ka="seo-company-18">孩子王</a>--%>
<%--                                    <a href="/gongsi/dd1db8274f5193c21nV42tS_.html" target="_blank" ka="seo-company-19">厦门本捷</a>--%>
<%--                                    <a href="/gongsi/8531731ebc286f821nV73t4~.html" target="_blank" ka="seo-company-20">京北方</a>--%>
<%--                                    <a href="/gongsi/5489c8629b74c3141Hx43Ns~.html" target="_blank" ka="seo-company-21">帮邦行</a>--%>
<%--                                    <a href="/gongsi/cf6b65d4b25a438403R92d4~.html" target="_blank" ka="seo-company-22">飞鱼科技</a>--%>
<%--                                    <a href="/gongsi/cee9c3b10e2213db3nN_0ts~.html" target="_blank" ka="seo-company-23">保障网</a>--%>
<%--                                    <a href="/gongsi/e6c331a363868bb91XJ509Q~.html" target="_blank" ka="seo-company-24">奥佳华</a>--%>
<%--                                    <a href="/gongsi/fb2c23c769f1ae5203R52tw~.html" target="_blank" ka="seo-company-25">衣邦人</a>--%>
<%--                                    <a href="/gongsi/f602f61dc658db0a1XZ63dg~.html" target="_blank" ka="seo-company-26">多米诺教育</a>--%>
<%--                                    <a href="/gongsi/3c9764d7e7b0c5e433V50t4~.html" target="_blank" ka="seo-company-27">平安普惠</a>--%>
<%--                                    <a href="/gongsi/35636452b60aff451nZ-2tm4.html" target="_blank" ka="seo-company-28">互动创想</a>--%>
<%--                                    <a href="/gongsi/929991d9982f5b381nR93Ng~.html" target="_blank" ka="seo-company-29">珍爱网</a>--%>
<%--                                    <a href="/gongsi/fab8bf569da89ef81nR63d20.html" target="_blank" ka="seo-company-30">美承集团</a>--%>
<%--                                    <a href="/gongsi/74112cee7ff26bcb1nd43NS8.html" target="_blank" ka="seo-company-31">上海利真</a>--%>
<%--                                    <a href="/gongsi/0f868a5bdedf367703F9.html" target="_blank" ka="seo-company-32">捷顺科技</a>--%>
<%--                                    <a href="/gongsi/1b28fe2d9ba585821XR809w~.html" target="_blank" ka="seo-company-33">朗新科技</a>--%>
<%--                                    <a href="/gongsi/bbba6a86b6c7fc243nx70tQ~.html" target="_blank" ka="seo-company-34">明源云</a>--%>
<%--                                    <a href="/gongsi/97881e9d90e3794b03F53N0~.html" target="_blank" ka="seo-company-35">千树科技</a>--%>
<%--                                    <a href="/gongsi/e85e275f5f9d2ddc1HNy39k~.html" target="_blank" ka="seo-company-36">博也教育</a>--%>
<%--                                    <a href="/gongsi/51a752c43a2d77e31Hd53Ns~.html" target="_blank" ka="seo-company-37">新通教育集团</a>--%>
<%--                                    <a href="/gongsi/0154b9fd7a5e58cc1nBz2Nk~.html" target="_blank" ka="seo-company-38">美联国际教育</a>--%>
<%--                                    <a href="/gongsi/e726798a1175de301X1939U~.html" target="_blank" ka="seo-company-39">三五互联</a>--%>
<%--                                    <a href="/gongsi/0bc562732fcf91fe3nJy.html" target="_blank" ka="seo-company-40">货拉拉科技</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="expand-btn"><a href="javascript:;" class="more-view"><span>展开</span><i class="fz fz-slidedown"></i></a></div>--%>
<%--                        </div>--%>
<%--                    </div>                --%>
                </div>
            </div>
        </div>
    </div>
</div>
<%--    <div id="footer" class="">--%>
<%--        <div class="inner home-inner">--%>
<%--            <div class="footer-social">--%>
<%--                <img src="https://static.zhipin.com/v2/web/geek/images/footer-logo.png" alt="">--%>
<%--                <p>企业服务热线和举报投诉 <span>400 065 5799</span></p>--%>
<%--                <p>工作日 <span>8:00 - 22:00</span></p>--%>
<%--                <p>休息日 <span>9:30 - 18:30</span></p>--%>
<%--                <p class="footer-icon">--%>
<%--                    <a href="http://www.weibo.com/bosszhipin" rel="nofollow" ka="link-weibo" target="_blank" class="icon-weibo"><span>官方微博</span></a>--%>
<%--                    <a href="javascript:;" class="icon-weixin" ka="link-weixin"><span>微信公众号</span><img src="https://static.zhipin.com/v2/web/geek/images/we_chat_qr.jpg" class="qrcode-weixin" /></a>--%>
<%--                    <a href="https://app.zhipin.com" class="icon-app" ka="link-downloadapp"><span>下载</span></a>--%>
<%--                </p>--%>
<%--            </div>--%>
<%--            <div class="footer-about clear-fix">--%>
<%--                <dl>--%>
<%--                    <dt>企业服务</dt>--%>
<%--                    <dd>--%>
<%--                        <a href="https://www.zhipin.com/job_detail/" ka="link-search">职位搜索</a>--%>
<%--                        <a href="https://news.zhipin.com/" ka="link-news">新闻资讯</a>--%>
<%--                        <a href="https://app.zhipin.com/" ka="link-app">BOSS直聘APP</a>--%>
<%--                    </dd>--%>
<%--                </dl>--%>
<%--                <dl>--%>
<%--                    <dt>使用与帮助</dt>--%>
<%--                    <dd>--%>
<%--                        <a href="https://www.zhipin.com/web/common/protocol/index.html" rel="nofollow" ka="link-privacy" target="_blank">平台协议</a>--%>
<%--                        <a href="https://www.zhipin.com/activity/cc/anticheatguide.html" rel="nofollow" ka="link-anticheatguide" target="_blank">防骗指南</a>--%>
<%--                        <a href="https://www.zhipin.com/activity/cc/usehelp.html" rel="nofollow" ka="link-usehelp" target="_blank">使用帮助</a>--%>
<%--                    </dd>--%>
<%--                </dl>--%>
<%--                <dl>--%>
<%--                    <dt>联系BOSS直聘</dt>--%>
<%--                    <dd>--%>
<%--                        <p>北京华品博睿网络技术有限公司</p>--%>
<%--                        <p>公司地址 北京市朝阳区太阳宫中路16号院1号楼18层1801内09</p>--%>
<%--                        <p>联系电话 010-84150633</p>--%>
<%--                        <p>违法和不良信息举报邮箱 <a class="report-mail" href="mailto:jubao@kanzhun.com" rel="nofollow">jubao@kanzhun.com</a></p>--%>
<%--                    </dd>--%>
<%--                </dl>--%>
<%--            </div>--%>
<%--            <div class="copyright">--%>
<%--                <p>--%>
<%--                    <span>Copyright © 2020 BOSS直聘</span><span>京ICP备14013441号-5</span><span>京ICP证150923号</span><span>京网文[2020]0399-066 号</span>--%>
<%--                    <span>--%>
<%--                     <a href="https://www.zhipin.com/activity/cc/businesslicense.html" rel="nofollow" ka="link-businesslicense" target="_blank">--%>
<%--                         <img src="https://static.zhipin.com/v2/web/geek/images/icon-badge-1.png" alt=""/>--%>
<%--                         电子营业执照--%>
<%--                     </a>--%>
<%--                </span>--%>
<%--                    <span><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010502032801" rel="nofollow" ka="link-beian" target="_blank"><img src="https://static.zhipin.com/v2/web/geek/images/icon-beian.png" alt=""/> 京公网安备11010502032801</a></span>--%>
<%--                    <span><a href="http://sdwj.zhipin.com/web/index.html" rel="nofollow" ka="link-sdwj" target="_blank">朝阳网警</a></span>--%>
<%--                    <span><a href="/web/common/protocol/hr-service.html" rel="nofollow" ka="link-hr-service" target="_blank">人力资源服务许可证</a></span>--%>
<%--                    <span><a href="https://www.12377.cn" rel="nofollow" ka="link-12377" target="_blank">网上有害信息举报专区</a></span>--%>
<%--                </p>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <!-- 通用侧边栏 -->
    <div id="siderbar">
        <div class="sider-index">
            <ul class="siderbar-top">
                <li data-value="interest">
                    <a href="javascript:;" ka="side_interest"><i class="icon-sider-interest"></i>感兴趣</a>
                </li>
                <li data-value="contact">
                    <a href="javascript:;" ka="side_chat"><i class="icon-sider-chat"></i>沟通过</a>
                </li>
                <li data-value="deliver">
                    <a href="javascript:;" ka="side_deliver"><i class="icon-sider-resume"></i>已投递</a>
                </li>
                <li data-value="interview">
                    <a href="javascript:;" ka="side_interview"><i class="icon-sider-interview"></i>面试</a>
                </li>
            </ul>
            <ul class="siderbar-bottom">
                <li>
                    <a class="siderbar-back-top" href="javascript:;" title="返回顶部"></a>
                </li>
                <li>
                    <a class="siderbar-service" href="javascript:;">客服</a >
                </li>
                <li>
                    <a class="siderbar-feedback" href="javascript:;">反馈</a>
                </li>
                <li>
                    <a class="siderbar-wechat" href="javascript:;">微信
                        <div class="qrcode-layer "><i></i><img src="https://static.zhipin.com/v2/web/geek/images/wechat-qrcode.jpg" alt="">关注BOSS直聘微信服务号</div>
                    </a>
                </li>
                <li>
                    <a class="siderbar-app" href="javascript:;">APP
                        <div class="qrcode-layer"><i></i><img src="/wapi/zpgeek/qrcode/generate.json?content=https%3A%2F%2Fwww.zhipin.com%2Fd%2Fv2%2F%3Ftype%3Dqr%26pkn%3Dmain-m%26sid%3Dmoren_14&w=200&h=200" alt="">下载BOSS直聘APP</div>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <!--通用注册登录-->
    <div class="sign-wrap sign-wrap-v2" style="display: none">





        <!--密码登录-->
        <div class="sign-form sign-pwd" style="display:none;">
            <div class="sign-slide-box">
                <a class="logo" href="https://www.zhipin.com/" ka="header-logo">
                    <img src="https://static.zhipin.com/v2/web/geek/images/logo.png">
                    <div>
                        <p>找工作</p >
                        <p>我要跟老板谈</p >
                    </div>
                </a>
                <ul>
                    <li>
                        <i class="icon"></i>
                        <span>沟通</span>
                        <span>在线职位及时沟通</span>
                    </li>
                    <li>
                        <i class="icon"></i>
                        <span>任性选</span>
                        <span>各大行业职位任你选</span>
                    </li>
                </ul>
            </div>
            <div class="sign-content">
                <div class="inner-box">
                    <h3 class="title">登录BOSS直聘</h3>
                    <form action="/wapi/zppassport/login/account" method="post">
                        <div class="sign-tab"><span class="link-signin cur">密码登录</span><span class="link-sms">短信登录</span><span class="link-scan">扫码登录</span></div>
                        <div class="tip-error tip-error-form"></div>
                        <div class="form-row row-select">
                            <span class="dropdown-select"><i class="icon-select-arrow"></i><em class="text-select">+86</em><input type="hidden" name="regionCode" value="+86"/></span>
                            <span class="ipt-wrap"><i class="icon-sign-phone"></i><input type="tel" class="ipt ipt-phone required" ka="signin-account" placeholder="手机号" name="account"/></span>
                            <div class="dropdown-menu">
                                <ul>
                                    <li data-val="+86"><span class="num">+86</span>中国大陆</li>
                                    <li data-val="+852"><span class="num">+852</span>中国香港</li>
                                    <li data-val="+853"><span class="num">+853</span>中国澳门</li>
                                    <li data-val="+886"><span class="num">+886</span>中国台湾</li>
                                    <li data-val="+1"><span class="num">+1</span>美国</li>
                                    <li data-val="+81"><span class="num">+81</span>日本</li>
                                    <li data-val="+44"><span class="num">+44</span>英国</li>
                                    <li data-val="+82"><span class="num">+82</span>韩国</li>
                                    <li data-val="+33"><span class="num">+33</span>法国</li>
                                    <li data-val="+7"><span class="num">+7</span>俄罗斯</li>
                                    <li data-val="+39"><span class="num">+39</span>意大利</li>
                                    <li data-val="+65"><span class="num">+65</span>新加坡</li>
                                    <li data-val="+63"><span class="num">+63</span>菲律宾</li>
                                    <li data-val="+60"><span class="num">+60</span>马来西亚</li>
                                    <li data-val="+64"><span class="num">+64</span>新西兰</li>
                                    <li data-val="+34"><span class="num">+34</span>西班牙</li>
                                    <li data-val="+95"><span class="num">+95</span>缅甸</li>
                                    <li data-val="+230"><span class="num">+230</span>毛里求斯</li>
                                    <li data-val="+263"><span class="num">+263</span>津巴布韦</li>
                                    <li data-val="+20"><span class="num">+20</span>埃及</li>
                                    <li data-val="+92"><span class="num">+92</span>巴基斯坦</li>
                                    <li data-val="+880"><span class="num">+880</span>孟加拉国</li>
                                </ul>                    </div>
                            <div class="tip-error"></div>
                        </div>
                        <div class="form-row">
                            <span class="ipt-wrap"><i class="icon-sign-pwd"></i><input type="password" class="ipt ipt-pwd required" ka="signin-password" placeholder="密码" name="password"/></span>
                            <div class="tip-error"></div>
                        </div>
                        <div class="form-row">
                            <div class="row-code" id="pwdVerrifyCode">
                            </div>
                            <div class="tip-error"></div>
                        </div>
                        <input type="hidden" name="csessionId">
                        <input type="hidden" name="csig">
                        <input type="hidden" name="ctoken">
                        <input type="hidden" name="cscene" value="nc_login">
                        <input type="hidden" value="FFFF0N00000000006DC1" name="cappKey">
                        <div class="form-btn">
                            <button type="submit" class="btn">登录</button>
                        </div>
                        <div class="text-tip">没有账号 <a href="javascript:;" class="link-signup">立即注册</a></div>
                    </form>
                </div>
            </div>
        </div>

        <!--短信登录-->
        <div class="sign-form sign-sms" style="display:none;">
            <div class="sign-slide-box">
                <a class="logo" href="https://www.zhipin.com/" ka="header-logo">
                    <img src="https://static.zhipin.com/v2/web/geek/images/logo.png">
                    <div>
                        <p>找工作</p >
                        <p>我要跟老板谈</p >
                    </div>
                </a>
                <ul>
                    <li>
                        <i class="icon"></i>
                        <span>沟通</span>
                        <span>在线职位及时沟通</span>
                    </li>
                    <li>
                        <i class="icon"></i>
                        <span>任性选</span>
                        <span>各大行业职位任你选</span>
                    </li>
                </ul>
            </div>
            <div class="sign-content">
                <div class="inner-box">
                    <h3 class="title">登录BOSS直聘</h3>
                    <form action="/wapi/zppassport/login/phone" method="post">
                        <div class="sign-tab"><span class="link-signin">密码登录</span><span class="link-sms cur">短信登录</span><span class="link-scan">扫码登录</span></div>
                        <div class="tip-error tip-error-form"></div>
                        <div class="form-row row-select">
                            <span class="dropdown-select"><i class="icon-select-arrow"></i><em class="text-select">+86</em><input type="hidden" name="regionCode" value="+86"/></span>
                            <span class="ipt-wrap"><i class="icon-sign-phone"></i><input type="tel" class="ipt ipt-phone required" ka="signin-account" placeholder="手机号" name="phone"/></span>
                            <div class="dropdown-menu">
                                <ul>
                                    <li data-val="+86"><span class="num">+86</span>中国大陆</li>
                                    <li data-val="+852"><span class="num">+852</span>中国香港</li>
                                    <li data-val="+853"><span class="num">+853</span>中国澳门</li>
                                    <li data-val="+886"><span class="num">+886</span>中国台湾</li>
                                    <li data-val="+1"><span class="num">+1</span>美国</li>
                                    <li data-val="+81"><span class="num">+81</span>日本</li>
                                    <li data-val="+44"><span class="num">+44</span>英国</li>
                                    <li data-val="+82"><span class="num">+82</span>韩国</li>
                                    <li data-val="+33"><span class="num">+33</span>法国</li>
                                    <li data-val="+7"><span class="num">+7</span>俄罗斯</li>
                                    <li data-val="+39"><span class="num">+39</span>意大利</li>
                                    <li data-val="+65"><span class="num">+65</span>新加坡</li>
                                    <li data-val="+63"><span class="num">+63</span>菲律宾</li>
                                    <li data-val="+60"><span class="num">+60</span>马来西亚</li>
                                    <li data-val="+64"><span class="num">+64</span>新西兰</li>
                                    <li data-val="+34"><span class="num">+34</span>西班牙</li>
                                    <li data-val="+95"><span class="num">+95</span>缅甸</li>
                                    <li data-val="+230"><span class="num">+230</span>毛里求斯</li>
                                    <li data-val="+263"><span class="num">+263</span>津巴布韦</li>
                                    <li data-val="+20"><span class="num">+20</span>埃及</li>
                                    <li data-val="+92"><span class="num">+92</span>巴基斯坦</li>
                                    <li data-val="+880"><span class="num">+880</span>孟加拉国</li>
                                </ul>                    </div>
                            <div class="tip-error"></div>
                        </div>
                        <div class="form-row">
                            <div class="row-code" id="loginVerrifyCode">
                            </div>
                            <div class="tip-error"></div>
                        </div>
                        <input type="hidden" name="csessionId">
                        <input type="hidden" name="csig">
                        <input type="hidden" name="ctoken">
                        <input type="hidden" name="cscene" value="nc_login">
                        <input type="hidden" value="FFFF0N00000000006DC1" name="cappKey">
                        <div class="form-row">
                        <span class="ipt-wrap"><i class="icon-sign-sms"></i><input type="text" class="ipt ipt-sms required" ka="signup-sms" placeholder="短信验证码" name="phoneCode" maxlength="6"/><input
                                type="hidden" name="smsType" value="1"/><button type="button" class="btn btn-sms" data-url="/wapi/zppassport/send/smsCode">发送验证码</button></span>
                            <div class="tip-error"></div>
                        </div>
                        <div class="form-btn">
                            <button type="submit" class="btn">登录</button>
                        </div>
                        <div class="text-tip">没有账号 <a href="javascript:;" class="link-signup">立即注册</a></div>
                    </form>
                </div>
            </div>
        </div>

        <!--扫码登录-->
        <div class="sign-form sign-scan" style="display:none;">
            <div class="sign-slide-box">
                <a class="logo" href="https://www.zhipin.com/" ka="header-logo">
                    <img src="https://static.zhipin.com/v2/web/geek/images/logo.png">
                    <div>
                        <p>找工作</p >
                        <p>我要跟老板谈</p >
                    </div>
                </a>
                <ul>
                    <li>
                        <i class="icon"></i>
                        <span>沟通</span>
                        <span>在线职位及时沟通</span>
                    </li>
                    <li>
                        <i class="icon"></i>
                        <span>任性选</span>
                        <span>各大行业职位任你选</span>
                    </li>
                </ul>
            </div>
            <div class="sign-content">
                <div class="inner-box">
                    <div class="tip-error tip-error-form"></div>
                    <div class="sign-tab"><span class="link-signin">密码登录</span><span class="link-sms">短信登录</span><span class="link-scan cur">扫码登录</span></div>
                    <div class="qrcode-box">
                        <input type="hidden" class="uuid" value=""/>
                        <p><span>使用 BOSS直聘 APP 扫码登录</span><em>扫码帮助</em></p>
                        <div class="qrcodeimg-box">
                            <div class="invalid-box">
                                <p>请重新刷新二维码</p>
                                <button class="btn">点击刷新</button>
                            </div>
                            <img src="" data-url="https://www.zhipin.com/qrscan/dispatcher?qrId="/>
                        </div>
                        <div class="qrcode-tip"><span class="gray">知道了</span>Boss现在也可以使用密码和短信登录了</div>
                        <div class="hover-range-left"></div>
                        <div class="hover-range-right"></div>
                        <div class="sign-scan-help animation">
                            <h4>扫码帮助</h4>
                            <ul class="scan-help-tab">
                                <li class="active">我是BOSS</li>
                                <li>我是牛人</li>
                            </ul>
                            <div class="sub-title">我的&nbsp;&gt;&nbsp;登录网页版</div>
                            <ul class="scan-help-content">
                                <li class="help-boss active"></li>
                                <li class="help-geek"></li>
                            </ul>
                        </div>
                    </div>
                    <div class="text-tip">没有账号 <a href="javascript:;" class="link-signup">立即注册</a></div>
                    <div class="login-step-box" >
                        <div class="user-photo">
                            <img src="">
                        </div>
                        <div class="login-step-text">
                            <h3 class="login-step-title">扫描成功</h3>
                            <p class="login-step-detail">请在App端确认登录</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--注册-->
        <div class="sign-form sign-register" style="display:block;">
            <div class="sign-slide-box">
                <a class="logo" href="https://www.zhipin.com/" ka="header-logo">
                    <img src="https://static.zhipin.com/v2/web/geek/images/logo.png">
                    <div>
                        <p>找工作</p >
                        <p>我要跟老板谈</p >
                    </div>
                </a>
                <ul class="geek-slide ">
                    <li>
                        <i class="icon"></i>
                        <span>沟通</span>
                        <span>在线职位及时沟通</span>
                    </li>
                    <li>
                        <i class="icon"></i>
                        <span>任性选</span>
                        <span>各大行业职位任你选</span>
                    </li>
                </ul>
                <ul class="boss-slide hide">
                    <li>
                        <i class="icon"></i>
                        <span>招聘效果好</span>
                        <span>与职场牛人在线开聊</span>
                    </li>
                    <li>
                        <i class="icon"></i>
                        <span>更多在线牛人</span>
                        <span>入职速度快</span>
                    </li>
                    <li>
                        <i class="icon"></i>
                        <span>人才匹配度高</span>
                        <span>获取更精准的牛人</span>
                    </li>
                </ul>
            </div>
            <div class="sign-content">
                <div class="inner-box">
                    <h3 class="title">注册BOSS直聘</h3>
                    <form action="/wapi/zppassport/user/registered" method="post">
                        <input type="hidden" name="act" value="">
                        <input type="hidden" name="purpose" value="">
                        <h4></h4>
                        <div class="tip-error tip-error-form"></div>
                        <div class="form-row row-select">
                            <span class="dropdown-select"><i class="icon-select-arrow"></i><em class="text-select">+86</em><input type="hidden" name="regionCode" value="+86"/></span>
                            <span class="ipt-wrap"><i class="icon-sign-phone"></i><input type="tel" class="ipt ipt-phone required" ka="signin-account" placeholder="手机号" name="phone"/></span>
                            <div class="dropdown-menu">
                                <ul>
                                    <li data-val="+86"><span class="num">+86</span>中国大陆</li>
                                    <li data-val="+852"><span class="num">+852</span>中国香港</li>
                                    <li data-val="+853"><span class="num">+853</span>中国澳门</li>
                                    <li data-val="+886"><span class="num">+886</span>中国台湾</li>
                                    <li data-val="+1"><span class="num">+1</span>美国</li>
                                    <li data-val="+81"><span class="num">+81</span>日本</li>
                                    <li data-val="+44"><span class="num">+44</span>英国</li>
                                    <li data-val="+82"><span class="num">+82</span>韩国</li>
                                    <li data-val="+33"><span class="num">+33</span>法国</li>
                                    <li data-val="+7"><span class="num">+7</span>俄罗斯</li>
                                    <li data-val="+39"><span class="num">+39</span>意大利</li>
                                    <li data-val="+65"><span class="num">+65</span>新加坡</li>
                                    <li data-val="+63"><span class="num">+63</span>菲律宾</li>
                                    <li data-val="+60"><span class="num">+60</span>马来西亚</li>
                                    <li data-val="+64"><span class="num">+64</span>新西兰</li>
                                    <li data-val="+34"><span class="num">+34</span>西班牙</li>
                                    <li data-val="+95"><span class="num">+95</span>缅甸</li>
                                    <li data-val="+230"><span class="num">+230</span>毛里求斯</li>
                                    <li data-val="+263"><span class="num">+263</span>津巴布韦</li>
                                    <li data-val="+20"><span class="num">+20</span>埃及</li>
                                    <li data-val="+92"><span class="num">+92</span>巴基斯坦</li>
                                    <li data-val="+880"><span class="num">+880</span>孟加拉国</li>
                                </ul>                    </div>
                            <div class="tip-error"></div>
                        </div>
                        <div class="form-row">
                            <div class="row-code" id="regVerrifyCode"></div>
                            <div class="tip-error"></div>
                        </div>

                        <input type="hidden" name="csessionId">
                        <input type="hidden" name="csig">
                        <input type="hidden" name="ctoken">
                        <input type="hidden" name="cscene" value="nc_login">
                        <input type="hidden" value="FFFF0N00000000006DC1" name="cappKey">
                        <div class="form-row">
                  <span class="ipt-wrap"><i class="icon-sign-sms"></i>
                      <input type="text" class="ipt ipt-sms required" ka="signup-sms" placeholder="短信验证码" name="phoneCode" maxlength="6"/>
                      <input type="hidden" name="smsType" value="2"/>
                      <button type="button" class="btn btn-sms" data-url="/wapi/zppassport/send/smsCode">发送验证码</button>
                  </span>
                            <div class="tip-error"></div>
                        </div>
                        <div class="form-btn">
                            <button type="submit" class="btn">注册</button>
                        </div>
                        <div class="text-tip">
                            <a href="https://www.zhipin.com/activity/cc/registerprotocol.html" target="_blank" class="user-agreement">注册代表你已同意用户协议及隐私政策</a>
                            <a href="javascript:;" class="link-signin">直接登录</a>
                        </div>
                    </form>
                </div>
                <div class="btn-switch ewm-switch">
                    <div class="switch-tip">微信极速注册<i class="icon-triangle"></i></div>
                </div>
            </div>
        </div>

        <!--扫码小程序注册-->
        <div class="sign-form sign-miniapp" style="display: none;">
            <div class="sign-slide-box">
                <a class="logo" href="https://www.zhipin.com/" ka="header-logo">
                    <img src="https://static.zhipin.com/v2/web/geek/images/logo.png">
                    <div>
                        <p>找工作</p >
                        <p>我要跟老板谈</p >
                    </div>
                </a>
                <ul>
                    <li>
                        <i class="icon"></i>
                        <span>沟通</span>
                        <span>在线职位及时沟通</span>
                    </li>
                    <li>
                        <i class="icon"></i>
                        <span>任性选</span>
                        <span>各大行业职位任你选</span>
                    </li>
                </ul>
            </div>
            <div class="sign-content">
                <div class="inner-box">
                    <input type="hidden" class="scene" value="db087e4e76e3409386cd0995ef7a38c0"/>
                    <h4>微信快速注册</h4>
                    <div class="qrcodeimg-box">
                        <div class="invalid-box">
                            <p>请重新刷新二维码</p>
                            <button class="btn">点击刷新</button>
                        </div>
                        <img src="" data-url="https://www.zhipin.com/qrscan/dispatcher?qrId=db087e4e76e3409386cd0995ef7a38c0">
                    </div>
                    <p class="sign-tip">请用微信“扫一扫”扫描上方二维码<br/>进入快捷注册</p>
                    <div class="text-tip">已有账号 <a href="javascript:;" class="link-signin">立即登录</a></div>
                </div>
                <div class="btn-switch phone-switch">
                    <div class="switch-tip">手机号注册在这里<i class="icon-triangle"></i></div>
                </div>
            </div>
        </div>

        <!--扫码小程序注册成功-->
        <div class="sign-form sign-succ">
            <h3 class="title">注册BOSS直聘</h3>
            <img class="img-succ" src="https://static.zhipin.com/zhipin-geek/v331/web/geek/images/success.png"/>
            <p>注册成功，即将跳转完善流程</p>
            <div class="btn-switch phone-switch"></div>
        </div>

        <!--注册成功完善简历-->
        <div class="sign-form sign-welcome">
            <h3 class="title">欢迎来到BOSS直聘</h3>
            <div class="welcome-box">
                <div class="welcome-text">
                    <b>快速完善简历</b>
                    <p>做好与Boss对话前的准备吧。</p>
                </div>
                <img src="https://static.zhipin.com/v2/web/geek/images/icon-sign-welcome.png" alt=""/>
                <div class="form-btn"><a ka="registe-complete" href="/web/geek/guide" class="btn">开始完善</a>
                </div>
                <div class="count-down"><em class="num">3s</em> 后自动跳转</div>
            </div>
        </div>    </div>

    <div class="container-mes">
        <ul class="message">
            <li><span class="text">你好</span></li>
            <li><span class="text">可以聊聊吗</span></li>
            <li><span class="text">我是谁谁谁我是谁谁谁</span></li>
        </ul>
        <div class="avatar">
            <img src="https://img.bosszhipin.com/beijin/upload/tmp/20201111/fc8b5a3333d3a69e01fcaf63633dce41839d4521942b5b4a0b31b099124b8086_s.jpg?x-oss-process=image/resize,w_100,limit_0" />
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
<!--简历预览-->
<div id="pop-resume">
    <!--关闭按钮-->
    <div class="pop-resume-close">
        <img src="https://static.zhipin.com/zhipin-geek/v331/web/geek/images/pop-resume-close.png" ka="user-resume-pop-resume-close"/>
    </div>
    <!--正在上传-->
    <div class="pop-item pop-loading">
        <div class="content">
            <img src="https://static.zhipin.com/zhipin-geek/v331/web/geek/images/in_upload.png" class="resume-icon"/>
            <p class="text">正在上传中</p>
            <img src="https://static.zhipin.com/zhipin-geek/v331/web/geek/images/loading.gif" class="pop-loading-pic"/>
        </div>
        <div class="des">
            <h4>上传简历</h4>
            <div class="resume-title">王家卫-3年Java.doc</div>
            <p>附件简历将在投递后被Boss预览查看，请 确认显示正确</p>
        </div>
    </div>
    <!--上传成功 预览-->
    <div class="pop-item pop-success">
        <div class="content">
            <img src="" class="resume-pic"/>
        </div>
        <div class="des">
            <h4>上传简历</h4>
            <div class="resume-title">王家卫-3年Java.doc</div>
            <p>附件简历将在投递后被Boss预览查看，请 确认显示正确</p>
            <div class="btn btn-confim" ka="user-resume-save" >确定</div>
            <div class="btn btn-change" ka="user-resume-edit-upload" >更改附件简历</div>
        </div>
    </div>
    <!--上传失败-->
    <div class="pop-item pop-fail">
        <div class="content">
            <img src="https://static.zhipin.com/zhipin-geek/v331/web/geek/images/upload-fail.png" class="resume-icon"/>
            <div class="title upload-fail">上传失败</div>
            <p class="msg">请重新上传，如仍然无法成功，可尝试更改文件格式</p>
        </div>
        <div class="des">
            <h4>上传简历</h4>
            <div class="resume-title">王家卫-3年Java.doc</div>
            <p>附件简历将在投递后被Boss预览查看，请 确认显示正确</p>
            <div class="btn upload-again" ka="user-resume-upload-fail-reupload" >重新上传</div>
            <p>支持 doc、docx、pdf、jpg、png 格式</p>
        </div>
    </div>
    <!--预览失败-->
    <div class="pop-item preview-fail">
        <div class="content">
            <img src="https://static.zhipin.com/zhipin-geek/v331/web/geek/images/upload-fail.png" class="resume-icon"/>
            <div class="title preview-fail">预览失败</div>
            <div class="msg">点击<a href="javascript:;" class="preview-refresh" ka="user-resume-refresh" >刷新</a>重新预览</div>
            <img src="https://static.zhipin.com/zhipin-geek/v331/web/geek/images/loading.gif" class="resume-loading"/>
        </div>
        <div class="des">
            <h4>上传简历</h4>
            <div class="resume-title">王家卫-3年Java.doc</div>
            <p>附件简历将在投递后被Boss预览查看，请 确认显示正确</p>
            <div class="btn upload-again" ka="user-resume-preview-fail-reupload">重新上传</div>
            <p>支持 doc、docx、pdf、jpg、png 格式</p>
        </div>
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
<%--<script>--%>
<%--    function get_share_datas_from_html_inapp() {--%>
<%--        var shid = "shdefault",--%>
<%--            urlShid,--%>
<%--            urlSid,--%>
<%--            pk = "pkdefault",--%>
<%--            pp = "ppdefault",--%>
<%--            pkn = (typeof _PK != 'undefined' ? _PK : document.getElementById("page_key_name")),--%>
<%--            getQueryString = function(name) {--%>
<%--                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"),--%>
<%--                    r = window.location.search.substr(1).match(reg);--%>
<%--                if (r != null) {--%>
<%--                    return unescape(r[2])--%>
<%--                }--%>
<%--                return null;--%>
<%--            };--%>
<%--        urlShid = getQueryString("shid");--%>
<%--        urlSid = getQueryString("sid");--%>
<%--        if (urlShid) {--%>
<%--            shid = urlShid;--%>
<%--        } else if (urlSid) {--%>
<%--            shid = urlSid;--%>
<%--        }--%>
<%--        if (pkn) {--%>
<%--            var pknVal = pkn.value;--%>
<%--            if (pknVal) {--%>
<%--                var pkArray = pknVal.split("|");--%>
<%--                if (pkArray.length == 1) {--%>
<%--                    pk = pkArray[0];--%>
<%--                } else if (pkArray.length >= 2) {--%>
<%--                    pk = pkArray[0];--%>
<%--                    pp = pkArray[1];--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>
<%--        var ret = [];--%>
<%--        ret["shid"] = shid;--%>
<%--        ret["pk"] = pk;--%>
<%--        ret["pp"] = pp;--%>
<%--        return ret;--%>
<%--    }--%>
<%--    function getQueryString(name)--%>
<%--    {--%>
<%--        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");--%>
<%--        var r = window.location.search.substr(1).match(reg);--%>
<%--        if(r!=null)return  unescape(r[2]); return null;--%>
<%--    }--%>
<%--</script>--%>
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
    // var _T = _T || [];
    // (function() {
    //     var script = document.createElement("script");
    //     script.src = "https://static.zhipin.com/library/js/analytics/ka.zhipin.min.js";
    //     var s = document.getElementsByTagName("script")[0];
    //     s.parentNode.insertBefore(script, s);
    // })();
    //
    // var _hmt = _hmt || [];
    // (function() {
    //     var hm = document.createElement("script");
    //     hm.src = "//hm.baidu.com/hm.js?194df3105ad7148dcf2b98a91b5e727a";
    //     var s = document.getElementsByTagName("script")[0];
    //     s.parentNode.insertBefore(hm, s);
    // })();



</script>
<%--<script type="application/ld+json">--%>
<%--    {--%>
<%--        "@context": "https://zhanzhang.baidu.com/contexts/cambrian.jsonld",--%>
<%--        "@id": "https://www.zhipin.com/job_detail/d5632e1152a89f521nV639m9F1FZ.html",--%>
<%--        "title": "「资产负债_软件开发岗（应届）招聘」_建信金科招聘-BOSS直聘",--%>
<%--        "description": "建信金科资产负债_软件开发岗（应届）招聘，薪资：8-13K，地点：厦门，要求：1年以内，学历：本科，福利：五险一金、补充医疗保险、定期体检、年终奖、带薪年假、餐补、节日福利、员工关怀、工会福利，资产负债业务高级经理刚刚在线，随时随地直接开聊。",--%>
<%--        "pubDate": "2020-11-16T09:32:20",--%>
<%--        "upDate":  "2020-11-19T22:41:42"--%>
<%--    }--%>
<%--</script>--%>
</html>
