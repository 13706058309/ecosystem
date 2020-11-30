<%--
  Created by IntelliJ IDEA.
  User: WTQ
  Date: 2020/11/12
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>证书申请详情</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/external.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/popup.css"/>
    <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jianli.css" rel="stylesheet">
    <script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js" crossorigin="anonymous"></script>
    <script src="https://static.zhipin.com/zhipin-geek/v334/web/geek/js/main.js"></script>
    <style>
        #container {
            margin:35px auto 0;
        }
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
                    <a href="${pageContext.request.contextPath}/golog/reg" style="background: #202329" ka="header-register" class="btn btn-outline">注册</a>
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
    <input type="hidden" value="${fileid}" id="fileid">
    <input type="hidden" value="${filename}" id="filename">
    <div id="container" style="width: 60%" >
        <dl class="job_detail">
            <dt>
                <h1 title="内容运营">
                    <em></em>
                    <div>申请 详情</div>
                    ${filename}证书
                </h1>
            </dt>
            <dd class="job_request">
                <span class="red">考核范围</span>
                <span>证书要求</span>
                <span>申请流程</span>
                <span>注意事项</span>
                <br/>
                技术成长 : <a href="${pageContext.request.contextPath}/course/homePage" target="_blank" style="color: #00c2b3 ">课程学习链接</a>
            </dd>
            <dd class="job_bt">
                <h3 class="description">证书描述</h3>
                <p>&nbsp;证书要求： <br/>
                    1、掌握该语言的技术； <br/>
                    2、良好的逻辑和代码编辑；<br/>
                    3、合格的证书项目测试和评审
                </p>
                <br/>
                <p>考核范围： <br/>
                    1、主要以教学视频和该语言来进行项目考核； <br/>
                    2、需要在规定时间内制作完项目；<br/>
                    3、以及项目的评审；
                </p>
                <br/>
                <p>申请流程： <br/>
                    1、选择证书类型； <br/>
                    2、完善申请人信息和证书信息；<br/>
                    3、支付考核费用；
                </p>
                <br/>
                <p>注意事项： <br/>
                    1、因个人原因造成申请失败，无退费； <br/>
                    2、必须在有效的时间上传证书项目进行测试；<br/>
                    3、支付考核费用；
                </p>
            </dd>
            <dd>
                <button  onclick="shenqingpanduan()" style="margin-left: 20px;color: #00c2b3" class="inline btn fr btn_apply">申请证书</button>

                <a href="cshouye" title="返回" style="margin-left: 20px;color: #00c2b3" class="inline btn fr btn_apply">返回</a>
            </dd>
        </dl>

    </div>
<script>
    function shenqingpanduan() {
       var fileid = $('#fileid').val();
        var filename=$('#filename').val();
        $.ajax({
            url:  "zhengshupanduaan",//请求服务端地址值
            async: true,
            type: "post",//请求方式
            dataType: "text",
            success: function (msg) {
                if (msg=='success'){
                    console.log("即将跳到申请证书页")
                    location.href = 'sqzhengshu?fileid='+fileid+'&filename='+filename;
                }else if (msg=='faile'){
                    alert("请先进行登录");
                    location.href = '跳转到登录页';
                }
            }
        });
    }
</script>
</body>
</html>
