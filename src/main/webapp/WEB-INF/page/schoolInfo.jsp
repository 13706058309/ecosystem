<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <script src="${pageContext.request.contextPath}/style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery.1.10.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/js/jquery.lib.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/ajaxfileupload.js"></script>
    <script src="${pageContext.request.contextPath}/style/js/additional-methods.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/excanvas.js"></script>
    <script src="${pageContext.request.contextPath}/style/js/conv.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/style/js/ajaxCross.json" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/style/js/core.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/style/js/popup.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/style/js/company.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/style/css/style.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/popup.css" type="text/css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body>
<div id="body" style="margin-top:100px;margin-left: 300px">
    <div id="container">
        <div class="clearfix">
            <div class="content_l">
                <span style="margin-left: 350px">点击图片可替换</span>
                <div class="c_detail"><div style="margin-left: 300px;width: 200px;" class="c_logo">

                    <div class="info-flex-item header-upload">

                        <div class="header-box">

                            <div class="header-mask" ></div>

                            <c:choose>
                                <c:when test="${not empty shool.logo}">
                                    <img src="${pageContext.request.contextPath}/uploadLogo${shool.logo}" id="photoEcho" class="header-img" style="width: 100%;height: 100%">
                                </c:when>

                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/style/images/logo_default.png" id="photoEcho" class="header-img" style="width:100%;height: 100%">
                                </c:otherwise>
                            </c:choose>
                            <form id="photoUpLoad" enctype="multipart/form-data">
                                <input type ="file"  class="head-input" id="photo" name="photo" style="width: 800px" accept="image/*" />
                            </form>

                        </div>
                    </div>
                </div>
                    <div class="c_box companyName">
                    </div>
                </div>

                <div id="coreValueiug" >
                    <div class="profile_wrap">
                        <dl class="c_section newIntro dn" style="display: none;" id="compName1">
                            <dt>
                                <h2 class=" layui-icon layui-icon-flag">学校名称</h2>
                            </dt>
                            <dd>
                                <form id="companyValueForm">
                                    <textarea   id="newCompName"  style="height: 15%">${shool.compName}</textarea>
                                    <div class="clear"></div>
                                    <a id="delValues" class="btn_small" onclick="change1()">确定</a>
                                    <a id="delValue" class="btn_cancel_s" onclick="hidden1()">取消</a>
                                </form>
                            </dd>
                        </dl>
                        <dl class="c_section" style="display: block;width: 800px;" id="compName2">
                            <dt >
                                <h2 class=" layui-icon layui-icon-flag" >学校名称</h2>
                            </dt>
                            <dd>
                                <div class="c_intro" id="coreValues" style="text-align: center">${shool.compName}</div>
                                <a title="编辑" id="editValue" class="c_edit"  onclick="show1()"></a>
                            </dd>
                        </dl>
                    </div>
                </div>

                <div id="coreValue2123">
                    <div class="profile_wrap">
                        <dl class="c_section newIntro dn" style="display: none;" id="infoIntr1">
                            <dt>
                                <h2 class="layui-icon layui-icon-form">简介</h2>
                            </dt>
                            <dd>
                                <form id="companyValueForm2">
                                    <textarea   id="infoIntr"  style="height: 15%">${shool.infoIntr}</textarea>
                                    <div class="clear"></div>
                                    <a id="delValues2" class="btn_small" onclick="change3()">确定</a>
                                    <a id="delValue2" class="btn_cancel_s" onclick="hidden3()">取消</a>
                                </form>
                            </dd>
                        </dl>
                        <dl class="c_section" style="display: block;width: 800px;" id="infoIntr2">
                            <dt>
                                <h2 class="layui-icon layui-icon-form">简介</h2>
                            </dt>
                            <dd>
                                <div class="c_intro" id="coreValues2" >${shool.infoIntr}</div>
                                <a title="编辑" id="editValue2" class="c_edit"  onclick="show3()"></a>
                            </dd>
                        </dl>
                    </div>
                </div>
                <div id="coreValue3">
                    <div class="profile_wrap">
                        <dl class="c_section newIntro dn" style="display: none;" id="coreValue1">
                            <dt>
                                <h2 class="layui-icon layui-icon-read">校训</h2>
                            </dt>
                            <dd>
                                <form id="companyValueForm3">
                                    <textarea   id="coreValue"  style="height: 15%">${shool.coreValue}</textarea>
                                    <div class="clear"></div>
                                    <a id="delValues3" class="btn_small" onclick="change4()">确定</a>
                                    <a id="delValue3" class="btn_cancel_s" onclick="hidden4()">取消</a>
                                </form>
                            </dd>
                        </dl>
                        <dl class="c_section" style="display: block;width: 800px;" id="coreValue2">
                            <dt  >
                                <h2 class="layui-icon layui-icon-read">校训</h2>
                            </dt>
                            <dd>
                                <div class="c_intro" id="coreValues3" style="width: 800px;text-align: center">${shool.coreValue}</div>
                                <a title="编辑" id="editValue3" class="c_edit"  onclick="show4()"></a>
                            </dd>
                        </dl>
                    </div>
                </div>
                <div id="coreValue11">
                    <div class="profile_wrap">
                        <dl class="c_section newIntro dn" style="display: none;" id="address1">
                            <dt>
                                <h2 class="layui-icon layui-icon-location">地址</h2>
                            </dt>
                            <dd>
                                <form id="companyValueForm11">
                                    <textarea   id="address"  style="height: 15%">${shool.address}</textarea>
                                    <div class="clear"></div>
                                    <a id="delValues11" class="btn_small" onclick="change5()">确定</a>
                                    <a id="delValue11" class="btn_cancel_s" onclick="hidden5()">取消</a>
                                </form>
                            </dd>
                        </dl>
                        <dl class="c_section" style="display: block;width: 800px;" id="address2">
                            <dt>
                                <h2 class="layui-icon layui-icon-location">地址</h2>
                            </dt>
                            <dd>
                                <div class="c_intro" id="coreValues11" style="width: 800px;text-align: center">${shool.address}</div>
                                <a title="编辑" id="editValue11" class="c_edit"  onclick="show5()"></a>
                            </dd>
                        </dl>
                    </div>
                </div>
                <div id="coreValue21">
                    <div class="profile_wrap">
                        <dl class="c_section newIntro dn" style="display: none;" id="contactInfo1">
                            <dt>
                                <h2 class="layui-icon  layui-icon-cellphone">联系方式</h2>
                            </dt>
                            <dd>
                                <form id="companyValueForm21">
                                    <textarea   id="contactInfo"  style="height: 15%">${shool.contactInfo}</textarea>
                                    <div class="clear"></div>
                                    <a id="delValues21" class="btn_small" onclick="change6()">确定</a>
                                    <a id="delValue21" class="btn_cancel_s" onclick="hidden6()">取消</a>
                                </form>
                            </dd>
                        </dl>
                        <dl class="c_section" style="display: block;width: 800px;" id="contactInfo2">
                            <dt>
                                <h2 class="layui-icon  layui-icon-cellphone" >联系方式</h2>
                            </dt>
                            <dd>
                                <div class="c_intro" id="coreValues21" style="width: 800px;text-align: center">${shool.contactInfo}</div>
                                <a title="编辑" id="editValue21" class="c_edit" onclick="show6()"></a>
                            </dd>
                        </dl>
                    </div>
                </div>
                <div id="coreValue211">
                    <div class="profile_wrap">
                        <dl class="c_section newIntro dn" style="display: none;" id="email1">
                            <dt>
                                <h2 class=" layui-icon layui-icon-email">eMail</h2>
                            </dt>
                            <dd>
                                <form id="companyValueForm211">
                                    <textarea   id="email"  style="height: 15%">${shool.email}</textarea>
                                    <div class="clear"></div>
                                    <a id="delValues211" class="btn_small" onclick="change7()">确定</a>
                                    <a id="delValue211" class="btn_cancel_s" onclick="hidden7()">取消</a>
                                </form>
                            </dd>
                        </dl>
                        <dl class="c_section" style="display: block;width: 800px;" id="email2">
                            <dt>
                                <h2 class=" layui-icon layui-icon-email">eMail</h2>
                            </dt>
                            <dd>
                                <div class="c_intro" id="coreValues211" style="width: 800px;text-align: center">${shool.email}</div>
                                <a title="编辑" id="editValue211" class="c_edit"  onclick="show7()"></a>
                            </dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
