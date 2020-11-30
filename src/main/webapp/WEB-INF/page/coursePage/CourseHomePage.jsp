<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/11
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="http://cymooc.org:80/common/css/bootstrap.css"/>
    <link rel="stylesheet" href="http://cymooc.org:80/common/css/course.css"/>
    <link rel="stylesheet" href="http://cymooc.org:80/common/css/news/news_details.css"/>

    <link rel="stylesheet" type="text/css" href="http://cymooc.org:80/common/css/muke.css">
    <link rel="stylesheet" type="text/css" href="http://cymooc.org:80/common/css/navigationBar.css">
    <link href="http://cymooc.org:80/common/css/style.css" type="text/css"rel="stylesheet" media="all">
    <link href="http://cymooc.org:80/common/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cymooc.org:80/common/css/flexslider.css" type="text/css" media="screen" property="" />
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/course/homePage.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">

</head>

<body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"/>
<script src="http://cymooc.org:80/usersPersonal/js/main.js"></script>

<input type="hidden" id="basepath" value="${pageContext.request.contextPath}"/>
<input type="hidden" id="fieldId" value="0"/>
<input type="hidden" id="count" value="${count}"/>

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
                    <a href="${pageContext.request.contextPath}/golog/reg" ka="header-register" class="btn btn-outline" style="background-color: #228b81;border: 0px;margin-top: -30px;">注册</a>
                    <a href="${pageContext.request.contextPath}/golog/login" class="btn btn-outline" style="background-color: #228b81;border: 0px;margin-top: -30px;">登录</a>
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

<!-- 菜单栏  -->
<div style=" overflow:hidden;height: 100%;margin: 0 auto;margin-top:20px;width: 1100px;box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
    <div class="course-all">
        <div class="courseul" style="background-color: white;">
            <div>
                <div class="nav_left" style="margin-right: 35px;">
                    <b>课程库</b>
                </div>
                <div class="nav_head sortul">
                    <c:if test="${not empty fields}">
                        <c:forEach items="${fields}" var="field">
                            <div nav_body_info="nav_body_in">
                                <a onclick="flush(${field.fieldId},1,9,true,false,false)" id="${field.fieldId}">${field.fieldName}</a>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 页面下半部分 -->
<div style=" overflow:hidden;height: 100%;margin: 0 auto;padding-top:20px;width: 1100px;">
    <div style="float:left;width:800px;background: #fff;border-radius:5px;min-height: 710px;" >
        <!-- 最新、最热、播放最多  -->
        <div style="background:#fff;height:46px;width:800px;margin:0px auto;border-radius:5px 5px 0 0">
            <ul class="sortul2">
                <li  class="course_curr"  >
                    <a onclick="loadCoursesInfo(0,1,9,false,false,false)" > 全部 </a>
                </li>
                <li >
                    <a onclick="loadCoursesInfo(0,1,9,false,true,false)"  >最新 </a>
                </li>
                <li >
                    <a onclick="loadCoursesInfo(0,1,9,false,false,true)" >最热</a>
                </li>
            </ul>
        </div>
        <!-- 最新、最热、播放最多  END -->

        <!-- 筛选的课程结果  -->
        <div class="courseright" style="display: block;margin:0 auto;float: none;">
            <!-- 视频 -->
            <ul class="courseulr" id="courseulr" style="min-height: 640px">

            </ul>
        </div>
        <div class="clear" style="clear: both"></div>
        <!-- 筛选的课程结果  END -->

        <!-- 分页  -->
        <div id="demo1" style="margin-left: 23%"></div>
        <!-- 分页  END -->
    </div>

    <!-- 推荐课程 -->
    <div style="float: right;width: 280px;height:550px;">
        <div class="div_group">
            <div class="divTitle">
                <div class="titleBottom"></div>
                <div class="titleRight"></div>
                <div class="titleText">经典公开课</div>
            </div>

            <c:if test="${not empty hotCourses}">
                <c:forEach items="${hotCourses}" var="course">
                    <a onclick="toDetailPage(${course.courseId},${qUser.userId})">
                        <div class="div_video" style="border:none;">
                            <div class="imgBox" style="border-radius:5px;">
                                <div>
                                    <div style="float:left;height:100px;width:100px;">
                                        <img  src="${pageContext.request.contextPath}${course.courseImgUrl}" style="width:150px;height:100px;border-radius:5px;"/>
                                    </div>
                                    <div style="float:left;height:100px;width:150px;">
                                        <span class="video_tilte" style="margin-left:60px;overflow: hidden;width:100px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">${course.courseName}</span><br />
                                        <span style="float:left;margin-left:105px;margin-top:10px;">${course.speakerName}</span>
                                        <br />
                                        <span style="float:left;margin-top:10px;margin-left:5px;">
                                            <img src="${pageContext.request.contextPath}/style/images/courseImg/play.png" style="width:20px;height:20px;margin-left:50px;margin-bottom:4px;"/>
                                            <span style="color: #69BADE;">${course.totalPlayTimes}次</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <hr style="height: 1px;border: none;border-top: 1px solid #F0F0F0;margin-top: 20px;margin-bottom: 20px;" />
                        </div>
                    </a>
                </c:forEach>
            </c:if>
            <div class="clear"></div>
        </div>
    </div>
    <!-- 推荐课程 END -->
