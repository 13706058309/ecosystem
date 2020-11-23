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
        <form class="layui-form" action="#" style="margin-left: 10%;margin-right: 10%" id="postPosition">
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
                <select name="postId" id="postId" lay-filter="position">

                </select>
            </div>
        </div>

            <div class="layui-form-item">
                <label class="layui-form-label">岗位名称:</label>
                <div class="layui-input-inline">
                    <input type="text" id="postName" name="postName" placeholder="填写岗位具体名称"  autocomplete="off" class="layui-input" >
<%--                    <label class="layui-form-label" style="color: red;display: none">skfsadsads</label>--%>
                </div>

            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所属部门:</label>
                <div class="layui-input-inline">
                    <input type="text" id="department" name="department" placeholder="职位所属部门"  autocomplete="off" class="layui-input" >
                </div>
            </div>

            <hr class="layui-bg-green">

            <div class="layui-form-item">
                <label class="layui-form-label">工作性质</label>
                <div class="layui-input-block">
                    <input type="radio" name="workNature" value="全职" title="全职" checked="">
                    <input type="radio" name="workNature" value="兼职" title="兼职">
                    <input type="radio" name="workNature" value="实习" title="实习" >
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">月薪范围</label>
                    <div class="layui-input-inline" style="width: 200px;">
                        <input type="text" name="minSalary" placeholder="￥" autocomplete="off" class="layui-input" id="minSalary">
                    </div>
                    <div class="layui-form-mid">-</div>
                    <div class="layui-input-inline" style="width: 200px;">
                        <input type="text" name="maxSalary" placeholder="￥" autocomplete="off" class="layui-input" id="maxSalary">
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
                    <select name="workCity" id="workCity" lay-filter="workCity">

                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">具体地址:</label>
                <div class="layui-input-inline">
                    <input type="text" id="detailAddress" name="detailAddress" placeholder="工作的具体地址"  autocomplete="off" class="layui-input" >
                </div>
<%--                <label class="layui-form-label">具体地址:</label>--%>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">招收人数:</label>
                <div class="layui-input-inline">
                    <input type="text" id="recruitsNum" name="recruitsNum" placeholder="打算招收的人数" autocomplete="off" class="layui-input" >
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">福利描述</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" class="layui-textarea" placeholder="简单描述一下岗位的福利" style="width: 80%; height: 15%;resize: none" id="jobBenefits" name="jobBenefits"></textarea>
                </div>
            </div>

            <hr class="layui-bg-green">

            <div class="layui-form-item" >
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
            </div>

            <div class="layui-form-item" >
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
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">投递邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" id="contactEmail" name="contactEmail" placeholder="接收简历的邮箱" lay-verify="required|phone" autocomplete="off" class="layui-input" >
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">联系方式</label>
                <div class="layui-input-inline">
                    <input type="text" id="contact" name="contact" placeholder="手机或固话" autocomplete="off" class="layui-input" >
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">工作描述</label>
                <div class="layui-input-block">
                    <textarea placeholder="具体工作的描述" class="layui-textarea" style="width: 80%; height: 35%; resize: none" id="jobDescription" name="jobDescription"></textarea>
                </div>
            </div>

            <hr class="layui-bg-green">

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input  type="button" class="layui-btn" onclick="sumb()" value="立即提交">  </input>
                    <input  type="button" class="layui-btn" value="招聘预览" onclick="showDetail()"></input>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>

    <div id="postPositionDetailDiv" style="display: none;padding: 3%">
        <table class="layui-table">
            <tr>
                <td  colspan="6"><h2>招聘岗位预览</h2></td>
            </tr>
            <tr>
                <td class="ziti" width="16%">岗位名称</td>
                <td id="dPostName"></td>
                <td class="ziti">所属部门</td>
                <td id="dDepart"></td>
                <td class="ziti">工作性质</td>
                <td id="workType"></td>
            </tr>

            <tr>
                <td class="ziti">月薪范围</td>
                <td id="salary"></td>
                <td class="ziti">工作城市</td>
                <td id="dWorkCity"></td>
                <td class="ziti">招收人数</td>
                <td id="num"></td>
            </tr>

            <tr>
                <td class="ziti">工作经验</td>
                <td id="dWorkExp"></td>
                <td class="ziti">学历</td>
                <td id="dEducation"></td>
                <td class="ziti">投递邮箱</td>
                <td id="dEmail"></td>
            </tr>

            <tr>
                <td rowspan="1" class="ziti">联系方式</td>
                <td colspan="5" id="dContact"> </td>
            </tr>

            <tr>
                <td rowspan="1" class="ziti">具体地址</td>
                <td colspan="5" id="dAddress"> </td>
            </tr>

            <tr>
                <td rowspan="1" class="ziti">福利描述</td>
                <td colspan="5" id="fuli"> </td>
            </tr>

            <tr>
                <td rowspan="1" class="ziti">工作描述</td>
                <td colspan="5" id="workDes"> </td>
            </tr>
        </table>
    </div>
</body>
</html>
