<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/11/11
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页导航</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
</head>
<body style="overflow:auto;">
<div class="layui-header" style="float: top;width: 100%">
    <ul class="layui-nav">
        <li class="layui-nav-item layui-this"><a onclick="changePath(this)" title="${pageContext.request.contextPath}/homePage/home">首页</a></li>
        <li class="layui-nav-item "><a onclick="changePath(this)" title="${pageContext.request.contextPath}/test/testComp" >公司</a></li>
        <li class="layui-nav-item">
            <a href="javascript:;">课程</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a href="${pageContext.request.contextPath}/homePage/home">移动模块</a></dd>
                <dd><a href="">后台模版</a></dd>
                <dd><a href="">电商平台</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="javascript:">我的简历</a></li>
        <li class="layui-nav-item"><a href="javascript:">发布职位</a></li>
    </ul>
</div>

<%--<%@include  file="/homePage/home"%>--%>

<%--<iframe id="page" src="${pageContext.request.contextPath}/homePage/home"--%>
<%--        name="mainx" style="float: top;height: 100%;width: 100%" scrolling="atuo"></iframe>--%>

<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function () {
        var element = layui.element;
        element.on('tab(demo)', function(data) {
            var src = $(".layui-tab-item.layui-show").find("iframe").attr("src");
            $(".layui-tab-item.layui-show").find("iframe").attr("src", src);
        });
    });
    // function changePath(note) {
    //    let elementById = document.getElementById('page').src=note.title;
    // }
</script>

<script type="text/javascript"> //设置选中链接高亮显示

var urlstr = location.href;
console.log(urlstr);

//alert((urlstr + '/').indexOf($(this).attr('href')));

var urlstatus=false;
$("#menu a").each(function () {

    if ((urlstr + '/').indexOf($(this).attr('href')) > -1&&$(this).attr('href')!='') {

        console.log($(this));
        $(this).addClass('cur'); urlstatus = true;
        $(this).parent().parent().parent().addClass('layui-nav-itemed');

    } else {

        $(this).removeClass('cur');

    }

});

if (!urlstatus) {$("#menu a").eq(0).addClass('cur'); }

</script>
</body>
</html>
