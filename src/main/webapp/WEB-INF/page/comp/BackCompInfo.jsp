<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/9
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns:wb="http://open.weibo.com/wb"><head>
    <style>
        .head-input{
            width: 70px;
            height: 70px;
            position: relative;
            top: -70px;
            opacity: 0;
        }
        .display-hide{
            display: none;
        }
        </style>
<%--    <script type="text/javascript" async="" src="${pageContext.request.contextPath}/style/js/conversion.js"></script>--%>
    <script src="${pageContext.request.contextPath}/comp/style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
    <style type="text/css"></style>
    <meta content="no-siteapp" http-equiv="Cache-Control">
    <link  media="handheld" rel="alternate">
    <!-- end 云适配 -->
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">

    <!-- <div class="web_root"  style="display:none">http://www.lagou.com</div> -->
    <script type="text/javascript">
        var ctx = "http://www.lagou.com";
        console.log(1);
    </script>
    <link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
    <link href="${pageContext.request.contextPath}/comp/style/css/style.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/comp/style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/comp/style/css/popup.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/comp/style/js/jquery.1.10.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/comp/style/js/jquery.lib.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/comp/style/js/ajaxfileupload.js"></script>
    <script src="${pageContext.request.contextPath}/comp/style/js/additional-methods.js" type="text/javascript"></script>
    <!--[if lte IE 8]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/comp/style/js/excanvas.js"></script>
    <![endif]-->
    <script type="text/javascript">
        var youdao_conv_id = 271546;
    </script>
    <script src="${pageContext.request.contextPath}/comp/style/js/conv.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/comp/style/js/ajaxCross.json" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vendor.css">--%>

</head>
<body>
<div id="body">

    <div id="container">
        <div class="clearfix">
            <div class="content_l">
                <div class="c_detail">
                    <div style="background-color:#fff;" class="c_logo">

                        <div class="info-flex-item header-upload">
                            <div class="header-box">
                                <div class="header-mask"></div>
                            <c:choose>
                                <c:when test="${not empty comp.logo}">
                                    <img src="${pageContext.request.contextPath}/uploadLogo${comp.logo}" id="headImg" class="header-img" style="width:100%;height: 100%">
                                </c:when>

                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/comp/style/images/logo_default.png" id="headImg" class="header-img" style="width:100%;height: 100%">
                                </c:otherwise>
                            </c:choose>
                                <form id="imgsForm" enctype="multipart/form-data">
                                <input type ="file"  class="head-input" id="uploadFiles" name="uploadFiles"
                                       accept="image/*" />
                                </form>
                                <span style="display: block">点击替换logo</span>
                            </div>
                        </div>
                    </div>

                    <div class="c_box companyName">
<%--                        <h3 title="公司名称" style="margin-left: 20%">公司名称</h3>--%>

