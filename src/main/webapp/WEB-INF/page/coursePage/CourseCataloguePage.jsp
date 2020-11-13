<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/11
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head>
    <meta charset="UTF-8">
    <title>课程列表页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="http://cymooc.org:80/common/css/jquery.pagination.css">

    <link rel="stylesheet" type="text/css" href="http://cymooc.org:80/common/css/course/courseList.css">
    <script type="text/javascript">var ctx = ''</script>
    <script type="text/javascript">var sessions = ''</script>
    <style>
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
    <link rel="stylesheet" href="http://cymooc.org/common/layer/skin/default/layer.css?v=3.0.3303" id="layuicss-skinlayercss"></head>
<body>


<div style="width: 100%;height: 720px;">

    <!-- 免费课程 -->
    <div class="courseDiv" data-cid="11132" onclick="playvideos('10612','11132','','1')">
        <img src="http://cymooc.org:80/common/images/course/u1004.png">
        <p class="courseName overText">第1章节：python语言概述</p>
    </div>

    <div class="courseDiv" data-cid="11133" onclick="playvideos('10612','11133','','2')">
        <img src="http://cymooc.org:80/common/images/course/u1004.png">
        <p class="courseName overText">第2章节：python语法基础</p>
    </div>

    <div class="courseDiv" data-cid="11135" onclick="playvideos('10612','11135','','3')">
        <img src="http://cymooc.org:80/common/images/course/u1004.png">
        <p class="courseName overText">第3章节：python数据结构</p>
    </div>

    <div class="courseDiv" data-cid="11136" onclick="playvideos('10612','11136','','4')">
        <img src="http://cymooc.org:80/common/images/course/u1004.png">
        <p class="courseName overText">第4章节：函数</p>
    </div>

    <div class="courseDiv" data-cid="11139" onclick="playvideos('10612','11139','','5')">
        <img src="http://cymooc.org:80/common/images/course/u1004.png">
        <p class="courseName overText">第5章节：文件IO操作</p>
    </div>

    <div class="courseDiv" data-cid="11141" onclick="playvideos('10612','11141','','6')">
        <img src="http://cymooc.org:80/common/images/course/u1004.png">
        <p class="courseName overText">第6章节：Python高级特性</p>
    </div>

    <div class="courseDiv" data-cid="11142" onclick="playvideos('10612','11142','','7')">
        <img src="http://cymooc.org:80/common/images/course/u1004.png">
        <p class="courseName overText">第7章节：面向对象编程1</p>
    </div>

    <div class="courseDiv" data-cid="11143" onclick="playvideos('10612','11143','','8')">
        <img src="http://cymooc.org:80/common/images/course/u1004.png">
        <p class="courseName overText">第8章节：面向对象编程2</p>
    </div>

    <div class="courseDiv" data-cid="11144" onclick="playvideos('10612','11144','','9')">
        <img src="http://cymooc.org:80/common/images/course/u1004.png">
        <p class="courseName overText">第9章节：面向对象编程3</p>
    </div>

    <div class="courseDiv" data-cid="11145" onclick="playvideos('10612','11145','','10')">
        <img src="http://cymooc.org:80/common/images/course/u1004.png">
        <p class="courseName overText">第10章节：Python面向对象总结</p>
    </div>


</div>

<div class="clear"></div>

<script src="http://cymooc.org:80/common/js/public/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="http://cymooc.org:80/common/js/public/public.js" type="text/javascript" charset="utf-8"></script>
<script src="http://cymooc.org:80/common/layer/layer.js"></script>
<script src="http://cymooc.org:80/common/js/course/courses.js" type="text/javascript" charset="utf-8"></script>
<script src="http://cymooc.org:80/common/js/jquery.pagination.min.js"></script>
<script type="text/javascript" src="http://cymooc.org:80/common/js/jsencrypt.min.js" charset="UTF-8"></script>


</body></html>
