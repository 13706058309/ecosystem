<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/20
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>简历</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
    <script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=7c1d325554fabccbfb414e1ec058cf40&plugin=AMap.Autocomplete"></script>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=85f285069a023533ccfb926369538910&plugin=AMap.Geocoder"></script>
    <script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
    <style>
        .layui-table th{
            text-align: center;
        }
        .layui-table{
            text-align: center;
        }

        .photoUpLoad{
            margin-left: 10%;
            width: 80%;
            height: 100%;
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

        .layui-table img{
            max-width: 200px;
        }

        .layui-table-cell {
            height: auto;
            overflow: visible;
            text-overflow: inherit;
        }

        table {
            table-layout: fixed;  /*fiexed 列宽由表格宽度和列宽度设定。 默认。列宽度由单元格内容设定。*/
            word-break: break-all;   /*允许在单词内换行*/
        }

    </style>
</head>

<body>
<div id="wrap" class="">
    <input type="hidden" value="${pageContext.request.contextPath}" id="path">
    <input type="hidden"  name="lng" id="lng" value="${comp.lng}">
    <input type="hidden"  name="lat" id="lat" value="${comp.lat}">
    <div id="main" class="inner">
        <div id="containers" class="resume-container">
            <div class="resume-content" style="height: 1000px">
                <!---->
                <div class="resume-content-box">

                    <div class="resume-box">
                        <div id="userinfo" class="resume-item resume-userinfo">
                            <div id="userinfo-show" class="item-primary" style="height: 60%">
                                <h2 class="title"> 企业信息 <a href="javascript:;" ka="user-resume-add-workexp"
                                                           class="link-add"><svg class="icon-svg">
                                    <use xlink:href="#icon-svg-add"></use>
                                </svg><span onclick="changeAddress()">修改</span></a></h2>
                                <div>
                                <table class="layui-table" style="height: 200px">
                                    <tr>
                                        <td width="33%"><h2 >Logo</h2></td>
                                        <td colspan="2" width="67%"><h2 style="">公司名称</h2></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="3">
                                            <form id="photoUpLoad" class="photoUpLoad" enctype="multipart/form-data">
                                                <input type="file" id="photo" class="photo" name="photo" accept="image/*"><span class="cross">+</span>
<%--                                                <img src="" alt="" id="photoEcho" class="photoEcho">--%>
                                                <c:choose>
                                                    <c:when test="${not empty comp.logo}">
                                                        <img src="${pageContext.request.contextPath}/uploadLogo${comp.logo}" id="photoEcho" class="photoEcho" >
                                                    </c:when>

                                                    <c:otherwise>
                                                        <img src="${pageContext.request.contextPath}/comp/style/images/logo_default.png" id="photoEcho" class="photoEcho">
                                                    </c:otherwise>
                                                </c:choose>
                                            </form>
                                        </td>
                                        <td colspan="2"><h2 id="compName">${comp.compName}</h2></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><h2>公司地址</h2></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><h2 id="address">${comp.address}</h2></td>
                                    </tr>
                                </table>
                                </div>

                                <div style="width: 100%;height: 50%" id="container">

                                </div>
                            </div>

                        </div>
                        <div id="summary" class="resume-item resume-summary">
                            <div class="item-primary advantage-show">
                                <h3 class="title"> 核心价值
                                    <!---->
                                </h3>
                                <ul>
                                    <li ka="user-resume-edit-advantage" class="">
                                        <div class="primary-info">
                                            <div class="info-text advantage-text" style="white-space: normal;">
                                                <p><h2 id="coreValue">${comp.coreValue}</h2></p>
                                            </div>
                                        </div>
                                        <div class="op op-show">
                                            <!----><a href="javascript:;" ka="user-resume-edit-advantage"
                                                      class="link-edit"><svg class="icon-svg">
                                            <use xlink:href="#icon-svg-edit"></use>
                                        </svg><span onclick="changeValue()">编辑</span></a></div>
                                    </li>
                                </ul>
                            </div>
                            <!---->
                        </div>

                        <div id="summarys" class="resume-item resume-summary">
                            <div class="item-primary advantage-show">
                                <h3 class="title"> 公司简介
                                    <!---->
                                </h3>
                                <ul>
                                    <li ka="user-resume-edit-advantage" class="">
                                        <div class="primary-info">
                                            <div class="info-text advantage-text" style="white-space: normal;">
                                                <p><h2 id="infoIntr">
                                                        ${comp.infoIntr}
                                                    </h2>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="op op-show">
                                            <!----><a href="javascript:;" ka="user-resume-edit-advantage"
                                                      class="link-edit"><svg class="icon-svg">
                                            <use xlink:href="#icon-svg-edit"></use>
                                        </svg><span onclick="changeInfo()">编辑</span></a></div>
                                    </li>
                                </ul>
                            </div>
                            <!---->
                        </div>
                    </div>
                </div>
            </div>

            <div class="user-sider" style="height: 600px;background: #fff;">

                <div data-v-3b220faa="" class="sider-box sider-resume">
                    <div data-v-3b220faa="" class="resume-attachment">
                        <h2 class="title"> 基本信息
                            <a href="javascript:;" ka="user-resume-add-workexp"
                               class="link-add">
                                <svg class="icon-svg" style="margin-left: 50%">
                                    <use xlink:href="#icon-svg-add"></use>
                                </svg>
                                <span onclick="changeBase()" style="color: #5bff67">修改</span>
                            </a>
                        </h2>

                        <div data-v-3b220faa="" >
                            <table class="layui-table" style="height: 50px" border="0px">
                                <tr>
                                    <td width="33%"><h3>城市</h3></td>
                                    <td width="67%"><h3 id="city">${comp.city}</h3></td>
                                </tr>

                                <tr>
                                    <td width="33%"><h3>邻域</h3></td>
                                    <td width="67%"><h3>${comp.industrys[0].industryName}</h3></td>
                                </tr>

                                <tr>
                                    <td width="33%"><h3>邮箱</h3></td>
                                    <td width="67%" style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;">
                                        <h3>${comp.email}</h3>
                                    </td>
                                </tr>

                                <tr>
                                    <td width="33%"><h3>规模</h3></td>
                                    <td width="67%" style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;"><h3 id="scale">${comp.scale}</h3></td>
                                </tr>

                                <tr>
                                    <td width="33%"><h3>主页</h3></td>
                                    <td width="67%" style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;"><h3 id="homePage">${comp.homePage}</h3></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div data-v-3b220faa="" class="sider-box sider-resume" style="margin-top: -8%">
                    <div data-v-3b220faa="" class="resume-attachment">
                        <h2 class="title"> 融资阶段
                            <a href="javascript:;" ka="user-resume-add-workexp"
                                                   class="link-add">
                                <svg class="icon-svg" style="margin-left: 50%">
                                    <use xlink:href="#icon-svg-add"></use>
                                </svg>
                                    <span onclick="changeStatu()" style="color: #5bff67">修改</span>
                            </a>
                        </h2>

                        <div data-v-3b220faa="" >
                            <table class="layui-table" style="height: 50px">
                                <tr>
                                    <td width="50%"><h3>目前阶段</h3></td>
                                    <td width="50%"><h3 id="finanStage">${comp.finanStage}</h3></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div data-v-3b220faa="" class="sider-box sider-resume" style="margin-top: -8%">
                    <div data-v-3b220faa="" class="resume-attachment">
                        <h2 class="title"> 产品介绍
                            <a href="javascript:;" ka="user-resume-add-workexp"
                               class="link-add">
                                <svg class="icon-svg" style="margin-left: 50%">
                                    <use xlink:href="#icon-svg-add"></use>
                                </svg>
                                <span onclick="changeProduct()" style="color: #5bff67">修改</span>
                            </a>
                        </h2>

                        <div data-v-3b220faa="" >
                            <div class="info-text advantage-text" style="white-space: normal;">
                                <p><h3 id="product">${comp.product}</h3></p>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

        </div>
    </div>
    <div>
        <div id="footer" style="min-height: 120px;">
            <div class="inner home-inner">

            </div>
        </div>

    </div>
</div>
</div>
    <div style="display: none" id="changeAddress">
        <br>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">新地址:</label>
            <div class="layui-input-inline">
                <input type="text" id="newAddress" name="newAddress"  autocomplete="off" class="layui-input" style="width: 200%">
            </div>
        </div>
    </div>

    <div style="display: none" id="changeValue">
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">价值：</label>
            <div class="layui-input-block" >
                <textarea placeholder="请输入内容" class="layui-textarea" style="width: 80%; height: 85%" id="newValue" name="newValue" >
                    ${comp.coreValue}
                </textarea>
            </div>
        </div>
    </div>

    <div style="display: none" id="changeInfo">
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">简介：</label>
            <div class="layui-input-block">
                    <textarea placeholder="请输入内容" class="layui-textarea" style="width: 70%; height: 85%" id="newInfo" name="newValue" >
                        ${comp.infoIntr}
                    </textarea>
            </div>
        </div>
    </div>

    <div style="display: none" id="changePro">
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">产品：</label>
            <div class="layui-input-block">
                        <textarea placeholder="请输入内容" class="layui-textarea" style="width: 70%; height: 85%" id="newPro" name="newPro" >
                            ${comp.product}
                        </textarea>
            </div>
        </div>
    </div>

    <div id="changeStatu" style="display: none;margin-top: 3%">
        <br>
        <form class="layui-form" action="" style="margin-left: 15%;margin-right: 15%">
            <label class="layui-form-label" style="margin-right: 10%">融资阶段</label>
            <div class="layui-input-inline">
                <select name="newFinanStage" id="newFinanStage">
                    <option>请选择</option>
                    <option >未融资</option>
                    <option >天使轮</option>
                    <option >A轮</option>
                    <option >B轮</option>
                    <option >C轮</option>
                    <option >D轮及以上</option>
                    <option >上市公司</option>
                </select>
            </div>
        </form>
    </div>

<div id="changeBase" style="display: none;margin-top: 3%">
    <br>
    <form class="layui-form" action="" style="margin-left: 5%;margin-right: 5%">
        <div class="layui-form-item">
            <label class="layui-form-label">规模：</label>

            <div class="layui-input-inline">
                <select name="newScale" id="newScale" lay-filter="province">
                    <option>请选择</option>
                    <option >少于15人</option>
                    <option >15-50人</option>
                    <option >50-150人</option>
                    <option>150-500人</option>
                    <option>500-999人</option>
                    <option>1000人以上</option>
                </select>
            </div>


            <label class="layui-form-label">主页：</label>
            <div class="layui-input-inline">
                <input type="text" id="newHomePage" name="newHomePage"  autocomplete="off" class="layui-input" >
            </div>

        </div>

    </form>
</div>

<script>
    var layer;
    var form;
    var num = 0;
    var path = $("#path").val();

    layui.use(['layer','form'],function () {
        layer = layui.layer;
        form = layui.form;
        form.render();
    })

    $(function () {
        $("td").on("mouseenter",function() {
            if (this.offsetWidth < this.scrollWidth) {
                var that = this;
                var text = $(this).text();
                layer.tips(text, that,{
                    tips: 1,
                    time: 2000         //设置显示时间
                });
            }
        });
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
                if(photos.length>=20){
                    layer.alert("logo名字长度不能超过20");
                    return false;
                }
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

    $(function () {
        postLocation();
    })

    function postLocation() {
        var lng = $("#lng").val();
        var lat = $("#lat").val();
        var map = new AMap.Map('container', {
            center: [lng, lat],
            zoom: 15
        });
        map.plugin(["AMap.ToolBar"], function() {
            map.addControl(new AMap.ToolBar());
        });
        <!-- 上面是定位，下面是打上标记 -->

        var marker;
        var icon = new AMap.Icon({
            image: 'http://vdata.amap.com/icons/b18/1/2.png',
            size: new AMap.Size(24, 24)
        });
        marker = new AMap.Marker({
            offset: new AMap.Pixel(-12, -12),
            zIndex: 101,
            map: map
        });
    }


    function changeAddress() {
        $("#newAddress").val("");
        layer.open({
            type:1,
            title:"面试具体通知",
            area:['50%','30%'],
            offset: ['10%', '30%'],
            content:$("#changeAddress"),
            btn:['修改','取消'],
            btn1: function (index,layero) {
                var address = $("#newAddress").val();
                $.ajax({
                    url:path+"/rec/changeCompInfo",
                    async: false,
                    data:"address="+address,
                    type:"post",
                    typeData:"text",
                    beforeSend:function(){
                        if(address.trim().length==0){
                            layer.msg("公司地址未填写");
                            return false;
                        }
                        if(address.length>=25){
                            layer.msg("公司地址不能超过25字符");
                            return false;
                        }
                    },
                    success:function (info) {
                        layer.close(index);
                        if(info=='1'){
                            layer.alert("修改成功");
                            $("#address").text(address);
                            location.reload();
                        }else if(info=='5'){
                            layer.alert("地址无效，定位失败");
                        }else{
                            layer.alert("网络繁忙，修改失败");
                        }
                    },
                })
            },
            btn2:function (index,layero) {
                layer.close(index);
            }
        })
    }

    function changeValue() {
        layer.open({
            type:1,
            title:"修改核心价值",
            area:['40%','40%'],
            offset: ['10%', '30%'],
            content:$("#changeValue"),
            btn:['修改','取消'],
            btn1: function (index,layero) {
                var coreValue = $("#newValue").val();
                $.ajax({
                    url:path+"/rec/changeCompInfo",
                    data:"coreValue="+coreValue,
                    type:"post",
                    typeData:"text",
                    beforeSend:function () {
                        if(coreValue.length==0){
                            layer.msg("核心价值未填写");
                            return false;
                        }
                        if(coreValue.length>=40){
                            layer.msg("核心价值不能超过40字符");
                            return false;
                        }
                    },
                    success:function (data) {
                        layer.close(index);
                        if(data=='1'){
                            layer.alert("修改成功");
                            $("#coreValue").text(coreValue);

                        }else{
                            layer.alert("网络繁忙，修改失败");
                        }
                    }
                })
            },
            btn2:function (index,layero) {
                layer.close(index);
            }
        })
    }

    function changeInfo() {
        layer.open({
            type:1,
            title:"修改公司简介",
            area:['40%','40%'],
            offset: ['10%', '30%'],
            content:$("#changeInfo"),
            btn:['修改','取消'],
            btn1: function (index,layero) {
                var infoIntr = $("#newInfo").val();
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
                        if(infoIntr.length>=200){
                            layer.msg("公司简介不能超过200字符");
                            return false;
                        }
                    },
                    success:function (data) {
                        layer.close(index);
                        if(data=='1'){
                            layer.alert("修改成功");
                            $("#infoIntr").text(infoIntr);

                        }else{
                            layer.alert("网络繁忙，修改失败");
                        }
                    }
                })
            },
            btn2:function (index,layero) {
                layer.close(index);
            }
        })
    }

    function changeProduct() {
        layer.open({
            type:1,
            title:"修改公司产品介绍",
            area:['40%','40%'],
            offset: ['10%', '30%'],
            content:$("#changePro"),
            btn:['修改','取消'],
            btn1: function (index,layero) {
                var product = $("#newPro").val();
                $.ajax({
                    url:path+"/rec/changeCompInfo",
                    data:"product="+product,
                    type:"post",
                    typeData:"text",
                    beforeSend:function () {
                        if(product.length==0){
                            layer.msg("产品讲述未填写");
                            return false;
                        }
                        if(product.length>=100){
                            layer.msg("产品讲述不能超过100字符");
                            return false;
                        }
                    },
                    success:function (data) {
                        layer.close(index);
                        if(data=='1'){
                            layer.alert("修改成功");
                            $("#product").text(product);

                        }else{
                            layer.alert("网络繁忙，修改失败");
                        }
                    }
                })
            },
            btn2:function (index,layero) {
                layer.close(index);
            }
        })
    }

    function changeStatu() {
        layer.open({
            type:1,
            title:"修改融资阶段",
            area:['40%','50%'],
            offset: ['10%', '30%'],
            content:$("#changeStatu"),
            btn:['修改','取消'],
            btn1: function (index,layero) {
                var finanStage = $("#newFinanStage").val();
                $.ajax({
                    url:path+"/rec/changeCompInfo",
                    data:"finanStage="+finanStage,
                    type:"post",
                    typeData:"text",
                    beforeSend:function () {
                        if(finanStage.length==0||finanStage=='请选择'){
                            layer.msg("请选择融资阶段");
                            return false;
                        }
                    },
                    success:function (data) {
                        layer.close(index);
                        if(data=='1'){
                            layer.alert("修改成功");
                            $("#finanStage").text(finanStage);

                        }else{
                            layer.alert("网络繁忙，修改失败");
                        }
                    }
                })
            },
            btn2:function (index,layero) {
                layer.close(index);
            }
        })
    }

    function changeBase() {
        layer.open({
            type:1,
            title:"修改信息",
            area:['60%','60%'],
            offset: ['10%', '30%'],
            content:$("#changeBase"),
            btn:['修改','取消'],
            btn1: function (index,layero) {
                var scale = $("#newScale").val();
                var homePage = $("#newHomePage").val();
                $.ajax({
                    url:path+"/rec/changeCompInfo",
                    data:"scale="+scale+"&homePage="+homePage,
                    type:"post",
                    typeData:"text",
                    beforeSend:function () {
                        if(homePage.length==0){
                            layer.msg("请填写主页");
                            return false;
                        }

                        if(homePage.length>=40){
                            layer.msg("主页长度不得超过40");
                            return false;
                        }

                        if(scale.length==0||scale=='请选择'){
                            layer.msg("请选择规模");
                            return false;
                        }
                    },
                    success:function (data) {
                        layer.close(index);
                        if(data=='1'){
                            layer.alert("修改成功");
                            $("#scale").text(scale);
                            $("#homePage").text(homePage);
                        }else{
                            layer.alert("网络繁忙，修改失败");
                        }
                    }
                })
            },
            btn2:function (index,layero) {
                layer.close(index);
            }
        })
    }
</script>
</body>

</html>