</div>
<!-- 页面下半部分 END -->
<!-- 空行 -->
<div class="clearh"></div>

<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script>
    window.onload = function () {
        loadCoursesInfo(0,1,9,false,false,false);
        getPage();
    }

    function flush(fieldId,curr,limit) {
        loadCoursesInfo(fieldId,curr,limit,false,false,false);
        getPage();
    }

    var total;    //数据总条数
    function getPage(){
        layui.use(['laypage', 'layer'], function() {
            var laypage = layui.laypage
                , layer = layui.layer;
            //总页数大于页码总数
            laypage.render({
                elem: 'demo1'
                ,count: total //数据总数
                ,limit:9
                , jump: function (obj,first) {
                    var fieldId = $("#fieldId").val();
                    if (!first){
                        loadCoursesInfo(fieldId,obj.curr,obj.limit,false,false,false);
                    }
                }
            });
        });
    }

    // 异步加载课程信息
    function loadCoursesInfo(fieldId,curr,limit,isField,isLatest,isHot) {
        var latest = null;
        var hot = null;
        if (isField == true){
            fieldId = $("#fieldId").val();
        }
        if (isLatest == true){
            fieldId = $("#fieldId").val();
            latest="latest";
        }
        if (isHot == true){
            fieldId = $("#fieldId").val();
            hot="hot";
        }

        $.ajax({
            url: "selectCourseByFieldId?fieldId=" + fieldId + "&curr=" + curr + "&limit=" + limit + "&latest="+latest+"&hot="+hot
            , method: "post"
            , success: function (object) {
                object = JSON.parse(object);
                var fieldId = object.fieldId;
                data = object.courses;
                var msg = object.courses;
                var str = "";
                for (var i = 0; i < msg.length; i++) {
                    str += "<li style=\"width:260px;margin-top: 10px;\" onclick=\"toDetailPage("+msg[i].courseId+")\">";
                    str += "<div class=\"courselist\" style=\"float:left;width:240px;height:190px;position: relative;\">";
                    str += "<img style=\"border-radius:3px 3px 0 0;width:240px;height:135px;\" src=\""+$("#basepath").val()+msg[i].courseImgUrl+"\"  title=\"" + msg[i].courseName + "\">";
                    str += "<div style=\"position: relative;top:20px;\">";
                    str += "<div style=\"float:left;margin-top:-20px;width:230px;color:#8a8a8a;\">";
                    str += "<div style=\"margin-top:5px;margin-left:0px;height:18px;width:180px;\" >";
                    str += "<div style=\" float:left;\">";
                    str += "</div>";
                    str += "<div style=\"float:left;width:100px;overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\">"
                    str += msg[i].courseName;
                    str += "</div>";
                    str += "</div>";
                    str += "</div>";
                    str += "<div style=\"float:left;margin-top:4px;width:235px;color:#8a8a8a;\">";
                    str += "<div style=\"float:left;margin-top:2px;margin-left:5px;height:18px;width:100px;overflow:hidden;text-overflow:ellipsis; white-space: nowrap;color:#FF0000;\" >";
                    str += "<img src=\"http://cymooc.org:80/common/images/experience/u13.png\" style=\"float:left;width:24px;height:24px;\" />";
                    str += "<span class=\"num\" style=\"float:left;margin-left:10px;\">";
                    str += msg[i].totalPlayTimes;
                    str += "</span>";
                    str += "</div>";
                    str += "<span style=\"float:left;display:inline-block;margin-top:5px;margin-left:65px;\">";
                    str += msg[i].speakerName;
                    str += "</span>";
                    str += "<img src=\"" + $("#basepath").val()+msg[i].speakerHeadImgUrl + "\" style=\"margin-top:-70px;margin-right:15px;width:48px;height: 48px;border-radius: 24px;display:block;float:right;border:3px solid #fff;\"/>";
                    str += "<div style=\"clear:both\">";
                    str += "</div>";
                    str += "</div>";
                    str += "</div>";
                    str += "</div>";
                    str += "</li>";
                }
                document.getElementById('courseulr').innerHTML = str;

                $("#fieldId").val(fieldId);
                if (typeof(object.count) !='undefined'){
                    $("#count").val(object.count);
                    total = $("#count").val();
                    // console.log("total: "+total);
                    getPage();
                }
            }
        });
    }

    function toDetailPage(courseId,userId) {
        if (userId==undefined){
            userId=0;
        }
        window.open("detailPage?courseId="+courseId+"&userId="+userId);
    }
</script>
</body>
</html>

