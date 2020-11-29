<%--
  Created by IntelliJ IDEA.
  User: WUWX
  Date: 2020/11/16
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>岗位信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js" crossorigin="anonymous"></script>
    <script src="https://static.zhipin.com/zhipin-geek/v334/web/geek/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
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
                        layer.msg('删除成功')
                        location.reload()
                    } else if (data == "lose") {
                        layer.msg("添加失败")
                    }
                },
                error: function () {
                    layer.msg('网络繁忙')
                }
            })
        }
    </script>
</head>
<body>

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
<%--                <li class=""><a ka="header_brand" href="https://www.zhipin.com/gongsi/">校招</a></li>--%>
                <li><a href="${pageContext.request.contextPath}/project" target="_blank">项目</a></li>
                <li class=""><a ka="header-app" href="${pageContext.request.contextPath}/course/homePage">课程</a></li>
                <li class=""><a ka="header-article" href="${pageContext.request.contextPath}/zhengshu/cshouye">证书</a></li>
            </ul>
        </div>

        <div class="user-nav" style="margin-top: 20px">

                <ul>
<%--                    <li class=""><a ka="header-message" href="https://www.zhipin.com/web/geek/chat">消息<span class="nav-chat-num"></span></a></li>--%>
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
                </ul>
        </div>
    </div>
</div>


<form class="layui-form">
<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" style="width: 70%;margin-left: 15%;margin-top: 2%">
    <input type="hidden" id="count" value="${count}">
    <input type="hidden" id="limit" value="${limit}">
    <input type="hidden" id="curr" value="${curr}">
    <ul class="layui-tab-title" >
        <li  <c:if test="${not empty posts}">class="layui-this"</c:if> lay-id="resumeInfo">感兴趣</li>
        <li  <c:if test="${not empty postss}">class="layui-this"</c:if> lay-id="resumeCommit">已投递</li>
        <li lay-id="deliveryInfo" <c:if test="${not empty postsss}">class="layui-this"</c:if> >投递反馈</li>
        <li lay-id="communication" <c:if test="${not empty postssss}">class="layui-this"</c:if>>沟通过</li>
    </ul>
    <div class="layui-tab-content" style="height: 90%">
        <c:if test="${zanwu1==1}"><h2>暂无感兴趣岗位</h2></c:if>
        <c:if test="${zanwu1==2}"><h2>暂无投递岗位</h2></c:if>
        <c:if test="${zanwu1==3}"><h2>暂无投递反馈</h2></c:if>
        <c:if test="${zanwu1==4}"><h2>暂无沟通公司</h2></c:if>
        <div class="layui-tab-item <c:if test="${not empty posts}"> layui-show</c:if>">

            <c:if test="${not empty posts}">

            <div id="wrap" class=""><c:if test="${not empty posts}">
                <div id="main" class="inner"><c:if test="${not empty posts}">
                    <div id="container" class="resume-container">
                        <div class="resume-content">
                            <!---->
                            <div class="resume-content-box">

                                <div class="resume-box"><c:if test="${not empty posts}">
                                    <div id="userinfo" class="resume-item resume-userinfo"><c:if test="${not empty posts}">
                                        <div id="purpose" class="resume-item resume-purpose">
                                            <c:if test="${not empty posts}">
                                                <c:forEach var="post" items="${posts}">
                                                    <div class="item-primary">
                                                        <h3 class="title"> ${post.backUser.bUserName} <a href="javascript:;" ka="user-resume-add-expectation"
                                                                                  class="link-add"><svg class="icon-svg">
                                                            <use xlink:href="#icon-svg-add"></use>
                                                        </svg><span onclick="postDel(${post.pPostId})">取消感兴趣</span></a>
                                                        </h3>
                                                        <ul>
                                                            <li ka="user-resume-edit-expectation0" class="">
                                                                <div class="primary-info">
                                                                    <div class="info-labels"><span class="prev-line"><span
                                                                            class="label-text"><i class="fz-resume fz-job"></i><a onclick="">${post.postName}</a>
                                                        </span></span><span class="prev-line"><i
                                                                            class="fz-resume fz-salary"></i>${post.minSalary}--${post.maxSalary}k </span>
                                                                        <span class="prev-line"><i
                                                                                class="fz-resume fz-place"></i> ${post.jobDescription} </span></div>
                                                                </div>
                                                                <div class="op op-show">
                                                                    <!----><a href="${pageContext.request.contextPath}/homePage/compProfile?bUserId=${post.backUser.bUserId}" ka="user-resume-edit-expectation0"
                                                                              class="link-edit"><svg class="icon-svg">
                                                                    <use xlink:href="#icon-svg-edit"></use>
                                                                </svg><span>${post.backUser.compName}</span></a><a href="javascript:;" ka="user-resume-edit-expectation0"
                                                                                              class="link-edit"><svg class="icon-svg">
                                                                    <use xlink:href="#icon-svg-edit"></use>
                                                                </svg><span onclick="window.open('${pageContext.request.contextPath}/rec/userChat?compID=${post.backUser.bUserId}')">继续沟通</span></a></div>
                                                            </li>
                                                            <li ka="user-resume-edit-expectation0" class="">
                                                                <div class="primary-info">
                                                                    <div class="info-labels"><span class="prev-line"><span
                                                                            class="label-text"><i class="fz-resume fz-job"></i> ${post.workYear}
                                                        </span></span><span class="prev-line"><i
                                                                            class="fz-resume fz-salary"></i> ${post.education} </span><span
                                                                            class="prev-line"><i class="fz-resume fz-salary"></i>
                                                        ${post.jobBenefits} </span></div>
                                                                </div>

                                                            </li>
                                                        </ul>
                                                    </div>
                                                </c:forEach>
                                            </c:if>

                                        </div></c:if>
                                    </div></c:if>
                                </div>
                                <div id="fenye" style="text-align: center"></div>
                            </div>
                        </div>
