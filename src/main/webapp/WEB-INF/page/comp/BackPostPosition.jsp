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
                    <input type="text" id="postName" name="postName" placeholder="填写岗位具体名称"  autocomplete="off" class="layui-input" onkeyup="testPost()">
<%--                    <label class="layui-form-label" style="color: red;display: none">skfsadsads</label>--%>
                    <span id="tip1" style="display: none;color: red" >请填写岗位名称</span>
                    <span id="tip2" style="display: none;color: red" >岗位名称不能超过10个字符</span>
                </div>

            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所属部门:</label>
                <div class="layui-input-inline">
                    <input type="text" id="department" name="department" placeholder="职位所属部门"  autocomplete="off" class="layui-input" >
                    <span id="tip3" style="display: none;color: red" >请填写部门</span>
                    <span id="tip4" style="display: none;color: red" >部门长度不能超过10</span>
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
                <span id="tip5" style="display: none;color: red" >工资只能是整数</span>
                <span id="tip6" style="display: none;color: red" >最低工资不能大于最大工资</span>
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
                    <input type="text" id="detailAddress" name="detailAddress" placeholder="工作的具体地址"  autocomplete="off" class="layui-input" style="width: 150%">
                    <span id="tip7" style="display: none;color: red" >请填写详细地址</span>
                    <span id="tip8" style="display: none;color: red" >地址长度不能超过20</span>
                </div>
<%--                <label class="layui-form-label">具体地址:</label>--%>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">招收人数:</label>
                <div class="layui-input-inline">
                    <input type="text" id="recruitsNum" name="recruitsNum" placeholder="打算招收的人数" autocomplete="off" class="layui-input" style="width: 150%">
                    <span id="tip9" style="display: none;color: red" >招收人数未填写</span>
                    <span id="tip10" style="display: none;color: red" >招收人数长度不能超过15</span>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">福利描述</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" class="layui-textarea" placeholder="简单描述一下岗位的福利" style="width: 80%; height: 15%;resize: none" id="jobBenefits" name="jobBenefits"></textarea>
                    <span id="tip11" style="display: none;color: red" >福利描述未填写</span>
                    <span id="tip12" style="display: none;color: red" >福利描述长度不能超过30</span>
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
                    <input type="text" id="contactEmail" name="contactEmail" placeholder="接收简历的邮箱" lay-verify="required|phone" autocomplete="off" class="layui-input" style="width: 150%">
                    <span id="tip13" style="display: none;color: red" >请输入正确邮箱格式</span>

                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">联系方式</label>
                <div class="layui-input-inline">
                    <input type="text" id="contact" name="contact" placeholder="请准确填写手机或固话" autocomplete="off" class="layui-input" style="width: 150%" >
                    <span id="tip15" style="display: none;color: red" >联系方式未填写</span>
                    <span id="tip16" style="display: none;color: red" >联系方式长度不能超过30</span>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">工作描述</label>
                <div class="layui-input-block">
                    <textarea placeholder="具体工作的描述" class="layui-textarea" style="width: 80%; height: 35%; resize: none" id="jobDescription" name="jobDescription" ></textarea>
                    <span id="tip17" style="display: none;color: red" >工作描述过于简单，长度起码10以上!</span>
                    <span id="tip18" style="display: none;color: red" >工作描述长度不能超过100!</span>
                </div>
            </div>

            <hr class="layui-bg-green">

            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 29%">
                    <input  type="button" class="layui-btn" onclick="sumb()" value="立即发布">  </input>
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

