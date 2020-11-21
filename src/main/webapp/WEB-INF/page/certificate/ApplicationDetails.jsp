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
</head>
<body>
<div id="body">
    <input type="hidden" value="${fileid}" id="fileid">
    <input type="hidden" value="${filename}" id="filename">
    <div id="container" >
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
                技术成长 : <a href="course/homePage">课程学习连接</a>
            </dd>
            <dd class="job_bt">
                <h3 class="description">证书描述</h3>
                <p>&nbsp;证书要求： <br/>
                    1、掌握该语言的技术； <br/>
                    2、良好的逻辑和代码编辑。
                </p>
                <p>考核范围： <br/>
                    1、主要以教学视频和该语言来进行项目考核； <br/>
                    2、需要在规定时间内制作完项目；
                </p>
                <p>申请流程： <br/>
                    1、选择证书类型； <br/>
                    2、完善申请人信息和证书信息；<br/>
                    3、支付考核费用
                </p>
                <p>注意事项： <br/>
                    1、选择证书类型； <br/>
                    2、完善申请人信息和证书信息；<br/>
                    3、支付考核费用
                </p>
            </dd>
            <dd>
                <button  onclick="shenqingpanduan()" style="margin-left: 20px" class="inline btn fr btn_apply">申请证书</button>

                <a href="cshouye" title="返回"  class="inline btn fr btn_apply">返回</a>
            </dd>
        </dl>
        <div id="weibolist"></div>
    </div>


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
