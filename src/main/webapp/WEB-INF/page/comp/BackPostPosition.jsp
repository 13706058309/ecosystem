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
<%--        <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />--%>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
        <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/comp/BackPostPosition.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/comp/BackPostPosition.css">

    </head>
<body>
    <input type="hidden" value="${pageContext.request.contextPath}" id="path">
    <div class="layui-container layui-fluid" id="postPositionDiv">
        <br>
        <h1 style="text-align: center">岗位发布</h1>
        <br>
        <form class="layui-form" action="#" style="margin-left: 15%;margin-right: 15%">
        <div class="layui-form-item" >
            <label class="layui-form-label">职位类别</label>
            <div class="layui-input-inline">
                <select name="industry" id="industry" lay-filter="industry">

                </select>
            </div>
            <div class="layui-input-inline" >
                <select name="depart" id="depart" lay-filter="depart">

                </select>
            </div>
            <div class="layui-input-inline">
                <select name="position" id="position" lay-filter="position">

                </select>
            </div>
        </div>

            <div class="layui-form-item">
                <label class="layui-form-label">岗位名称:</label>
                <div class="layui-input-inline">
                    <input type="text" id="account" name="account"  autocomplete="off" class="layui-input" >
<%--                    <label class="layui-form-label" style="color: red;display: none">skfsadsads</label>--%>
                </div>

            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所属部门:</label>
                <div class="layui-input-inline">
                    <input type="text" id="department" name="account"  autocomplete="off" class="layui-input" >
                </div>
            </div>

            <hr class="layui-bg-green">

            <div class="layui-form-item">
                <label class="layui-form-label">工作性质</label>
                <div class="layui-input-block">
                    <input type="radio" name="work" value="全职" title="全职" checked="">
                    <input type="radio" name="work" value="兼职" title="兼职">
                    <input type="radio" name="work" value="实习" title="实习" >
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">月薪范围</label>
                    <div class="layui-input-inline" style="width: 200px;">
                        <input type="text" name="priceMin" placeholder="￥" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid">-</div>
                    <div class="layui-input-inline" style="width: 200px;">
                        <input type="text" name="priceMax" placeholder="￥" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid">k</div>
                </div>
            </div>

            <div class="layui-form-item" >
                <label class="layui-form-label">工作城市</label>

                <div class="layui-input-inline">
                    <select name="province" id="province" lay-filter="province">

                    </select>
                </div>

                <div class="layui-input-inline">
                    <select name="city" id="city" lay-filter="city">

                    </select>
                </div>

            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">具体地址:</label>
                <div class="layui-input-inline">
                    <input type="text" id="address" name="account" lay-verify="required|phone" autocomplete="off" class="layui-input" >
                </div>
                <label class="layui-form-label">具体地址:</label>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">招收人数:</label>
                <div class="layui-input-inline">
                    <input type="text" id="num" name="account" lay-verify="required|phone" autocomplete="off" class="layui-input" >
                </div>
            </div>
            <hr class="layui-bg-green">

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

            <div class="layui-form-item">
                <label class="layui-form-label">投递邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" id="email" name="email" lay-verify="required|phone" autocomplete="off" class="layui-input" >
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">工作描述</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" class="layui-textarea" style="width: 60%; height: 35%"></textarea>
                </div>
            </div>

            <hr class="layui-bg-green">

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="" class="layui-btn" onclick="sumb()">立即提交</button>
                    <button type="" class="layui-btn" >招聘预览</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>

</body>
</html>
