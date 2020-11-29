<%--
  Created by IntelliJ IDEA.
  User: WTQ
  Date: 2020/11/12
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">
    <title>证书申请列表</title>
    <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jianli.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js" crossorigin="anonymous"></script>
    <script src="https://static.zhipin.com/zhipin-geek/v334/web/geek/js/main.js"></script>

</head>
<body>
<div id="header" style="background-color:#00c2b3;height: 80px" >
    <div class="inner home-inner" >
        <div class="logo" style="width: 150px;height: 70px">

            <a  ka="header-home-logo" title="钱程无忧" style="background: url(${pageContext.request.contextPath}/imgs/logo12.jpg) 3px 7px no-repeat;background-size:150px 70px;width: 150px;height: 70px"><span>钱程无忧</span></a>
        </div>
        <div class="nav" style="margin-top: 20px">
            <ul>
                <li class=""><a ka="header-home" href="${pageContext.request.contextPath}/homePage/home">首页</a></li>
                <li class=""><a ka="header-job" href="${pageContext.request.contextPath}/center/job">职位</a></li>
                <li class=""><a class="nav-school" ka="header-school" href="${pageContext.request.contextPath}/homePage/companylist">公司</a></li>
                <%--                <li class=""><a ka="header_brand" href="https://www.zhipin.com/gongsi/">校招</a></li>--%>
                <li><a href="${pageContext.request.contextPath}/project" target="_blank">项目</a></li>
                <li class=""><a ka="header-app" href="${pageContext.request.contextPath}/course/homePage">课程</a></li>
                <li class=""><a ka="header-article" href="${pageContext.request.contextPath}/zhengshu/cshouye">证书</a></li>
            </ul>
        </div>

        <div class="user-nav" style="margin-top: 20px">
            <ul>
                <%--                    <li class=""><a ka="header-message" href="https://www.zhipin.com/web/geek/chat">消息<span class="nav-chat-num"></span></a></li>--%>
                <li class="nav-figure">
                    <a >
                        <span class="label-text">${qUser.userName}</span><img id="topImg"  src="${pageContext.request.contextPath}${qUser.headImgUrl}" alt=""/>
                    </a>
                    <div class="dropdown">
                        <a href="${pageContext.request.contextPath}/center/jianli" ka="header-personal">个人中心<span>编辑简历</span></a>
                        <a href="${pageContext.request.contextPath}/center/accountSet" ka="account_manage">账号设置<span>重置密码|更换手机号|隐私设置|修改用户名</span></a>
                        <a href="${pageContext.request.contextPath}/homePage/quitAccount?city=${workCity}"  ka="header-logout">退出登录</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<div id="wrap" class="">
    <div id="main" class="inner">
    <div id="container"  class="resume-container" >
        <div class="resume-content">
        <div class="demoTable">

            查询条件:
            <div class="layui-inline">
                <input class="layui-input" type="date" id="top" name="top" autocomplete="off">
            </div >至
            <div class="layui-inline">
                <input type="date" class="layui-input" id="down" name="down" autocomplete="off">
            </div>
            证书类型：
            <div class="layui-inline"><input class="layui-input" name="fieldName" id="fieldName" style="width: 250px;height: 40px" type="text" autocomplete="off" placeholder="请输入文档标题" ></div>
            <button class="layui-btn" data-type="reload">搜索</button>
        </div>
        <table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>
        </div>
        <div class="user-sider" style="height: 600px;background: #fff;">
            <div data-v-3b220faa="" class="sider-box sider-resume">
                <%--                    <div data-v-3b220faa="" class="resume-attachment">--%>
                <%--                        <h3 data-v-3b220faa="" class="sider-title">附件管理--%>
                <%--                        </h3>--%>
                <%--                        <div data-v-3b220faa="" class="btns"><button data-v-3b220faa="" type="button"--%>
                <%--                                                                     class="btn btn-primary">上传简历</button>--%>
                <%--                        </div>--%>
                <%--                        <div data-v-3b220faa="" class="">--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                    <div style="text-align: center">--%>
                <%--                        <div class="info-flex-item header-upload">--%>
                <%--                            <div class="header-box">--%>
                <%--                        <div class="header-mask" ></div><img style="height: 10%;width: 30%" id="headImg2"--%>
                <%--                                                                src="${pageContext.request.contextPath}${resume.photo}"--%>
                <%--                                                       class="header-img"></div></div>--%>
                <%--                        <div>${resume.realName}</div>--%>
                <%--                    </div>--%>
                <div style="margin-top: 20px">
                    <h2 style="color: #0cccb5">我的信息</h2>
                    <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/center/resumeInfo"  >收藏岗位</a></div>
                    <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/center/accountSet" >账号设置</a></div>
                    <%--                        <div style="margin-left: 20%"><a href=""  >收藏课程</a></div>--%>
                    <%--                        <div style="margin-left: 20%"><a href=""  >观看历史</a></div>--%>
                    <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/zhengshu/zxzsliebiao"  >证书申请</a></div>
                    <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/zhengshu/zxzstushi"  >证书展示</a></div>
                    <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/zhengshu/zxzskaifa"  >证书项目</a></div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <div>
