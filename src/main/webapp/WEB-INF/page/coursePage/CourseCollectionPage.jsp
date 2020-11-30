<%--
  Created by IntelliJ IDEA.
  User: WUWX
  Date: 2020/11/10
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">
    <title>关注课程</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jianli.css" rel="stylesheet">
    <link href="http://cymooc.org:80/common/css/course.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/style/js/jquery-3.5.1.js" crossorigin="anonymous"></script>

</head>

<body>
<input type="text" style="display: none" id="kong">
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<input type="hidden" id="userId" value="${qUser.userId}">
<%--<div id="header" style="background-color: #0d98ff">--%>
<%--<div class="inner home-inner" >--%>
<%--    <div class="logo">--%>
<%--&lt;%&ndash;        <img src="" style="width: 140px,30px" >&ndash;%&gt;--%>
<%--        <a href="https://www.zhipin.com/" ka="header-home-logo" title="钱程无忧" style="background: url(${pageContext.request.contextPath}/imgs/logo20.png) 3px 7px no-repeat;;background-size:150px 30px"><span>钱程无忧</span></a>--%>
<%--    </div>--%>
<%--    <div class="nav">--%>
<%--        <ul>--%>
<%--            <li class=""><a ka="header-home" href="https://www.zhipin.com/" >首页</a></li>--%>
<%--            <li class=""><a ka="header-job" href="https://www.zhipin.com/job_detail/">职位</a></li>--%>
<%--            <li class=""><a class="nav-school" ka="header-school" href="https://www.zhipin.com/xiaoyuan/">公司</a></li>--%>
<%--            <li class="cur"><a ka="tab_overseas_click" href="${pageContext.request.contextPath}/center/jianli">简历</a></li>--%>
<%--            <li class=""><a ka="header_brand" href="https://www.zhipin.com/gongsi/">校招</a></li>--%>
<%--            <li class=""><a ka="header-app" href="https://app.zhipin.com/">课程</a></li>--%>
<%--            <li class=""><a ka="header-article" href="https://news.zhipin.com/">资讯</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>

<%--</div>--%>

<div id="header" style="background-color:#00c2b3;height: 80px" >
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
            <c:if test="${empty qUser}">
                <div class="btns" style="margin-top: 10%">
                    <a href="${pageContext.request.contextPath}/golog/reg" ka="header-register" class="btn btn-outline" style="background-color: #228b81;border: 0px">注册</a>
                    <a href="${pageContext.request.contextPath}/golog/login" class="btn btn-outline" style="background-color: #228b81;border: 0px">登录</a>
                </div>
            </c:if>
            <c:if test="${not empty qUser}">
                <ul>
                        <%--                <li class=""><a ka="header-message" href="https://www.zhipin.com/web/geek/chat">消息<span class="nav-chat-num"></span></a></li>--%>
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
            </c:if>
        </div>
    </div>
</div>
<div id="wrap" class="">
    <div id="main" class="inner">
        <div id="container" class="resume-container">
            <div class="resume-content">
                <!---->

                <div class="resume-content-box">
                    <div class="resume-box">
                        <!-- 收藏的课程 -->
                        <div class="courseright" style="display: block;margin:0 auto;float: none;">
                            <ul class="courseulr" id="courseulr" style="min-height: 640px">
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="user-sider" style="height: 600px;background: #fff;">
                <div data-v-3b220faa="" class="sider-box sider-resume">
                    <%--                    <div data-v-3b220faa="" class="resume-attachment">--%>
                    <%--                        <h3 data-v-3b220faa="" class="sider-title">附件管理--%>
                    <%--                        </h3>--%>
                    <%--                        <div data-v-3b220faa="" class="btns"><button data-v-3b220faa="" type="button"--%>
                    <%--                                                                     class="btn btn-primary">上传简历</button>--%>
                    <%--                        </div>--%>
                    <%--                        <div data-v-3b220faa="" class="">--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <%--                    <div style="text-align: center">--%>
                    <%--                        <div class="info-flex-item header-upload">--%>
                    <%--                            <div class="header-box">--%>
                    <%--                        <div class="header-mask" ></div><img style="height: 10%;width: 30%" id="headImg2"--%>
                    <%--                                                                src="${pageContext.request.contextPath}${resume.photo}"--%>
                    <%--                                                       class="header-img"></div></div>--%>
                    <%--                        <div>${resume.realName}</div>--%>
                    <%--                    </div>--%>
                    <div style="margin-top: 20px">
                        <h2 style="color: #0cccb5">我的信息</h2>
                        <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/center/resumeInfo"  >收藏岗位</a></div>
                        <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/center/accountSet" >账号设置</a></div>
                        <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/collect/collectionPage"  >关注课程</a></div>
                        <%--                        <div style="margin-left: 20%"><a href=""  >观看历史</a></div>--%>
                        <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/zhengshu/zxzsliebiao"  >证书申请</a></div>
                        <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/zhengshu/zxzstushi"  >证书展示</a></div>
                        <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/zhengshu/zxzskaifa"  >证书项目</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div id="footer" style="min-height: 120px;">
            <div class="inner home-inner">

            </div>
        </div>

    </div>
