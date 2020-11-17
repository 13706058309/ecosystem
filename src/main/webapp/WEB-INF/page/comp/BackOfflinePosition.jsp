<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/11
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comp/BackOfflinePosition.css">
<script src="${pageContext.request.contextPath}/js/comp/BackOfflinePosition.js"></script>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<body>
<script id="btns" type="text/html">
    <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="onLine">重新上线</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
</script>

    <h1 style="text-align: center">已下线岗位</h1>
    <br>
    <input type="hidden" value="${pageContext.request.contextPath}" id="path">
        <div class="demoTable layui-form" style="margin-left: 25%">
            <div class="layui-form-item">

                <div class="layui-inline">
                    <label class="layui-form-label">发布时间</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="beginTime" placeholder="yyyy-MM-dd">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">至</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="endTime" placeholder="yyyy-MM-dd">
                    </div>
                </div>

            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">岗位名称:</label>
                <div class="layui-input-inline">
                    <input type="tel" id="postName" class="layui-input">
                </div>

                <div class="layui-input-inline" style="margin-left: 8%">
                    <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" data-type="reload">查询</button>
                </div>
            </div>
        </div>
    <table id="userTable" lay-filter="test"></table>
<input type="hidden" id="pID">
<div id="postPositionDetailDiv" style="display: none;padding: 3%">
    <table class="layui-table">
        <tr>
            <td  colspan="6"><h2>招聘信息查看/双击可修改</h2></td>
        </tr>
        <tr>
            <td class="ziti" width="16%">岗位名称</td>
            <td id="dPostName" ondblclick="changePostName()"></td>
            <td class="ziti">岗位类型</td>
            <td id="dPostType" ondblclick="changePostType()"></td>
            <td class="ziti">所属部门</td>
            <td id="dDepart" ondblclick="changePostName()"></td>
        </tr>

        <tr>
            <td class="ziti">月薪范围</td>
            <td id="salary" ondblclick="changeSalary()">dsfs</td>
            <td class="ziti" >工作城市</td>
            <td id="dWorkCity" ondblclick="changeCity()"></td>
            <td class="ziti">招收人数</td>
            <td id="num" ondblclick="changeNum()"></td>
        </tr>

        <tr>
            <td class="ziti">工作经验</td>
            <td id="dWorkExp" ondblclick="changeWorkYear()"></td>
            <td class="ziti">学历</td>
            <td id="dEducation" ondblclick="changeEdu()"></td>
            <td class="ziti">工作性质</td>
            <td id="workType" ondblclick="changeWorkType()"></td>
        </tr>

        <tr>
            <td rowspan="1" class="ziti">投递邮箱</td>
            <td colspan="5" id="dEmail" ondblclick="changeEmail()"> </td>
        </tr>

        <tr>
            <td rowspan="1" class="ziti">联系方式</td>
            <td colspan="5" id="dContact" ondblclick="changeContact()"> </td>
        </tr>

        <tr>
            <td rowspan="1" class="ziti">具体地址</td>
            <td colspan="5" id="dAddress" ondblclick="changeAddre()"> </td>
        </tr>

        <tr>
            <td rowspan="1" class="ziti">福利描述</td>
            <td colspan="5" id="fuli" ondblclick="changeJobBenf()"> </td>
        </tr>

        <tr>
            <td rowspan="1" class="ziti">工作描述</td>
            <td colspan="5" id="workDes" ondblclick="changeJobDes()"> </td>
        </tr>

    </table>
</div>

<div style="display: none" id="changePostName">
    <br>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">岗位名称:</label>
        <div class="layui-input-inline">
            <input type="text" id="newPostName" name="newPostName"  autocomplete="off" class="layui-input" >
        </div>
    </div>
</div>

<div style="display: none" id="changeDepartMent">
    <br>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">岗位名称:</label>
        <div class="layui-input-inline">
            <input type="text" id="newDepart" name="newDepart"  class="layui-input" >
        </div>
    </div>
</div>


<div id="changePost" style="display: none;margin-top: 3%">
    <br>
    <form class="layui-form" action="" style="margin-left: 15%;margin-right: 15%">
        <div class="layui-form-item">
            <label class="layui-form-label">职位类别</label>
            <div class="layui-input-inline" >
                <select name="industry" id="industry" lay-filter="industry">

                </select>
            </div>
            <div class="layui-input-inline">
                <select name="depart" id="depart" lay-filter="depart">

                </select>
            </div>
            <div class="layui-input-inline">
                <select name="postId" id="postId" lay-filter="position">

                </select>
            </div>
        </div>

    </form>
