<%--
  Created by IntelliJ IDEA.
  User: WTQ
  Date: 2020/11/12
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>申请证书</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <link href="${pageContext.request.contextPath}/style/css/style.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/css/popup.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jianli.css" rel="stylesheet">
    <script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js" crossorigin="anonymous"></script>
    <script src="https://static.zhipin.com/zhipin-geek/v334/web/geek/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>

    <style>
        #xieyi{
            color: #980e3b;
            background-color:transparent;
            border-style:none
        }

         #container {
             margin:35px auto 0;
         }
        #tijiao{
            display: inline-block;
            height: 38px;
            line-height: 38px;
            padding: 0 18px;
            background-color: #009688;
            color: #fff;
            white-space: nowrap;
            text-align: center;
            font-size: 14px;
            border: none;
            border-radius: 2px;
            cursor: pointer
        }
    </style>
</head>
<body>
<div id="header" style="background-color:#00c2b3;height: 80px" >
    <div class="inner home-inner" >
        <div class="logo" style="width: 150px;height: 70px">

            <a  ka="header-home-logo" title="钱程无忧" style="background: url(${pageContext.request.contextPath}/imgs/logo12.jpg) 3px 7px no-repeat;background-size:150px 70px;width: 150px;height: 70px;margin-top: -20px"><span>钱程无忧</span></a>
        </div>
        <div class="nav" style="margin-top: 20px">
            <ul>
                <li class=""><a ka="header-home" href="${pageContext.request.contextPath}/homePage/home">首页</a></li>
                <li class=""><a ka="header-job" href="${pageContext.request.contextPath}/center/job">职位</a></li>
                <li class=""><a class="nav-school" ka="header-school" href="${pageContext.request.contextPath}/homePage/companylist">公司</a></li>
                <%--                <li class=""><a ka="header_brand" href="https://www.zhipin.com/gongsi/">校招</a></li>--%>
                <li><a href="${pageContext.request.contextPath}/project" >项目</a></li>
                <li class=""><a ka="header-app" href="${pageContext.request.contextPath}/course/homePage">课程</a></li>
                <li class="cur"><a ka="header-article" href="${pageContext.request.contextPath}/zhengshu/cshouye">证书</a></li>
            </ul>
        </div>

        <div class="user-nav" style="margin-top: 20px">
            <c:if test="${empty qUser}">
                <div class="btns" style="margin-top: 10%">
                    <a href="${pageContext.request.contextPath}/golog/reg" style="background: #202329" ka="header-register" class="btn btn-outline">注册</a>
                    <a href="${pageContext.request.contextPath}/golog/login" style="background: #202329" class="btn btn-outline">登录</a>
                </div>
            </c:if>
            <c:if test="${not empty qUser}">
                <ul>
                        <%--                <li class=""><a ka="header-message" href="https://www.zhipin.com/web/geek/chat">消息<span class="nav-chat-num"></span></a></li>--%>
                    <li class="nav-figure">
                        <a >
                            <span class="label-text">${qUser.userName}</span><img src="${pageContext.request.contextPath}${qUser.headImgUrl}" alt=""/>
                        </a>
                        <div class="dropdown">
                            <a href="${pageContext.request.contextPath}/center/jianli" ka="header-personal">个人中心<span>编辑简历</span></a>
                            <a href="${pageContext.request.contextPath}/userProject/projectOfUser" ka="header-personal">我的项目<span>项目订单</span></a>
                            <a href="${pageContext.request.contextPath}/center/accountSet" ka="account_manage">账号设置<span>重置密码|更换手机号|隐私设置|修改用户名</span></a>
                            <a href="${pageContext.request.contextPath}/homePage/quitAccount?city=${workCity}"  ka="header-logout">退出登录</a>
                        </div>
                    </li>
                </ul></c:if>
        </div>
    </div>
</div>
    <div class="container" style="width: 70%;margin-left: 16%">
        <div id="container"  >
            <dl class="company_center_content">
                <dt>
                    <h1>
                        <em></em>
                        申请 证书
                    </h1>
                </dt>
                <dd>
                    <form method="post" id="jobForm">
                        <table class="btm">
                            <tbody><tr>
                                <td width="25"><span class="redstar">*</span></td>
                                <td width="85">申请人</td>
                                <td>
                                    <input type="text" placeholder="请上传您的身份证正面照片" style="height: 45px" readonly unselectable="on"  id="identityName" >
                                </td>
                                <td>
                                        <input type="file" name="file_idcard" id="file_idcard" class="file" multiple data-min-file-count="2" >

                                </td>
                            </tr>
                            <tr>
                                <td><span class="redstar">*</span></td>
                                <td>身份证</td>
                                <td>
                                    <input type="text"  style="height: 45px" readonly unselectable="on" onkeyup="shenfenzhengZZ()"  name="identityNumber" id="identityNumber">
                                </td>
                                <td>
                                    <input type="button" id="tijiao" value="提交" onclick="load()">
                                </td>
                            </tr>
                            <tr>
                                <td><span class="redstar">*</span></td>
                                <td>联系号码</td>
                                <td>
                                    <input  type="text" placeholder="请输入您的联系号码"  style="height: 45px" onblur="phoneZZ()" name="phoneNumber" id="phoneNumber">
                                </td>
                            </tr>
                            <tr>
                                <td><span class="redstar">*</span></td>
                                <td>证书类型</td>
                                <td>
                                    <input type="text" value="${filenames}"  style="height: 45px"  readonly unselectable="on" id="filename" >
                                </td>
                            </tr>
                            <tr>
                                <td><span class="redstar">*</span></td>
                                <td>申请费用</td>
                                <td>
                                    <input type="text" value="${cerfee}"  style="height: 45px"  readonly unselectable="on" id="filemoney" >
                                </td>
                            </tr>
                            <tr>
                                <td><span class="redstar">*</span></td>
                                <td>
                                    <input type="checkbox" id="chenkxieyi" style="margin-top: 15px;margin-left: 20px">
                                </td>
                                <td>
                                    <button type="button"  data-method="notice" id="xieyi" class="layui-btn"  >《同意证书协议》</button>
                                </td>
                            </tr>
                            <tr>
                                <td width="25" ></td>
                                <td colspan="2">
                                    <div style="align-content: center">
                                        <input  type="submit" onclick="javascript:history.back(-1)" value="返回" id="jobPreview" class="btn_32">
                                        <input type="button" value="确认并支付" onclick="upzhengshu()" id="yeszhengshu" class="btn_32">
                                    </div>
                                </td>
                            </tr>
                            </tbody></table>
                    </form>
                </dd>
            </dl>
        </div>
    </div><!-- end .content -->
    <input type="hidden" value="${fileids}" id="fileid">