<%--                        <div class="user-sider" style="height: 600px;background: #fff;">--%>
<%--                            <div data-v-3b220faa="" class="sider-box sider-resume">--%>
<%--                                <div data-v-3b220faa="" class="resume-attachment">--%>
<%--                                    <h3 data-v-3b220faa="" class="sider-title">附件管理--%>
<%--                                    </h3>--%>
<%--                                    <div data-v-3b220faa="" class="btns"><button data-v-3b220faa="" type="button"--%>
<%--                                                                                 class="btn btn-primary">上传简历</button>--%>
<%--                                    </div>--%>
<%--                                    <div data-v-3b220faa="" class="">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                </div></c:if>
            </div></c:if>
            </c:if>
        </div>
        <div class="layui-tab-item <c:if test="${not empty postss}">layui-show</c:if>">
            <c:if test="${not empty postss}">
                <div id="wrap" class=""><c:if test="${not empty postss}">
                    <div id="main" class="inner"><c:if test="${not empty postss}">
                        <div id="container" class="resume-container">
                            <div class="resume-content">
                                <!---->
                                <div class="resume-content-box">

                                    <div class="resume-box"><c:if test="${not empty postss}">
                                        <div id="userinfo" class="resume-item resume-userinfo"><c:if test="${not empty postss}">
                                            <div id="purpose" class="resume-item resume-purpose">
                                                <c:if test="${not empty postss}">
                                                    <c:forEach var="post" items="${postss}">
                                                        <div class="item-primary">
                                                            <h3 class="title"> ${post.backUser.bUserName}
                                                            </h3>
                                                            <ul>
                                                                <li ka="user-resume-edit-expectation0" class="">
                                                                    <div class="primary-info">
                                                                        <div class="info-labels"><span class="prev-line"><span
                                                                                class="label-text"><i class="fz-resume fz-job"></i><a >${post.postName}</a>
                                                        </span></span><span class="prev-line"><i
                                                                                class="fz-resume fz-salary"></i> ${post.minSalary}--${post.maxSalary}k </span>
                                                                            <span class="prev-line"><i
                                                                                    class="fz-resume fz-place"></i> ${post.jobDescription} </span></div>
                                                                    </div>
                                                                    <div class="op op-show">
                                                                        <!----><a href="${pageContext.request.contextPath}/homePage/compProfile?bUserId=${post.backUser.bUserId}" ka="user-resume-edit-expectation0"
                                                                                  class="link-edit"><svg class="icon-svg">
                                                                        <use xlink:href="#icon-svg-edit"></use>
                                                                    </svg><span>${post.backUser.compName}</span></a><a href="javascript:;" ka="user-resume-edit-expectation0"
                                                                                                  class="link-edit"><svg class="icon-svg">
                                                                        <use xlink:href="#icon-svg-edit"></use>
                                                                    </svg><span onclick="window.open('${pageContext.request.contextPath}/rec/userChat?compID=${post.backUser.bUserId}')">继续沟通</span></a></div>
                                                                </li>
                                                                <li ka="user-resume-edit-expectation0" class="">
                                                                    <div class="primary-info">
                                                                        <div class="info-labels"><span class="prev-line"><span
                                                                                class="label-text"><i class="fz-resume fz-job"></i> ${post.workYear}
                                                        </span></span><span class="prev-line"><i
                                                                                class="fz-resume fz-salary"></i> ${post.education} </span><span
                                                                                class="prev-line"><i class="fz-resume fz-salary"></i>
                                                        ${post.jobBenefits} </span></div>
                                                                    </div>

                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>

                                            </div></c:if>
                                        </div></c:if>
                                    </div>
                                    <div id="fenye2" style="text-align: center"></div>
                                </div>
                            </div>
                                <%--                        <div class="user-sider" style="height: 600px;background: #fff;">--%>
                                <%--                            <div data-v-3b220faa="" class="sider-box sider-resume">--%>
                                <%--                                <div data-v-3b220faa="" class="resume-attachment">--%>
                                <%--                                    <h3 data-v-3b220faa="" class="sider-title">附件管理--%>
                                <%--                                    </h3>--%>
                                <%--                                    <div data-v-3b220faa="" class="btns"><button data-v-3b220faa="" type="button"--%>
                                <%--                                                                                 class="btn btn-primary">上传简历</button>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div data-v-3b220faa="" class="">--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                                <%--                            </div>--%>
                                <%--                        </div>--%>
                        </div>
                    </div></c:if>
                </div></c:if>
            </c:if>


        </div>
        <div class="layui-tab-item <c:if test="${not empty postsss}" >layui-show</c:if>">
            <c:if test="${not empty postsss}">
                <div id="wrap" class=""><c:if test="${not empty postsss}">
                <div id="main" class="inner"><c:if test="${not empty postsss}">
                <div id="container" class="resume-container">
                    <div class="resume-content">
                        <!---->
                        <div class="resume-content-box">

                            <div class="resume-box"><c:if test="${not empty postsss}">
                                <div id="userinfo" class="resume-item resume-userinfo"><c:if test="${not empty postsss}">
                                    <div id="purpose" class="resume-item resume-purpose">
                                        <c:if test="${not empty postsss}">
                                            <c:forEach var="post" items="${postsss}">
                                                <div class="item-primary">
                                                    <h3 class="title"> ${post.backUser.compName}--${post.postName}的反馈信息
                                                    </h3>
                                                    <ul>
                                                        <li ka="user-resume-edit-expectation0" class="">
                                                            <div class="primary-info">
                                                                <div class="info-labels"><span class="prev-line"><span
                                                                        class="label-text"><i class=" "></i>简历状态:${post.parameter.paramName}
                                                                    &nbsp; &nbsp; <i>${post.delivery.feedBackTime}</i>
                                                        </span>
