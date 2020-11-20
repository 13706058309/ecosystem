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
    </style>
</head>

<body>
<div id="wrap" class="">
    <div id="main" class="inner">
        <div id="container" class="resume-container">
            <div class="resume-content" style="height: 1000px">
                <!---->
                <div class="resume-content-box">

                    <div class="resume-box">
                        <div id="userinfo" class="resume-item resume-userinfo">
                            <div id="userinfo-show" class="item-primary" style="height: 60%">
                                <h2 class="title"> 企业信息 <a href="javascript:;" ka="user-resume-add-workexp"
                                                           class="link-add"><svg class="icon-svg">
                                    <use xlink:href="#icon-svg-add"></use>
                                </svg><span >添加</span></a></h2>
                                <div>
                                <table class="layui-table" style="height: 200px">
                                    <tr>
                                        <td width="33%"><h2 >Logo</h2></td>
                                        <td colspan="2" width="67%"><h2 style="">公司名称</h2></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="3">
                                            <div id="photoUpLoad" class="photoUpLoad">
                                                <input type="file" id="photo" class="photo" name="photo" accept="image/*"><span class="cross">+</span>
                                                <img src="" alt="" id="photoEcho" class="photoEcho">
                                            </div>
                                        </td>
                                        <td colspan="2">1</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><h2 style="">公司地址</h2></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">2</td>
                                    </tr>
                                </table>
                                </div>

                                <div style="background-color: red;width: 100%;height: 50%">

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
                                                <p><h2>1、熟悉前端模块化、组件化开发、项目优化
                                                2、熟悉前端模块化、组件化开发、项目优化
                                                3、熟悉前端模块化、组件化开发、项目优化
                                                4、熟悉前端模块化、组件化开发、项目优化</h2></p>
                                            </div>
                                        </div>
                                        <div class="op op-show">
                                            <!----><a href="javascript:;" ka="user-resume-edit-advantage"
                                                      class="link-edit"><svg class="icon-svg">
                                            <use xlink:href="#icon-svg-edit"></use>
                                        </svg><span>编辑</span></a></div>
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
                                                <p><h2>1、熟悉前端模块化、组件化开发、项目优化
                                                2、熟悉前端模块化、组件化开发、项目优化
                                                3、熟悉前端模块化、组件化开发、项目优化
                                                4、熟悉前端模块化、组件化开发、项目优化</h2></p>
                                            </div>
                                        </div>
                                        <div class="op op-show">
                                            <!----><a href="javascript:;" ka="user-resume-edit-advantage"
                                                      class="link-edit"><svg class="icon-svg">
                                            <use xlink:href="#icon-svg-edit"></use>
                                        </svg><span>编辑</span></a></div>
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
                        <h3 data-v-3b220faa="" class="sider-title">附件管理
                        </h3>
                        <div data-v-3b220faa="" class="btns"><button data-v-3b220faa="" type="button"
                                                                     class="btn btn-primary">上传简历</button>
                        </div>
                        <div data-v-3b220faa="" class="">
                        </div>
                    </div>
                </div>

                <div data-v-3b220faa="" class="sider-box sider-resume">
                    <div data-v-3b220faa="" class="resume-attachment">
                        <h3 data-v-3b220faa="" class="sider-title">附件管理
                        </h3>
                        <div data-v-3b220faa="" class="btns"><button data-v-3b220faa="" type="button"
                                                                     class="btn btn-primary">上传简历</button>
                        </div>
                        <div data-v-3b220faa="" class="">
                        </div>
                    </div>
                </div>

                <div data-v-3b220faa="" class="sider-box sider-resume">
                    <div data-v-3b220faa="" class="resume-attachment">
                        <h3 data-v-3b220faa="" class="sider-title">附件管理
                        </h3>
                        <div data-v-3b220faa="" class="btns"><button data-v-3b220faa="" type="button"
                                                                     class="btn btn-primary">上传简历</button>
                        </div>
                        <div data-v-3b220faa="" class="">
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

<script>
    function selectFile() {
        let files = event.target.files;
        if (files.length === 0) return false;
        let reader = new FileReader();
        reader.readAsDataURL(files[0]);
        reader.onloadend = () => {
            $("#headImg").attr("src", reader.result)
        }
    }
    function userInfoUpdate() {
        $("#userinfo-show").hide()
        $("#userinfo-update").show()
    }
    function userInfoUpdateComfirm() {
        event.preventDefault()
        $("#userinfo-show").show()
        $("#userinfo-update").hide()
    }
    function userInfoUpdateCancel() {
        event.preventDefault()
        $("#userinfo-show").show()
        $("#userinfo-update").hide()
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
</script>
</body>

</html>