<%--                        <em class="unvalid"></em>--%>
<%--                        <span class="valid dn" style="display: none;">拉勾未认证企业</span>--%>
<%--                        <a class="applyC" href="#">认证通过</a>--%>
                        <div class="clear"></div>
                        <h1 title="" style="text-align: center">公司名称</h1>

                        <h1 title="" class="fullname" style="text-align: center">${comp.compName}</h1>

                        <h1 title=""  style="text-align: center">具体地址</h1>

                        <form class="clear editDetail dn" id="editDetailForm" style="display: none;">
                            <input type="text" placeholder="写明公司详细地址，限25字" maxlength="25" value="${comp.address}"  id="compAddress" class="valid">

                            <input type="button" value="保存" id="saveDetail" class="btn_small" onclick="changeAddress()">
                            <a id="cancelDetail" class="btn_cancel_s" >取消</a>
                        </form>

                        <div class="clear oneword" style="display: block;" id="addressDiv">
                            <img width="17" height="15" src="${pageContext.request.contextPath}/comp/style/images/quote_l.png">&nbsp;
                            <h1 class="fullname" id="address" style="display: inline-block;text-align: center">${comp.address}</h1>&nbsp;
                            <img width="17" height="15" src="${pageContext.request.contextPath}/comp/style/images/quote_r.png">
                        </div>

                    </div>
                    <a title="编辑基本信息" class="c_edit" id="editCompanyDetail" href="javascript:void(0);" style="display: block" ></a>
                    <div class="clear"></div>
                </div>

                <div class="c_breakline"></div>

                <div id="coreValue">
                    <div class="profile_wrap">
                        <!--编辑介绍-->
                        <dl class="c_section newIntro dn" style="display: none;" id="valuesComp">
                            <dt>
                                <h2><em></em>公司核心价值</h2>
                            </dt>
                            <dd>
                                <form id="companyValueForm">
                                    <textarea placeholder="请详细描述公司核心价值"  id="newCoreValue"  style="height: 15%">${comp.coreValue}</textarea>
                                    <div class="word_count fr">你可以输入 <span>50</span> 字</div>
                                    <div class="clear"></div>
                                    <a id="delValues" class="btn_small" onclick="changeScor()">确定</a>
                                    <a id="delValue" class="btn_cancel_s" onclick="hiddenValue()">取消</a>
                                </form>
                            </dd>


                        </dl>

                        <!--有介绍-->
                        <dl class="c_section" style="display: block" id="realValue">
                            <dt>
                                <h2><em></em>公司核心价值</h2>
                            </dt>
                            <dd>
                                <div class="c_intro" id="coreValues">${comp.coreValue}</div>
                                <a title="编辑公司介绍" id="editValue" class="c_edit" href="#" onclick="showValue()"></a>
                            </dd>
                        </dl>

                    </div>

                </div><!-- end #Profile -->

                <div class="c_breakline"></div>

                <div id="Profile">
                    <div class="profile_wrap">
                        <!--无介绍 -->
                        <dl class="c_section dn" style="display: none;" id="c1">
                            <dt>
                                <h2><em></em>公司介绍</h2>
                            </dt>
                            <dd>
                                <div class="addnew">
                                    详细公司的发展历程、让求职者更加了解你!<br>
                                    <a id="addIntro" href="javascript:void(0)">+添加公司介绍</a>
                                </div>
                            </dd>
                        </dl>
                        <!--编辑介绍-->
                        <dl class="c_section newIntro dn" style="display: none;" id="c2">
                            <dt>
                                <h2><em></em>公司介绍</h2>
                            </dt>
                            <dd>
                                <form id="companyDesForm">
                                    <textarea placeholder="请分段详细描述公司简介、企业文化等" id="newInfoIntr" class="valid"></textarea>
                                    <div class="word_count fr">你还可以输入 <span>955</span> 字</div>
                                    <div class="clear"></div>
                                    <input type="button" value="保存" id="submitProfile" class="btn_small" onclick="changeInfo()">
                                    <a id="delProfile" class="btn_cancel_s" href="javascript:void(0)">取消</a>
                                </form>
                            </dd>
                        </dl>

                        <!--有介绍-->
                        <dl class="c_section" style="display: block;" id="c3">
                            <dt>
                                <h2><em></em>公司介绍</h2>
                            </dt>
                            <dd>
                                <div class="c_intro" id="infoIntr">${comp.infoIntr}</div>
                                <a title="编辑公司介绍" id="editIntro" class="c_edit" href="javascript:void(0)"></a>
                            </dd>
                        </dl>
                    </div>

                </div><!-- end #Profile -->

                <!--[if IE 7]> <br /> <![endif]-->

                <input type="hidden" value="" name="hasNextPage" id="hasNextPage">
                <input type="hidden" value="" name="pageNo" id="pageNo">
                <input type="hidden" value="" name="pageSize" id="pageSize">
                <div id="flag"></div>
            </div>

            <div class="content_r">
                <div id="Tags">
                    <div id="c_tags_show" class="c_tags solveWrap" style="display: block;">
                        <table>
                            <tbody>
                            <tr>
                                <td>地点</td>
                                <td>${comp.city}</td>
                            </tr>
                            <tr>
                                <td>领域</td>
                                <td>${comp.industrys[0].industryName}   ${comp.industrys[1].industryName}</td>
                            </tr>
                            <tr>
                                <td>邮箱</td>
                                <td>${comp.email}</td>
                            </tr>
                            <tr>
                                <td>规模</td>
                                <td id="scale">${comp.scale}</td>
                            </tr>
                            <tr>
                                <td>主页</td>
                                <td id="homePage"><a target="_blank" href="${comp.homePage}">${comp.homePage}</a></td>
                            </tr>
                            </tbody>
                        </table>
