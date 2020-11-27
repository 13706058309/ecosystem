<%--
  Created by IntelliJ IDEA.
  User: lxz
  Date: 2020/10/13
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>企业管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../JS/layui/css/layui.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <input id="path" type="hidden" value="${pageContext.request.contextPath}">

</head>

<body>

<script src="${pageContext.request.contextPath}/jquery-3.5.1.js"></script>
<script charset="UTF-8" src="${pageContext.request.contextPath}/js/value.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<form class="layui-form" action="denglujieguo" method="post">
    <div class="demoTable">
        <div class="layui-form-item" style="margin-left: 250px">
            <div class="layui-inline" style="margin-top: 20px">
                <label class="layui-form-label">企业名称</label>
                <div class="layui-input-inline" style="width: 100px;">
                    <input type="text" name="compName" id="compName" autocomplete="off" class="layui-input"
                           style="width: 195px">
                </div>
            </div>

            <%--            <div class="layui-inline" style="margin-top: 20px;margin-left: 20px">--%>
            <%--                <label class="layui-form-label">状态</label>--%>
            <%--                <div class="layui-input-inline" style="width: 195px;">--%>
            <%--                    <select name="stateId" id="stateId" lay-verify="required" style="margin-top: 140px">&ndash;%&gt;--%>
            <%--                        <option value=""></option>--%>
            <%--                        <option value="1">审核通过</option>--%>
            <%--                        <option value="2">审核不通过</option>--%>
            <%--                    </select>--%>
            <%--                </div>--%>
            <%--            </div>--%>
        </div>

        <div class="layui-form-item" style="margin-left: 550px;margin-top: -47px;">
            <button type="button" class="layui-btn" style="margin-top: -10px;margin-left: 200px;width: 75px"
                    data-type="reload">搜索
            </button>
        </div>
        <table id="demo" lay-filter="test"></table>
        <script>
            layui.use('table', function () {
                var table = layui.table;
                //第一个实例
                table.render({
                    elem: '#demo'
                    , height: 510
                    , url: "${pageContext.request.contextPath}/test/enterprise"
                    , page: true //开启分页
                    , limits: [10, 20]
                    , limit: 10
                    , id: 'testReload'
                    , cols: [[ //表头
                        {field: 'bUserId', title: '序列', width: 80, sort: true, fixed: 'left'}
                        , {field: 'compName', title: '企业名称', width: 280}
                        , {field: 'contactInfo', title: '联系方式', width: 180, sort: true}
                        , {field: 'bUserName', title: '申请人', width: 180, sort: true}
                        , {field: 'bRegTime', title: '申请时间', width: 230, sort: true}
                        , {field: '', title: '操作', width: 300, toolbar: "#bar", align: "center"}
                    ]]
                });
                var $ = layui.$, active = {
                    reload: function () {
                        //执行重载
                        table.reload('testReload', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            },
                            where: {
                                compName: $('#compName').val(),
                                stateId: $('#stateId').val(),
                            }
                        }, 'data');
                    }
                };
                $('.demoTable .layui-btn').on('click', function () {
                    var type = $(this).data('type');
                    active[type] ? active[type].call(this) : '';
                });

                table.on('tool(test)', function (obj) {
                    var data = obj.data //获得当前行数据
                        , layEvent = obj.event; //获得 lay-event 对应的值
                    if (layEvent === 'approved') {//如果点击的是审核通过
                        layer.confirm('确定审核通过吗？', function (index) {
                            var bUserId = data.bUserId;
                            var stateId = data.stateId;
                            if (stateId == 3) {
                                stateId = 1;
                            } else if (stateId == 2) {
                                stateId = 1;
                            }
                            $.ajax({
                                url: "${pageContext.request.contextPath}/test/changeEnterpriseState",
                                type: "post",
                                async: true,
                                data: "bUserId=" + bUserId + "&stateId=" + stateId,
                                typeData: "text", //数据类型
                                success: function (data) {
                                    if (data == "success") {
                                        alert("修改状态成功了");
                                        obj.del(); //删除对应行（tr）的DOM结构
                                        layer.close(index);
                                    } else {
                                        alert("修改状态失败了");
                                    }
                                },
                                error: function () { //请求失效时执行的函数
                                    alert("网络繁忙");
                                }
                            })
                        })

                    } else if (layEvent === 'notApproved') {//如果点击审核不通过
                        layer.confirm('确定审核不通过吗？', function (index) {
                            var bUserId = data.bUserId;
                            var stateId = data.stateId;
                            if (stateId == 1) {
                                stateId = 2;
                            } else if (stateId == 3) {
                                stateId = 2;
                            }
                            $.ajax({
                                url: "${pageContext.request.contextPath}/test/changeEnterpriseState",
                                type: "post",
                                async: true,
                                data: "bUserId=" + bUserId + "&stateId=" + stateId,
                                typeData: "text", //数据类型
                                success: function (data) {
                                    if (data == "success") {
                                        alert("修改状态成功");
                                        obj.del(); //删除对应行（tr）的DOM结构

                                        layer.close(index);
                                    } else {
                                        alert("修改状态失败了");
                                    }
                                },
                                error: function () { //请求失效时执行的函数
                                    alert("网络繁忙");
                                }
                            })
                        })

                    } else if (layEvent === 'download') {//点击下载
                        var datas = obj.data
                        var bUserId = datas.bUserId;
                        location.href = "${pageContext.request.contextPath}/test/upload?bUserId=" + bUserId;
                        <%--alert("下载");--%>
                        <%--var data = obj.data //获得当前行数据--%>
                        <%--    , layEvent = obj.event; //获得 lay-event 对应的值--%>
                        <%--var bUserId = data.bUserId;--%>
                        <%--var compName = data.compName;--%>
                        <%--var contactInfo = data.contactInfo;--%>
                        <%--var bUserName = data.bUserName;--%>
                        <%--var bRegTime = data.bRegTime;--%>
                        <%--// alert("获取id" + bUserId);--%>
                        <%--// alert("获取名字" + compName);--%>
                        <%--// alert("获取手机号" + contactInfo);--%>
                        <%--// alert("获取时间" + bRegTime);--%>
                        <%--$.ajax({--%>
                        <%--    url: "${pageContext.request.contextPath}/test/upload",--%>
                        <%--    type: "post",--%>
                        <%--    async: true,--%>
                        <%--    data: "bUserId=" + bUserId + "&compName=" + compName + "&contactInfo=" + contactInfo + "&bUserName=" + bUserName + "&bRegTime=" + bRegTime,--%>
                        <%--    typeData: "text", //数据类型--%>
                        <%--    success: function (data) {--%>
                        <%--       alert("下载成功")--%>
                        <%--    },--%>
                        <%--    error: function () { //请求失效时执行的函数--%>
                        <%--        alert("网络繁忙");--%>
                        <%--    }--%>
                        <%--})--%>
                    }
                });
            });
        </script>
        <script type="text/html" id="bar">

            <a class="layui-btn layui-btn-sm" lay-event="approved" id="approved">审核通过</a>
            <a class="layui-btn layui-btn-sm" lay-event="notApproved" id="notApproved">审核不通过</a>
            <a class="layui-btn layui-btn-sm" lay-event="download" id="download">下载</a>


<%--            {{#  if(d.stateId == 2){ }}--%>
<%--            <a class="layui-btn  layui-btn-sm" lay-event="approved">审核通过</a>--%>
<%--            <a class="layui-btn  layui-btn-sm" lay-event="notApproved">审核不通过</a>--%>
<%--            <a class="layui-btn  layui-btn-sm" lay-event="download">下载</a>--%>
<%--            {{#  } }}--%>

<%--            {{#  if(d.stateId == 3){ }}--%>
<%--            <a class="layui-btn  layui-btn-sm" lay-event="approved">审核通过</a>--%>
<%--            <a class="layui-btn  layui-btn-sm" lay-event="notApproved">审核不通过</a>--%>
<%--            <a class="layui-btn  layui-btn-sm" lay-event="download">下载</a>--%>
<%--            {{#  } }}--%>
        </script>
    </div>
    </div>
</form>


</body>
</html>
