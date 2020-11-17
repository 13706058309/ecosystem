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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>证书首页</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/style/css/style.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/popup.css" type="text/css" rel="stylesheet">

    <style>
        .collection_link{
            color: #019875;
            background-color:transparent;
            border-style:none
        }
    </style>
</head>
<body>

<div id="body">

    <div id="container">

        <div class="clearfix">
            <div class="content_l">
                <dl class="c_collections">
                    <dt>
                        <h1><em></em>热门证书</h1>
                    </dt>
                    <dd>
                        <form id="collectionsForm">
                            <ul class="reset my_collections">
                                <c:if test="${not empty certificateList}">
                                    <c:forEach items="${certificateList}" var="map">
                                        <li data-id="133340">
                                            <img alt="携程旅行网" src="${map.cerHeadPortrait}">
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
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </form>
                    </dd>
                </dl>
            </div>
            <div class="content_r">
                <div class="mycenterR" id="myInfo">
                    <h2>公告专栏</h2>
                    <a href="collections.html">最火热的潮流</a>
                    <br>
                    <a target="_blank" href="subscribe.html">最棒的语言</a>

                </div><!--end #myInfo-->

            </div>
        </div>
        <div class="clear"></div>
        <a rel="nofollow" title="回到顶部" id="backtop"></a>
    </div><!-- end #container -->
</div><!-- end #body -->

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