<%--                        <a id="editTags" class="c_edit" href="javascript:void(0)"></a>--%>
                        <a id="editTags" class="c_edit" onclick="showChange1()"></a>
                    </div>
                    <div id="c_tags_edit" class="c_tags editTags dn" style="display: none;">
                        <form id="tagForms">
                            <table>
                                <tbody>
                                <tr>
                                    <td>地点</td>
                                    <td>
                                        <input type="hidden" value="${comp.city}"  class="valid">
                                        <input type="button" style="background:none;cursor:default;border:none !important;" disable="disable" value="${comp.city}"  class="select_tags">
                                    </td>
                                </tr>

                                <tr>
                                    <td>领域</td>
                                    <td>
                                        <input type="hidden" value="${comp.industrys[0].industryName}   ${comp.industrys[1].industryName}" class="valid">
                                        <input type="button" style="background:none;cursor:default;border:none !important;" disable="disable" value="${comp.industrys[0].industryName}   ${comp.industrys[1].industryName}" class="select_tags">
                                    </td>
                                </tr>

                                <tr>
                                    <td>邮箱</td>
                                    <td>
                                        <input type="hidden" value="${comp.email}" class="valid">
                                        <input type="button" style="background:none;cursor:default;border:none !important;" disable="disable" value="${comp.email}" class="select_tags">
                                    </td>
                                </tr>

                                <tr>
                                    <td>规模</td>
                                    <td>
                                        <input type="hidden" value="${comp.scale}" id="companySize" name="companySize" class="valid">
                                        <input type="button" value="${comp.scale}" id="select_sca" class="select_tags">
                                        <div class="selectBox dn" id="box_sca" style="display: none;">
                                            <ul class="reset">
                                                <li <c:if test="${comp.scale}=='少于15人'"> class="current" </c:if>>少于15人</li>
                                                <li <c:if test="${comp.scale}=='15-50人'"> class="current" </c:if>>15-50人</li>
                                                <li <c:if test="${comp.scale}=='50-150人'"> class="current" </c:if>>50-150人</li>
                                                <li <c:if test="${comp.scale}=='150-500人'"> class="current" </c:if>>150-500人</li>
                                                <li <c:if test="${comp.scale}=='500-999人'"> class="current" </c:if>>500-999人</li>
                                                <li <c:if test="${comp.scale}=='1000人以上'"> class="current" </c:if>>1000人以上</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>主页</td>
                                    <td>
                                        <input type="text" placeholder="请输入网址" value="http://www.weimob.com" name="companyUrl" id="companyUrl" class="valid">
                                    </td>
                                </tr>
                                </tbody></table>
                            <input type="hidden" id="comCity" value="${comp.city}">
                            <input type="hidden" id="comInd" value="${comp.industrys[0].industryName}   ${comp.industrys[1].industryName}">
                            <input type="hidden" id="comSize" value="${comp.scale}">
                            <input type="hidden" id="comUrl" value="${comp.homePage}">
                            <input type="button" value="保存" id="submitFeatures" class="btn_small" onclick="sureChange1()">
                            <a id="cancelFeatures" class="btn_cancel_s" onclick="hiddenChange1()" >取消</a>
                            <div class="clear"></div>
                        </form>
                    </div>
                </div><!-- end #Tags -->

                <dl class="c_section c_stages">
                    <dt>
                        <h2><em></em>融资阶段</h2>
                        <a title="编辑融资阶段" class="c_edit" id="btn3" onclick="show2()"></a>
                    </dt>
                    <dd>
                        <ul class="reset stageshow" id="s1">
                            <li>目前阶段：<span class="c5" id="finanStage">${comp.finanStage}</span></li>
                        </ul>
                        <form class="dn" id="stageform" >
                            <div class="stageSelect" id="s2">
                                <label>目前阶段</label>
                                <input type="hidden" value="${comp.finanStage}" id="financeStage" name="financeStage" class="valid">
                                <input type="button" value="${comp.finanStage}" id="select_fin" class="select_tags_short fl">
                                <div class="selectBoxShort dn" id="box_fin" style="display: none;">
                                    <ul class="reset">
                                        <li <c:if test="${comp.finanStage}=='未融资'"> class="current" </c:if>>未融资</li>
                                        <li <c:if test="${comp.finanStage}=='天使轮'"> class="current" </c:if>>天使轮</li>
                                        <li <c:if test="${comp.finanStage}=='A轮'"> class="current" </c:if>>A轮</li>
                                        <li <c:if test="${comp.finanStage}=='B轮'"> class="current" </c:if>>B轮</li>
                                        <li <c:if test="${comp.finanStage}=='C轮'"> class="current" </c:if>>C轮</li>
                                        <li <c:if test="${comp.finanStage}=='D轮及以上'"> class="current" </c:if>>D轮及以上</li>
                                        <li <c:if test="${comp.finanStage}=='上市公司'"> class="current" </c:if>>上市公司</li>
                                    </ul>
                                </div>
                            </div>

                            <input type="submit" value="保存" class="btn_small" id="btn1" onclick="changeFin()">
                            <a class="btn_cancel_s" onclick="hidden2()" id="btn2">取消</a>
                            <div class="clear"></div>

                        </form>
                    </dd>
                </dl><!-- end .c_stages -->


                <dl class="c_section ">
                    <dt>
                        <h2><em></em>公司产品</h2>
                        <a title="产品介绍编辑" class="c_edit" href="#" onclick="showProduct()"></a>
                    </dt>
                    <dd>
                        <ul class="reset stageshow" id="u1">
                            <div class="c_intro" id="product">${comp.product}</div>
                        </ul>
                        <form id="products" style="display:none;">
                            <textarea placeholder="请简短描述该产品定位、产品特色、用户群体等" maxlength="500" class="s_textarea valid"
                                      name="productProfile" style="width: 100%" id="productProfile">${comp.product}</textarea>
                            <input type="button" value="保存" class="btn_small" onclick="changeProduct()">
                            <a id="cancelProducts" class="btn_cancel_s" onclick="hiddenProduct()">取消</a>
                            <div class="clear"></div>

                        </form>
                    </dd>
                </dl>
        </div>

        <!------------------------------------- end ----------------------------------------->

        <script src="${pageContext.request.contextPath}/comp/style/js/company.min.js" type="text/javascript"></script>
        <script>
            var avatar = {};
            avatar.uploadComplate = function( data ){
                var result = eval('('+ data +')');
                if(result.success){
                    jQuery('#logoShow img').attr("src",ctx+ '/'+result.content);
                    jQuery.colorbox.close();
                }
            };
        </script>
        <div class="clear"></div>
        <input type="hidden" value="af5b64a9520a4b7da6287ff3400dde11" id="resubmitToken">
        <a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
    </div><!-- end #container -->
