<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/10
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns:wb="http://open.weibo.com/wb"><head>

    <script type="text/javascript" async="" src="${pageContext.request.contextPath}/style/js/conversion.js"></script>
    <script src="${pageContext.request.contextPath}/style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
    <style type="text/css"></style>
    <meta content="no-siteapp" http-equiv="Cache-Control">
    <link  media="handheld" rel="alternate">
    <!-- end 云适配 -->
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">

    <!-- <div class="web_root"  style="display:none">h</div> -->
    <script type="text/javascript">
        var ctx = "h";
        console.log(1);
    </script>
<%--    <link href="h/images/favicon.ico" rel="Shortcut Icon">--%>
    <link href="${pageContext.request.contextPath}/style/css/style.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/BackChangePwd.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/popup.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery.1.10.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/js/jquery.lib.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/ajaxfileupload.js"></script>
    <script src="${pageContext.request.contextPath}/style/js/additional-methods.js" type="text/javascript"></script>
    <!--[if lte IE 8]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/excanvas.js"></script>
    <![endif]-->
    <script type="text/javascript">
        var youdao_conv_id = 271546;
    </script>
    <script src="${pageContext.request.contextPath}/style/js/conv.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/style/js/ajaxCross.json" charset="UTF-8"></script>

    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body>
<div id="body">
    <input type="hidden" value="${pageContext.request.contextPath}" id="path">
    <div id="container">
        <input type="hidden" id="hasSidebar" value="1">
        <div id="changePwdDiv">
        <dl class="c_section">
            <dt>
                <h2><em></em>修改密码</h2>
            </dt>
            <dd>
                <form id="updatePswForm">
                    <table class="savePassword">
                        <tbody>
                        <tr>
                            <td>登录账号</td>
                            <td class="c7">${admin.account}</td>
                        </tr>
                        <tr>
                            <td class="label">当前密码</td>
                            <td>
                                <input type="password" maxlength="16" id="oldpassword" name="oldpassword" style="background-image: url(${pageContext.request.contextPath}/style/images/img/0CQnd2Jos49xUAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;height: 45px">
                                <span id="updatePwd_beError" style="display:none;" class="error">
            				</span></td>
                        </tr>
                        <tr>
                            <td class="label">新密码</td>
                            <td><input type="password" maxlength="16" id="newpassword" name="newpassword" style="background-image: url(${pageContext.request.contextPath}/style/images/img/a6y3y0Wx5kbFHvGuXzkgf0xhKnPzA4UTyaTB8Ph8AvcHi3fnsrZ7Wore02YViqVOrRXXPhfqP8j6MYlawoAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;height: 45px"></td>
                        </tr>
                        <tr>
                            <td class="label">确认密码</td>
                            <td><input type="password" maxlength="16" id="comfirmpassword" name="comfirmpassword" style="background-image: url(${pageContext.request.contextPath}/style/images/img/a6y3y0Wx5kbFHvGuXzkgf0xhKnPzA4UTyaTB8Ph8AvcHi3fnsrZ7Wore02YViqVOrRXXPhfqP8j6MYlawoAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;height: 45px"></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><input type="button" class="layui-btn" onclick="changePwd()" value="保 存"></td>
                        </tr>
                        </tbody></table>
                </form>
            </dd>
        </dl>
    </div>
            <!-- 修改密码 -->
            <div style="display: none" class="popup" id="updatePassword">
                <h3>修改密码成功，请重新登录</h3>
                <h4><span>5</span>秒后将自动退出</h4>
                <a class="btn" href="login.html">直接退出</a>
            </div>

        </div>
        <!------------------------------------- end -----------------------------------------> <script src="${pageContext.request.contextPath}/style/js/setting.js"></script>
        <div class="clear"></div>
        <input type="hidden" value="" id="resubmitToken">
        <a rel="nofollow" title="回到顶部" id="backtop"></a>
    </div><!-- end #container -->
</div><!-- end #body -->


<script src="${pageContext.request.contextPath}/style/js/core.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/style/js/popup.min.js" type="text/javascript"></script>

<!--  -->
</body>
<script>
    var path = $("#path").val();
    var layer;
    layui.use('layer',function () {
        layer = layui.layer;
    })
    function changePwd() {
        var pwd = $("#oldpassword").val()
        var newPwd = $("#newpassword").val();
        var againPwd = $("#comfirmpassword").val();

        $.ajax({
            url:path+"/rec/compChangePwd",
            data:"pwd="+pwd+"&newPwd="+newPwd,
            type:"post",
            typeData:"text",
            beforeSend:function(){
                var pattern = /\w{6,16}$/;
                if(!pattern.test(newPwd)){
                    layer.msg("密码只能由字母数字_组成,且至少6位，最多16位");
                    return false;
                }

                if(newPwd!=againPwd){
                    return false;
                }

            },
            success:function (data) {
                if(data=='1'){
                    layer.alert("旧密码错误");
                }else if(data=='2'){
                    layer.alert("修改成功，请重新登录");
                }else{
                    layer.alert("业务繁忙，修改失败");
                }
            }
        })
    }
</script>
</html>
