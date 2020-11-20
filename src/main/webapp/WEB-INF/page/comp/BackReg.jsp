<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/19
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=7c1d325554fabccbfb414e1ec058cf40&plugin=AMap.Autocomplete"></script>
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=85f285069a023533ccfb926369538910&plugin=AMap.Geocoder"></script>
<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
<link  type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<html>
<head>
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<style>
    .layui-input{
        border-width: 2px;
        border-radius: 5px;
    }

    .layui-form-select dl {
        max-height:200px;
    }

    #register{
        border: 2px solid #2cffda;
        background-color: #a5c3ff;
        margin:3% 17%;
        border-radius: 20px;
        position: relative;
        z-index: 1;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    #bodys{
        background-image: url("${pageContext.request.contextPath}/imgs/3.png");
        background-repeat: no-repeat;
        background-size: cover;
    }

    .photoUpLoad{
        margin-left: 10%;
        width: 60%;
        height: 30%;
        position: relative;
        cursor: pointer;
        border-radius: 2px;
        border: solid 1px #d0daea;
    }
    .photo{
        opacity: 0;
        z-index: 999;
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
    }
    .photoEcho{
        z-index: 99;
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
    }

    .photoUpLoad .cross{
        color: #d0daea;
        font-size: 44px;
        line-height: 44px;
        position: absolute;
        top: 38px;
        right: 36px;
    }
</style>
<body id="bodys">
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
<div id="register">
    <h1 style="text-align: center">企业注册</h1>
    <form class="layui-form layui-form-pane" id="regForm">
        <br>

        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">公司名称</label>
            <div class="layui-input-block">
                <input type="text" name="compName" id="compName" autocomplete="off" placeholder="请输入公司名称" class="layui-input" style="width: 80%">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">负责人姓名</label>
            <div class="layui-input-block">
                <input type="text" name="bUserName" id="bUserName" autocomplete="off" placeholder="请输入负责人名称" class="layui-input" style="width: 80%">
            </div>
        </div>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 2%;">
            <legend style="margin-left: 20%">公司营业执照上传</legend>
        </fieldset>

        <div class="layui-form-item" style="margin-left: 15%">
            <div id="photoUpLoad" class="photoUpLoad">
                <input type="file" id="photo" class="photo" name="photo" accept="image/*"><span class="cross">+</span>
                <img src="" alt="" id="photoEcho" class="photoEcho">
            </div>
        </div>


        <div class="layui-form-item" style="margin-left: 22%">
            <label class="layui-form-label">所在城市</label>
            <div class="layui-input-inline">
                <select name="province" id="province" lay-filter="province">

                </select>
            </div>
            <div class="layui-input-inline">
                <select name="city" id="city" lay-filter="workCity">

                </select>
            </div>

        </div>

        <div class="layui-form-item" style="margin-left: 22%">
            <label class="layui-form-label">所属行业</label>
            <div class="layui-input-inline" style="width: 56%">
                <select name="industry" id="industry" lay-filter="industry">

                </select>
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">公司地址</label>
            <div class="layui-input-block">
                <input type="text" name="address" id="address" autocomplete="off" placeholder="请输入公司地址" class="layui-input" style="width: 80%">
            </div>
        </div>
            <input type="hidden"  name="lng" id="lng">
            <input type="hidden"  name="lat" id="lat">
        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">公司邮箱</label>
            <div class="layui-input-block">
                <input type="text" name="email" id="email" autocomplete="off" placeholder="请输入公司名称" class="layui-input" style="width: 80%">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">申请账号</label>
            <div class="layui-input-block">
                <input type="text" name="account" id="account" autocomplete="off" placeholder="请输入公司名称" class="layui-input" style="width: 80%">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">输入密码</label>
            <div class="layui-input-block">
                <input type="password" name="pwd" id="pwd" autocomplete="off" placeholder="请输入密码" class="layui-input" style="width: 80%">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">再次确认</label>
            <div class="layui-input-block">
                <input type="password" name="againPwd" id="againPwd" autocomplete="off" placeholder="再次确认密码" class="layui-input" style="width: 80%">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">绑定手机号</label>
            <div class="layui-input-block">
                <input type="text" id="phone" name="contactInfo" autocomplete="off" placeholder="请输入手机号" class="layui-input" style="width: 80%">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 25%">
            <label class="layui-form-label">验证码</label>
            <div class="layui-input-inline">
                <input type="text" name="code" id="code" autocomplete="off" class="layui-input">
            </div>

            <div class="layui-input-inline">
                <input type="button" id="codeBtn" autocomplete="off" class=" layui-btn" value="发送验证码" onclick="sendCode()">
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 4%">
            <div class="layui-input-inline" style="margin-left: 22%">
                <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" onclick="regs()">注册</button>
            </div>
            <div class="layui-input-inline">
                <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid"><a href="#">返回</a></button>
            </div>
            <input type="reset" name="reset" style="display: none;" />
        </div>


    </form>