<%--                                                                </span><span class="prev-line"><i--%>
<%--                                                                        class="fz-resume fz-salary"></i> ${post.minSalary}--${post.maxSalary}k </span>--%>
<%--                                                                    <span class="prev-line"><i--%>
<%--                                                                            class="fz-resume fz-place"></i> ${post.jobDescription} </span>--%>
                                                                </div>
                                                            </div>
                                                            <div class="op op-show">
<%--                                                                <!----><a href="javascript:;" ka="user-resume-edit-expectation0"--%>
<%--                                                                          class="link-edit"><svg class="icon-svg">--%>
<%--                                                                <use xlink:href="#icon-svg-edit"></use>--%>
<%--                                                            </svg><span>${post.backUser.compName}</span></a>--%>
                                                                <a href="javascript:;" ka="user-resume-edit-expectation0"
                                                                                                               class="link-edit"><svg class="icon-svg">
                                                                <use xlink:href="#icon-svg-edit"></use>
                                                            </svg><span onclick="postInfo(${post.pPostId})">岗位详情</span></a></div>
                                                        </li>
                                                        <li ka="user-resume-edit-expectation0" class="">
                                                            <div class="primary-info">
                                                                <div class="info-labels"><span class="prev-line"><span
                                                                        class="label-text"><i class="fz-resume fz-job"></i> 反馈信息：${post.delivery.feedBackInfo}
                                                        </span></span>
