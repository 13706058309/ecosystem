<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/10
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<%--    <script type="text/javascript" async="" src="${pageContext.request.contextPath}/style/js/conversion.js"></script>--%>
    <script src="${pageContext.request.contextPath}/style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
    <style type="text/css"></style>
    <meta content="no-siteapp" http-equiv="Cache-Control">
    <link  media="handheld" rel="alternate">
    <!-- end 云适配 -->
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>钱程无忧</title>
<%--    <link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">--%>
    <link href="${pageContext.request.contextPath}/style/css/style.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/popup.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery.1.10.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/js/jquery.lib.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/ajaxfileupload.js"></script>
<%--    <script src="${pageContext.request.contextPath}/style/js/additional-methods.js" type="text/javascript"></script>--%>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <!--[if lte IE 8]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/excanvas.js"></script>
    <![endif]-->

<%--    <script src="${pageContext.request.contextPath}/style/js/conv.js" type="text/javascript"></script>--%>
    <script src="${pageContext.request.contextPath}/style/js/ajaxCross.json" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vendor.css">

</head>
<body>
<div id="body" style="background-color: #5dfffc">
    <div id="container" style="margin-top: 1%">

        <form class="content_mid layui-form">
            <dl class="c_section c_section_mid">
                <dt>
                    <h2><em></em>填写公司信息</h2>
                </dt>
                <dd>
                    <input type="hidden" id="path" value="${pageContext.request.contextPath}">
                    <form id="stepForm">
                        <h3>公司负责人</h3>
                        <input type="text"  maxlength="4" placeholder="请输入公司负责人的姓名"  name="bUserName" id="bUserName" style="height: 8%;">

                        <h3>上传负责人身份证</h3>
<%--                        <div id="logoNo">--%>
<%--                            <span>上传营业执照 大小：小于5M</span>--%>
<%--                            <div class="layui-upload">--%>
<%--                                <input type="file" class="layui-btn layui-btn-normal" id="uploadFile" name="upload" ></input>--%>
<%--                            </div>--%>
                        <div class="info-flex-item header-upload">
                            <div class="header-box">
                                <div class="header-mask"></div><img id="headImg"
                                                                    src="https://paimgcdn.baidu.com/2986AD9ACAF1B0B1?src=http%3A%2F%2Fms.bdimg.com%2Fdsp-image%2F3256454903.jpg&rz=urar_2_968_600&v=0"
                                                                    class="header-img">
                                <input type="file" onchange="selectFile()" class="head-input"
                                       accept="image/*" />
                            </div>
                        </div>
<%--                        </div>--%>

                        <h3>公司名称</h3> <!--非必填-->
                        <input type="text" placeholder="请输入公司简称，如:拉勾" value="" name="compName" id="compName" class="valid" style="height: 8%">

                        <input type="text" placeholder="请输入公司简称，如:拉勾" value="" name="compName" id="compName" class="valid">

                        <h3>公司营业执照上传</h3>
                        <div id="logoNo">
                            <span>上传营业执照 大小：小于5M</span>
                            <div class="layui-upload">
                                <input type="file" class="layui-btn layui-btn-normal" id="uploadFile" name="upload" onclick="up()" />
                            </div>
                        </div>

                        <h3>所在城市</h3>

                        <div class="layui-form-item" >

                            <div class="layui-input-inline">
                                <select name="province" id="province" lay-filter="province" style="width: 30%;">

                                </select>
                            </div>

                            <div class="layui-input-inline">
                                <select name="workCity" id="workCity" lay-filter="workCity" style="width: 30%;">

                                </select>
                            </div>
                        </div>


                        <h3>公司邮箱</h3>
                        <input type="text" placeholder="公司邮箱，用于接收求职者简历" name="email" id="email" style="height: 40px;">

                        <h3>行业领域</h3>
                        <div>
                            <input type="hidden" value="" name="select_industry_hidden" id="select_industry_hidden">
                            <input type="button" value="请选择行业领域" name="select_industry" id="select_industry" class="select">
                            <div class="dn" id="box_industry" style="display: none;">
                                <ul class="reset">
                                    <li>移动互联网</li>
                                    <li>电子商务</li>
                                    <li>社交</li>
                                    <li>企业服务</li>
                                    <li>O2O</li>
                                    <li>教育</li>
                                    <li>文化艺术</li>
                                    <li>游戏</li>
                                    <li>在线旅游</li>
                                    <li>金融互联网</li>
                                    <li>健康医疗</li>
                                    <li>生活服务</li>
                                    <li>硬件</li>
                                    <li>搜索</li>
                                    <li>安全</li>
                                    <li>运动体育</li>
                                    <li>云计算\大数据</li>
                                    <li>移动广告</li>
                                    <li>社会化营销</li>
                                    <li>视频多媒体</li>
                                    <li>媒体</li>
                                    <li>智能家居</li>
                                    <li>智能电视</li>
                                    <li>分类信息</li>
                                    <li>招聘</li>
                                </ul>
                            </div>
                        </div>

                        <h3>申请账号</h3>
                        <input type="text" placeholder="输入申请的账号，用于后期登录" name="account" id="account" style="height: 40px;">

                        <h3>输入密码</h3>
                        <input type="password" placeholder="请输入密码" name="pwd" id="pwd" style="height: 40px;">

                        <h3>确认密码</h3>
                        <input type="password" placeholder="再次输入密码" name="pwdAgain" id="pwdAgain" style="height: 40px;">

                        <h3>手机号码</h3>
                        <input type="text" maxlength="11" onkeyup="this.value=this.value.replace(/\D/g,'')"  placeholder="请输入手机号，可以用于密码找回" name="telephone" id="telephone" style="height: 40px;">

                        <h3>验证码</h3>
                        <input type="text" placeholder="输入验证码" name="vCode" id="vCode" style="height: 40px;width: 200px">
                        <input type="button" class="layui-btn layui-btn-normal" value="发送验证码">
                        <span style="display:none;" class="error" id="beError"></span>