</div>

</body>
<script>
    var layer;
    var form;
    var InterValObj;
    var curCount=300;
    var path = $("#path").val();
    layui.use(['form','layer'],function () {
        form = layui.form;
        layer = layui.layer;
        form.render();
        form.on('select(province)', function(data){
            $.ajax({
                url:path+"/rec/findCityByID",
                data:"provinceID="+data.value,
                type:"post",
                typeData:"text",
                success:function (info) {
                    var arr = JSON.parse(info);
                    $("#city").empty();
                    var $option1 = $("<option>"+'请选择'+"</option>");
                    $("#city").append($option1);
                    for(var i=0;i<arr.length;i++){
                        var $option = $("<option value='"+arr[i].cityName+"' >"+arr[i].cityName+"</option>");
                        $("#city").append($option);
                        form.render();
                    }
                },
            })
        })
    })

    $("#photo").change(function(){
        var file = this.files[0];
        console.log(file);
        if(!file){
            return false;
        }

        var maxSize = 1024*5 ; //图片最大KB
        if(!/(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file.type)){
            top.alertLocal("请上传gif,jpeg,jpg,png格式的图片！");
            return;
        }
        if(file.size > maxSize* 1024){
            top.alertLocal("请上传"+5+"M以下的图片");
            return;
        }

        var objUrl = getObjectURL(file) ;
        if (objUrl) {
            $("#photoEcho").attr("src", objUrl) ;
        }
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

    $(function () {
        path = $("#path").val();
        $.ajax({
            url:path+"/rec/findAllIndustry",
            type:"post",
            typeData:"text",
            success:function (info) {
                var arr = JSON.parse(info);
                $("#industry").empty();
                var $option1 = $("<option>"+'请选择'+"</option>");
                $("#industry").append($option1);
                for(var i=0;i<arr.length;i++){
                    var $option = $("<option value='"+arr[i].industryId+"' onclick='findDepart(1)'>"+arr[i].industryName+"</option>");
                    $("#industry").append($option);
                    form.render();
                }
            },
        })
    })

    $(function () {
        path = $("#path").val();
        $.ajax({
            url:path+"/rec/findAllProvince",
            type:"post",
            typeData:"text",
            success:function (info) {
                var arr = JSON.parse(info);
                $("#province").empty();
                var $option1 = $("<option>"+'请选择'+"</option>");
                $("#province").append($option1);
                for(var i=0;i<arr.length;i++){
                    var $option = $("<option value='"+arr[i].provinceId+"'>"+arr[i].provinceName+"</option>");
                    $("#province").append($option);
                    form.render();
                }
            },
        })
    })
    //发送验证码
    function sendCode() {
        var phone = $("#phone").val();
        var pattern = /0?(13|14|15|18|17)[0-9]{9}/;
        if(!pattern.test(phone)){
            layer.alert("请输入正确手机号",{icon: 0,offset: '20%'});
        }else{
            $.ajax({
                url:path+"/rec/regSendCode",
                type:'post',
                data:"phone=" + phone,
                dataType:'text',
                success:function(data){
                    if(data=='1'){
                        layer.alert("发送成功",{icon: 0,offset: '20%'});
                        $("#codeBtn").attr("disabled", "true");
                        $("#codeBtn").css("background-color", "grey");
                        $("#codeBtn").val( curCount + "秒");
                        InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
                    }else if(data=='2'){
                        // layer.alert("手机号已被注册");
                        layer.alert("手机号已被注册",{icon: 0,offset: '20%'});
                    }else{
                        layer.alert("发送失败，请稍后再发",{icon: 0,offset: '20%'});
                    }
                },
                error:function(){
                    layer.alert('请求超时或系统出错!',{icon: 0,offset: '20%'});
                }
            });

        }
    }

    function regs() {
        var value = $("#codeBtn").val();

        if(value=='发送验证码'){
            layer.alert("验证码未发送",{icon: 0,offset: '20%'});
            return false;
        }

        if(value=='重新发送'){
            layer.alert("验证码已超时,请重新发送",{icon: 0,offset: '20%'});
            return false;
        }

        var form = new FormData(document.getElementById("regForm"))
        $.ajax({
            url:path+"/rec/compReg",
            type:'post',
            data:form,
            processData: false,
            contentType: false,
            dataType:'text',
            beforeSend:function(){
                var phone = $("#phone").val();
                var pattern = /0?(13|14|15|18|17)[0-9]{9}/;
                if(!pattern.test(phone)){
                    layer.alert("请输入正确手机号",{icon: 0,offset: '20%'});
                    return false;
                }
                var compName = $("#compName").val();
                if(compName.trim().length==0){
                    layer.alert("公司名不能为空",{icon: 0,offset: '20%'});
                    return false;
                }
                if(compName.length>=20){
                    layer.alert("公司名长度不能超过30",{icon: 0,offset: '20%'});
                    return false;
                }

                var bUserName = $("#bUserName").val();
                var pattern = /[\u4e00-\u9fa5]{2,4}$/;
                if(!pattern.test(bUserName)){
                    layer.alert("负责人名字长度4，只能是汉字",{icon: 0,offset: '20%'});
                    return false;
                }

                var photo = $("#photo").val();
                if(photo.length==0){
                    layer.alert("需要上传营业执照",{icon: 0,offset: '20%'});
                    return false;
                }
                if(photo.length>=20){
                    layer.alert("图片名字不能超过20",{icon: 0,offset: '20%'});
                    return false;
                }

                var city = $("#city").val();
                if(city==null||city=='请选择'||city.length==0){
                    layer.alert("所在城市不能为空",{icon: 0,offset: '20%'});
                    return false;
                }

                var address = $("#address").val();
                var i = postLocation();
                if(i==2){
                    layer.alert("地址有误，定位不存在",{icon: 0,offset: '20%'});
                    return false;
                }
                if(address.length>=20){
                    layer.alert("地址长度不能超过20",{icon: 0,offset: '20%'});
                    return false;
                }

                var industry = $("#industry").val();
                if(industry==null||industry=='请选择'||industry.length==0){
                    layer.alert("所属行业不能为空",{icon: 0,offset: '20%'});
                    return false;
                }

                var email = $("#email").val();
                var pattern = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                if(!pattern.test(email)){
                    layer.alert("请输入正确邮箱格式",{icon: 0,offset: '20%'});
                    return false;
                }

                var account = $("#account").val();
                var pattern = /^[A-z_]\w{5,13}$/;
                if(!pattern.test(account)){
                    layer.alert("账号首位要字母只能由字母数字_组成，至少6位，最多14位",{icon: 0,offset: '20%'});
                    return false;
                }

                var pwd = $("#pwd").val();
                var pattern = /\w{6,14}$/;
                if(!pattern.test(pwd)){
                    layer.alert("密码只能由字母数字_组成,且至少6位，最多14位",{icon: 0,offset: '20%'});
                    return false;
                }

                var againPwd = $("#againPwd").val();
                if(pwd!=againPwd){
                    layer.alert("两次密码不同",{icon: 0,offset: '20%'});
                    return false;
                }

                var code = $("#code").val();
                if(code.length!=4){
                    layer.alert("验证码错误",{icon: 0,offset: '20%'});
                    return false;
                }

            },
            success:function(data){
                if(data==5){
                    layer.alert('注册成功，请等待审核通过!',{icon: 0,offset: '20%'});
                    curCount=300;
                    window.clearInterval(InterValObj);//停止计时器
                    $("#codeBtn").removeAttr("disabled");//启用按钮
                    $("#codeBtn").css("background-color", "#0D9572");
                    $("#codeBtn").val("发送验证码");
                    $("input[type=reset]").trigger("click");
                }else if(data=='2'){
                    layer.alert("手机号输入错误");
                }else if(data=='1'){
                    layer.alert('验证码输入错误!',{icon: 0,offset: '20%'});
                }else if(data=='3'){
                    layer.alert('账号重复请重新填写!',{icon: 0,offset: '20%'});
                }else{
                    layer.alert('系统繁忙，注册失败!',{icon: 0,offset: '20%'});
                }
            },
            error:function(){
                layer.alert('请求超时或系统出错!',{icon: 0,offset: '20%'});
            }
        });
    }



    function SetRemainTime() {
        if (curCount == 0) {
            curCount=300;
            window.clearInterval(InterValObj);//停止计时器
            $("#codeBtn").removeAttr("disabled");//启用按钮
            $("#codeBtn").css("background-color", "#0D9572");
            $("#codeBtn").val("重新发送");
        }
        else {
            curCount--;
            $("#codeBtn").val(curCount +"秒");
        }
    }

    function postLocation() {
        var geocoder = new AMap.Geocoder({
        });

        var address  = $("#address").val();
        geocoder.getLocation(address, function(status, result) {
            if (status === 'complete'&&result.geocodes.length) {
                var lnglat = result.geocodes[0].location
                alert(lnglat.lng);
                $("#lat").val(lnglat.lat);
                $("#lng").val(lnglat.lng);
                return "1";
            }else{
                return "2";
            }
        });

    }

</script>
</html>
