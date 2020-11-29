<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/11
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <!--<meta charset="UTF-8">-->
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>课程页面</title>
    <link rel="stylesheet" type="text/css" href="http://cymooc.org:80/common/css/course/index.css"/>
    <link rel="stylesheet" type="text/css" href="http://cymooc.org:80/common/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="http://cymooc.org:80/common/css/muke.css">
    <link rel="stylesheet" type="text/css" href="http://cymooc.org:80/common/css/navigationBar.css">
    <link href="http://cymooc.org:80/common/css/style.css" type="text/css"rel="stylesheet" media="all">
    <link href="http://cymooc.org:80/common/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cymooc.org:80/common/css/flexslider.css" type="text/css" media="screen" property="" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/course/detailPage.css"/>
    <script type="text/javascript">var ctx = ''</script>
    <script type="text/javascript">var sessions = ''</script>
</head>
<body>
<input type="hidden" id="basePath" value="${pageContext.request.contextPath}"/>
<input type="hidden" id="courseId" value="${course.courseId}"/>
<div class="safe" style="margin-bottom: 20px;margin-top: 20px">
    <div class="courseDiv">
        <img src="${pageContext.request.contextPath}${course.courseImgUrl}" class="floatL" style="width: 385px;height: 270px;display: block;margin: 15px;"/>
        <div class="courseDetail floatR">
            <div class="courseDetail1">
                <p class="courseName">
                    <span>${course.courseName}</span>
                </p>
                <p class="courseInfo" style="margin: 15px 0;">
                     <span class="">
                         <img src="${pageContext.request.contextPath}/style/images/courseImg/unit.png"/>
                         <span style="color: #69BADE;">${course.unitNumber}</span>章节
                     </span>
                    <span class="">
                        <img src="${pageContext.request.contextPath}/style/images/courseImg/collections.png"/>
                        <span style="color: #69BADE;">${course.collectionNumber}</span>
                    </span>
                </p>
                <p class="courseDescribe" style="height:33px; text-overflow:ellipsis; overflow:hidden;">${course.courseIntroduce}</p>
                <p class="courseInfo">
						<span class="">
							<img src="${pageContext.request.contextPath}/style/images/courseImg/play.png"/>
							<span style="color: #69BADE;">${course.totalPlayTimes}</span>播放量
						</span>
                </p> <br>
            </div>

            <span class="noCollectCourse" style="margin-top:10px;margin-left:400px;" ></span>
            <c:choose>
                <c:when test="${not empty courseCollect}">
                    <span id="collectIcon" onclick="cancelCollectCourse(${course.courseId},${qUser.userId})">
                        <img class="imging" src="${pageContext.request.contextPath}/style/images/courseImg/isCollect.png" style="width:20px;height:20px;margin-right:10px;"/>
                    </span>
                    <span id="productName">取消收藏</span>
                    <input type="text" id="coll" value="1" style="display:none;">
                    </span>
                </c:when>
                <c:otherwise>
                    <span id="collectIcon" onclick="collectCourse(${course.courseId},${qUser.userId})">
                        <img class="imging" src="${pageContext.request.contextPath}/style/images/courseImg/noCollect.png" style="width:20px;height:20px;margin-right:10px;"/>
                    </span>
                    <span id="productName">收藏课程</span>
                    <input type="text" id="coll" value="1" style="display:none;">
                    </span>
                </c:otherwise>
            </c:choose>


        </div>
        <div class="clear"></div></div>
</div>

<div class="safe" >
    <div class="courseLeft">
        <div class="tabs">
            <div id="courseList" class="coursetab hoverTab">课程目录</div>
            <div id="courseIntroduce" class="coursetab">相关评价</div>
<%--            <div id="courseMaterial" class="coursetab">课程详情</div>--%>
        </div>
        <iframe id="courseIframe" src="" width="820px" scrolling="yes"  data-pro="10607"></iframe>
    </div>
    <div style="float: right;width: 280px">

        <div class="div_group">
            <div class="divTitle">
                <div class="titleBottom"></div>
                <div class="titleRight"></div>
                <div class="titleText">相关课程</div>
            </div>

            <c:if test="${not empty relatedCourses}">
                <c:forEach items="${relatedCourses}" var="relatedCourse">
                    <a onclick="relateCourseJump(${relatedCourse.courseId})">
                        <div class="div_video" style="border:none;">
                            <div class="imgBox" style="border-radius:5px;">
                                <div >
                                    <div style="float:left;height:100px;width:100px;">
                                        <img  src="${pageContext.request.contextPath}${relatedCourse.courseImgUrl}" style="width:150px;height:100px;border-radius:5px;"/></div>
                                    <div style="float:left;height:100px;width:150px;">
                                        <span class="video_tilte" style="margin-left:60px;overflow: hidden;width:100px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">${relatedCourse.courseName}</span><br />
                                        <span style="float:left;margin-left:105px;margin-top:10px;">${relatedCourse.speakerName}</span><br />
                                        <span style="float:left;margin-top:10px;margin-left:5px;">
							<img src="${pageContext.request.contextPath}/style/images/courseImg/play.png" style="width:20px;height:20px;margin-left:50px;margin-bottom:4px;"/>
							<span style="color: #69BADE;">${relatedCourse.totalPlayTimes}</span>次<!-- 播放 --></span>
                                    </div>
                                </div>
                            </div>
                            <hr class="hr1" />
                        </div>
                    </a>
                </c:forEach>
            </c:if>
        </div>
    </div>
