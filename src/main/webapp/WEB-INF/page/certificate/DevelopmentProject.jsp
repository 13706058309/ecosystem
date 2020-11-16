<%--
  Created by IntelliJ IDEA.
  User: WTQ
  Date: 2020/11/12
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>开发证书项目</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/style.css"/>
</head>
<body>
<div id="body">
    <div id="container">

        <dl class="c_delivery">
            <dt>
                <h1><em></em>开发阶段</h1>
            </dt>
            <dd>
                <form id="deliveryForm">
                    <ul class="reset my_delivery">
                        <li>
                            <div class="d_item">
                                <h2 title="随便写">
                                    <em>JAVA证书考核</em>
                                    <span>（项目考核）</span>
                                    <!--  -->
                                    </a>
                                </h2>
                                <div class="clear"></div>
                                <label  class="d_jobname" target="_blank">
                                    钱程无忧 <span>认证证书</span>
                                </label>
                                <span class="d_time">申请时间：2014-07-01 17:15</span>
                                <div class="clear"></div>
                                <div class="d_resume">
                                    下载项目：
                                    <a>项目需求</a>
                                </div>
                                <label class="btn_showprogress"  onclick="zhankai()">
                                    不合适
                                    <i></i></label>
                            </div>
                            <div class="progress_status" id="www" style="display: none">
                                <ul class="status_steps">
                                    <li class="status_done status_1">1</li>
                                    <li class="status_line status_line_done"><span></span></li>
                                    <li class="status_done">2</li>
                                    <li class="status_line status_line_done"><span></span></li>
                                    <li class="status_done">3</li>
                                    <li class="status_line status_line_done"><span></span></li>
                                    <li class="status_done">4</li>
                                </ul>
                                <ul class="status_text">
                                    <li  class="status_text_1" >上传状态</li>
                                    <li class="status_text_2"style="margin-left:90px">审核状态</li>
                                    <li class="status_text_3"style="margin-left:90px">评审状态</li>
                                    <li  class="status_text_4"style="margin-left:90px">成功</li>
                                </ul>
                                <ul class="status_list">
                                    <li class="top">
                                        <div class="list_time"><em></em>2014-07-01 17:15</div>
                                        <div class="list_body">
                                            简历被lixiang标记为不合适
                                            <div>您的简历已收到，但目前您的工作经历与该职位不是很匹配，因此很抱歉地通知您无法进入面试。</div>
                                        </div>
                                    </li>
                                    <li class="top">
                                        <div class="list_time"><em></em>2014-07-01 17:08</div>
                                        <div class="list_body">
                                            lixiang已成功接收你的简历
                                        </div>
                                    </li>
                                    <li class="bottom">
                                        <div class="list_time"><em></em>2014-07-01 17:08</div>
                                        <div class="list_body">
                                            lixiang已成功接收你的简历
                                        </div>
                                    </li>
                                </ul>
                                <a class="btn_closeprogress" href="javascript:;"></a>
                            </div>
                        </li>
                    </ul>
                </form>
            </dd>
        </dl>


        <div class="clear"></div>
        <input type="hidden" value="" id="resubmitToken">
        <a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
    </div><!-- end #container -->
</div><!-- end #body -->
<script>
    function zhankai(){
        // 获取 <span> 元素，用于关闭弹窗
        var span = document.getElementById("www");
        if (span.style.display == "none"){
            span.style.display = "block";
        }else {
            span.style.display = "none";
        }
    }
</script>
</body>
</html>