</div><!-- end #body -->
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
<script src="${pageContext.request.contextPath}/comp/style/js/core.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/comp/style/js/popup.min.js" type="text/javascript"></script>

<!--  -->


<div id="cboxOverlay" style="display: none;"></div>
<div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;">
    <div id="cboxWrapper">
        <div id="cboxTopLeft" style="float: left;"></div>
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

<script>
    var path = $("#path").val();
    var layer;
    layui.use('layer',function () {
        layer = layui.layer;
    })
    function showProduct() {
        $("#products").css("display","block");
        $("#u1").css("display","none");
        $("#productProfile").attr("readonly",false);
    }

    function hiddenProduct() {
        $("#products").css("display","none");
        $("#u1").css("display","block");
        $("#productProfile").attr("readonly",true);
    }

    function showValue() {
        $("#valuesComp").css("display","block");
        $("#realValue").css("display","none");
    }

    function hiddenValue() {
        $("#valuesComp").css("display","none");
        $("#realValue").css("display","block");
    }

    function showChange1() {
        $("#c_tags_show").css("display","none");
        $("#c_tags_edit").css("display","block");
    }

    function hiddenChange1() {
        $("#c_tags_show").css("display","block");
        $("#c_tags_edit").css("display","none");
    }

    function hidden2() {
        $("#s1").css("display","block");
        $("#s2").css("display","none");
        $("#btn1").css("display","none");
        $("#btn2").css("display","none");
        $("#btn3").css("display","block");
    }

    function show2() {
        $("#stageform").css("display","block");
        $("#s1").css("display","none");
        $("#s2").css("display","block");
        $("#btn1").css("display","block");
        $("#btn2").css("display","block");
    }

    function sureChange1() {
        var homePage = $("#companyUrl").val();
        var scale = $("#companySize").val();
        $.ajax({
            url:path+"/rec/changeCompInfo",
            data:"homePage="+homePage+"&scale="+scale,
            type:"post",
            typeData:"text",
            beforeSend:function () {
                if(homePage.length==0){
                    layer.msg("主页地址未填写");
                    return false;
                }
                if(homePage.length>=40){
                    layer.msg("主页地址不能超过40字符");
                    return false;
                }
            },
            success:function (data) {
                hiddenChange1()
                if(data=='1'){
                    layer.alert("修改成功");
                    $("#scale").text(scale);
                    $("#homePage").text(homePage);

                    $("#companySize").val(scale);
                    $("#companyUrl").val(homePage);

                    $("#select_sca").val(scale);
                    $("#comSize").val(scale);

                    $("#comUrl").val(homePage);


                }else{
                    layer.alert("网络繁忙，修改失败");
                }
            }
        })
    }

    function changeScor() {
        var coreValue = $("#newCoreValue").val();
        $.ajax({
            url:path+"/rec/changeCompInfo",
            data:"coreValue="+coreValue,
            type:"post",
            typeData:"text",
            beforeSend:function () {
                if(homePage.length==0){
                    layer.msg("核心价值未填写");
                    return false;
                }
                if(homePage.length>=40){
                    layer.msg("核心价值不能超过50字符");
                    return false;
                }
            },
            success:function (data) {
                hiddenValue();
                if(data=='1'){
                    layer.alert("修改成功");
                    $("#newCoreValue").text(coreValue);

                }else{
                    layer.alert("网络繁忙，修改失败");
                }
            }
        })
    }
    //修改公司信息
    function changeInfo() {
        var infoIntr = $("#newInfoIntr").val();
        $.ajax({
            url:path+"/rec/changeCompInfo",
            data:"infoIntr="+infoIntr,
            type:"post",
            typeData:"text",
            beforeSend:function () {
                if(infoIntr.length==0){
                    layer.msg("公司简介未填写");
                    return false;
                }
                if(homePage.length>=200){
                    layer.msg("公司简介不能超过200字符");
                    return false;
                }
            },
            success:function (data) {
                if(data=='1'){
                    layer.alert("修改成功");
                    $("#infoIntr").text(infoIntr);
                }else{
                    layer.alert("网络繁忙，修改失败");
                }

                $("#c2").css("display","none");
                $("#c3").css("display","block");
            }
        })
    }
    //修改公司地址
    function changeAddress() {

        var address = $("#compAddress").val();
        $.ajax({
            url:path+"/rec/changeCompInfo",
            data:"address="+address,
            type:"post",
            typeData:"text",
            beforeSend:function () {
                if(address.length==0){
                    layer.msg("公司地址未填写");
                    return false;
                }
                if(address.length>=25){
                    layer.msg("公司地址不能超过25字符");
                    return false;
                }
            },
            success:function (data) {
                if(data=='1'){
                    layer.alert("修改成功");
                    $("#address").text(address);
                }else{
                    layer.alert("网络繁忙，修改失败");
                }
                $("#addressDiv").css("display","block");
                $("#editDetailForm").css("display","none");
                $("#editCompanyDetail").css("display","block");
            }
        })
    }

    function changeFin() {
        var finanStage = $("#financeStage").val();
        alert(finanStage)
        $.ajax({
            url:path+"/rec/changeCompInfo",
            data:"finanStage="+finanStage,
            type:"post",
            typeData:"text",
            success:function (data) {
                if(data=='1'){
                    layer.alert("修改成功");
                    $("#finanStage").text(finanStage);
                }else{
                    layer.alert("网络繁忙，修改失败");
                }
                hidden2();
            }
        })
    }

    function changeProduct() {
        var product = $("#productProfile").val();
        $.ajax({
            url:path+"/rec/changeCompInfo",
            data:"product="+product,
            type:"post",
            typeData:"text",
            beforeSend:function () {
                if(infoIntr.length==0){
                    layer.msg("产品讲述未填写");
                    return false;
                }
                if(homePage.length>=100){
                    layer.msg("产品讲述不能超过100字符");
                    return false;
                }
            },
            success:function (data) {
                if(data=='1'){
                    layer.alert("修改成功");
                    $("#infoIntr").text(infoIntr);
                }else{
                    layer.alert("网络繁忙，修改失败");
                }

                hiddenProduct();
                $("#industry").text(product);
            }
        })
    }

    // function selectFile() {
    //
    //     let files = event.target.files;
    //     if (files.length === 0) return false;
    //     let reader = new FileReader();
    //     reader.readAsDataURL(files[0]);
    //     reader.onloadend = () => {
    //         $("#headImg").attr("src", reader.result)
    //     }
    // }
    $('input[type=file]').each(function()
    {
        var max_size=1024*1024*5;
        $(this).change(function(evt)
        {
            var finput = $(this);
            var files = evt.target.files; // 获得文件对象
            var output = [];
            for (var i = 0, f; f = files[i]; i++)
            {  //检查文件大小
                if(f.size > max_size)
                {
                    layer.alert("上传的图片不能超过5M!");
                    $(this).val('');
                    return false;
                }else{
                    var fName = $("#uploadFiles").val();
                    let files = event.target.files;

                    var form = new FormData(document.getElementById("imgsForm"))
                    $.ajax({
                        url:path+"/rec/uploadLogo",
                        data:form,
                        processData:false,
                        contentType:false,
                        type:"post",
                        beforeSend:function(){
                            if (files.length === 0) return false;
                            return true;

                        },
                        success:function (info) {
                            if(info=='1'){
                                layer.msg('上传成功')
                                let reader = new FileReader();
                                reader.readAsDataURL(files[0]);
                                reader.onloadend = () => {
                                    $("#headImg").attr("src", reader.result)
                                }
                            }else{
                                layer.msg('系统繁忙，上传失败')
                            }
                        },
                    })

                }
            }
        });
    });
</script>
</html>