</div>
<div class="clear"></div>
</div>
<div class="clear"></div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"/>
<script src="http://cymooc.org:80/common/js/course/courses.js" type="text/javascript" charset="utf-8"></script>
<script>
    // 收藏课程
    function collectCourse(courseId,userId) {
        var basePath = $('#basePath').val();
        // console.log(userId);
        var collectTime = getNowTime();
        if (userId==undefined){
            userId="0";
        }
        var jsonData = {"courseId":courseId,"userId":userId,"collectTime":collectTime}
        $.ajax({
            url:basePath+"/collect/collectCourse",
            data:jsonData,
            success:function (data) {
                var tip="";
                if (data=="collectSuccess"){
                    tip = "收藏成功";
                    $('#collectIcon').attr("onclick","cancelCollectCourse("+courseId+","+userId+")");
                    $("img[class='imging']").attr("src",basePath+"/style/images/courseImg/isCollect.png");
                    $('#productName').text("取消收藏");
                }else {
                    tip = "服务器繁忙，请稍后再试";
                }
                // layui.use('layer', function(){
                //     var layer = layui.layer;
                //     layer.open({
                //         type: 1,
                //         content: '<div style="width:300px;height: 60px;text-align: center;margin-top: 20%;color: green;">'+tip+'</div>',
                //         btn:['确定'],
                //         yes:function (index) {
                //             layer.close(index);
                //         }
                //     });
                // });
                confirm(tip);
            }
        });

    }

    // 取消收藏
    function cancelCollectCourse(courseId,userId) {
        var basePath = $('#basePath').val();
        if(userId==undefined){
            userId=0;
        }
        var jsonData = {"courseId":courseId,"userId":userId}
        $.ajax({
            url:basePath+"/collect/cancelCollectCourse",
            data:jsonData,
            success:function (data) {
                var tip="";
                if (data=="cancelSuccess"){
                    tip = "取消收藏成功";
                    $('#collectIcon').attr("onclick","collectCourse("+courseId+","+userId+")");
                    $("img[class='imging']").attr("src",basePath+"/style/images/courseImg/noCollect.png");
                    $('#productName').text("收藏课程");
                }else {
                    tip = "服务器繁忙，请稍后再试";
                }
                confirm(tip);
            }
        });
    }

    // 点击相关课程中的某个课程进行页面跳转
    function relateCourseJump(courseId) {
        location.href="detailPage?courseId="+courseId;
    }

    // 获取当前系统时间
    function getNowTime() {
        var myDate = new Date();

        var year=myDate.getFullYear();        //获取当前年
        var month=myDate.getMonth()+1;   //获取当前月
        var date=myDate.getDate();            //获取当前日


        var h=myDate.getHours();              //获取当前小时数(0-23)
        var m=myDate.getMinutes();          //获取当前分钟数(0-59)
        var s=myDate.getSeconds();

        var now=year+'-'+getNow(month)+"-"+getNow(date)+" "+getNow(h)+':'+getNow(m)+":"+getNow(s);
        return now;
    }

    // 当月，日，时，分，秒小于10时以0x形式显示
    function getNow(s){
        return s < 10 ? '0' + s: s;
    }

    $(function(){
        iframeSrc();
        $('.tabs').children().click(function(){
            switch($(this).attr('id')){
                case "courseList":
                    sessionStorage.courseIframesrc1 = '0';
                    iframeSrc();
                    break;
                case "courseIntroduce":
                    sessionStorage.courseIframesrc1 = '1';
                    iframeSrc();
                    break;
                case "courseMaterial":
                    sessionStorage.courseIframesrc1 = '2';
                    iframeSrc();
                    break;
            }
        });

        // 相关课程
        $('.div_video').mouseenter(function(){
            $(this).find('.videoDescribe').animate({top:"37px"});
        }).mouseleave(function(){
            $(this).find('.videoDescribe').animate({top:"180px"});
        });

        $('.activityDiv').mouseenter(function(){
            $(this).find('.activityDescribe').animate({top:"106px"});
        }).mouseleave(function(){
            $(this).find('.activityDescribe').animate({top:"136px"});
        });

    });

    //iframe页面跳转
    function iframeSrc(){
        if(sessionStorage.courseIframesrc1 == undefined) {
            sessionStorage.courseIframesrc1 = '0';
        }

        var courseId = $('#courseId').val();
        var contextPath = $('#basePath').val();

        switch(sessionStorage.courseIframesrc1) {
            case '0':
                $('.tabs').children().attr('class','coursetab');
                $('#courseList').addClass('hoverTab');
                $('#courseIframe').attr("src",contextPath+"/unit/cataloguePage?courseId="+courseId);

                break;
            case '1':
                $('.tabs').children().attr('class','coursetab');
                $('#courseIntroduce').addClass('hoverTab');
                $('#courseIframe').attr("src",contextPath+"/courseAppraise/evaluationPage?courseId="+courseId+"&page=1"+"&limit=5");
                break;
            case '2':
                $('.tabs').children().attr('class','coursetab');
                $('#courseMaterial').addClass('hoverTab');
                break;
        }
    }


</script>
</html>