</div>

<div style="display: none" id="changeSalary">
    <br>
    <div class="layui-form-item layui-form-text">
        <div class="layui-inline">
            <label class="layui-form-label">月薪范围</label>
            <div class="layui-input-inline" >
                <input type="text" name="minSalary" placeholder="￥" autocomplete="off" class="layui-input" id="minSalary">
            </div>
            <div class="layui-form-mid">-</div>
            <div class="layui-input-inline" >
                <input type="text" name="maxSalary" placeholder="￥" autocomplete="off" class="layui-input" id="maxSalary">
            </div>
            <div class="layui-form-mid">k</div>
        </div>
    </div>
</div>

<div id="changeCity" style="display: none;margin-top: 3%">
    <br>
    <form class="layui-form" action="" style="margin-left: 15%;margin-right: 15%">
        <div class="layui-form-item">
            <label class="layui-form-label">工作城市</label>

            <div class="layui-input-inline">
                <select name="province" id="province" lay-filter="province">

                </select>
            </div>

            <div class="layui-input-inline">
                <select name="workCity" id="workCity" lay-filter="workCity">

                </select>
            </div>
        </div>

    </form>
</div>

<div style="display: none" id="changNum">
    <br>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">招收人数:</label>
        <div class="layui-input-inline">
            <input type="text" id="newNum" name="newNum"  class="layui-input" >
        </div>
    </div>
</div>

<div id="changeWorkYear" style="display: none;margin-top: 3%">
    <br>
    <form class="layui-form" action="" style="margin-left: 15%;margin-right: 15%">
        <label class="layui-form-label">工作经验</label>
        <div class="layui-input-inline">
            <select name="workYear" id="workYear">
                <option value="不限">不限</option>
                <option value="应届毕业生">应届毕业生</option>
                <option value="1年以下">1年以下</option>
                <option value="1-3年">1-3年</option>
                <option value="3-5年">3-5年</option>
                <option value="5-10年">5-10年</option>
                <option value="10年以上">10年以上</option>
            </select>
        </div>
    </form>
</div>

<div id="changeEdu" style="display: none;margin-top: 3%">
    <br>
    <form class="layui-form" action="" style="margin-left: 15%;margin-right: 15%">
        <label class="layui-form-label">学历</label>
        <div class="layui-input-inline">
            <select name="education" id="education">
                <option value="不限">不限</option>
                <option value="高中">高中</option>
                <option value="大专">大专</option>
                <option value="本科">本科</option>
                <option value="硕士">硕士</option>
                <option value="博士">博士</option>
            </select>
        </div>
    </form>
</div>

<div id="changeWorkType" style="display: none;margin-top: 3%">
    <br>
    <form class="layui-form" action="" style="margin-left: 15%;margin-right: 15%">
        <label class="layui-form-label">工作性质</label>
        <div class="layui-input-block">
            <input type="radio" name="workNature" value="全职" title="全职" checked="">
            <input type="radio" name="workNature" value="兼职" title="兼职">
            <input type="radio" name="workNature" value="实习" title="实习" >
        </div>
    </form>
</div>

<div style="display: none" id="changEmail">
    <br>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">投递邮箱</label>
        <div class="layui-input-inline">
            <input type="text" id="contactEmail" name="contactEmail" class="layui-input" >
        </div>
    </div>
</div>

<div style="display: none" id="changContact">
    <br>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">联系方式</label>
        <div class="layui-input-inline">
            <input type="text" id="contact" name="contact"  class="layui-input" >
        </div>
    </div>
</div>

<div style="display: none" id="changeAddress">
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">具体地址</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" style="width: 80%; height: 85%" id="detailAddress" name="detailAddress"></textarea>
        </div>
    </div>
</div>

<div style="display: none" id="changeFuli">
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">福利描述</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" style="width: 80%; height: 85%" id="jobBenefits" name="jobBenefits"></textarea>
        </div>
    </div>
</div>

<div style="display: none" id="changeWorkDes">
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">工作描述</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" style="width: 80%; height: 85%" id="jobDescription" name="jobDescription"></textarea>
        </div>
    </div>
</div>
</body>
</html>
