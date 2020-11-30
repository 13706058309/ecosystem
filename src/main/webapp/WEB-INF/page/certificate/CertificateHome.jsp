<%--
  Created by IntelliJ IDEA.
  User: WTQ
  Date: 2020/11/12
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">
    <title>证书首页</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/style/css/style.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/popup.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jianli.css" rel="stylesheet">
    <script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js" crossorigin="anonymous"></script>
    <script src="https://static.zhipin.com/zhipin-geek/v334/web/geek/js/main.js"></script>

    <style>
        .collection_link{
            color: #019875;
            background-color:transparent;
            border-style:none
        }
        #container {
            margin:35px auto 0;
        }
        .content_l{
            float:left;
            width:680px;}
    </style>
</head>
<body>

<div id="header" style="background-color:#00c2b3;height: 80px" >
    <div class="inner home-inner" >
        <div class="logo" style="width: 150px;height: 70px">

            <a  ka="header-home-logo" title="钱程无忧" style="background: url(${pageContext.request.contextPath}/imgs/logo12.jpg) 3px 7px no-repeat;background-size:150px 70px;width: 150px;height: 70px;margin-top: -20px"><span>钱程无忧</span></a>
        </div>
        <div class="nav" style="margin-top: 20px">
            <ul>
                <li class=""><a ka="header-home" href="${pageContext.request.contextPath}/homePage/home">首页</a></li>
                <li class=""><a ka="header-job" href="${pageContext.request.contextPath}/center/job">职位</a></li>
                <li class=""><a class="nav-school" ka="header-school" href="${pageContext.request.contextPath}/homePage/companylist">公司</a></li>
                <%--                <li class=""><a ka="header_brand" href="https://www.zhipin.com/gongsi/">校招</a></li>--%>
                <li><a href="${pageContext.request.contextPath}/project" >项目</a></li>
                <li class=""><a ka="header-app" href="${pageContext.request.contextPath}/course/homePage">课程</a></li>
                <li class="cur"><a ka="header-article" href="${pageContext.request.contextPath}/zhengshu/cshouye">证书</a></li>
            </ul>
        </div>

        <div class="user-nav" style="margin-top: 20px">
            <c:if test="${empty qUser}">
                <div class="btns" style="margin-top: 10%">
                    <a href="${pageContext.request.contextPath}/golog/reg" ka="header-register" style="background: #202329" class="btn btn-outline">注册</a>
                    <a href="${pageContext.request.contextPath}/golog/login" style="background: #202329" class="btn btn-outline">登录</a>
                </div>
            </c:if>
            <c:if test="${not empty qUser}">
                <ul>
                        <%--                <li class=""><a ka="header-message" href="https://www.zhipin.com/web/geek/chat">消息<span class="nav-chat-num"></span></a></li>--%>
                    <li class="nav-figure">
                        <a >
                            <span class="label-text">${qUser.userName}</span><img src="${pageContext.request.contextPath}${qUser.headImgUrl}" alt=""/>
                        </a>
                        <div class="dropdown">
                            <a href="${pageContext.request.contextPath}/center/jianli" ka="header-personal">个人中心<span>编辑简历</span></a>
                            <a href="${pageContext.request.contextPath}/center/accountSet" ka="account_manage">账号设置<span>重置密码|更换手机号|隐私设置|修改用户名</span></a>
                            <a href="${pageContext.request.contextPath}/homePage/quitAccount?city=${workCity}"  ka="header-logout">退出登录</a>
                        </div>
                    </li>
                </ul></c:if>
        </div>
    </div>
</div>

    <div id="container" style="width: 60%">
                <dl class="c_collections">
                    <dt>
                        <h1><em></em>热门证书</h1>
                    </dt>
                    <dd>
                        <form id="collectionsForm">
                            <ul class="reset my_collections">
                                <c:if test="${not empty certificateList}">
                                    <c:forEach items="${certificateList}" var="map">
                                        <c:if test="${map.cershowState != 2 }">
                                        <li data-id="133340">
                                            <img alt="携程旅行网" src="${pageContext.request.contextPath}${map.cerHeadPortrait}">
                                            <div class="co_item">
                                                <h2 title="${map.field.fieldName}">

                                                        <em >${map.field.fieldName}证书</em>
                                                        <span style="color: #ff725c">（项目考核）</span>

                                                </h2>
                                                <span class="co_time">更新时间：${map.cerChangeTime}</span>
                                                <div class="co_cate">${map.cerTrait}</div>
                                                <span class="co_youhuo c7">${map.cerSketch}</span>

                                                <c:if test="${map.cershowState == 1 }">
                                                    <input type="button" value="申请证书" class="collection_link" onclick="shenqingpanduan('${map.field.fieldId}','${map.field.fieldName}')" >
                                                    <i></i>
                                                    <a class="collection_link" href="cxiangqing?filename=${map.field.fieldName}&fileid=${map.field.fieldId}" >申请详情</a>
                                                </c:if>
                                                <c:if test="${map.cershowState == 0 }">
                                                    <label class="collection_link" >已获得</label>
                                                </c:if>
                                            </div>
                                        </li>
                                    </c:if >
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </form>
                    </dd>
                </dl>



        <div class="clear"></div>
        <a rel="nofollow" title="回到顶部" id="backtop"></a>
    </div><!-- end #container -->
<!-- end #body -->
<div id="linkbox">
    <dl style="margin-left: 25%">
        <dt>友情链接</dt>
        <dd>
            <a href="http://lieyunwang.com/" target="_blank">猎云网</a> <span>|</span>
            <a href="http://www.chuanke.com/" target="_blank">传课网</a> <span>|</span>
            <a href="http://se.360.cn/" target="_blank">360安全浏览器</a> <span>|</span>
            <a href="http://www.zhongchou.cn" target="_blank">众筹网</a><span>|</span>
            <a href="http://www.zhubajie.com/" target="_blank">创意服务外包</a><span>|</span>
            <a href="http://www.thinkphp.cn/" target="_blank">thinkphp</a><span>|</span>
            <a href="http://www.meitu.com/" target="_blank">美图公司</a><span>|</span>
            <a href="http://iwebad.com/" target="_blank">网络广告人社区</a>
            <a href="h/af/flink.html" target="_blank" class="more">更多</a>
        </dd>
    </dl>
</div>
<script>
    function shenqingpanduan(fileid,filename) {
        $.ajax({
            url:  "zhengshupanduaan",//请求服务端地址值
            async: true,
            type: "post",//请求方式
            dataType: "text",
            success: function (msg) {
                if (msg=='success'){
                    location.href='sqzhengshu?fileid='+fileid+'&filename='+filename;
                }else if (msg=='faile'){

                }
            }
        });
    }
</script>
</body>
</html>
