<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/22
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>下载收费</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link href="${pageContext.request.contextPath}/bg/css/bgstyle.css" rel="stylesheet">

</head>
<body>

<!-- main -->
<div class="main-w3layouts wrapper">
    <input type="hidden" value="${pageContext.request.contextPath}" id="path">
    <div class="main-agileinfo">
        <div class="agileits-top">
            <form action="#" method="post">

                <input type="submit" value="登录" id="command" onclick="change()">
            </form>
            <p id="detail">暂未开启收费</p>
        </div>
    </div>
    <!-- copyright -->
<%--    <div class="w3copyright-agile">--%>
<%--        <p>© 2019 站长素材 . All rights <a href="" title="站长素材">Reserved</a></p>--%>
<%--    </div>--%>
    <!-- //copyright -->
    <ul class="w3lsg-bubbles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
<!-- //main -->

</body>
<script>
    var path = $("#path").val();
    var layer;
    layui.use('layer',function () {
        layer = layui.layer;
    })
    $(function () {
        $.ajax({
            url:path+"/rec/judgeDownFee",
            type:"post",
            typeData:"text",
            success:function (data) {
                if(data=="no"){
                    $("#command").val("开启收费");
                    $("#detail").text("暂未开启收费");
                }else{
                    $("#command").val("关闭收费");
                    $("#detail").text("收费已开启，费用为"+data+"元");
                }
            }
        })
    })

    function change() {
        var command =  $("#command").val();
       if(command=='关闭收费'){

       }
    }
</script>
</html>


