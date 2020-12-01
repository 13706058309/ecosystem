<%--
  Created by IntelliJ IDEA.
  User: WTQ
  Date: 2020/11/20
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台已获得证书</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
</head>
<style>
    /* 弹窗 (background) */
    .modal {
        display: none; /* 默认隐藏 */
        position: fixed;
        z-index: 1;
        padding-top: 100px;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4);
    }

    /* 弹窗内容 */
    .modal-content {
        position: relative;
        background-color: #fefefe;
        margin: auto;
        padding: 0;
        border: 1px solid #888;
        width: 800px;
        height: 600px;
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
        -webkit-animation-name: animatetop;
        -webkit-animation-duration: 0.4s;
        animation-name: animatetop;
        animation-duration: 0.4s
    }

    /* 添加动画 */
    @-webkit-keyframes animatetop {
        from {top:-300px; opacity:0}
        to {top:0; opacity:1}
    }

    @keyframes animatetop {
        from {top:-300px; opacity:0}
        to {top:0; opacity:1}
    }

    /* 关闭按钮 */
    .close {
        color: white;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

    .modal-header {
        padding: 2px 5px;
        background-color: #009688;
        color: white;

    }

    .modal-body {
        padding: 2px 16px;
        height: 600px;
    }
</style>
<script>
    function kongzhiimg(id){
        // 获取 <span> 元素，用于关闭弹窗
        var modal = document.getElementById(id);
        modal.style.display = "block";
    }
    function guanbi(id) {
        // 获取 <span> 元素，用于关闭弹窗
        $('#ming').text("");
        $('#mingcheng').text("");
        $('#shijian').text("");
        $('#cshiren').text("");
        $('#modal-body').css("background-image","url()");
        var modal = document.getElementById("modal");
        modal.style.display = "none";
    }
</script>
<body>


<div id="body">
    <div id="container" >
        <div class="demoTable">

            查询条件:
            <div class="layui-inline">
                <input class="layui-input" type="date" id="top" name="top" autocomplete="off">
            </div >至
            <div class="layui-inline">
                <input type="date" class="layui-input" id="down" name="down" autocomplete="off">
            </div>
            证书类型：
            <div class="layui-inline">
                <input class="layui-input" name="fieldName" id="fieldName" style="width: 250px;height: 40px" type="text" autocomplete="off" placeholder="请输入文档标题" >
            </div>
            申请人：
                <div class="layui-inline">
                <input class="layui-input" name="trueName" id="trueName" style="width: 250px;height: 40px" type="text" autocomplete="off" placeholder="请输入用户名" >
                </div>
            评审员：
                    <div class="layui-inline">
                    <input class="layui-input" name="bUserName" id="bUserName" style="width: 250px;height: 40px" type="text" autocomplete="off" placeholder="请输入审核员" >
            </div>
            <button class="layui-btn" data-type="reload">搜索</button>
        </div>
        <table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>
    </div>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="chakan">查看</a>
    <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="baogao">项目报告</button>
    <a class="layui-btn layui-bg-blue layui-btn-xs" lay-event="shipin">评审视频</a>
</script>
<!-- 弹窗 -->
<div id="modal" class="modal">

    <!-- 弹窗内容 -->
    <div class="modal-content" style="margin-top: -40px">
        <div class="modal-header">
            <span class="close" onclick="guanbi()">&times;</span>
            <h2 id="ming" style="text-align: center"></h2>
        </div>
        <div class="modal-body" id="modal-body" style="background-size:100% 100%;">
            <label id="mingcheng"style="position: absolute;top: 370px;left: 100px;font-size: 25px"></label>
            <label id="zhengshulei" style="position: absolute;top: 354px;left: 355px;font-size: 40px"></label>
            <label id="shijian" style="position: absolute;top: 522px;left: 500px"></label>
            <label id="cshiren" style="position: absolute;top: 495px;left: 475px"></label>

        </div>

    </div>

</div><input id="path" type="hidden" value="${pageContext.request.contextPath}" >
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    window.onload=function () {
        var path = $('#path').val();
        console.log('adasd'+path)
        layui.use('table', function () {
            var table = layui.table;

            //方法级渲染
            table.render({
                elem: '#LAY_table_user'
                , url: '${pageContext.request.contextPath}/backzhengshu/getbackceruserlist'
                , cols: [[
                    {type: 'numbers', title: 'ID', width: 80}
                    , {templet: '<div>{{d.cerRecord.trueName}}</div>',title: '申请人', width: 120}
                    , {templet: '<div>{{d.cerRecord.cerPhone}}</div>', title: '联系号码', width: 200}
                    , {templet: '<div>{{d.backUser.bUserName}}</div>', title: '评审员', width: 120}
                    , {field: 'gainTime',title: '获得时间', width: 200 ,sort: true}
                    , {field: 'name',title: '证书', width: 100, sort: true}
                    , {templet: '<div>{{d.cerRecord.cerFinalScore}}</div>', title: '总分数', width: 100}
                    , {field: 'score', title: '操作', width: 250, align: 'center', toolbar: '#barDemo'}
                ]]
                , id: 'testReload'
                , page: true
                ,Width:800
                , height: 500
            });

            table.on('tool(user)', function (obj) {
                var data = obj.data;
                if (obj.event === 'chakan') {
                    var url = data.url;
                    var ming = data.name;
                    var mingzi = data.cerRecord.trueName;
                    var shijian = data.gainTime;
                    var xxx = data.backUser.bUserName;

                    $('#ming').text(ming+"证书");
                    $('#mingcheng').text(mingzi);
                    $('#zhengshulei').text(ming);
                    $('#shijian').text(shijian);
                    $('#cshiren').text(xxx+"/人才生态系统计算机语言认证中心");
                    $('#modal-body').css("background-image","url("+path+url+")");
                    var modal = document.getElementById("modal");
                    modal.style.display = "block";

                } else if (obj.event === 'baogao') {
                     var mingzi = data.cerRecord.trueName;
                     var id = data.cerId;
                    layer.confirm('是否下载:' + mingzi + '的项目报告', function (index) {
                        layer.closeAll();//关闭所有的弹出层
                        location.href='${pageContext.request.contextPath}/zhengshu/finaldownload?cerid='+id;
                    });
                } else if (obj.event === 'shipin') {
                    var mingzi = data.cerRecord.trueName;
                    var id = data.cerId;
                    layer.confirm('是否下载:' + mingzi + '的评审视频', function (index) {
                        layer.closeAll();//关闭所有的弹出层
                        location.href='${pageContext.request.contextPath}/backzhengshu/psvideodownload?cerid='+id;
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
                            trueName: $('#trueName').val(),
                            bUserName: $('#bUserName').val(),
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
