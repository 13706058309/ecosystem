<%--
  Created by IntelliJ IDEA.
  User: yuzhen
  Date: 2020/11/12
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>权限配置</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>基础效果</legend>
</fieldset>
<div id="test1" class="demo-transfer"></div>


<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['transfer', 'layer', 'util'], function(){
        var $ = layui.$
            ,transfer = layui.transfer
            ,layer = layui.layer
            ,util = layui.util;

        //模拟数据
        var data1 = [
            {"value": "1", "title": "李白"}
            ,{"value": "2", "title": "杜甫"}
            ,{"value": "3", "title": "苏轼"}
            ,{"value": "4", "title": "李清照"}
            ,{"value": "5", "title": "鲁迅", "disabled": true}
            ,{"value": "6", "title": "巴金"}
            ,{"value": "7", "title": "冰心"}
            ,{"value": "8", "title": "矛盾"}
            ,{"value": "9", "title": "贤心"}
        ]


        //基础效果
        transfer.render({
            elem: '#test1'
            ,data: data1
        });

    });
</script>

</body>
</html>