<%--                        <input type="hidden" id="companyId" name="companyId" value="25927">--%>
<%--                        <input type="hidden" id="companyName" name="companyName" value="福建平潭协创进出口贸易有限公司">--%>
                        <a onclick="comReg()"><input type="button" value="注册" id="stepBtn" class="btn_big fr"></a>
                    </form>
                </dd>
            </dl>
        </form>
<%--        <script src="${pageContext.request.contextPath}/style/js/step1.min.js" type="text/javascript"></script>--%>
<%--        <script type="text/javascript" src="${pageContext.request.contextPath}/js/data.js"></script>--%>
        <script type="text/javascript">

            var form;
            layui.use('form',function () {
                form = layui.form;
                form.render();
            })



            function up() {
                var path = $("#path").val();
                var type = "file";  //后台接收时需要的参数名称，自定义即可
                var id = $("#uploadFile").val(); //即input的id，用来寻找值
                var formData = new FormData();
                formData.append(type,$("#"+id)[0].files[0]);//生成一对表单属性
                $.ajax({
                    url:path,
                })
            }

            var avatar = {};
            avatar.uploadComplate = function( data ){
                var result = eval('('+ data +')');
                if(result.success){
                    jQuery('#logoShow img').attr("src",ctx+ '/'+result.content);
                    jQuery.colorbox.close();
                    jQuery('#logoNo').hide();
                    jQuery('#logoShow').show();
                }
            };


            //企业注册
            function comReg() {
                var path = $("#path").val();
                var bUserName = $("#username").val();
                var compName = $("#compName").val();
                // var province = $("#province").text();
                // var city = $("#city").text();
                // var district = $("#district").text();
                var email = $("#email").val();
                var account = $("#account").val();
                var pwd = $("#pwd").val();
                var pwdAgain = $("#pwdAgain").val();
                var contactInfo = $("#telephone").val();

                $.ajax({
                    url:path+"/comp/join",
                    data:{"bUserName":bUserName,"compName":compName,"email":email,"account":account,"pwd":pwd,"contactInfo":contactInfo},
                    type:"post",
                    typeData:"text",
                    beforeSend:function () {
                        if(bUserName.length==0){
                            alert("姓名不能为空!");
                            return false;
                        }
                        if(compName.length==0){
                            alert("公司名称不能为空!");
                            return false;
                        }
                        if(email.length==0){
                            alert("邮箱不能为空!");
                            return false;
                        }
                        if(pwd.length==0){
                            alert("密码不能为空!");
                            return false;
                        }
                        if(pwdAgain != pwd){
                            alert("两次密码不一致，请重新输入!");
                            return false;
                        }
                        if(telephone.length==0){
                            alert("手机号不能为空!");
                            return false;
                        }
                        return true;
                    },
                    success:function (info) {
                            if(info == 'regsuccess'){
                                alert("恭喜您,入驻成功!请耐心等待管理员的审核,审核通过后,方可登录!");
                            } else if(info == 'regfaid'){
                                alert("对不起,入驻失败!请重新填写企业信息!");
                                location.href = path+"/comp/compReg";
                            } else if(info == 'repeat') {
                                alert("注册失败！原因:该账号或者该名称已存在。")
                            }
                    },
                    error:function () {
                        alert("错误,请联系管理员!");
                    }

                })

                // alert("省:"+province+"市:"+city+"县城:"+district);
            }

            function selectFile() {
                let files = event.target.files;
                if (files.length === 0) return false;
                let reader = new FileReader();
                reader.readAsDataURL(files[0]);
                reader.onloadend = () => {
                    $("#headImg").attr("src", reader.result)
                }
            }

        </script>

        <div class="clear"></div>
        <input type="hidden" value="13ae35fedd9e45cdb66fb712318d7369" id="resubmitToken">
        <a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
    </div><!-- end #container -->
</div><!-- end #body -->


<script src="${pageContext.request.contextPath}/style/js/core.min.js" type="text/javascript"></script>
<%--<script src="${pageContext.request.contextPath}/style/js/popup.min.js" type="text/javascript"></script>--%>

<!--  -->


<%--<div id="cboxOverlay" style="display: none;"></div>--%>
<%--<div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;">--%>
<%--    <div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div>--%>
<%--        <div id="cboxTopCenter" style="float: left;"></div>--%>
<%--        <div id="cboxTopRight" style="float: left;"></div>--%>
<%--    </div>--%>
<%--        <div style="clear: left;">--%>
<%--            <div id="cboxMiddleLeft" style="float: left;"></div>--%>
<%--            <div id="cboxContent" style="float: left;">--%>
<%--                <div id="cboxTitle" style="float: left;"></div>--%>
<%--                <div id="cboxCurrent" style="float: left;"></div>--%>
<%--                <button type="button" id="cboxPrevious"></button>--%>
<%--                <button type="button" id="cboxNext"></button>--%>
<%--                <button id="cboxSlideshow"></button>--%>
<%--                <div id="cboxLoadingOverlay" style="float: left;"></div>--%>
<%--                <div id="cboxLoadingGraphic" style="float: left;"></div>--%>
<%--            </div>--%>
<%--            <div id="cboxMiddleRight" style="float: left;"></div>--%>
<%--        </div>--%>
<%--        <div style="clear: left;">--%>
<%--            <div id="cboxBottomLeft" style="float: left;"></div>--%>
<%--            <div id="cboxBottomCenter" style="float: left;"></div>--%>
<%--            <div id="cboxBottomRight" style="float: left;"></div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>--%>
<%--</div>--%>
</body>
</html>
