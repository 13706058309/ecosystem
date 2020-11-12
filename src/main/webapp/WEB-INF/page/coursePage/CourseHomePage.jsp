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
    <link rel="stylesheet" href="http://cymooc.org:80/common/css/jquery.pagination.css" />
    <link rel="stylesheet" href="http://cymooc.org:80/common/css/course.css"/>
    <link rel="stylesheet" href="http://cymooc.org:80/common/css/news/news_details.css" />
    <style>

        .nav_left{
            display: inline-block;
            margin: 20px;
        }
        .nav_head{
            display: inline-block;
            width: 800px;
        }
        .nav_head>div,.nav_body>div{
            display: inline-block;
            margin: 10px;
            padding: 3px 5px;
            cursor:pointer
        }
        .nav_body{
            display: inline-block;
            width: 800px;
        }
        .nav_body>div{
            display: inline-block;
        }
        .sortul>div:hover{
            color: #fff;
            background: none repeat scroll 0 0 #3eb0e0;
            padding: 3px 5px;
            border-radius: 5px;
        }
        .courseulr li{
            height: auto;
            width: 100%;
            cursor: pointer;
            margin-bottom: 5px;
        }
        /*------------------课程页面样式start-----------------*/
        .floatL{
            float: left;
        }
        .floatR{
            float: right;
        }
        .overText{
            overflow: hidden;
            text-overflow:ellipsis;
            white-space: nowrap;
        }
        .courseDiv{
            width: 100%;
            height: 300px;
            background-color: rgba(255, 255, 255, 1);
            border-radius: 5px;
            -moz-box-shadow: 1px 5px 10px rgba(215, 215, 215, 0.349019607843137);
            -webkit-box-shadow: 1px 5px 10px rgba(215, 215, 215, 0.349019607843137);
            box-shadow: 1px 5px 10px rgba(215, 215, 215, 0.349019607843137);
            overflow: hidden;
        }
        .courseDetail{
            width: 335px;
            height: 270px;
            margin: 15px;
            /*background-color: #E6E6E6;*/
        }
        .courseName{
            font-weight: 700;
            font-style: normal;
            font-size: 20px;
            color: #E74434;
        }
        .courseDescribe{
            font-size: 14px;
            color: #797979;
            line-height: 16px;
        }
        .courseInfo{
            color: #797979;
            margin: 20px 0;
            line-height: 20px;
            height: 20px;
        }
        .courseInfo>span{
            float: left;
            margin-right: 30px;
            line-height: 20px;
            height: 20px;
            display: block;
            font-size: 14px
        }
        .courseInfo img{
            display: inline-block;
            vertical-align: middle;
            width: 20px;
            height: 20px;
        }
        .div_group{
            height: 821px;
            margin-top: 0;
        }
        .videoDescribe{
            top: 180px;
        }
        .ui-pagination-container .ui-pagination-page-item:hover{
            border-color: rgba(231, 68, 52, 1);
            color: rgba(231, 68, 52, 1);
        }
        .ui-pagination-container .ui-pagination-page-item.active{
            background: rgba(231, 68, 52, 1);
            border-color: rgba(231, 68, 52, 1);
            color: white;
        }
        .hr1{ height:1px;border:none;border-top:1px solid #F0F0F0;}
    </style>
</head>
<body>




<link rel="stylesheet" type="text/css" href="http://cymooc.org:80/common/css/muke.css">
<link rel="stylesheet" type="text/css" href="http://cymooc.org:80/common/css/navigationBar.css">
<link href="http://cymooc.org:80/common/css/style.css" type="text/css"rel="stylesheet" media="all">
<link href="http://cymooc.org:80/common/css/font-awesome.css" rel="stylesheet">
<!-- font-awesome icons -->
<link rel="stylesheet" href="http://cymooc.org:80/common/css/flexslider.css" type="text/css" media="screen" property="" />
<script src="http://cymooc.org:80/common/js/jquery-2.2.3.min.js"></script>
<script src="http://cymooc.org:80/common/layer/layer.js" type="text/javascript" charset="utf-8"></script>
<script src="http://cymooc.org:80/usersPersonal/js/main.js"></script>
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
</style>
<input type="hidden" id="basepath" value="http://cymooc.org:80/"/>
<!--<div class="headBar" id="fixed">
	<div class="nav-art">
		<span class="navimg-art"><a href="http://cymooc.org:80/"><img
				border="0" style="height:25px;width:140px;margin-top:15px;"
				src="http://cymooc.org:80/common/images/cymklogo.png"></a></span>
		<ul class="nag-art">

            <li class="nag_li" style="margin-left:30px;" id="l0"><a
                    href="http://cymooc.org:80/indexPage_IndexPage_index_Index" class="link1"> 首页 </a></li>
            <li class="nag_li" id="l2"><a href="http://cymooc.org:80/course_CourseRe_courses_course"
                                          class="link1"> 课程库 </a></li>
            <li class="nag_li" id="l2"><a href="http://cymooc.org:80/course_CourseRe_opens_course"
                                          class="link1"> 公开课 </a></li>
            <li class="nag_li" id="l4"><a href="http://cymooc.org:80/activity_Activity_activityList_activity"
                                          class="link1"> 活动 </a></li>
            <li class="nag_li" id="l3"><a href="http://cymooc.org:80/experts_Experts_index_teacher"
                                          class="link1"> 师资 </a></li>
            <li class="nag_li" id="l5"><a href="http://cymooc.org:80/news_NewsPage_list_news?articletype=3"
                                          class="link1"> 文章 </a></li>


			<li class="nag_li2">
				<div class="select" style="width:250px;height: 30px;">

						<input type="text" name="keywords" id="keywords"
							placeholder="搜索你感兴趣的新闻" value="" /> <input type="hidden"
							name="type" value="1" /> <a href="javascript:void(0);"
							onclick="mysearch()" class="sellink"> </a>
			 		</form>
				</div>
			</li>
		</ul>-->
<!-- 	<script>
    $(function(){
        $('.nag_li').click(function(){
            alert(123)
            $('.nag_li').css({border:none});
            $('.nag_li').children().eq(0).css({color: '#ec6941'});
            $(this).css({borderBottom: '2px solid #fa5c53'});
            $(this).children().eq(0).css({color: '#D11303'});
        });
    });
    </script> -->
<!--<span class="massage"> <span class="exambtn_lore">


            <div class="navbar">
                <div class="navbar-inner">
                    <ul class="nav nav-pills">
                        <li class="dropdown" >
                                <img style="width:25px;margin-top:5px;margin-left:-60px;float:left" alt="个人中心/注销"
                                src="http://cymooc.org:80/image/ren.png" title="个人中心/注销">
                            <ul class="dropdown-menu" >
                                <li><a href="http://cymooc.org:80/personal_PersonalPage_index_personal"  id="personal">个人中心</a></li>
                                <li><a href="javascript:void(0)" id="logout">注销</a></li>
                            </ul>
                        </li>
                        <li class="dropdown" >
                                <img style="width:25px;margin-top:5px;margin-left:-10px;float:left" alt="浏览记录"
                                src="http://cymooc.org:80/image/liulang.png" title="浏览记录">
                            <ul class="dropdown-menu"  style="top:30px;left:-70px">
                                <li><a href="javascript:void(0)" >该功能暂未开放</a></li>
                            </ul>
                        </li>
                        <li class="dropdown" >

                                <img style="width:25px;margin-top:5px;margin-left:22px;float:left" alt="收藏中心"
                                src="http://cymooc.org:80/image/soucang.png" title="收藏中心">
                            <ul class="dropdown-menu"  style="top:30px;left:-30px">
                                <li><a href="javascript:void(0)" >该功能暂未开放</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>

</span>
</span>
</div>
</div>-->

<script type="text/javascript">

    $(function() {
        $("#l"+"").addClass("currentBar");
    });
    /* 	function mysearch() {
            form1.submit();
        } */
    function searchsubmit() {
        $("#keywords").val(encodeURI($("#keywords").val()));
    }
    function mysearch() {
        var title =  encodeURI(encodeURI($("#keywords").val().trim()));
        window.location.href = "news_NewsPage_list_news?article_title="+title+"&articletype=&circle_id=";
    };
</script>

<!-- 菜单栏  -->
<div style=" overflow:hidden;height: 100%;margin: 0 auto;margin-top:20px;width: 1100px;box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
    <div class="course-all">
        <div class="courseul" style="background-color: white;">
            <div>
                <div class="nav_left" style="margin-right: 35px;">
                    <b>课程库</b>
                </div>
                <div class="nav_head sortul">
                    <div nav_body_info="nav_body_all"     class="course_curr"  >
                        <a href="?program_type=" onclick="" >全部</a>
                    </div>
                    <div nav_body_info="nav_body_java"   >
                        <a href="?program_type=0" onclick="" >Java</a>
                    </div>
                    <div nav_body_info="nav_body_html"   >
                        <a href="?program_type=1" onclick="" >Html5</a>
                    </div>
                    <div nav_body_info="nav_body_in"     >
                        <a href="?program_type=2" onclick="" >嵌入式</a>
                    </div>
                    <div nav_body_info="nav_body_in"     >
                        <a href="?program_type=3" onclick="" >软件开发</a>
                    </div>
                </div>
            </div>
            <!--<div>
                <div class="nav_left">
                    <b>课程类别</b>
                </div>
                <div class="nav_body sortul">
                        <div   class="course_curr" >
                            <a href="?prod_category=&program_type="> 全部</a>
                        </div>
                        <div >
                            <a href="?prod_category=0&program_type="> 实战项目</a>
                        </div>
                        <div >
                            <a href="?prod_category=1&program_type="> 知识库</a>
                        </div>
                        <div >
                            <a href="?prod_category=2&program_type="> 其他</a>
                        </div>
                </div>-->
        </div>
    </div>
</div>

<!-- 页面下半部分 -->
<div style=" overflow:hidden;height: 100%;margin: 0 auto;padding-top:20px;width: 1100px;">
    <!-- box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); -->
    <div style="float:left;width:800px;background: #fff;border-radius:5px;min-height: 710px;" >
        <!-- 最新、最热、播放最多  -->
        <div style="background:#fff;height:46px;width:800px;margin:0px auto;border-radius:5px 5px 0 0">
            <ul class="sortul2">
                <li  class="course_curr"  >
                    <a href="?orders=a.prod_id&prod_category=&program_type=" > 全部 </a>
                </li>
                <li >
                    <a href="?orders=a.create_time&prod_category=&program_type="  >最新 </a>
                </li>

                <li >
                    <a href="?orders=a.prod_click_num&prod_category=&program_type="  >最热</a>
                </li>
            </ul>
        </div>
        <!-- 最新、最热、播放最多  END -->


        <!-- 筛选的课程结果  -->
        <div class="courseright" style="display: block;margin:0 auto;float: none;">
            <div class="clearh"></div>
            <!-- 视频 -->
            <ul class="courseulr" id="courseulr" style="min-height: 700px">


                <!-- 一个视频 -->
                <li style="width:260px;margin-top: 10px;" onclick="encryptUrl('course_CourseRe_index1_course?prodid=',10612)">
                    <div class="courselist" style="float:left;width:240px;height:190px;position: relative;">
                        <img style="border-radius:3px 3px 0 0;width:240px;height:135px;" src="http://117.27.136.49:8078/data/product/3e7903d2fe244e81906191deea4698cf.jpg" onerror="this.src='http://cymooc.org:80/common/images/uiz7.jpg'"  title="python入门基础">
                        <div style="position: relative;top:20px;">
                            <div style="float:left;margin-top:-20px;width:230px;color:#8a8a8a;">
                                <div style="margin-top:5px;margin-left:0px;height:18px;width:180px;" >
                                    <div style=" float:left;">
                                        【python



                                        】
                                    </div>
                                    <div style="float:left;width:100px;overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                        python入门基础
                                    </div>
                                </div>
                            </div>

                            <!--讲师头像-->
                            <div style="float:left;margin-top:4px;width:235px;color:#8a8a8a;">


                                <div style="float:left;margin-top:2px;margin-left:5px;height:18px;width:100px;overflow:hidden;text-overflow:ellipsis; white-space: nowrap;color:#FF0000;" >
                                    <img src="http://cymooc.org:80/common/images/experience/u13.png" style="float:left;width:24px;height:24px;" />



                                    <span class="num" style="float:left;margin-left:10px;">0
						                                        </span>


                                </div>



                                <span style="float:left;display:inline-block;margin-top:5px;margin-left:85px;">黄平平</span>
                                <img src="http://117.27.136.49:8078/cymooc_photo/teacher/huangpingping.jpg" style="margin-top:-70px;width:48px;height: 48px;border-radius: 24px;display:block;float:right;border:3px solid #fff;">
                                <div style="clear:both"></div>
                            </div>
                        </div>
                        <!--                                 <div class="courseDiv"> -->

                        <!--                                         </p> -->
                        <!--                                     </div> -->
                        <!--                                     <div class="clear"></div> -->
                        <!--                                 </div> -->
                </li>
                <!-- 一个视频 -->

                <!-- 一个视频 -->
                <li style="width:260px;margin-top: 10px;"



                    onclick="encryptUrl('course_CourseRe_index1_course?prodid=',10608)"

                >
                    <div class="courselist" style="float:left;width:240px;height:190px;position: relative;">
                        <img style="border-radius:3px 3px 0 0;width:240px;height:135px;" src="http://117.27.136.49:8078/data/product/2524751410de48f2bdc2e5dd3b25a857.jpg" onerror="this.src='http://cymooc.org:80/common/images/uiz7.jpg'"  title="扫雷游戏">
                        <div style="position: relative;top:20px;">
                            <div style="float:left;margin-top:-20px;width:230px;color:#8a8a8a;">
                                <div style="margin-top:5px;margin-left:0px;height:18px;width:180px;" >
                                    <div style=" float:left;">
                                        【 java



                                        】
                                    </div>
                                    <div style="float:left;width:100px;overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                        扫雷游戏
                                    </div>
                                </div>
                            </div>

                            <div style="float:left;margin-top:4px;width:235px;color:#8a8a8a;">


                                <div style="float:left;margin-top:2px;margin-left:5px;height:18px;width:100px;overflow:hidden;text-overflow:ellipsis; white-space: nowrap;color:#FF0000;" >
                                    <img src="http://cymooc.org:80/common/images/experience/u13.png" style="float:left;width:24px;height:24px;" />



                                    <span class="num" style="float:left;margin-left:10px;">341
						                                        </span>


                                </div>



                                <span style="float:left;display:inline-block;margin-top:5px;margin-left:85px;">陈 乐</span>
                                <img src="http://117.27.136.49:8078/data/product/chenle1.jpg" style="margin-top:-70px;width:48px;height: 48px;border-radius: 24px;display:block;float:right;border:3px solid #fff;">
                                <div style="clear:both"></div>
                            </div>
                        </div>
                        <!--                                 <div class="courseDiv"> -->

                        <!--                                         </p> -->
                        <!--                                     </div> -->
                        <!--                                     <div class="clear"></div> -->
                        <!--                                 </div> -->
                </li>
                <!-- 一个视频 -->

                <!-- 一个视频 -->
                <li style="width:260px;margin-top: 10px;"



                    onclick="encryptUrl('course_CourseRe_index1_course?prodid=',10607)"

                >
                    <div class="courselist" style="float:left;width:240px;height:190px;position: relative;">
                        <img style="border-radius:3px 3px 0 0;width:240px;height:135px;" src="http://117.27.136.49:8078/data/product/d5e9b3389972482294a0b983c764f192.jpg" onerror="this.src='http://cymooc.org:80/common/images/uiz7.jpg'"  title="Java界面编程">
                        <div style="position: relative;top:20px;">
                            <div style="float:left;margin-top:-20px;width:230px;color:#8a8a8a;">
                                <div style="margin-top:5px;margin-left:0px;height:18px;width:180px;" >
                                    <div style=" float:left;">
                                        【 java



                                        】
                                    </div>
                                    <div style="float:left;width:100px;overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                        Java界面编程
                                    </div>
                                </div>
                            </div>

                            <div style="float:left;margin-top:4px;width:235px;color:#8a8a8a;">


                                <div style="float:left;margin-top:2px;margin-left:5px;height:18px;width:100px;overflow:hidden;text-overflow:ellipsis; white-space: nowrap;color:#FF0000;" >
                                    <img src="http://cymooc.org:80/common/images/experience/u13.png" style="float:left;width:24px;height:24px;" />



                                    <span class="num" style="float:left;margin-left:10px;">435
						                                        </span>


                                </div>



                                <span style="float:left;display:inline-block;margin-top:5px;margin-left:85px;">陈 乐</span>
                                <img src="http://117.27.136.49:8078/data/product/chenle1.jpg" style="margin-top:-70px;width:48px;height: 48px;border-radius: 24px;display:block;float:right;border:3px solid #fff;">
                                <div style="clear:both"></div>
                            </div>
                        </div>
                        <!--                                 <div class="courseDiv"> -->

                        <!--                                         </p> -->
                        <!--                                     </div> -->
                        <!--                                     <div class="clear"></div> -->
                        <!--                                 </div> -->
                </li>
                <!-- 一个视频 -->

                <!-- 一个视频 -->
                <li style="width:260px;margin-top: 10px;"



                    onclick="encryptUrl('course_CourseRe_index1_course?prodid=',10606)"

                >
                    <div class="courselist" style="float:left;width:240px;height:190px;position: relative;">
                        <img style="border-radius:3px 3px 0 0;width:240px;height:135px;" src="http://117.27.136.49:8078/data/product/fab0e736d15e40e2ae22dce49b7bb7f4.jpg" onerror="this.src='http://cymooc.org:80/common/images/uiz7.jpg'"  title="租车管理系统">
                        <div style="position: relative;top:20px;">
                            <div style="float:left;margin-top:-20px;width:230px;color:#8a8a8a;">
                                <div style="margin-top:5px;margin-left:0px;height:18px;width:180px;" >
                                    <div style=" float:left;">
                                        【 java



                                        】
                                    </div>
                                    <div style="float:left;width:100px;overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                        租车管理系统
                                    </div>
                                </div>
                            </div>

                            <div style="float:left;margin-top:4px;width:235px;color:#8a8a8a;">


                                <div style="float:left;margin-top:2px;margin-left:5px;height:18px;width:100px;overflow:hidden;text-overflow:ellipsis; white-space: nowrap;color:#FF0000;" >
                                    <img src="http://cymooc.org:80/common/images/experience/u13.png" style="float:left;width:24px;height:24px;" />



                                    <span class="num" style="float:left;margin-left:10px;">532
						                                        </span>


                                </div>



                                <span style="float:left;display:inline-block;margin-top:5px;margin-left:85px;">陈 乐</span>
                                <img src="http://117.27.136.49:8078/data/product/chenle1.jpg" style="margin-top:-70px;width:48px;height: 48px;border-radius: 24px;display:block;float:right;border:3px solid #fff;">
                                <div style="clear:both"></div>
                            </div>
                        </div>
                        <!--                                 <div class="courseDiv"> -->

                        <!--                                         </p> -->
                        <!--                                     </div> -->
                        <!--                                     <div class="clear"></div> -->
                        <!--                                 </div> -->
                </li>
                <!-- 一个视频 -->

                <!-- 一个视频 -->
                <li style="width:260px;margin-top: 10px;"



                    onclick="encryptUrl('course_CourseRe_index1_course?prodid=',10605)"

                >
                    <div class="courselist" style="float:left;width:240px;height:190px;position: relative;">
                        <img style="border-radius:3px 3px 0 0;width:240px;height:135px;" src="http://117.27.136.49:8078/data/product/f86c6a5515a643cd85d5f8e96609787e.jpg" onerror="this.src='http://cymooc.org:80/common/images/uiz7.jpg'"  title="Java面向对象">
                        <div style="position: relative;top:20px;">
                            <div style="float:left;margin-top:-20px;width:230px;color:#8a8a8a;">
                                <div style="margin-top:5px;margin-left:0px;height:18px;width:180px;" >
                                    <div style=" float:left;">
                                        【 java



                                        】
                                    </div>
                                    <div style="float:left;width:100px;overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                        Java面向对象
                                    </div>
                                </div>
                            </div>

                            <div style="float:left;margin-top:4px;width:235px;color:#8a8a8a;">


                                <div style="float:left;margin-top:2px;margin-left:5px;height:18px;width:100px;overflow:hidden;text-overflow:ellipsis; white-space: nowrap;color:#FF0000;" >
                                    <img src="http://cymooc.org:80/common/images/experience/u13.png" style="float:left;width:24px;height:24px;" />



                                    <span class="num" style="float:left;margin-left:10px;">124
						                                        </span>


                                </div>



                                <span style="float:left;display:inline-block;margin-top:5px;margin-left:85px;">陈 乐</span>
                                <img src="http://117.27.136.49:8078/data/product/chenle1.jpg" style="margin-top:-70px;width:48px;height: 48px;border-radius: 24px;display:block;float:right;border:3px solid #fff;">
                                <div style="clear:both"></div>
                            </div>
                        </div>
                        <!--                                 <div class="courseDiv"> -->

                        <!--                                         </p> -->
                        <!--                                     </div> -->
                        <!--                                     <div class="clear"></div> -->
                        <!--                                 </div> -->
                </li>
                <!-- 一个视频 -->

                <!-- 一个视频 -->
                <li style="width:260px;margin-top: 10px;"



                    onclick="encryptUrl('course_CourseRe_index1_course?prodid=',10604)"

                >
                    <div class="courselist" style="float:left;width:240px;height:190px;position: relative;">
                        <img style="border-radius:3px 3px 0 0;width:240px;height:135px;" src="http://117.27.136.49:8078/data/product/df7f22ff6c8a473db3021b20d07608eb.jpg" onerror="this.src='http://cymooc.org:80/common/images/uiz7.jpg'"  title="抽奖系统">
                        <div style="position: relative;top:20px;">
                            <div style="float:left;margin-top:-20px;width:230px;color:#8a8a8a;">
                                <div style="margin-top:5px;margin-left:0px;height:18px;width:180px;" >
                                    <div style=" float:left;">
                                        【 java



                                        】
                                    </div>
                                    <div style="float:left;width:100px;overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                        抽奖系统
                                    </div>
                                </div>
                            </div>

                            <div style="float:left;margin-top:4px;width:235px;color:#8a8a8a;">


                                <div style="float:left;margin-top:2px;margin-left:5px;height:18px;width:100px;overflow:hidden;text-overflow:ellipsis; white-space: nowrap;color:#FF0000;" >
                                    <img src="http://cymooc.org:80/common/images/experience/u13.png" style="float:left;width:24px;height:24px;" />



                                    <span class="num" style="float:left;margin-left:10px;">312
						                                        </span>


                                </div>



                                <span style="float:left;display:inline-block;margin-top:5px;margin-left:85px;">陈 乐</span>
                                <img src="http://117.27.136.49:8078/data/product/chenle1.jpg" style="margin-top:-70px;width:48px;height: 48px;border-radius: 24px;display:block;float:right;border:3px solid #fff;">
                                <div style="clear:both"></div>
                            </div>
                        </div>
                        <!--                                 <div class="courseDiv"> -->

                        <!--                                         </p> -->
                        <!--                                     </div> -->
                        <!--                                     <div class="clear"></div> -->
                        <!--                                 </div> -->
                </li>
                <!-- 一个视频 -->

                <!-- 一个视频 -->
                <li style="width:260px;margin-top: 10px;"



                    onclick="encryptUrl('course_CourseRe_index1_course?prodid=',10603)"

                >
                    <div class="courselist" style="float:left;width:240px;height:190px;position: relative;">
                        <img style="border-radius:3px 3px 0 0;width:240px;height:135px;" src="http://117.27.136.49:8078/data/product/bc3451953c084b64acd44456a1fec24a.jpg" onerror="this.src='http://cymooc.org:80/common/images/uiz7.jpg'"  title="Java初级语法">
                        <div style="position: relative;top:20px;">
                            <div style="float:left;margin-top:-20px;width:230px;color:#8a8a8a;">
                                <div style="margin-top:5px;margin-left:0px;height:18px;width:180px;" >
                                    <div style=" float:left;">
                                        【 java



                                        】
                                    </div>
                                    <div style="float:left;width:100px;overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                        Java初级语法
                                    </div>
                                </div>
                            </div>

                            <div style="float:left;margin-top:4px;width:235px;color:#8a8a8a;">


                                <div style="float:left;margin-top:2px;margin-left:5px;height:18px;width:100px;overflow:hidden;text-overflow:ellipsis; white-space: nowrap;color:#FF0000;" >
                                    <img src="http://cymooc.org:80/common/images/experience/u13.png" style="float:left;width:24px;height:24px;" />



                                    <span class="num" style="float:left;margin-left:10px;">234
						                                        </span>


                                </div>



                                <span style="float:left;display:inline-block;margin-top:5px;margin-left:85px;">陈 乐</span>
                                <img src="http://117.27.136.49:8078/data/product/chenle1.jpg" style="margin-top:-70px;width:48px;height: 48px;border-radius: 24px;display:block;float:right;border:3px solid #fff;">
                                <div style="clear:both"></div>
                            </div>
                        </div>
                        <!--                                 <div class="courseDiv"> -->

                        <!--                                         </p> -->
                        <!--                                     </div> -->
                        <!--                                     <div class="clear"></div> -->
                        <!--                                 </div> -->
                </li>
                <!-- 一个视频 -->

                <!-- 一个视频 -->
                <li style="width:260px;margin-top: 10px;"



                    onclick="encryptUrl('course_CourseRe_index1_course?prodid=',10597)"

                >
                    <div class="courselist" style="float:left;width:240px;height:190px;position: relative;">
                        <img style="border-radius:3px 3px 0 0;width:240px;height:135px;" src="http://117.27.136.49:8078/data/product/254be4af33ec4136b5f6248903d63ed5.jpg" onerror="this.src='http://cymooc.org:80/common/images/uiz7.jpg'"  title="捕鱼达人">
                        <div style="position: relative;top:20px;">
                            <div style="float:left;margin-top:-20px;width:230px;color:#8a8a8a;">
                                <div style="margin-top:5px;margin-left:0px;height:18px;width:180px;" >
                                    <div style=" float:left;">
                                        【

                                        嵌入式

                                        】
                                    </div>
                                    <div style="float:left;width:100px;overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                        捕鱼达人
                                    </div>
                                </div>
                            </div>

                            <div style="float:left;margin-top:4px;width:235px;color:#8a8a8a;">


                                <div style="float:left;margin-top:2px;margin-left:5px;height:18px;width:100px;overflow:hidden;text-overflow:ellipsis; white-space: nowrap;color:#FF0000;" >
                                    <img src="http://cymooc.org:80/common/images/experience/u13.png" style="float:left;width:24px;height:24px;" />



                                    <span class="num" style="float:left;margin-left:10px;">893
						                                        </span>


                                </div>



                                <span style="float:left;display:inline-block;margin-top:5px;margin-left:85px;">李雅静</span>
                                <img src="http://117.27.136.49:8078/cymooc_photo/teacher/liyajing.jpg" style="margin-top:-70px;width:48px;height: 48px;border-radius: 24px;display:block;float:right;border:3px solid #fff;">
                                <div style="clear:both"></div>
                            </div>
                        </div>
                        <!--                                 <div class="courseDiv"> -->

                        <!--                                         </p> -->
                        <!--                                     </div> -->
                        <!--                                     <div class="clear"></div> -->
                        <!--                                 </div> -->
                </li>
                <!-- 一个视频 -->

                <!-- 一个视频 -->
                <li style="width:260px;margin-top: 10px;"



                    onclick="encryptUrl('course_CourseRe_index1_course?prodid=',10407)"

                >
                    <div class="courselist" style="float:left;width:240px;height:190px;position: relative;">
                        <img style="border-radius:3px 3px 0 0;width:240px;height:135px;" src="http://117.27.136.49:8078/data/product/02064219511a4b7797c0bf97303a110a.jpg" onerror="this.src='http://cymooc.org:80/common/images/uiz7.jpg'"  title="NBA官网">
                        <div style="position: relative;top:20px;">
                            <div style="float:left;margin-top:-20px;width:230px;color:#8a8a8a;">
                                <div style="margin-top:5px;margin-left:0px;height:18px;width:180px;" >
                                    <div style=" float:left;">
                                        【
                                        Html5


                                        】
                                    </div>
                                    <div style="float:left;width:100px;overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                        NBA官网
                                    </div>
                                </div>
                            </div>

                            <div style="float:left;margin-top:4px;width:235px;color:#8a8a8a;">


                                <div style="float:left;margin-top:2px;margin-left:5px;height:18px;width:100px;overflow:hidden;text-overflow:ellipsis; white-space: nowrap;color:#FF0000;" >
                                    <img src="http://cymooc.org:80/common/images/experience/u13.png" style="float:left;width:24px;height:24px;" />



                                    <span class="num" style="float:left;margin-left:10px;">106270
						                                        </span>


                                </div>



                                <span style="float:left;display:inline-block;margin-top:5px;margin-left:85px;">李雅静</span>
                                <img src="http://117.27.136.49:8078/cymooc_photo/teacher/liyajing.jpg" style="margin-top:-70px;width:48px;height: 48px;border-radius: 24px;display:block;float:right;border:3px solid #fff;">
                                <div style="clear:both"></div>
                            </div>
                        </div>
                        <!--                                 <div class="courseDiv"> -->

                        <!--                                         </p> -->
                        <!--                                     </div> -->
                        <!--                                     <div class="clear"></div> -->
                        <!--                                 </div> -->
                </li>
                <!-- 一个视频 -->




                <div class="clearh"></div>
        </div>
        <div class="clear"></div>
        <!-- 筛选的课程结果  END -->
        <div id="pagination" class="page" style="float:right;height: 33px;margin-right: 5px;margin-bottom: 5px"></div>

    </div>

    <!-- 推荐课程 -->
    <div style="float: right;width: 280px;height:550px;">
        <div class="div_group">
            <div class="divTitle">
                <div class="titleBottom"></div>
                <div class="titleRight"></div>
                <div class="titleText">热门课程</div>
            </div>


            <a href="javascript:void(0);" onclick="encryptUrl('course_CourseRe_index1_course?prodid=',10592);">
                <div class="div_video" style="border:none;">
                    <div class="imgBox" style="border-radius:5px;">
                        <div >
                            <div style="float:left;height:100px;width:100px;">
                                <img  src="http://117.27.136.49:8078/data/product/226ef57641024639836af7e960716375.jpg" style="width:150px;height:100px;border-radius:5px;"/></div>
                            <div style="float:left;height:100px;width:150px;">

                                <span class="video_tilte" style="margin-left:60px;overflow: hidden;width:100px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">企业需要什么样的人</span><br />



                                <span style="float:left;margin-left:105px;margin-top:10px;">欧忠良</span>
                                <br />
                                <span style="float:left;margin-top:10px;margin-left:5px;">
							<img src="http://cymooc.org:80/common/images/course/u991.png" style="width:20px;height:20px;margin-left:50px;margin-bottom:4px;"/>
							<span style="color: #69BADE;">1240</span>
							次<!-- 播放 -->
						   </span>
                            </div>
                        </div>
                        <!--                             <div class="videoDescribe"> -->

                        <!--                                 </p> -->
                        <!--                             </div> -->
                    </div>
                    <hr class="hr1" />
                </div>
            </a>


            <a href="javascript:void(0);" onclick="encryptUrl('course_CourseRe_index1_course?prodid=',10593);">
                <div class="div_video" style="border:none;">
                    <div class="imgBox" style="border-radius:5px;">
                        <div >
                            <div style="float:left;height:100px;width:100px;">
                                <img  src="http://117.27.136.49:8078/data/product/b1c9ce07b46142ee97d98973a44b74c6.jpg" style="width:150px;height:100px;border-radius:5px;"/></div>
                            <div style="float:left;height:100px;width:150px;">

                                <span class="video_tilte" style="margin-left:60px;overflow: hidden;width:100px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">程序员的成长之路</span><br />



                                <span style="float:left;margin-left:105px;margin-top:10px;">欧忠良</span>
                                <br />
                                <span style="float:left;margin-top:10px;margin-left:5px;">
							<img src="http://cymooc.org:80/common/images/course/u991.png" style="width:20px;height:20px;margin-left:50px;margin-bottom:4px;"/>
							<span style="color: #69BADE;">1153</span>
							次<!-- 播放 -->
						   </span>










                            </div>
                        </div>
                        <!--                             <div class="videoDescribe"> -->

                        <!--                                 </p> -->
                        <!--                             </div> -->
                    </div>
                    <hr class="hr1" />
                </div>
            </a>

            <!--                     <div class="div_video" style="padding-bottom: 7px;"> -->
            <!--                         <div class="imgBox"> -->

            <!-- <!--                             <div class="videoDescribe"> -->

            <!-- <!--                                 </p> -->
            <!-- <!--                             </div> -->
            <!--                         </div> -->












            <!--                     </div> -->
            <!--                 </a> -->


            <a href="javascript:void(0);" onclick="encryptUrl('course_CourseRe_index1_course?prodid=',10594);">
                <div class="div_video" style="border:none;">
                    <div class="imgBox" style="border-radius:5px;">
                        <div >
                            <div style="float:left;height:100px;width:100px;">
                                <img  src="http://117.27.136.49:8078/data/product/5f5e115f5e4b465c812135164799f0dc.jpg" style="width:150px;height:100px;border-radius:5px;"/></div>
                            <div style="float:left;height:100px;width:150px;">

                                <span class="video_tilte" style="margin-left:60px;overflow: hidden;width:100px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">学编程的历经阶段</span><br />



                                <span style="float:left;margin-left:105px;margin-top:10px;">欧忠良</span>
                                <br />
                                <span style="float:left;margin-top:10px;margin-left:5px;">
							<img src="http://cymooc.org:80/common/images/course/u991.png" style="width:20px;height:20px;margin-left:50px;margin-bottom:4px;"/>
							<span style="color: #69BADE;">862</span>
							次<!-- 播放 -->
						   </span>










                            </div>
                        </div>
                        <!--                             <div class="videoDescribe"> -->

                        <!--                                 </p> -->
                        <!--                             </div> -->
                    </div>
                    <hr class="hr1" />
                </div>
            </a>

            <!--                     <div class="div_video" style="padding-bottom: 7px;"> -->
            <!--                         <div class="imgBox"> -->

            <!-- <!--                             <div class="videoDescribe"> -->

            <!-- <!--                                 </p> -->
            <!-- <!--                             </div> -->
            <!--                         </div> -->












            <!--                     </div> -->
            <!--                 </a> -->


            <a href="javascript:void(0);" onclick="encryptUrl('course_CourseRe_index1_course?prodid=',10595);">
                <div class="div_video" style="border:none;">
                    <div class="imgBox" style="border-radius:5px;">
                        <div >
                            <div style="float:left;height:100px;width:100px;">
                                <img  src="http://117.27.136.49:8078/data/product/5a47ac47b98744089bf3aa4598c1087e.jpg" style="width:150px;height:100px;border-radius:5px;"/></div>
                            <div style="float:left;height:100px;width:150px;">

                                <span class="video_tilte" style="margin-left:60px;overflow: hidden;width:100px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">快速掌握一门开发语言</span><br />



                                <span style="float:left;margin-left:105px;margin-top:10px;">欧忠良</span>
                                <br />
                                <span style="float:left;margin-top:10px;margin-left:5px;">
							<img src="http://cymooc.org:80/common/images/course/u991.png" style="width:20px;height:20px;margin-left:50px;margin-bottom:4px;"/>
							<span style="color: #69BADE;">657</span>
							次<!-- 播放 -->
						   </span>










                            </div>
                        </div>
                        <!--                             <div class="videoDescribe"> -->

                        <!--                                 </p> -->
                        <!--                             </div> -->
                    </div>
                    <hr class="hr1" />
                </div>
            </a>

            <!--                     <div class="div_video" style="padding-bottom: 7px;"> -->
            <!--                         <div class="imgBox"> -->

            <!-- <!--                             <div class="videoDescribe"> -->

            <!-- <!--                                 </p> -->
            <!-- <!--                             </div> -->
            <!--                         </div> -->












            <!--                     </div> -->
            <!--                 </a> -->


            <a href="javascript:void(0);" onclick="encryptUrl('course_CourseRe_index1_course?prodid=',10596);">
                <div class="div_video" style="border:none;">
                    <div class="imgBox" style="border-radius:5px;">
                        <div >
                            <div style="float:left;height:100px;width:100px;">
                                <img  src="http://117.27.136.49:8078/data/product/b76e50228e274427b931d4ace82f7037.jpg" style="width:150px;height:100px;border-radius:5px;"/></div>
                            <div style="float:left;height:100px;width:150px;">

                                <span class="video_tilte" style="margin-left:60px;overflow: hidden;width:100px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">IT软件技术发展历程</span><br />



                                <span style="float:left;margin-left:105px;margin-top:10px;">欧忠良</span>
                                <br />
                                <span style="float:left;margin-top:10px;margin-left:5px;">
							<img src="http://cymooc.org:80/common/images/course/u991.png" style="width:20px;height:20px;margin-left:50px;margin-bottom:4px;"/>
							<span style="color: #69BADE;">556</span>
							次<!-- 播放 -->
						   </span>










                            </div>
                        </div>
                        <!--                             <div class="videoDescribe"> -->

                        <!--                                 </p> -->
                        <!--                             </div> -->
                    </div>
                    <hr class="hr1" />
                </div>
            </a>

            <!--                     <div class="div_video" style="padding-bottom: 7px;"> -->
            <!--                         <div class="imgBox"> -->

            <!-- <!--                             <div class="videoDescribe"> -->

            <!-- <!--                                 </p> -->
            <!-- <!--                             </div> -->
            <!--                         </div> -->












            <!--                     </div> -->
            <!--                 </a> -->

            <div class="clear"></div>
        </div>
    </div>
    <!-- 推荐课程 END -->
