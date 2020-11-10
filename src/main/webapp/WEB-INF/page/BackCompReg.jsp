<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/10
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns:wb="http://open.weibo.com/wb"><head>
    <script type="text/javascript" async="" src="${pageContext.request.contextPath}/style/js/conversion.js"></script>
    <script src="${pageContext.request.contextPath}/style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
    <style type="text/css"></style>
    <meta content="no-siteapp" http-equiv="Cache-Control">
    <link  media="handheld" rel="alternate">
    <!-- end 云适配 -->
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>基本信息-招聘服务-拉勾网-最专业的互联网招聘平台</title>

    <!-- <div class="web_root"  style="display:none">http://www.lagou.com</div> -->
    <script type="text/javascript">
        var ctx = "http://www.lagou.com";
        console.log(1);
    </script>
    <link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
    <link href="${pageContext.request.contextPath}/style/css/style.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/popup.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery.1.10.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/js/jquery.lib.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/ajaxfileupload.js"></script>
    <script src="${pageContext.request.contextPath}/style/js/additional-methods.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <!--[if lte IE 8]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/excanvas.js"></script>
    <![endif]-->
    <script type="text/javascript">
        var youdao_conv_id = 271546;
    </script>
    <script src="${pageContext.request.contextPath}/style/js/conv.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/style/js/ajaxCross.json" charset="UTF-8"></script></head>
<body>
<div id="body" style="background-color: #5dfffc">
    <div id="header" style="background-color: grey">
    <div class="wrapper">
        <a class="logo" href="#">
            <img width="229" height="43" alt="拉勾招聘-专注互联网招聘" src="${pageContext.request.contextPath}/imgs/logo.png">
        </a>
    </div>
</div><!-- end #header -->
    <div id="container" style="margin-top: 1%">

        <div class="content_mid">
            <dl class="c_section c_section_mid">
                <dt>
                    <h2><em></em>填写公司信息</h2>
                </dt>
                <dd>
                    <form id="stepForm">

                        <h3>公司简称</h3> <!--非必填-->
                        <input type="text" placeholder="请输入公司简称，如:拉勾" value="" name="name" id="name" class="valid">
                        <h3>公司营业执照上传</h3>
                        <div id="logoNo">
                            <span>上传营业执照 大小：小于5M</span>
                            <div class="layui-upload">
                                <input type="file" class="layui-btn layui-btn-normal" id="uploadFile" name="upload" ></input>
                            </div>
                        </div>

                        <h3>所在城市</h3>
                        <input type="text" placeholder="请输入工作城市，如：北京" name="citys" id="citys" style="height: 40px;">

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
                        <input type="text" placeholder="请输入密码" name="pwd" id="pwd" style="height: 40px;">

                        <h3>确认密码</h3>
                        <input type="text" placeholder="再次输入密码" name="pwdAgain" id="pwdAgain" style="height: 40px;">

                        <h3>手机号码</h3>
                        <input type="text" placeholder="请输入手机号，可以用于密码找回" name="telephone" id="telephone" style="height: 40px;">

                        <h3>验证码</h3>
                        <input type="text" placeholder="输入验证码" name="vCode" id="vCode" style="height: 40px;width: 200px">
                        <input type="button" class="layui-btn layui-btn-normal" value="发送验证码">
                        <span style="display:none;" class="error" id="beError"></span>
                        <input type="hidden" id="companyId" name="companyId" value="25927">
                        <input type="hidden" id="companyName" name="companyName" value="福建平潭协创进出口贸易有限公司">
                        <input type="submit" value="注册" id="stepBtn" class="btn_big fr">
                    </form>
                </dd>
            </dl>
        </div>

        <script src="${pageContext.request.contextPath}/style/js/step1.min.js" type="text/javascript"></script>
        <script>
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
        </script>
        <div class="clear"></div>
        <input type="hidden" value="13ae35fedd9e45cdb66fb712318d7369" id="resubmitToken">
        <a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
    </div><!-- end #container -->
</div><!-- end #body -->
<div id="footer">
    <div class="wrapper">
        <a rel="nofollow" target="_blank" href="about.html">联系我们</a>
        <a target="_blank" href="http://www.lagou.com/af/zhaopin.html">互联网公司导航</a>
        <a rel="nofollow" target="_blank" href="http://e.weibo.com/lagou720">拉勾微博</a>
        <a rel="nofollow" href="javascript:void(0)" class="footer_qr">拉勾微信<i></i></a>
        <div class="copyright">&copy;2013-2014 Lagou <a href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action" target="_blank">京ICP备14023790号-2</a></div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/style/js/core.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/style/js/popup.min.js" type="text/javascript"></script>

<!--  -->


<div id="cboxOverlay" style="display: none;"></div>
<div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;">
    <div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div>
        <div id="cboxTopCenter" style="float: left;"></div>
        <div id="cboxTopRight" style="float: left;"></div>
    </div>
        <div style="clear: left;">
            <div id="cboxMiddleLeft" style="float: left;"></div>
            <div id="cboxContent" style="float: left;">
                <div id="cboxTitle" style="float: left;"></div>
                <div id="cboxCurrent" style="float: left;"></div>
                <button type="button" id="cboxPrevious"></button>
                <button type="button" id="cboxNext"></button>
                <button id="cboxSlideshow"></button>
                <div id="cboxLoadingOverlay" style="float: left;"></div>
                <div id="cboxLoadingGraphic" style="float: left;"></div>
            </div>
            <div id="cboxMiddleRight" style="float: left;"></div>
        </div>
        <div style="clear: left;">
            <div id="cboxBottomLeft" style="float: left;"></div>
            <div id="cboxBottomCenter" style="float: left;"></div>
            <div id="cboxBottomRight" style="float: left;"></div>
        </div>
    </div>
    <div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
</div>
</body>
</html>
