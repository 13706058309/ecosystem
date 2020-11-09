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
    <script type="text/javascript" async="" src="${pageContext.request.contextPath}/style/js/conversion.js"></script>
    <script src="${pageContext.request.contextPath}/style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
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
    <link href="${pageContext.request.contextPath}/style/css/style.css" type="text/css" rel="stylesheet">
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
    <script src="${pageContext.request.contextPath}/style/js/ajaxCross.json" charset="UTF-8"></script></head>
<body>
<div id="body">

    <div id="container">
        <!-- <script src="style/js/swfobject_modified.js" type="text/javascript"></script> -->
        <div class="clearfix">

            <div class="content_l">
                <div class="c_detail">
                    <div style="background-color:#fff;" class="c_logo">
                        <a title="上传公司LOGO" id="logoShow" class="inline cboxElement" href="#logoUploader">
                            <img width="190" height="190" alt="公司logo" src="${pageContext.request.contextPath}/style/images/logo_default.png">

                            <span>更换公司图片<br>190px*190px 小于5M</span>
                        </a>
                    </div>

                    <div class="c_box companyName">
                        <h2 title="公司名称">公司名称</h2>

                        <em class="unvalid"></em>
                        <span class="valid dn" style="display: none;">拉勾未认证企业</span>
                        <a class="applyC" href="#">认证通过</a>
                        <div class="clear"></div>

                        <h1 title="福建平潭协创进出口贸易有限公司" class="fullname">福建平潭协创进出口贸易有限公司</h1>

                        <form class="clear editDetail dn" id="editDetailForm" style="display: none;">
                            <input type="text" placeholder="写明公司详细地址，限25字" maxlength="50" value="" name="companyFeatures" id="companyFeatures" class="valid"><span for="companyFeatures" generated="true" class="error" style="display: none;">请输入5-50字的一句话介绍</span>
                            <input type="hidden" value="25927" id="companyId" name="companyId">
                            <input type="submit" value="保存" id="saveDetail" class="btn_small">
                            <a id="cancelDetail" class="btn_cancel_s" >取消</a>
                        </form>

                        <div class="clear oneword" style="display: block;"><img width="17" height="15" src="${pageContext.request.contextPath}/style/images/quote_l.png">&nbsp; <span>请输入公司地址</span> &nbsp;<img width="17" height="15" src="${pageContext.request.contextPath}/style/images/quote_r.png"></div>
                        <h3 class="dn">已选择标签</h3>
                        <ul style="overflow:auto" id="hasLabels" class="reset clearfix">
                            <li><span>年终分红</span></li>
                            <li><span>五险一金</span></li>
                            <li><span>弹性工作</span></li>
                            <li><span>岗位晋升</span></li>
                            <li class="link">编辑</li>
                        </ul>
                        <div class="dn" id="addLabels">
                            <a id="changeLabels" class="change" href="javascript:void(0)">换一换</a>
                            <input type="hidden" value="1" id="labelPageNo">
                            <input type="submit" value="贴上" class="fr" id="add_label">
                            <input type="text" placeholder="添加自定义标签" name="label" id="label" class="label_form fr">
                            <div class="clear"></div>
                            <ul class="reset clearfix"> </ul>
                            <a id="saveLabels" class="btn_small" href="javascript:void(0)">保存</a>
                            <a id="cancelLabels" class="btn_cancel_s" href="javascript:void(0)">取消</a>
                        </div>
                    </div>
                    <a title="编辑基本信息" class="c_edit" id="editCompanyDetail" href="javascript:void(0);" style="display: block;"></a>
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
                                    <textarea placeholder="请分段详细描述公司简介、企业文化等" name="companyProfile" id="newValue" class="valid" style="height: 15%">法嘎嘎法嘎嘎</textarea>
                                    <div class="word_count fr">你还可以输入 <span>955</span> 字</div>
                                    <div class="clear"></div>
                                    <input type="submit" value="保存" id="submitValue" class="btn_small">
                                    <a id="delValue" class="btn_cancel_s" onclick="hiddenValue()">取消</a>
                                </form>
                            </dd>
                        </dl>

                        <!--有介绍-->
                        <dl class="c_section" style="display: block;" id="realValue">
                            <dt>
                                <h2><em></em>公司核心价值</h2>
                            </dt>
                            <dd>
                                <div class="c_intro">afdsafs</div>
                                <a title="编辑公司介绍" id="editValue" class="c_edit" href="#" onclick="showValue()"></a>
                            </dd>
                        </dl>
                    </div>

                </div><!-- end #Profile -->

                <div class="c_breakline"></div>

                <div id="Profile">
                    <div class="profile_wrap">
                        <!--无介绍 -->
                        <dl class="c_section dn" style="display: none;">
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
                        <dl class="c_section newIntro dn" style="display: none;">
                            <dt>
                                <h2><em></em>公司介绍</h2>
                            </dt>
                            <dd>
                                <form id="companyDesForm">
                                    <textarea placeholder="请分段详细描述公司简介、企业文化等" name="companyProfile" id="companyProfile" class="valid">该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎</textarea>
                                    <div class="word_count fr">你还可以输入 <span>955</span> 字</div>
                                    <div class="clear"></div>
                                    <input type="submit" value="保存" id="submitProfile" class="btn_small">
                                    <a id="delProfile" class="btn_cancel_s" href="javascript:void(0)">取消</a>
                                </form>
                            </dd>
                        </dl>

                        <!--有介绍-->
                        <dl class="c_section" style="display: block;">
                            <dt>
                                <h2><em></em>公司介绍</h2>
                            </dt>
                            <dd>
                                <div class="c_intro">afdsafs</div>
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
            </div>	<!-- end .content_l -->

            <div class="content_r">
                <div id="Tags">
                    <div id="c_tags_show" class="c_tags solveWrap" style="display: block;">
                        <table><tbody><tr><td>地点</td><td>上海</td></tr><tr><td>领域</td><td>移动互联网</td></tr><tr><td>规模</td><td>150-500人</td></tr><tr><td>主页</td><td><a target="_blank" href="http://www.zmtpost.com">http://www.zmtpost.com</a></td></tr></tbody></table>
                        <a id="editTags" class="c_edit" href="javascript:void(0)"></a>
                    </div>
                    <div id="c_tags_edit" class="c_tags editTags dn" style="display: none;">
                        <form id="tagForms">
                            <table>
                                <tbody><tr>
                                    <td>地点</td>
                                    <td>
                                        <input type="text" placeholder="请输入地点" value="上海" name="city" id="city" class="valid">
                                    </td>
                                </tr>
                                <tr>
                                    <td>领域</td><!-- 支持多选 -->
                                    <td>
                                        <input type="hidden" value="移动互联网" id="industryField" name="industryField" class="valid">
                                        <input type="button" style="background:none;cursor:default;border:none !important;" disable="disable" value="移动互联网" id="select_ind" class="select_tags">

                                    </td>
                                </tr>
                                <tr>
                                    <td>规模</td>
                                    <td>
                                        <input type="hidden" value="150-500人" id="companySize" name="companySize" class="valid">
                                        <input type="button" value="150-500人" id="select_sca" class="select_tags">
                                        <div class="selectBox dn" id="box_sca" style="display: none;">
                                            <ul class="reset">
                                                <li>少于15人</li>
                                                <li>15-50人</li>
                                                <li>50-150人</li>
                                                <li class="current">150-500人</li>
                                                <li>500-2000人</li>
                                                <li>2000人以上</li>
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
                            <input type="hidden" id="comCity" value="上海">
                            <input type="hidden" id="comInd" value="移动互联网">
                            <input type="hidden" id="comSize" value="150-500人">
                            <input type="hidden" id="comUrl" value="http://www.zmtpost.com">
                            <input type="submit" value="保存" id="submitFeatures" class="btn_small">
                            <a id="cancelFeatures" class="btn_cancel_s" href="javascript:void(0)">取消</a>
                            <div class="clear"></div>
                        </form>
                    </div>
                </div><!-- end #Tags -->

                <dl class="c_section c_stages">
                    <dt>
                        <h2><em></em>融资阶段</h2>
                        <a title="编辑融资阶段" class="c_edit" href="javascript:void(0)"></a>
                    </dt>
                    <dd>
                        <ul class="reset stageshow">
                            <li>目前阶段：<span class="c5">天使轮</span></li>
                        </ul>
                        <form class="dn" id="stageform">
                            <div class="stageSelect">
                                <label>目前阶段</label>
                                <input type="hidden" value="天使轮" id="financeStage" name="financeStage">
                                <input type="button" value="天使轮" id="select_fin" class="select_tags_short fl">
                                <div class="selectBoxShort dn" id="box_fin" style="display: none;">
                                    <ul class="reset">
                                        <li>未融资</li>
                                        <li class="current">天使轮</li>
                                        <li>A轮</li>
                                        <li>B轮</li>
                                        <li>C轮</li>
                                        <li>D轮及以上</li>
                                        <li>上市公司</li>
                                    </ul>
                                </div>
                            </div>

                            <input type="submit" value="保存" class="btn_small">
                            <a id="cancelStages" class="btn_cancel_s" href="javascript:void(0)">取消</a>
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
                        <ul class="reset stageshow">
                            <textarea placeholder="请简短描述该产品定位、产品特色、用户群体等" maxlength="500" value="" class="s_textarea valid" name="productProfile" style="width: 100%"></textarea>
                        </ul>
                        <form id="products" style="display:none;">

                            <input type="submit" value="保存" class="btn_small">
                            <a id="cancelProducts" class="btn_cancel_s" >取消</a>
                            <div class="clear"></div>

                        </form>
                    </dd>
                </dl>
        </div>

        <!-------------------------------------弹窗lightbox  ----------------------------------------->
        <div style="display:none;">
            <div style="width:650px;height:470px;" class="popup" id="logoUploader">
                <object width="650" height="470" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="FlashID">
                    <param value="../../flash/avatar.swf?url=http://www.lagou.com/cd/saveProfileLogo.json" name="movie">
                    <param value="high" name="quality">
                    <param value="opaque" name="wmode">
                    <param value="111.0.0.0" name="swfversion">
                    <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
                    <param value="../../Scripts/expressInstall.swf" name="expressinstall">
                    <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
                    <!--[if !IE]>-->
                    <object width="650" height="470" data="../../flash/avatar.swf?url=http://www.lagou.com/cd/saveProfileLogo.json" type="application/x-shockwave-flash">
                        <!--<![endif]-->
                        <param value="high" name="quality">
                        <param value="opaque" name="wmode">
                        <param value="111.0.0.0" name="swfversion">
                        <param value="../../Scripts/expressInstall.swf" name="expressinstall">
                        <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
                        <div>
                            <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
                            <p><a href="http://www.adobe.com/go/getflashplayer"><img width="112" height="33" src="style/images/get_flash_player.gif" alt="获取 Adobe Flash Player"></a></p>
                        </div>
                        <!--[if !IE]>-->
                    </object>
                    <!--<![endif]-->
                </object>
            </div><!-- #logoUploader -->
        </div>
        <!------------------------------------- end ----------------------------------------->

        <script src="${pageContext.request.contextPath}/style/js/company.min.js" type="text/javascript"></script>
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

<script src="${pageContext.request.contextPath}/style/js/core.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/style/js/popup.min.js" type="text/javascript"></script>

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
    function showProduct() {
        $("#products").css("display","block");
    }

    function showValue() {
        $("#valuesComp").css("display","block");
        $("#realValue").css("display","none");
    }

    function hiddenValue() {
        $("#valuesComp").css("display","none");
        $("#realValue").css("display","block");
    }
</script>
</html>
