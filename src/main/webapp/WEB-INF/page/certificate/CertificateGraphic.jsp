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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>已获得证书列表</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <link href="${pageContext.request.contextPath}/style/css/style.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/popup.css" type="text/css" rel="stylesheet">
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
<div id="body">
    <div id="container">
        <dl class="c_delivery">
            <dt>
                <h1><em></em>官方证书</h1>
            </dt>
            <form id="companyListForm" name="companyListForm" method="get" action="h/c/companylist.html">
                <ul class="hc_list reset" style="width: 1024px;margin: 35px auto 0;padding-bottom: 100px">
<c:if test="${not empty cerUserList}">
    <c:forEach items="${cerUserList}" var="list">
                    <li style="margin-top: 40px;width: 215px">
                        <h3 style="text-align: center;font-family:Microsoft YaHei,微软雅黑,MicrosoftJhengHei,华文琥珀,STHupo,MingLiu;color: #009688" title="${list.name}">${list.name}</h3>
                        <div class="comLogo">
                            <img src="${list.url}" onclick="kongzhiimg('${list.cuid}')"  width="190" height="190" alt="${list.name}"/>
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
                <div class="modal-body" style="background: url('${list.url}') no-repeat;background-size:100% 100%;">
                    <label style="position: relative;top: 340px;left: 120px;font-size: 23px">${list.cerRecord.trueName}</label>
                    <label style="position: relative;top: 480px;left: 400px">${list.gainTime}</label>
                    <label style="position: relative;top: 455px;left: 250px;">${list.backUser.bUserName}/人才生态系统计算机语言认证中心</label>
                </div>

            </div>

        </div>
    </c:forEach>
</c:if>
                </ul>
            </form>
        </dl>
        <div class="clear"></div>
        <a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
    </div><!
</div><!-- end #body -->
</body>
</html>