</body>
<script>
    var path = $("#path").val();
    var layer;
    layui.use('layer',function () {
        layer = layui.layer;
    })
    function show1() {
        $("#compName1").css("display","block");
        $("#compName2").css("display","none");
    }

    function hidden1() {
        $("#compName1").css("display","none");
        $("#compName2").css("display","block");
    }
    function show2() {
        $("#bUserName1").css("display","block");
        $("#bUserName2").css("display","none");
    }

    function hidden2() {
        $("#bUserName1").css("display","none");
        $("#bUserName2").css("display","block");
    }
    function show3() {
        $("#infoIntr1").css("display","block");
        $("#infoIntr2").css("display","none");
    }

    function hidden3() {
        $("#infoIntr1").css("display","none");
        $("#infoIntr2").css("display","block");
    }
    function show4() {
        $("#coreValue1").css("display","block");
        $("#coreValue2").css("display","none");
    }

    function hidden4() {
        $("#coreValue1").css("display","none");
        $("#coreValue2").css("display","block");
    }
    function show5() {
        $("#address1").css("display","block");
        $("#address2").css("display","none");
    }

    function hidden5() {
        $("#address1").css("display","none");
        $("#address2").css("display","block");
    }
    function show6() {
        $("#contactInfo1").css("display","block");
        $("#contactInfo2").css("display","none");
    }

    function hidden6() {
        $("#contactInfo1").css("display","none");
        $("#contactInfo2").css("display","block");
    }
    function show7() {
        $("#email1").css("display","block");
        $("#email2").css("display","none");
    }

    function hidden7() {
        $("#email1").css("display","none");
        $("#email2").css("display","block");
    }
    $("#photo").change(function(){
        var file = this.files[0];
        console.log(file);
        if(!file){
            return false;
        }

        var maxSize = 1024*5 ; //图片最大KB
        if(!/(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file.type)){
            top.alertLocal("请上传gif,jpeg,jpg,png格式的图片！");
            return false;
        }
        if(file.size > maxSize* 1024){
            top.alertLocal("请上传"+5+"M以下的图片");
            return false;
        }
        var photos = $("#photo").val();
        var form = new FormData(document.getElementById("photoUpLoad"))
        $.ajax({
            url:path+"/rec/uploadLogo",
            data:form,
            processData:false,
            contentType:false,
            type:"post",
            beforeSend:function(){
                if (photos.length === 0) return false;
                return true;

            },
            success:function (info) {
                if(info=='1'){
                    layer.msg('上传成功');
                    var objUrl = getObjectURL(file) ;
                    if (objUrl) {
                        $("#photoEcho").attr("src", objUrl) ;
                    }
                }else{
                    layer.msg('系统繁忙，上传失败')
                }
            },
        })

    }) ;

    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null ;
        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }




    function change1() {
        var newCompName = $("#newCompName").val().trim();
        $.ajax({
            url:path+"/talent/changeSchoolInfo",
            data:"newCompName="+newCompName,
            type:"post",
            typeData:"text",
            beforeSend:function () {
                if(newCompName.length==0){
                    layer.msg("请填写完整");
                    return false;
                }
                if(newCompName.length>15){
                    layer.msg("学校名称限制15字");
                    return false;
                }
                if(!( /^[\u4e00-\u9fa5\\w]+$/.test(newCompName))){
                    layer.msg("学校名称只能是汉字");
                    return false;
                }
                return true;
            },
            success:function (data) {
                if(data=='1'){
                    layer.msg("修改成功",{
                        time:1000,
                        end:function () {
                           location.reload();
                        }
                    })

                }
            }
        })
    }

    function change3() {
        var infoIntr = $("#infoIntr").val();
        $.ajax({
            url:path+"/talent/changeSchoolInfo",
            data:"infoIntr="+infoIntr,
            type:"post",
            typeData:"text",
            beforeSend:function () {
                if(infoIntr.length==0){
                    layer.msg("请填写完整");
                    return false;
                }
                if(infoIntr.length>200){
                    layer.msg("简介限制200字");
                    return false;
                }
                return true;
            },
            success:function (data) {
                if(data=='1'){
                    layer.msg("修改成功",{
                        time:1000,
                        end:function () {
                            location.reload();
                        }
                    })

                }
            }
        })
    }
    function change4() {
        var coreValue = $("#coreValue").val();
        $.ajax({
            url:path+"/talent/changeSchoolInfo",
            data:"coreValue="+coreValue,
            type:"post",
            typeData:"text",
            beforeSend:function () {
                if(coreValue.length==0){
                    layer.msg("请填写完整");
                    return false;
                }
                if(coreValue.length>30){
                    layer.msg("校训限制30字");
                    return false;
                }
                return true;
            },
            success:function (data) {
                if(data=='1'){
                    layer.msg("修改成功",{
                        time:1000,
                        end:function () {
                            location.reload();
                        }
                    })

                }
            }
        })
    }
    function change5() {
        var address = $("#address").val();
        $.ajax({
            url:path+"/talent/changeSchoolInfo",
            data:"address="+address,
            type:"post",
            typeData:"text",
            beforeSend:function () {
                if(address.length==0){
                    layer.msg("请填写完整");
                    return false;
                }
                if(address.length>30){
                    layer.msg("地址限制30字");
                    return false;
                }
                return true;
            },
            success:function (data) {
                if(data=='1'){
                    layer.msg("修改成功",{
                        time:1000,
                        end:function () {
                            location.reload();
                        }
                    })

                }
            }
        })
    }
    function change6() {
        var contactInfo = $("#contactInfo").val();
        $.ajax({
            url:path+"/talent/changeSchoolInfo",
            data:"contactInfo="+contactInfo,
            type:"post",
            typeData:"text",
            beforeSend:function () {
                if(contactInfo.length==0){
                    layer.msg("请填写完整");
                    return false;
                }
                if(contactInfo.length>12){
                    layer.msg("联系方式限制12字");
                    return false;
                }
                if(!(/^((\d{11})|(\d{7,8})|(\d{4}|\d{3})-(\d{7,8}))$/.test(contactInfo))){
                    layer.msg("格式错误");
                    return false;
                }
                return true;
            },
            success:function (data) {
                if(data=='1'){
                    layer.msg("修改成功",{
                        time:1000,
                        end:function () {
                            location.reload();
                        }
                    })

                }
            }
        })
    }
    function change7() {
        var email = $("#email").val();
        $.ajax({
            url:path+"/talent/changeSchoolInfo",
            data:"email="+email,
            type:"post",
            typeData:"text",
            beforeSend:function () {
                if(email.length==0){
                    layer.msg("请填写完整");
                    return false;
                }
                if(email.length>30){
                    layer.msg("邮件限制30字");
                    return false;
                }
                var patterns = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                if(!patterns.test(email)){
                    layer.msg("邮箱格式不正确");
                    return false;
                }

                return true;
            },
            success:function (data) {
                if(data=='1'){
                    layer.msg("修改成功",{
                        time:1000,
                        end:function () {
                            location.reload();
                        }
                    })

                }
            }
        })
    }
</script>
</html>
