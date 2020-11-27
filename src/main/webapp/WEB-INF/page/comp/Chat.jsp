<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/23
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<!--解决idea thymeleaf 表达式模板报红波浪线-->
<!--suppress ALL -->
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>聊天页面</title>
    <!-- jquery在线版本 -->
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
    <!--引入样式-->
    <style>
        .dis{
            border: green 1px solid;
            height: 10%;
        }
    </style>

    <link rel="stylesheet"  href="${pageContext.request.contextPath}/chat/css/index.css">

</head>

<body>

<div class="qqBox" style="margin-top: 0%">
    <!-- xx -->
    <div class="BoxHead">
        <!-- <div class="headImg">
        <img src="./index_files/6.jpg">
    </div> -->
        <div class="internetName"></div>

    </div>
    <!-- 好友聊天类容 -->
    <div class="context">
        <input type="hidden" id="path"  value="${pageContext.request.contextPath}">
        <input type="hidden" id="photo"  value="${admin.logo}">
        <input type="hidden" id="compID" value="${admin.bUserId}">
        <input type="hidden" id="userID">
        <input type="hidden" id="curImg">
        <input type="hidden" id="ip3" value="123">
        <div class="conLeft">
            <div class="shouBox">
                <div class="shous">
                    <div style="height: 60px;">
                        <img class="touimg" src="${pageContext.request.contextPath}/uploadLogo${admin.logo}" style="width: 100%;height: 120%" alt="11">
                    </div>
                    <div class="txiangName">${admin.bUserName}</div>
                    <div style="height: 52px;">
                        <img class="caidanImg" src="${pageContext.request.contextPath}/chat/iocn/caidan.png" alt="">
                    </div>
                </div>


                <!-- 搜索 -->

                <form style="height: 130px;" onSubmit="submitFn(this, event);">

                </form>

                <!-- 菜单分组 -->
                <div class="aui-flexView">

                    <div class="aui-scrollView">
                        <div class="aui-tab-box" data-ydui-tab>
                            <div class="tab-nav">

                                <div class="tab-nav-item tab-active">
                                    <a href="javascript:;">消息</a>
                                </div>

                            </div>

                            <div class="tab-panel">
                                <!--消息-->
                                <div class="tab-panel-item tab-active">
                                    <div class="tab-item">
<%--                                        <a href="javascript:;" class="aui-list-item">--%>
                                            <ul id="number" style="margin-top:0%;position: absolute">
                                                <li>
                                                    <div class="liLeft"><img
                                                            src="${pageContext.request.contextPath}/chat/index_files/20170926103645_04.jpg"></div>
                                                    <div class="liRight">
                                                        <span class="intername">前端交流群</span>
                                                        <span class="infor">厉害了</span>
                                                    </div>
                                                </li>
                                            </ul>
<%--                                        </a>--%>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>


            </div>

        </div>
        <div class="conRight">
            <div class="Righthead">
                <!-- <div class="headName">赵鹏</div>
            <div class="headConfig">
                <ul>
                    <li><img src="${pageContext.request.contextPath}/chat/index_files/20170926103645_06.jpg"></li>
                    <li><img src="${pageContext.request.contextPath}/chat/index_files/20170926103645_08.jpg"></li>
                    <li><img src="${pageContext.request.contextPath}/chat/index_files/20170926103645_10.jpg"></li>
                    <li><img src="${pageContext.request.contextPath}/chat/index_files/20170926103645_12.jpg"></li>
                </ul>
            </div> -->
            </div>
            <!-- 显示聊天内容 -->
            <div class="RightCont" style="overflow-x:auto; overflow-y:auto;width: 75%; height: 250px; ">
                <ul class="newsList" id="chats">

                </ul>
            </div>
            <div class="RightFoot">
                <div class="emjon" style="display: none;">
                    <ul>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_02.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_05.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_07.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_12.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_14.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_16.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_20.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_23.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_25.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_30.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_31.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_33.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_37.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_38.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_40.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_45.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_47.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_48.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_52.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_54.jpg"></li>
                        <li><img src="${pageContext.request.contextPath}/chat/index_files/em_55.jpg"></li>
                    </ul>
                </div>
                <div class="footTop">
                    <ul>
                        <!-- <li><img src="${pageContext.request.contextPath}/chat/index_files/20170926103645_31.jpg"></li> -->
                        <li class="ExP"><img src="${pageContext.request.contextPath}/chat/index_files/20170926103645_33.jpg"></li>
                        <!-- <li><img src="${pageContext.request.contextPath}/chat/index_files/20170926103645_35.jpg"></li>
                    <li><img src="${pageContext.request.contextPath}/chat/index_files/20170926103645_37.jpg"></li> -->

                    </ul>
                </div>
                <div class="inputBox">
                        <textarea id="dope" style="width: 99%;height: 75px; border: none;outline: none; resize:none;"
                                  name="" rows="" cols=""></textarea>
                    <button class="sendBtn">发送(s)</button>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<script type="text/javascript" src="${pageContext.request.contextPath}/chat/js/jquery.min.js"></script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/chat/js/index.js"></script>



</body>


