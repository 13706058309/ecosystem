<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/10
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html >
    <head>
        <title>Title</title>
        <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
        <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/comp/BackPostPosition.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/comp/BackPostPosition.css">
        <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
    </head>
<body>

    <div id="postPositionDiv">
        <br>
        <h1 style="text-align: center">岗位发布</h1>
        <br>
        <form class="layui-form" action="" style="margin-left: 10%">
        <div class="layui-form-item" >
            <label class="layui-form-label">职位类别</label>
            <div class="layui-input-inline">
                <select name="quiz1">

                </select>
            </div>
            <div class="layui-input-inline">
                <select name="quiz2">

                </select>
            </div>
            <div class="layui-input-inline">
                <select name="quiz3">

                </select>
            </div>
        </div>

            <div class="layui-form-item">
                <label class="layui-form-label">岗位名称:</label>
                <div class="layui-input-inline">
                    <input type="text" id="account" name="account" lay-verify="required|phone" autocomplete="off" class="layui-input" style="width: 300px">
                    <label class="layui-form-label" style="color: red;display: none">skfsadsads</label>
                </div>

            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所属部门:</label>
                <div class="layui-input-inline">
                    <input type="text" id="department" name="account" lay-verify="required|phone" autocomplete="off" class="layui-input" style="width: 300px">
                </div>
            </div>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;margin-left: -12%">
            </fieldset>

            <div class="layui-form-item">
                <label class="layui-form-label">工作性质</label>
                <div class="layui-input-block">
                    <input type="radio" name="like[write]" title="全职">
                    <input type="checkbox" name="like[read]" title="兼职" checked="">
                    <input type="checkbox" name="like[game]" title="实习">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">月薪范围</label>
                    <div class="layui-input-inline" style="width: 200px;">
                        <input type="text" name="price_min" placeholder="￥" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid">-</div>
                    <div class="layui-input-inline" style="width: 200px;">
                        <input type="text" name="price_max" placeholder="￥" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid">k</div>
                </div>
            </div>

            <div class="layui-form-item" >
                <label class="layui-form-label">工作城市</label>
                <div class="layui-input-inline">
                    <select name="quiz1">

                    </select>
                </div>
                <div class="layui-input-inline">
                    <select name="quiz2">

                    </select>
                </div>

            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">具体地址:</label>
                <div class="layui-input-inline">
                    <input type="text" id="address" name="account" lay-verify="required|phone" autocomplete="off" class="layui-input" style="width: 300px">
                </div>
            </div>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;margin-left: -12%">
            </fieldset>

            <div class="layui-form-item" >
                <label class="layui-form-label">工作经验</label>
                <div class="layui-input-inline">
                    <select name="quiz1">
                        <option>不限</option>
                        <option>应届毕业生</option>
                        <option>1年以下</option>
                        <option>1-3年</option>
                        <option>3-5年</option>
                        <option>5-10年</option>
                        <option>10年以上</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item" >
                <label class="layui-form-label">学历</label>
                <div class="layui-input-inline">
                    <select name="quiz1">
                        <option>不限</option>
                        <option>大专</option>
                        <option>本科</option>
                        <option>硕士</option>
                        <option>博士</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">工作描述</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" class="layui-textarea" style="width: 500px; height: 200px"></textarea>
                </div>
            </div>
        </form>
    </div>

</body>
</html>