<%--                                                                    <span class="prev-line"><i--%>
<%--                                                                        class="fz-resume fz-salary"></i> ${post.education} </span><span--%>
<%--                                                                        class="prev-line"><i class="fz-resume fz-salary"></i>--%>
<%--                                                        ${post.jobBenefits} </span>--%>
                                                                </div>
                                                            </div>

                                                        </li>
                                                    </ul>
                                                </div>
                                            </c:forEach>
                                        </c:if>

                                    </div></c:if>
                                </div></c:if>
                            </div>
                            <div id="fenye3" style="text-align: center"></div>
                        </div>
                    </div>
                        <%--                        <div class="user-sider" style="height: 600px;background: #fff;">--%>
                        <%--                            <div data-v-3b220faa="" class="sider-box sider-resume">--%>
                        <%--                                <div data-v-3b220faa="" class="resume-attachment">--%>
                        <%--                                    <h3 data-v-3b220faa="" class="sider-title">附件管理--%>
                        <%--                                    </h3>--%>
                        <%--                                    <div data-v-3b220faa="" class="btns"><button data-v-3b220faa="" type="button"--%>
                        <%--                                                                                 class="btn btn-primary">上传简历</button>--%>
                        <%--                                    </div>--%>
                        <%--                                    <div data-v-3b220faa="" class="">--%>
                        <%--                                    </div>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                </div>
                </div></c:if>
                </div></c:if>
            </c:if>
        </div>
        <div class="layui-tab-item  <c:if test="${not empty postssss}" >layui-show</c:if>">
            <c:if test="${not empty postssss}">
                <div id="wrap" class=""><c:if test="${not empty postssss}">
                <div id="main" class="inner"><c:if test="${not empty postssss}">
                <div id="container" class="resume-container">
                    <div class="resume-content">
                        <!---->
                        <div class="resume-content-box">

                            <div class="resume-box"><c:if test="${not empty postssss}">
                                <div id="userinfo" class="resume-item resume-userinfo"><c:if test="${not empty postssss}">
                                    <div id="purpose" class="resume-item resume-purpose">
                                        <c:if test="${not empty postssss}">
                                            <c:forEach var="post" items="${postssss}">
                                                <div class="item-primary">
                                                    <h3 class="title"> ${post.bUserName}
                                                    </h3>
                                                    <ul>
                                                        <li ka="user-resume-edit-expectation0" class="">
                                                            <div class="primary-info">
                                                                <div class="info-labels"><span class="prev-line"><span
                                                                        class="label-text"><i class=" "></i>${post.compName}
                                                                    &nbsp; &nbsp;
                                                        </span>
<%--                                                                </span><span class="prev-line"><i--%>
<%--                                                                        class="fz-resume fz-salary"></i> ${post.minSalary}--${post.maxSalary}k </span>--%>
<%--                                                                    <span class="prev-line"><i--%>
<%--                                                                            class="fz-resume fz-place"></i> ${post.jobDescription} </span>--%>
                                                                </div>
                                                            </div>
                                                            <div class="op op-show">
                                                                    <%--                                                                <!----><a href="javascript:;" ka="user-resume-edit-expectation0"--%>
                                                                    <%--                                                                          class="link-edit"><svg class="icon-svg">--%>
                                                                    <%--                                                                <use xlink:href="#icon-svg-edit"></use>--%>
                                                                    <%--                                                            </svg><span>${post.backUser.compName}</span></a>--%>
                                                                <a href="javascript:;" ka="user-resume-edit-expectation0"
                                                                   class="link-edit"><svg class="icon-svg">
                                                                    <use xlink:href="#icon-svg-edit"></use>
                                                                </svg><span onclick="window.open('${pageContext.request.contextPath}/rec/userChat?compID=${post.bUserId}')">继续沟通</span></a></div>
                                                        </li>
                                                        <li ka="user-resume-edit-expectation0" class="">
                                                            <div class="primary-info">
                                                                <div class="info-labels"><span class="prev-line"><span
                                                                        class="label-text"><i class="fz-resume fz-job"></i> 公司简介：${post.infoIntr}
                                                        </span></span>
                                                                        <%--                                                                    <span class="prev-line"><i--%>
                                                                        <%--                                                                        class="fz-resume fz-salary"></i> ${post.education} </span><span--%>
                                                                        <%--                                                                        class="prev-line"><i class="fz-resume fz-salary"></i>--%>
                                                                        <%--                                                        ${post.jobBenefits} </span>--%>
                                                                </div>
                                                            </div>

                                                        </li>
                                                    </ul>
                                                </div>
                                            </c:forEach>
                                        </c:if>

                                    </div></c:if>
                                </div></c:if>
                            </div>
                            <div id="fenye4" style="text-align: center"></div>
                        </div>
                    </div>
                        <%--                        <div class="user-sider" style="height: 600px;background: #fff;">--%>
                        <%--                            <div data-v-3b220faa="" class="sider-box sider-resume">--%>
                        <%--                                <div data-v-3b220faa="" class="resume-attachment">--%>
                        <%--                                    <h3 data-v-3b220faa="" class="sider-title">附件管理--%>
                        <%--                                    </h3>--%>
                        <%--                                    <div data-v-3b220faa="" class="btns"><button data-v-3b220faa="" type="button"--%>
                        <%--                                                                                 class="btn btn-primary">上传简历</button>--%>
                        <%--                                    </div>--%>
                        <%--                                    <div data-v-3b220faa="" class="">--%>
                        <%--                                    </div>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                </div>
                </div></c:if>
                </div></c:if>
            </c:if>
        </div>
    </div>