<script type="text/javascript" th:inline="javascript">
    //项目根路径
    var ctx = $("#path").val();

    var compID = $("#compID").val();
    var photo = $("#photo").val();


    $(function () {
        $.ajax({
            url:ctx+"/rec/getChatUser",
            type:"post",
            typeData:"text",
            success:function (data) {
                var arr = JSON.parse(data);
                var length = arr.length;
                $("#number").empty();
                if(length>0){
                    for(var i=0;i<length;i++){
                        if(i==0){
                            var $li = $("<li class='bg' id='a"+arr[i].userId+"' onclick='changeSelect(this)'></li>");//
                            $('.internetName').text(arr[i].userInfo.userName);
                            $("#userID").val(arr[i].userId);
                            $("#curImg").val(arr[i].userInfo.headImgUrl);
                            var $img = $("<div class='liLeft'><input type='hidden' class='headImg' value='"+arr[i].userInfo.headImgUrl+"'><input type='hidden' class='userID' value='"+arr[i].userId+"'><img src='"+ctx+"/"+arr[i].userInfo.headImgUrl+"' style='margin-top: 5px;width: 80%;height: 80%' ></div>");
                            var $div = $("<div class='liRight'><span class='intername'>"+arr[i].userInfo.userName+"</span><span class='infor'>"+arr[i].recoredTime+"</span></div>");
                        }else{
                            var $li = $("<li id='a"+arr[i].userId+"' onclick='changeSelect(this)'></li>");//
                            var $img = $("<div class='liLeft'><input type='hidden' class='headImg' value='"+arr[i].userInfo.headImgUrl+"'><input type='hidden' class='userID' value='"+arr[i].userId+"'><img src='"+ctx+"/"+arr[i].userInfo.headImgUrl+"' style='margin-top: 5px;width: 80%;height: 80%' ></div>");
                            if(arr[i].isRead == 1 && arr[i].companyId==0){
                                var $div = $("<div class='liRight'><span class='intername'>"+arr[i].userInfo.userName+"</span><span class='infor'>"+"未读消息"+"</span></div>");
                            }else{
                                var $div = $("<div class='liRight'><span class='intername'>"+arr[i].userInfo.userName+"</span><span class='infor'>"+arr[i].recoredTime+"</span></div>");
                            }
                        }
                        $li.append($img);
                        $li.append($div);
                        $("#number").append($li);
                     }
                    findChat(arr[0].userId);
                }else{
                    alert("暂无用户来访");
                    $("#dope").attr("readonly",true);
                }
            }
        })
    })

    function changeSelect(node) {

        $(node).addClass('bg').siblings().removeClass('bg');
        var intername=$(node).children('.liRight').children('.intername').text();
        var tip = $(node).children('.liRight').children('.infor').text();
        var userID = $(node).children('.liLeft').children('.userID').val();
        $("#userID").val(userID);
        $("#curImg").val($(node).children('.liLeft').children('.headImg').val());
        $('.internetName').text(intername);
        $('.newsList').html('');
        if(tip=='未读消息'){
            $.ajax({
                url:ctx+"/rec/readUserMsg",
                type:"post",
                data:"userID="+userID,
                typeData:"text",
                async:false,
                success:function (data) {
                    if(data=='1'){
                        findChat(userID);
                    }
                }
            })
        }else{
            findChat(userID);
        }
    }


    function findChat(userID) {
        $.ajax({
            url:ctx+"/rec/findChatRec",
            type:"post",
            data:"userID="+userID,
            typeData:"text",
            async:false,
            success:function (data) {
                var arrs = JSON.parse(data);
                $('.newsList').empty();
                for(var i=0;i<arrs.length;i++){
                    if(arrs[i].companyId!=0){
                        var $li = $("<li></li>");
                        var $div1 = $("<div class='nesHead'><img src='"+ctx+"/uploadLogo"+photo+"'></div>");
                        var $div2 = $("<div class='news'><img class='jiao' src='"+ctx+"/chat/img/you.jpg'>"+arrs[i].recored+"<div>")
                        $li.append($div1),
                            $li.append($div2),
                            $('.newsList').append($li);
                        $('.RightCont').scrollTop($('.RightCont')[0].scrollHeight );
                    }else{
                        var $li = $("<li></li>");
                        var $div1 = $("<div class='answerHead'><img src='"+ctx+"/"+arrs[i].userInfo.headImgUrl+"'></div>");
                        var $div2 = $("<div class='answers'><img class='jiao' src='"+ctx+"/chat/img/you.jpg' >"+arrs[i].recored+"<div>")
                        $li.append($div1),
                            $li.append($div2),
                            $('.newsList').append($li);
                        $('.RightCont').scrollTop($('.RightCont')[0].scrollHeight );
                    }
                }

                if(length!=0){
                    $('.conLeft').find('li.bg').children('.liRight').children('.infor').text(arrs[length-1].recoredTime);
                }else{
                    $('.conLeft').find('li.bg').children('.liRight').children('.infor').text(NowTime());
                }
            }
        })
    }
</script>
<script src="${pageContext.request.contextPath}/js/comp/socketChart.js"></script>

</html>