<script type="text/html" id="barDemo">

    {{#  if(d.stateId==22){ }}
    <a class="layui-btn layui-bg-red layui-btn-xs" lay-event="chehui">取消</a>
    {{#  } }}

    {{#  if(d.stateId==23){ }}
        <a class="layui-btn layui-bg-orange layui-btn-xs"lay-event="daifukuan">待付款</a>
    {{#  } }}

    {{#  if(d.stateId==24){ }}
        <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit">7天内无法申请</button>
    {{#  } }}
    {{#  if(d.stateId==25||d.stateId==32){ }}
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="downxuqiu">下载证书项目需求</a>
    {{#  } }}

    {{#  if(d.stateId==26||d.stateId==28||d.stateId==30){ }}
    <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit">7天内无法申请</button>
    {{#  } }}

    {{#  if(d.stateId==27||d.stateId==31||d.stateId==29){ }}
    <a class="layui-btn layui-bg-blue layui-btn-xs" lay-event="tiaozhun">进入证书项目</a>
    {{#  } }}


</script>

<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    window.onload=function () {
        layui.use('table', function () {
            var table = layui.table;

            //方法级渲染
            table.render({
                elem: '#LAY_table_user'
                , url: '${pageContext.request.contextPath}/zhengshu/getcersqlist'
                , cols: [[
                    {type: 'numbers', title: 'ID', width: 40}
                    , {field: 'trueName',title: '申请人', width: 100}
                    , {templet: '<div>{{d.field.fieldName}}</div>', title: '证书类型', width: 80}
                    , {field: 'beginTime',title: '申请时间', width: 160, sort: true}
                    , {field: 'turnoverTime',title: '更新时间', width: 160, sort: true}
                    , {templet: '<div>{{d.state.paramName}}</div>', title: '当前状态',  width: 120}
                    , {field: 'score', title: '操作', width: 160, align: 'center', toolbar: '#barDemo'}
                ]]
                , id: 'testReload'
                , page: true
                , height: 500
            });

            table.on('tool(user)', function (obj) {
                var data = obj.data;
                if (obj.event === 'chehui') {
                        layer.confirm('确定取消申请吗?一经取消7天内无法再次申请', function (index) {
                        var cerid = data.cerRecordId;
                        $.ajax({
                            url:"${pageContext.request.contextPath}/zhengshu/xiugaicersqzhuangtai",//=servlet里要调用的方法名
                            async: true,//true异步请求，false同步请求，不写默认true，ajax嵌套时需要同步请求
                            type: "post",//请求方式
                            data: "cerid="+cerid,//要提交的数据
                            dataType: "text",//响应的格式
                            success:function (msg) {
                                if(msg=="success"){
                                    <%--location.href=  "${pageContext.request.contextPath}/zhengshu/getcersqlist";--%>
                                    table.reload("testReload");
                                    layer.close(index);
                                }else {
                                    layer.msg("网络中断，请重启或者联系运营商", {icon: 5});
                                }
                            }
                        });
                    });
                } else if (obj.event === 'daifukuan') {
                    var fileid = data.field.fieldId;
                    var cerid = data.cerRecordId;
                    console.log("当前id"+fileid);
                    $.ajax({
                        url:"${pageContext.request.contextPath}/zhengshu/getzssqfeiyong",//=servlet里要调用的方法名
                        async: true,//true异步请求，false同步请求，不写默认true，ajax嵌套时需要同步请求
                        type: "post",//请求方式
                        data: "fileid="+fileid,//要提交的数据
                        dataType: "text",//响应的格式
                        success:function (msg) {
                            layer.confirm('确定支付'+msg+'元', function (index) {
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
                                location.href='${pageContext.request.contextPath}/zhifubao/alipayTradePagePay?WIDout_trade_no='+sNow+'&WIDtotal_amount='+msg+'&WIDsubject='+xinxi+'&cerRecordlastid='+cerid;
                            });
                        }
                    });

                } else if (obj.event === 'downxuqiu') {
                    var fileid = data.field.fieldId;
                    var filename = data.field.fieldName;
                        layer.confirm('是否下载:' + filename + '的证书项目需求', function (index) {
                        location.href="${pageContext.request.contextPath}/zhengshu/filedownload?fileid="+fileid;

                    });
                }
            });
            var $ = layui.$, active = {
                reload: function () {
                    //执行重载
                    table.reload('testReload', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        , where: {
                            fieldName: $('#fieldName').val(),
                            top: $('#top').val(),
                            down: $('#down').val(),
                        }
                    }, 'data');
                }
            };

            $('.demoTable .layui-btn').on('click', function () {
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
        });
    }
</script>

</body>
</html>