</div>
</div>

<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script>
    var basePath=$('#path').val();
    $(function () {
        var userId = $('#userId').val();
        console.log(userId);
        loadCoursesInfo(userId);
    });
    // 异步加载课程信息
    function loadCoursesInfo(userId) {

        if (userId==undefined || userId==""){
            userId=0;
        }
        $.ajax({
            url: basePath+"/collect/collectCourses?userId="+userId
            , method: "post"
            , success: function (object) {
                object = JSON.parse(object);
                var str = "";
                for (var i = 0; i < object.length; i++) {
                    str += "<li style=\"width:260px;margin-top: 10px;\" onclick=\"toDetailPage("+object[i].courseId+","+userId+")\">";
                    str += "<div class=\"courselist\" style=\"float:left;width:240px;height:190px;position: relative;\">";
                    str += "<img style=\"border-radius:3px 3px 0 0;width:240px;height:135px;\" src=\""+basePath+object[i].courseImgUrl+"\"  title=\"" + object[i].courseName + "\">";
                    str += "<div style=\"position: relative;top:20px;\">";
                    str += "<div style=\"float:left;margin-top:-20px;width:230px;color:#8a8a8a;\">";
                    str += "<div style=\"margin-top:5px;margin-left:0px;height:18px;width:180px;\" >";
                    str += "<div style=\" float:left;\">";
                    str += "</div>";
                    str += "<div style=\"float:left;width:100px;overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\">"
                    str += object[i].courseName;
                    str += "</div>";
                    str += "</div>";
                    str += "</div>";
                    str += "<div style=\"float:left;margin-top:4px;width:235px;color:#8a8a8a;\">";
                    str += "<div style=\"float:left;margin-top:2px;margin-left:5px;height:18px;width:100px;overflow:hidden;text-overflow:ellipsis; white-space: nowrap;color:#FF0000;\" >";
                    str += "<img src=\"http://cymooc.org:80/common/images/experience/u13.png\" style=\"float:left;width:24px;height:24px;\" />";
                    str += "<span class=\"num\" style=\"float:left;margin-left:10px;\">";
                    str += object[i].collectionNumber;
                    str += "</span>";
                    str += "</div>";
                    str += "<span style=\"float:left;display:inline-block;margin-top:5px;margin-left:65px;\">";
                    str += object[i].speakerName;
                    str += "</span>";
                    str += "<img src=\"" + basePath+object[i].speakerHeadImgUrl + "\" style=\"margin-top:-70px;margin-right:15px;width:48px;height: 48px;border-radius: 24px;display:block;float:right;border:3px solid #fff;\"/>";
                    str += "<div style=\"clear:both\">";
                    str += "</div>";
                    str += "</div>";
                    str += "</div>";
                    str += "</div>";
                    str += "</li>";
                }
                $('#courseulr').append(str);
            }
        });
    }

    function toDetailPage(courseId,userId) {
        window.open(basePath+"/course/detailPage?courseId="+courseId+"&userId="+userId);
    }
</script>
</body>
</html>