</div>
<!-- 页面下半部分 END -->
<!-- 空行 -->
<div class="clearh"></div>



<!--<div align="center" style="height:70px;width:100%;background: #fff;margin-top:20px">
	<div style="display: inline-block;margin-top:15px">
	<span style="margin: 10px;color:gray">联系热线：0591-83713060</span>|
	<span style="margin: 10px;color:gray">地址：福州金山大榕树创意园5号楼3层</span>|
	<span style="margin: 10px;color:gray">创造和实现美好梦想的地方</span><br />
	</div>

	<div style="display: inline-block;width: 5px"></div>
	<img id="a" title="微信公众号：3315716916" style="width: 20px;height: 20px;" src="http://cymooc.org:80/image/weixin.jpg" />
	<div style="display: inline-block;width: 10px"></div>
	<a target="_blank" href="tencent://message/?Menu=yes&uin=2195974152&Site=QQ&Service=300&sigT=45a1e5847943b64c6ff3990f8a9e644d2b31356cb0b4ac6b24663a3c8dd0f8aa12a595b1714f9d45"><img title="qq:梅老师 3315716916" style="width: 20px;height: 28px;z-index:99999" src="http://cymooc.org:80/image/qq.jpg" /> <br>
	</a>-->
<!-- 	站长统计 -->
<!--<script type="text/javascript">document.write(unescape("%3Cspan id='cnzz_stat_icon_1278629301'%3E%3C/span%3E%3Cscript src='https://v1.cnzz.com/z_stat.php%3Fid%3D1278629301%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>

<span>版权所有 闽ICP备11003491号</span>
<div style="clear:both"></div>
<div id="img"  style="display:none;position: absolute;z-index:9999"><img width="200" heigh="200" style="display:inline-block;z-index:9999;" src="http://cymooc.org:80/common/images/qrcode_1127.jpg"/></div>
</div>-->

<!-- <script type="text/javascript" >
//  var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
//  document.write(unescape("%3Cspanid='cnzz_stat_icon_1273317759'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s13.cnzz.com/z_stat.php%3Fid%3D1273317759%26show%3Dpic1 ' type='text/javascript'%3E%3C/script%3E"));
</script> -->

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



<script src="http://cymooc.org:80/common/js/public/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="http://cymooc.org:80/common/js/jquery.pagination.min.js"></script>
<script type="text/javascript" src="http://cymooc.org:80/common/js/jsencrypt.min.js" charset="UTF-8"></script>
<script>
    /* $(function () {

            $("#btn").click(function () {
                $.ajax({
                    url: '@Url.Action("Login")',
                    data: "pwd=" + encodeURI(data).replace(/\+/g, '%2B'),  //+号的处理：因为数据在网络上传输时，非字母数字字符都将被替换成百分号（%）后跟两位十六进制数，而base64编码在传输到后端的时候，+会变成空格，因此先替换掉。后端再替换回来
                    type: 'post',
                    success: function (msg) {
                        alert(msg);
                    }
                });
            });

        }); */
    //rsa加密
    function encryptUrl(url,value){
        //alert(value);
        value = value.toString();
        //var str = "10552";
        var publicKey = 'MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAJ1Y+eHJ9hkQWKAvBTZI+TyLAPRfpCCWt0Cg4bzfhH0HbEmN04hPCb65zYgHAWwUGDRavzuOyOH9zu70XJjFj4UCAwEAAQ==';
        //var publicKey = 'MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBANID4bpP43dkdDdcl7HS3oJVIUKXNnpLLefL/CBWHGloZyF173SJoFeajEb+yjoI1GGToFqy7roqN1cE+etquTUCAwEAAQ==';
        var encrypt = new JSEncrypt();
        encrypt.setPublicKey(publicKey);
        var encrypted = encrypt.encrypt(value);
        //console.log(encrypted);
        window.location.href='course_CourseRe_index1_course?prodid2='+encrypted;
    }
    var searchType=''; //搜索类型
    var searchType2='100';
    var orderType ='';
    var prodType = ''; //产品类型
    var categoryType = '';//产品种类
    /* $(function () {
        $(".searchType > div").click(function () {
            searchType=$(this).data("circle");
            window.location.href="course_CourseRe_courses_course?program_type="+searchType+"&order="+orderType+"&prod_category="+categoryType
        })
         $(".categoryType > div").click(function () {
            categoryType=$(this).data("category");
            window.location.href="course_CourseRe_courses_course?program_type="+searchType+"&order="+orderType+"&prod_category="+categoryType
        })
        $(".orderType > li").click(function () {
            orderType=$(this).data("order");
            window.location.href="course_CourseRe_courses_course?program_type="+searchType+"&order="+orderType+"&prod_category="+categoryType
        })
    }); */
    $("#pagination").pagination({
        currentPage: 1,
        totalPage: 4  ,
        isShow: true,
        count: 4,
        homePageText: "<<",
        endPageText: ">>",
        prevPageText: "<",
        nextPageText: ">",
        callback: function(current) {
            window.location.href="course_CourseRe_courses_course?pageNum="+current+"&program_type="+searchType+"&order="+orderType
        }
    });
    $("#pagination2").pagination({
        currentPage: 1,
        totalPage: 4  ,
        isShow: true,
        count: 4,
        homePageText: "<<",
        endPageText: ">>",
        prevPageText: "<",
        nextPageText: ">",
        callback: function(current) {
            window.location.href="course_CourseRe_courses_course?pageNum="+current+"&program_type="+searchType2+"&order="+orderType
        }
    });
    $(function(){
        $('.div_video').mouseenter(function(){
            $(this).find('.videoDescribe').animate({top:"37px"});
        }).mouseleave(function(){
            $(this).find('.videoDescribe').animate({top:"180px"});
        });
    });
</script>
</body>
</html>

