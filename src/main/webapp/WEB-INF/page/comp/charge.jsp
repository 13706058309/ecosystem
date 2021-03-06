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
            <input class="text" type="text" name="Username" placeholder="人才币" required="" id="money" >
            <input type="submit" value="" id="commands" onclick="changeMoney()" style="margin-bottom: 0%">
            <input type="submit" value="" id="command" onclick="change()">
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
        $("#commands").val("修改收费额度")
        $.ajax({
            url:path+"/rec/judgeDownFee",
            type:"post",
            typeData:"text",
            success:function (data) {
                if(data=="no"){
                    $("#money").css("display","none");
                    $("#commands").css("display","none");
                    $("#command").val("开启收费");
                    $("#detail").text("暂未开启简历下载收费");
                }else{
                    $("#money").css("display","block");
                    $("#commands").css("display","block");
                    $("#command").val("关闭收费");
                    $("#detail").text("简历下载收费已开启，费用为"+data+"人才币");
                }
            }
        })
    })

    function change() {
        var command =  $("#command").val();
       if(command=='关闭收费'){
           layer.confirm('是否关闭收费',{
               btn:['确定','取消'],
               time:20000,
           },function (index) {
               $.ajax({
                   url:path+"/rec/closeFee",
                   type:"post",
                   typeData:"text",
                   success:function (info) {
                       if(info=='1'){
                           layer.msg('关闭成功');
                           $("#money").css("display","none");
                           $("#commands").css("display","none");
                           $("#command").val("开启收费");
                           $("#detail").text("暂未开启简历下载收费");
                       }else{
                           layer.msg("网络繁忙，关闭失败");
                       }
                   },
               })
           })
       }else{
           layer.confirm('是否开启收费',{
               btn:['确定','取消'],
               time:20000,
           },function (index) {
               $.ajax({
                   url:path+"/rec/openFee",
                   type:"post",
                   typeData:"text",
                   success:function (info) {
                       if(info=='failed'){
                           layer.msg("网络繁忙，关闭失败");
                       }else{
                           layer.msg('开启成功');
                           $("#money").css("display","block");
                           $("#commands").css("display","block");
                           $("#command").val("关闭收费");
                           $("#detail").text("简历下载收费已开启，费用为"+info+"人才币");
                       }
                   },
               })
           })
       }
    }

    function changeMoney() {
        var money = $("#money").val();
        var pattern = /^\+?[1-9][0-9]*$/;
        if(!pattern.test(money)){
            layer.msg("请输入正整数")
            return false;
        }
        layer.confirm('是否确认修改收费额度',{
            btn:['确定','取消'],
            time:20000,
        },function (index) {
            $.ajax({
                url:path+"/rec/changeFee",
                type:"post",
                typeData:"text",
                data:"money="+money,
                success:function (info) {
                    if(info=='failed'){
                        layer.msg("网络繁忙，修改失败");
                    }else{
                        layer.msg('修改成功');
                        $("#money").val("");
                        $("#detail").text("简历下载收费已开启，费用为"+money+"人才币");
                    }
                },
            })
        })



    }
</script>
</html>


