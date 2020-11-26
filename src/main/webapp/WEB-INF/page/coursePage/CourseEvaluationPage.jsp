<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/11
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh" lang="zh" class="windows desktop landscape">

<head>
    <title>评价</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="x-dns-prefetch-control" content="on">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">

    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/uc.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/ux.css" />

<%--    <link rel="stylesheet" href="//mc.stu.126.net/pub/s/pt_web_course_intro_2a9e16a12bedbda677f57d84227b34eb.css">--%>

    <style>
        html,body{
            overflow-x:hidden;
        }
    </style>

</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>

<body class="auto-1605070794559-parent" id="auto-id-1605070794519" >
<input type="hidden" id="basePath" value="${pageContext.request.contextPath}"/>
<input type="hidden" id="listLength" value="${totalNums}"/>
<input type="hidden" id="courseId" value="${courseId}"/>
<div class="g-mn2">
    <div class="g-mn2">
        <div class="g-mn2 f-bgw m-infomation f-f0">
            <ul class="flow-default" id="LAY_demo1"></ul>
        </div>
    </div>
</div>

</body>

<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use('flow', function(){
        var flow = layui.flow;
        var basePath = $('#basePath').val();
        var courseId = $('#courseId').val();
        var limit = 5; //每页显示的条数
        var length = $('#listLength').val(); // 总的数据量
        var pages = Math.ceil(parseInt(length)/limit); // 向上取整获得页数
        flow.load({
            elem: '#LAY_demo1' //流加载容器
            ,scrollElem: '#LAY_demo1' //滚动条所在元素，一般不用填，此处只是演示需要。
            ,done: function(page, next){ //执行下一页的回调
                //数据插入
                setTimeout(function(){
                    var lis = [];
                    $.ajax({
                        url:basePath+"/courseAppraise/loadMore?courseId="+courseId+"&page="+page+"&limit="+limit,
                        dataType:"json",
                        success:function (data) {
                            // data = JSON.parse()
                            console.log(data);
                            for(var i = 0; i < data.length; i++){
                                var html = "";
                                html += "<li>";
                                html += "<div class=\"ux-mooc-comment-course-comment_comment-list\">";
                                html += "<div class=\"ux-mooc-comment-course-comment_comment-list_item\">";

                                html += "<div class=\"ux-mooc-comment-course-comment_comment-list_item_avatar\">";
                                html += "<a href=\"此处填去个人中心的路径\" target=\"_top\">";
                                html += "<img src=\""+basePath+data[i].userInfo.headImgUrl+"\" width=\"40\" height=\"40\">";
                                html += "</a>";
                                html += "</div>";

                                html += "<div class=\"ux-mooc-comment-course-comment_comment-list_item_body\">";
                                html += "<div class=\"ux-mooc-comment-course-comment_comment-list_item_body_user-info\">";
                                html += "<a class=\"primary-link ux-mooc-comment-course-comment_comment-list_item_body_user-info_name\" href=\"此处填去个人中心的路径\" target=\"_top\">";
                                html += data[i].userInfo.userName;
                                html += "</a>";
                                html += "</div>";
                                html += "<div class=\"ux-mooc-comment-course-comment_comment-list_item_body_content\">";
                                html += "<span>";
                                html += data[i].appraiseText;
                                html += "</span>";
                                html += "</div>";
                                html += "<div class=\"ux-mooc-comment-course-comment_comment-list_item_body_comment-info\">";
                                html += "<div class=\"ux-mooc-comment-course-comment_comment-list_item_body_comment-info_time\">";
                                html += data[i].appraiseTime;
                                html += "</div>";
                                html += "</div>";
                                html += "</div>";

                                html += "</div>";
                                html += "</div>";
                                html += "</li>";

                                lis.push(html);
                            }
                            //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                            //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                            next(lis.join(''), page<pages);
                        }
                    });

                }, 500);
            }
        });
    });
</script>

</html>