</div>

</form>
<div class="links links-friends" style="margin-left: 25%">
    <dl class="links-item">
        <dt>友情链接：</dt>
        <dd>
            <a href="http://lieyunwang.com/" target="_blank">猎云网</a> <span>|</span>
            <a href="http://www.chuanke.com/" target="_blank">传课网</a> <span>|</span>
            <a href="http://se.360.cn/" target="_blank">360安全浏览器</a> <span>|</span>
            <a href="http://www.zhongchou.cn" target="_blank">众筹网</a><span>|</span>
            <a href="http://www.zhubajie.com/" target="_blank">创意服务外包</a><span>|</span>
            <a href="http://www.thinkphp.cn/" target="_blank">thinkphp</a><span>|</span>
            <a href="http://www.meitu.com/" target="_blank">美图公司</a><span>|</span>
            <a href="http://iwebad.com/" target="_blank">网络广告人社区</a>
        </dd>
    </dl>
</div>

<script>
    layui.use(['element','form'], function(){
        var $ = layui.jquery
            ,form=layui.form
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

        element.on('test(555)',function (data) {
            console.log("9999999999999999999999999")
        })

        element.on('tab(docDemoTabBrief)', function(data){
            console.log('efheiughuirehieguhi')
            console.log(this); //当前Tab标题所在的原始DOM元素
            console.log(data.index); //得到当前Tab的所在下标
            console.log(data.elem); //得到当前的Tab大容器
            var layid=$(this).attr("lay-id");
            console.log($(this).attr("layid")); //得到当前的Tab大容器

            location.href=layid;
            // $.ajax({
            //     url: layid,
            //     charset:"UTF-8",
            //     async: "true",
            //     type: "post",
            //     data: "",
            //     dataType: "text",
            //     success: function (data) {
            //         if (data == "succes") {
            //             //向服务端发送删除指令
            //             layer.msg('删除成功')
            //             location.reload()
            //         } else if (data == "lose") {
            //             layer.msg("添加失败")
            //         }
            //     },
            //     error: function () {
            //         layer.msg('网络繁忙')
            //     }
            // })


        });

    });
</script>



<script>
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
            ,jump:function (obj,first) {
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数
                if(!first){
                    location.href="resumePage?curr="+obj.curr+"&limit="+obj.limit;
                }
            }
        });
        laypage.render({
            elem: 'fenye2'
            ,count: count
            ,curr:curr
            ,theme: '#1E9FFF'
            ,limit:limit
            ,jump:function (obj,first) {
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数
                if(!first){
                    location.href="resumeCommitPage?curr="+obj.curr+"&limit="+obj.limit;
                }
            }
        });
        laypage.render({
            elem: 'fenye3'
            ,count: count
            ,curr:curr
            ,theme: '#1E9FFF'
            ,limit:limit
            ,jump:function (obj,first) {
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数
                if(!first){
                    location.href="deliveryInfoPage?curr="+obj.curr+"&limit="+obj.limit;
                }
            }
        });

        laypage.render({
            elem: 'fenye4'
            ,count: count
            ,curr:curr
            ,theme: '#1E9FFF'
            ,limit:limit
            ,jump:function (obj,first) {
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数
                if(!first){
                    location.href="communicationPage?curr="+obj.curr+"&limit="+obj.limit;
                }
            }
        });

    });
    function postInfo(id) {
        location.href="postInfo?lid="+id;
    }
</script>
</body>
</html>
