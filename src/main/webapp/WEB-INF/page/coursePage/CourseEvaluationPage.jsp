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

    <link rel="stylesheet" href="//mc.stu.126.net/pub/s/pt_web_course_intro_2a9e16a12bedbda677f57d84227b34eb.css">

    <style>
        html,body{
            overflow-x:hidden;
        }
    </style>

</head>

<body class="auto-1605070794559-parent" id="auto-id-1605070794519" >
<div class="g-mn2">
    <div class="g-mn2">
        <div class="g-mn2 f-bgw m-infomation f-f0">
            <ul class="flow-default" id="LAY_demo1">
                <li>
                    <div class="ux-mooc-comment-course-comment_comment-list">
                        <div class="ux-mooc-comment-course-comment_comment-list_item">
                            <div class="ux-mooc-comment-course-comment_comment-list_item_avatar">
                                <!--Regular if83-->
                                <a href="//www.icourse163.org/home.htm?userId=1144572502" target="_top"><img src="https://edu-image.nosdn.127.net/057B8DA26AAE0EECBB5F99BEF29EE3E6.png" width="40" height="40"></a>
                            </div>
                            <div class="ux-mooc-comment-course-comment_comment-list_item_body">
                                <div class="ux-mooc-comment-course-comment_comment-list_item_body_user-info">
                                    <!--Regular if84-->
                                    <a class="primary-link ux-mooc-comment-course-comment_comment-list_item_body_user-info_name" href="//www.icourse163.org/home.htm?userId=1144572502" target="_top">ykt1535642204606</a>
                                </div>


                                <div class="ux-mooc-comment-course-comment_comment-list_item_body_content">
                                    <span>很棒（此条五毛，括号内删除）</span>
                                </div>

                                <div class="ux-mooc-comment-course-comment_comment-list_item_body_comment-info">
                                    <div class="ux-mooc-comment-course-comment_comment-list_item_body_comment-info_time">发表于 2019-09-02</div>
                                </div>
                                <!--Regular if93-->
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>

</div>

</body>

<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use('flow', function(){
        var flow = layui.flow;

        flow.load({
            elem: '#LAY_demo1' //流加载容器
            ,scrollElem: '#LAY_demo1' //滚动条所在元素，一般不用填，此处只是演示需要。
            ,done: function(page, next){ //执行下一页的回调

                //模拟数据插入
                setTimeout(function(){
                    var lis = [];
                    for(var i = 0; i < 8; i++){
                        lis.push('<li>'+ ( (page-1)*3 + i + 1 ) +'</li>')
                    }

                    //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                    //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                    next(lis.join(''), page < 10); //假设总页数为 10
                }, 500);
            }
        });

    });
</script>

</html>