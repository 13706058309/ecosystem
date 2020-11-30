<%--
  Created by IntelliJ IDEA.
  User: WTQ
  Date: 2020/11/12
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">
    <title>已获得证书列表</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <link href="${pageContext.request.contextPath}/style/css/style.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/popup.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jianli.css" rel="stylesheet">
    <script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js" crossorigin="anonymous"></script>

    <script src="https://static.zhipin.com/zhipin-geek/v334/web/geek/js/main.js"></script>
</head>

<style>
    /* 弹窗 (background) */
    .modal {
        display: none; /* 默认隐藏 */
        position: fixed;
        z-index: 1;
        padding-top: 100px;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4);
    }

    /* 弹窗内容 */
    .modal-content {
        position: relative;
        background-color: #fefefe;
        margin: auto;
        padding: 0;
        border: 1px solid #888;
        width: 800px;
        height: 600px;
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
        -webkit-animation-name: animatetop;
        -webkit-animation-duration: 0.4s;
        animation-name: animatetop;
        animation-duration: 0.4s
    }

    /* 添加动画 */
    @-webkit-keyframes animatetop {
        from {top:-300px; opacity:0}
        to {top:0; opacity:1}
    }

    @keyframes animatetop {
        from {top:-300px; opacity:0}
        to {top:0; opacity:1}
    }

    /* 关闭按钮 */
    .close {
        color: white;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

    .modal-header {
        padding: 2px 5px;
        background-color: #009688;
        color: white;

    }

    .modal-body {
        padding: 2px 16px;
        height: 600px;
    }

     #container {
         margin:0 auto 0;
     }
    .c_delivery{

        margin-bottom: 20px;
    }

</style>
<script>
 function kongzhiimg(id){
     // 获取 <span> 元素，用于关闭弹窗
     var modal = document.getElementById(id);
     modal.style.display = "block";
    }
    function guanbi(id) {
        // 获取 <span> 元素，用于关闭弹窗
        var modal = document.getElementById(id);
        modal.style.display = "none";
    }
</script>
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
                <li><a href="${pageContext.request.contextPath}/project" target="_blank">项目</a></li>
                <li class=""><a ka="header-app" href="${pageContext.request.contextPath}/course/homePage">课程</a></li>
                <li class=""><a ka="header-article" href="${pageContext.request.contextPath}/zhengshu/cshouye">证书</a></li>
            </ul>
        </div>

        <div class="user-nav" style="margin-top: 20px">
            <ul>
                <%--                    <li class=""><a ka="header-message" href="https://www.zhipin.com/web/geek/chat">消息<span class="nav-chat-num"></span></a></li>--%>
                <li class="nav-figure">
                    <a >
                        <span class="label-text">${qUser.userName}</span><img id="topImg"  src="${pageContext.request.contextPath}${qUser.headImgUrl}" alt=""/>
                    </a>
                    <div class="dropdown">
                        <a href="${pageContext.request.contextPath}/center/jianli" ka="header-personal">个人中心<span>编辑简历</span></a>
                        <a href="${pageContext.request.contextPath}/center/accountSet" ka="account_manage">账号设置<span>重置密码|更换手机号|隐私设置|修改用户名</span></a>
                        <a href="${pageContext.request.contextPath}/homePage/quitAccount?city=${workCity}"  ka="header-logout">退出登录</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<div id="wrap" class="">
    <div id="main" class="inner">
    <div id="container" class="resume-container">
        <div class="resume-content">
        <dl class="c_delivery">
            <dt>
                <h1><em></em>官方证书</h1>
            </dt>
            <form id="companyListForm" name="companyListForm" method="get" action="h/c/companylist.html">
                <ul class="hc_list reset" style="margin: 0 auto 0;padding-bottom: 100px">
<c:if test="${not empty cerUserList}">
    <c:forEach items="${cerUserList}" var="list">
                    <li style="margin-top: 40px;width: 215px;margin-right: 13px">
                        <h3 style="text-align: center;font-family:Microsoft YaHei,微软雅黑,MicrosoftJhengHei,华文琥珀,STHupo,MingLiu;color: #009688" title="${list.name}">${list.name}</h3>
                        <div class="comLogo">
                            <img src="${pageContext.request.contextPath}${list.url}" onclick="kongzhiimg('${list.cuid}')"  width="190" height="190" alt="${list.name}"/>
                        </div>
                        </a>
                        <label  target="_blank" style="text-align: center">姓名:${list.cerRecord.trueName}</label><br>
                        <label target="_blank"style="text-align: center"> 身份证:${list.cerRecord.idNumber}</label><br>
                        <label target="_blank"style="text-align: center"> 获取时间:${list.gainTime}</label>
                    </li>

        <!-- 弹窗 -->
        <div id="${list.cuid}" class="modal">

            <!-- 弹窗内容 -->
            <div class="modal-content">
                <div class="modal-header">
                    <span class="close" onclick="guanbi('${list.cuid}')">&times;</span>
                    <h2 style="text-align: center">${list.name}证书</h2>
                </div>
                <div class="modal-body" style="background: url('${pageContext.request.contextPath}${list.url}') no-repeat;background-size:100% 100%;">

                    <label style="position: absolute;top: 360px;left: 100px;font-size: 25px">${list.cerRecord.trueName}</label>
                    <label style="position: absolute;top: 512px;left: 500px">${list.gainTime}</label>
                    <label style="position: absolute;top: 340px;left: 355px;font-size: 40px"><b>${list.name}</b></label>
                    <label style="position: absolute;top: 485px;left: 475px;">${list.backUser.bUserName}/人才生态系统计算机语言认证中心</label>
                </div>

            </div>

        </div>
    </c:forEach>
</c:if>
                </ul>
            </form>
        </dl>
        <div class="clear"></div>
        </div>
        <div class="user-sider" style="height: 600px;background: #fff;">
            <div data-v-3b220faa="" class="sider-box sider-resume">
                <%--                    <div data-v-3b220faa="" class="resume-attachment">--%>
                <%--                        <h3 data-v-3b220faa="" class="sider-title">附件管理--%>
                <%--                        </h3>--%>
                <%--                        <div data-v-3b220faa="" class="btns"><button data-v-3b220faa="" type="button"--%>
                <%--                                                                     class="btn btn-primary">上传简历</button>--%>
                <%--                        </div>--%>
                <%--                        <div data-v-3b220faa="" class="">--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                    <div style="text-align: center">--%>
                <%--                        <div class="info-flex-item header-upload">--%>
                <%--                            <div class="header-box">--%>
                <%--                        <div class="header-mask" ></div><img style="height: 10%;width: 30%" id="headImg2"--%>
                <%--                                                                src="${pageContext.request.contextPath}${resume.photo}"--%>
                <%--                                                       class="header-img"></div></div>--%>
                <%--                        <div>${resume.realName}</div>--%>
                <%--                    </div>--%>
                <div style="margin-top: 20px">
                    <h2 style="color: #0cccb5">我的信息</h2>
                    <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/center/resumeInfo"  >收藏岗位</a></div>
                    <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/center/accountSet" >账号设置</a></div>
                    <%--                        <div style="margin-left: 20%"><a href=""  >收藏课程</a></div>--%>
                    <%--                        <div style="margin-left: 20%"><a href=""  >观看历史</a></div>--%>
                    <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/zhengshu/zxzsliebiao"  >证书申请</a></div>
                    <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/zhengshu/zxzstushi"  >证书展示</a></div>
                    <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/zhengshu/zxzskaifa"  >证书项目</a></div>
                </div>
            </div>
        </div>
        <a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
    </div>
</div>
</div>
    <!-- end #body -->
</body>
</html>