<script src="${pageContext.request.contextPath}/layui/dist/layui.js" charset="utf-8"></script>
<script>
    $(function(){
       $('#filename').text("${filenames}");
        });
    //提交
    function upzhengshu(){
        var username = $('#identityName').val();
        var usernumber = $('#identityNumber').val();
        var phone = $('#phoneNumber').val();
        var fileid = $('#fileid').val();
        var filemoney = $('#filemoney').val();
        var chenkxieyi = document.getElementById("chenkxieyi");
        layui.use('layer', function() {
            layer = layui.layer;
        if (username==""||usernumber==""||phone==""){
            layer.msg('信息填写不完整', {icon: 5});
        }else if (chenkxieyi.checked==false){
            layer.msg('请同意协议', {icon: 5});
        }else if (username!=""||usernumber!=""||phone!=""||chenkxieyi.checked==true){
            $.ajax({
                url:  "${pageContext.request.contextPath}/zhengshu/upupzhengshu",//请求服务端地址值
                async: true,
                type: "post",//请求方式
                data: "username=" + username+"&usernumber="+usernumber+"&phone="+phone+"&fileid="+fileid,
                dataType: "text",
                success: function (msg) {
                    if (msg=='22'){
                        layer.msg('请勿重复申请', {icon: 5});
                    }else if (msg=='23'){
                        layer.msg('待付款，请到个人中心', {icon: 5});
                    }else if (msg=='24'){
                        layer.msg('7天内不可再申请', {icon: 5});
                    }else if (msg=='500'){
                        layer.msg('当前处于开发阶段，请勿重复申请', {icon: 5});
                    }else {
                       //跳转支付界面
                        var xinxi = "证书申请";
                        var vNow = new Date();
                        var sNow = "";
                        sNow += String(vNow.getFullYear());
                        sNow += String(vNow.getMonth() + 1);
                        sNow += String(vNow.getDate());
                        sNow += String(vNow.getHours());
                        sNow += String(vNow.getMinutes());
                        sNow += String(vNow.getSeconds());
                        sNow += String(vNow.getMilliseconds());
                        location.href='${pageContext.request.contextPath}/zhifubao/alipayTradePagePay?WIDout_trade_no='+sNow+'&WIDtotal_amount='+filemoney+'&WIDsubject='+xinxi+'&cerRecordlastid='+msg;
                    }
                }
            });
        }
        });
    }


    //弹出证书协议
    layui.use('layer', function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
        //触发事件
        var active = {
            notice: function(){
                //示范一个公告层
                layer.open({
                    type: 1
                    ,title: false //不显示标题栏
                    ,closeBtn: false
                    ,area: '300px;'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: [ '已阅']
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">' +
                        '这是一份很认真的协议,请认真阅读<br>一旦支付<br>不协商不退款！！！'
                });
            }
        };
        $('#xieyi').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });

    //读取身份证
    function load() {
        var formData= new FormData;
        formData.append("file",$("#file_idcard")[0].files[0]);
        // var file = new FormData(document.getElementById("idCardform"));
        $.ajax({
            url:"${pageContext.request.contextPath}/zhengshu/shenfenupload",//=servlet里要调用的方法名
            async: true,//true异步请求，false同步请求，不写默认true，ajax嵌套时需要同步请求
            type: "post",//请求方式
            data: formData,//要提交的数据
            processData:false,
            contentType:false,
            dataType:"json",
            success:function (data) {
                console.log(data);
                if(data.idcard_number_type==1) {
                    $('#identityName').val(data.words_result.姓名.words);
                    $('#identityNumber').val(data.words_result.公民身份号码.words);
                }else if (data.idcard_number_type==-1){
                    alert("请输入正确的身份证照片");
                }
            }

        });
    }
    //手机正则
    function phoneZZ() {
        layui.use('layer', function() {
            layer = layui.layer;
            var mPattern = /^1[3456789]\d{9}$/.test($("#phoneNumber").val());
            if (mPattern) {
                layer.msg('输入手机号正确', {icon: 6});
            }else{
                layer.msg('输入手机号错误', {icon: 5});
                $("#phoneNumber").val("");
            }
        });
    }
    //身份证正则
    function shenfenzhengZZ() {
        layui.use('layer', function() {
            layer = layui.layer;
            var mPattern = /(^\d{15}$)|(^\d{17}(x|X|\d)$)/.test($("#identityNumber").val());
            if (mPattern) {
                layer.msg('输入身份证正确', {icon: 6})
            }else{
                layer.msg('输入身份证错误，请重新上传', {icon: 5})
                $("#identityNumber").val("");
            }
        });
    }

</script>
</body>
</html>