<script>
    $("#postName").change(function () {
        var postName = $("#postName").val();
        if(postName.trim().length==0){
            $("#tip1").css("display","block");
            $("#tip2").css("display","none");
            return false;
        }
        if(postName.trim().length>10){
            $("#tip2").css("display","block");
            $("#tip1").css("display","none");
            return false;
        }
        $("#tip1").css("display","none");
        $("#tip2").css("display","none");
    })

    $("#department").change(function () {
        var department = $("#department").val();
        if(department.trim().length==0){
            $("#tip3").css("display","block");
            $("#tip4").css("display","none");
            return false;
        }
        if(department.trim().length>10){
            $("#tip4").css("display","block");
            $("#tip3").css("display","none");
            return false;
        }
        $("#tip3").css("display","none");
        $("#tip4").css("display","none");
    })

    $("#detailAddress").change(function () {
        var detailAddress = $("#detailAddress").val();
        if(detailAddress.trim().length==0){
            $("#tip7").css("display","block");
            $("#tip8").css("display","none");
            return false;
        }
        if(detailAddress.trim().length>20){
            $("#tip8").css("display","block");
            $("#tip7").css("display","none");
            return false;
        }
        $("#tip7").css("display","none");
        $("#tip8").css("display","none");
    })

    $("#recruitsNum").change(function () {
        var recruitsNum = $("#recruitsNum").val();
        if(recruitsNum.trim().length==0){
            $("#tip9").css("display","block");
            $("#tip10").css("display","none");
            return false;
        }
        if(recruitsNum.trim().length>15){
            $("#tip10").css("display","block");
            $("#tip9").css("display","none");
            return false;
        }
        $("#tip9").css("display","none");
        $("#tip10").css("display","none");
    })

    $("#jobBenefits").change(function () {
        var jobBenefits = $("#jobBenefits").val();
        if(jobBenefits.trim().length==0){
            $("#tip11").css("display","block");
            $("#tip12").css("display","none");
            return false;
        }
        if(jobBenefits.trim().length>30){
            $("#tip12").css("display","block");
            $("#tip11").css("display","none");
            return false;
        }
        $("#tip11").css("display","none");
        $("#tip12").css("display","none");
    })

    $("#contactEmail").change(function () {
        var contactEmail = $("#contactEmail").val();
        var patterns = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        if(!patterns.test(contactEmail)){
            $("#tip13").css("display","block");
            return false;
        }
        $("#tip13").css("display","none");
    })

    $("#contact").change(function () {
        var contact = $("#contact").val();
        if(contact.trim().length==0){
            $("#tip15").css("display","block");
            $("#tip16").css("display","none");
            return false;
        }
        if(contact.trim().length>30){
            $("#tip16").css("display","block");
            $("#tip15").css("display","none");
            return false;
        }
        $("#tip15").css("display","none");
        $("#tip16").css("display","none");
    })

    $("#jobDescription").change(function () {
        var jobDescription = $("#jobDescription").val();
        if(jobDescription.trim().length<=10){
            $("#tip17").css("display","block");
            $("#tip18").css("display","none");
            return false;
        }
        if(jobDescription.trim().length>200){
            $("#tip18").css("display","block");
            $("#tip17").css("display","none");
            return false;
        }
        $("#tip17").css("display","none");
        $("#tip18").css("display","none");
    })

    // $("#minSalary").change(function () {
    //     var minSalary = 0;
    //     var maxSalary = 0;
    //     minSalary = $("#minSalary").val();
    //     maxSalary = $("#maxSalary").val();
    //     var pattern = /^\+?[1-9][0-9]*$/;
    //
    //     if(parseInt($("#minSalary").val())>= parseInt($("#maxSalary").val())){
    //         $("#tip6").css("display","block");
    //         $("#tip5").css("display","none");
    //         return false;
    //     }
    //
    //     if(!pattern.test(minSalary)||!pattern.test(maxSalary)){
    //         $("#tip5").css("display","block");
    //         $("#tip6").css("display","none");
    //         return false;
    //     }
    //
    //     $("#tip5").css("display","none");
    //     $("#tip6").css("display","none");
    // })
    //
    // $("#maxSalary").change(function () {
    //     var minSalary = 0;
    //     var maxSalary = 0;
    //     minSalary = $("#minSalary").val();
    //     maxSalary = $("#maxSalary").val();
    //     var pattern = /^\+?[1-9][0-9]*$/;
    //
    //     if(parseInt($("#minSalary").val())>= parseInt($("#maxSalary").val())){
    //         $("#tip6").css("display","block");
    //         $("#tip5").css("display","none");
    //         return false;
    //     }
    //     if(!pattern.test(minSalary)||!pattern.test(maxSalary)){
    //         $("#tip5").css("display","block");
    //         $("#tip6").css("display","none");
    //         return false;
    //     }
    //     $("#tip5").css("display","none");
    //     $("#tip6").css("display","none");
    // })
</script>

</html>


