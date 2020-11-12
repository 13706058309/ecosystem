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
    <title>课程页面</title>
    <link rel="stylesheet" type="text/css" href="http://cymooc.org:80/common/css/course/index.css"/>
    <link rel="stylesheet" type="text/css" href="http://cymooc.org:80/common/css/bootstrap.css"/>
    <link rel="stylesheet" href="http://cymooc.org:80/common/css/news/news_details.css" />


    <script type="text/javascript">var ctx = ''</script>
    <script type="text/javascript">var sessions = ''</script>
    <style>
        .videoDescribe{
            top: 180px;
        }
        .timeConcrol{
            width:100%;
            height:30px;
            background-color:red;
        }
        .priceConcrol{
            width:100%;
            height:40px;
        }
        .time{
            line-height:30px;
        }
        .rankUser{
            float: left;
            margin-left:30px;
            height:40px;
        }
        .ranking{
            width: 35px;
            height: 20px;
            background-color: rgba(218, 58, 55, 1);
            border: none;
            border-radius: 5px;
            font-weight: 700;
            font-size: 14px;
            color: #FFFFFF;
            float: right;
            margin-right:15px;
            text-align: center;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
        }
        .tryBtn{
            width:60px;
            height:22px;
            float:right;
            background-color:#F7C3BE;
            color:#FF0000;
            font-weight:bold;
            margin-top:20px;
            border-radius:10px;
            border: none;
        }
        button:hover{
            background-color:#FF0000;
            color:#FFFFFF;
        }
        /* body .my-class .layui-layer-title{background:#c00; color:#fff; border: none;} */
        /* body .my-class .layui-layer-btn{border-top:1px solid #E9E7E7} */
        body .my-class .layui-layer-btn a{background:#E74434;}
    </style>
</head>
<body>
<!--   导航栏 -->

<link rel="stylesheet" type="text/css" href="http://cymooc.org:80/common/css/muke.css">
<link rel="stylesheet" type="text/css" href="http://cymooc.org:80/common/css/navigationBar.css">
<link href="http://cymooc.org:80/common/css/style.css" type="text/css"rel="stylesheet" media="all">
<link href="http://cymooc.org:80/common/css/font-awesome.css" rel="stylesheet">

<link rel="stylesheet" href="http://cymooc.org:80/common/css/flexslider.css" type="text/css" media="screen" property="" />
<script src="http://cymooc.org:80/common/js/jquery-2.2.3.min.js"></script>
<script src="http://cymooc.org:80/common/layer/layer.js" type="text/javascript" charset="utf-8"></script>

<!-- 	  导航 -->
<style type="text/css">
    .safe_width {
        width: 1100px;
        margin: 10px auto;
    }

    /*****************未登录时登录注册按钮******************/
    .tkbtn {
        display: inline-block;
        width: 60px;
        height: 35px;
        line-height: 35px;
        text-align: center;
        background: url(http://cymooc.org:80/common/images/btn1.png) no-repeat;
        font-size: 14px;
    }

    .tkbtn:link,.tkbtn:visited {
        color: #fff;
        text-decoration: none;
    }

    .tkbtn:hover {
        color: #fff;
        background: url(http://cymooc.org:80/common/images/btn_hover1.png) no-repeat;
    }

    .tkbtn.tklog {
        background-position: 0px 0px;
        float: left;
    }

    .tkbtn.tkreg {
        background-position: -0.87px -44px;
        float: right;
    }

    ::-webkit-input-placeholder { /* WebKit browsers */
        color: #A9A9A9;
    }
    .navbar .nav > li .dropdown-menu {
        margin: 0;
    }
    .navbar .nav > li:hover .dropdown-menu {
        display: block;
    }
    ul.dropdown-menu {
        top:30px;
        left:-112px;
        background:#fff;
        border: none;
    }
    .dropdown-menu > li > a {
        padding: 7px 20px;
        color: gray;
        letter-spacing: 1px;
    }
    .dropdown-menu > li > a:hover {
        background-color:#F0F0F0;
    }

    .div_group{
        margin-top: 32px;
    }

    #courseIframe{
        min-height: 900px;
    }
</style>
<input type="hidden" id="basepath" value="http://cymooc.org:80/"/>


<script type="text/javascript">

    $(function() {
        $("#l"+"").addClass("currentBar");
    });

    function searchsubmit() {
        $("#keywords").val(encodeURI($("#keywords").val()));
    }

    function mysearch() {
        var title =  encodeURI(encodeURI($("#keywords").val().trim()));
        window.location.href = "news_NewsPage_list_news?article_title="+title+"&articletype=&circle_id=";
    };
</script>
<div class="safe" style="margin-bottom: 20px;margin-top: 20px">
    <div class="courseDiv">
        <img src="http://117.27.136.49:8078/data/product/d5e9b3389972482294a0b983c764f192.jpg" onerror="this.src='http://cymooc.org:80/common/images/uiz7.jpg'" class="floatL" style="width: 385px;height: 270px;display: block;margin: 15px;"/>
        <div class="courseDetail floatR">
            <div class="courseDetail1">
                <p class="courseName">
                    <span>Java界面编程</span>
                </p>
                <p class="courseInfo" style="margin: 15px 0;">

                     <span class="">
                         <img src="http://cymooc.org:80/common/images/course/u989.png"/>
                         <span style="color: #69BADE;">7</span>章节
                     </span>
                    <span class="">
                        <img src="http://cymooc.org:80/common/images/course/u991.png"/>
                        <span style="color: #69BADE;">435</span>次播放
                    </span>
                </p>

                <p class="courseDescribe" style="height:33px; text-overflow:ellipsis; overflow:hidden;">Java界面编程的详细介绍</p>

                <p class="courseInfo">
						<span class="">
							<img src="http://cymooc.org:80/common/images/course/u989.png"/>
							<span style="color: #69BADE;">7</span>播放量
						</span>
                    <!-- 							次播放 -->
                    <!-- 							 人共同学习 -->
                </p> <br>
            </div>



            <span id="collectProduct" class="noCollectCourse" style="margin-top:10px;margin-left:400px;" onclick="collproduct(2,10607)"></span>
            <img id="imging" src="http://cymooc.org:80/common/images/course/noCollect.png" style="width:20px;height:20px;margin-right:10px;"/>
            <span id="productName">收藏课程</span>
                <input type="text" id="coll" value="1" style="display:none;">
            </span>

        </div>
        <div class="clear"></div></div>
</div>

<div class="safe" >
    <div class="courseLeft">
        <div class="tabs">
            <div id="courseList" class="coursetab hoverTab">课程目录</div>
            <div id="courseIntroduce" class="coursetab">相关评价</div>
            <div id="courseMaterial" class="coursetab">课程详情</div>

        </div>
        <iframe id="courseIframe" src="" width="820px" scrolling="no"  data-pro="10607"></iframe>
    </div>
    <div style="float: right;width: 280px">

        <div class="div_group">
            <div class="divTitle">
                <div class="titleBottom"></div>
                <div class="titleRight"></div>
                <div class="titleText">相关课程</div>
            </div>

            <a href="javascript:void(0);" onclick="encryptUrl('course_CourseRe_index1_course?prodid=',10592);">
                <div class="div_video" style="border:none;">
                    <div class="imgBox" style="border-radius:5px;">
                        <div >
                            <div style="float:left;height:100px;width:100px;">
                                <img  src="http://117.27.136.49:8078/data/product/226ef57641024639836af7e960716375.jpg" style="width:150px;height:100px;border-radius:5px;"/></div>
                            <div style="float:left;height:100px;width:150px;">
                                <span class="video_tilte" style="margin-left:60px;overflow: hidden;width:100px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">企业需要什么样的人</span><br />
                                <span style="float:left;margin-left:105px;margin-top:10px;">欧忠良</span><br />
                                <span style="float:left;margin-top:10px;margin-left:5px;">
							<img src="http://cymooc.org:80/common/images/course/u991.png" style="width:20px;height:20px;margin-left:50px;margin-bottom:4px;"/>
							<span style="color: #69BADE;">1240</span>次<!-- 播放 --></span>
                            </div>
                        </div>
                    </div>
                    <hr class="hr1" />
                </div>
            </a>

        </div>

    </div>

</div>
<div class="clear"></div>
</div>
<div class="clear"></div>
<script>

    $(function(){
        // setScroll();
        $("#a").on("mouseover",function(){
            var  hight =  $("#a").position().top-200;
            var width = $("#a").position().left+10-100
            ;
            $("#img").css("top",hight+"px");
            $("#img").css("left",width+"px");
            $("#img").slideDown("slow")
        });
        $("#img").on("mouseout",function(){
            $("#img").hide("slow");
        });
    })
</script>



</body>
<script type="text/javascript" src="http://cymooc.org:80/common/js/public/jquery-2.1.4.js" charset="UTF-8"></script>
<script type="text/javascript" src="http://cymooc.org:80/common/js/public/jquerysession.js" charset="UTF-8"></script>
<script src="http://cymooc.org:80/common/layer/layer.js"></script>
<script type="text/javascript" src="http://cymooc.org:80/common/layui/layui.js"></script>
<script src="http://cymooc.org:80/common/js/course/courses.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="http://cymooc.org:80/common/js/jsencrypt.min.js" charset="UTF-8"></script>
<script>
    // 收藏和取消课程处理
    function collproduct(type,prodid){
        console.log($("#coll").val());
        var i =+'';
        if(i==''){
            prodid = prodid.toString();
            //初始化公钥
            var publicKey = 'MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAJ1Y+eHJ9hkQWKAvBTZI+TyLAPRfpCCWt0Cg4bzfhH0HbEmN04hPCb65zYgHAWwUGDRavzuOyOH9zu70XJjFj4UCAwEAAQ==';
            var encrypt = new JSEncrypt();
            encrypt.setPublicKey(publicKey);
            //加密数据
            var prodidE = encrypt.encrypt(prodid);
            var surl='course_CourseRe_index1_course?prodid2='+prodidE;
            checkSession(surl,0);
        }else{
            $.ajax({
                type:"post",
                url:"course_CourseRe_collectCourse_course?prodid="+prodid+"&collect_type="+type+"&collecting="+$("#coll").val(),
                async:false,
                success: function(data){
                    console.log(data)
                    //1未收藏  2.已收藏
                    if(data==1){
                        $("#imging").attr('src',"http://cymooc.org:80/common/images/course/isCollect.png");
                        $("#productName").html("取消收藏课程");
                        $("#collectProduct").css("color","#DD501C");
                        $("#coll").prop('value',"2");
                        layer.msg("该课程收藏成功！");
                    }else if(data==2){
                        $("#imging").attr('src',"http://cymooc.org:80/common/images/course/noCollect.png");
                        $("#productName").html("收藏课程");
                        $("#collectProduct").css("color","#A7A8A7");
                        $("#coll").prop('value',"1");
                        layer.msg("取消收藏成功！");
                    }else if(data==0){
                        layer.msg("收藏失败，请稍后再试！");
                    }else{
                        layer.msg("取消收藏失败，请稍后再试！");
                    }

                },
                error:function() {
                    layer.msg("服务器忙~");
                }
            });
        }

    }


    /**
     * 登录成功后需要页面刷新以获取用户数据
     */
    function checkPageSession() {
        if(sessions){
            //页面存在登录信息
            //向后台发送心跳包 保证session不过期
            //HeartBeat
            setInterval (heartBeat(), 60*1000*10);
        }else{
            //后台查询是否登录
            $.ajax({
                type: "post",
                url: "video_VideoRe_checkSession_video",//发表日报
                async:false,
                success: function (data) {
                    if(data=="0"){
                        //未登录
                    }else{
                        //已登录，刷新
                        parent.window.location.reload();
                    }
                },
                error: function () {
                    //top.layer.msg("系统异常，请稍后再试");
                }
            });
        }

    }

    $(function(){
        checkPageSession();
    })

    function heartBeat(){
        $.ajax({
            type: "post",
            url: "video_VideoRe_heartBeat_video",//发表日报
            async:false,
            success: function (data) {
                if(data=="0"){
                    //未登录
                    layer.msg("发生异常登录过期~~~")
                }else{
                    //已登录
                }
            },
            error: function () {
                //top.layer.msg("系统异常，请稍后再试");
            }
        })
    }

    $(function(){
        iframesrc();
        $('.tabs').children().click(function(){
            console.log($(this).attr('id'));
            switch($(this).attr('id')){
                case "courseList":
                    sessionStorage.courseIframesrc1 = '0';
                    iframesrc();
                    break;
                case "courseIntroduce":
                    sessionStorage.courseIframesrc1 = '1';
                    iframesrc();
                    break;
                case "courseMaterial":
                    sessionStorage.courseIframesrc1 = '2';
                    iframesrc();
                    break;
            }
        });

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

    })
    //iframe页面跳转
    function iframesrc(){
        if(sessionStorage.courseIframesrc1 == undefined) {
            sessionStorage.courseIframesrc1 = '0';
        }
        switch(sessionStorage.courseIframesrc1) {
            case '0':
                $('.tabs').children().attr('class','coursetab');
                $('#courseList').addClass('hoverTab');
                if($('#courseIframe').data("circle")){
                    // $('#courseIframe').attr("src","course_CourseRe_courseList_course?circle_id="+$('#courseIframe').data("circle")+"&prodid="+ $('#courseIframe').data("pro"));
                    $('#courseIframe').attr("src","course/cataloguePage");

                }else{
                    // $('#courseIframe').attr("src","course_CourseRe_courseList_course?prodid="+ $('#courseIframe').data("pro"));

                    $('#courseIframe').attr("src","cataloguePage");
                }
                break;
            case '1':
                $('.tabs').children().attr('class','coursetab');
                $('#courseIntroduce').addClass('hoverTab');
                if($('#courseIframe').data("circle")){
                    $('#courseIframe').attr("src","course_CourseRe_courseIntroduce_course?circle_id="+$('#courseIframe').data("circle")+"&prodid="+ $('#courseIframe').data("pro"));

                }else{
                    // $('#courseIframe').attr("src","course_CourseRe_courseIntroduce_course?prodid="+ $('#courseIframe').data("pro"));
                    $('#courseIframe').attr("src","evaluationPage");
                }
                break;
            case '2':
                $('.tabs').children().attr('class','coursetab');
                $('#courseMaterial').addClass('hoverTab');
                if($('#courseIframe').data("circle")){
                    $('#courseIframe').attr("src","course_CourseRe_courseMaterial_course?circle_id="+$('#courseIframe').data("circle")+"&prodid="+ $('#courseIframe').data("pro"));

                }else{
                    $('#courseIframe').attr("src","course_CourseRe_courseMaterial_course?prodid="+ $('#courseIframe').data("pro"));
                }
                break;
        }
    }

</script>
</html>


