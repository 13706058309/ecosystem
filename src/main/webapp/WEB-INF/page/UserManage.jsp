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
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <title>用户管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

</head>

<body>
<script src="${pageContext.request.contextPath}/jquery-3.5.1.js"></script>
<script charset="UTF-8" src="${pageContext.request.contextPath}/js/value.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

<form class="layui-form" method="post">
    <div class="demoTable" style="margin-left: 20%">
        <div class="layui-form-item" style="margin-left: 100px">
            <div class="layui-inline" style="margin-top: 20px">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline" style="width: 100px;">
                    <input type="text" name="userName" id="userName" autocomplete="off" class="layui-input" style="width: 195px">
                </div>
            </div>

            <div class="layui-inline" style="margin-top: 20px;margin-left: 20px">
                <label class="layui-form-label">状态</label>
                <div class="layui-input-inline"  style="width: 195px;">
                    <select id="accStandId" name="accStandId" lay-verify="required" style="margin-top: 140px">--%>
                        <option value=""></option>
                        <option value="1">启用</option>
                        <option value="2">禁用</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 550px;margin-top: -47px;">
            <button type="button" class="layui-btn" style="margin-top: -10px;margin-left: 200px;width: 75px" data-type="reload">搜索</button>
        </div>
    </div>
    <table id="demo" lay-filter="test" style="margin-left: -600px"></table>
    <script>
        layui.use('table', function () {
            var table = layui.table;
            //第一个实例
            table.render({
                elem: '#demo'
                , height: 470
                , url: "${pageContext.request.contextPath}/test/getTableInfo"
                , page: true //开启分页
                , limits: [10,20]
                , limit: 10
                , id: 'testReload'
                , cols: [[ //表头
                    {field: 'userId', title: '序列', width: 80, sort: true, fixed: 'left', align: "center"}
                    , {field: 'userName', title: '用户名', width: 180, align: "center"}
                    , {field: 'telephone', title: '手机号', width: 180, sort: true, align: "center"}
                    , {field: 'address', title: '地址', width: 180, align: "center"}
                    , {field: 'accStandId', title: '账号状态', width: 180, align: "center", templet: function (d) {
                            if (d.accStandId == 1){
                                return '启用';
                            }else if(d.accStandId == 2){
                                return '禁用';
                            }else if(d.accStandId == 3){
                                return '已删除';
                            }
                        }
                    }
                    , {field: '', title: '操作', width: 180, toolbar: "#bar", align: "center"}
                ]],
            });

            var $ = layui.$, active = {
                reload: function(){
                    //执行重载
                    table.reload('testReload', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        },
                        where: {
                            userName: $('#userName').val(),
                            accStandId: $('#accStandId').val(),
                        }
                    }, 'data');
                }
            };
            $('.demoTable .layui-btn').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
            table.on('tool(test)', function (obj) {
                var data = obj.data //获得当前行数据
                    , layEvent = obj.event; //获得 lay-event 对应的值
                if (layEvent === 'disable') {
                    var userId = data.userId;
                    var accStandId = data.accStandId;
                    if (accStandId == 1) {
                        accStandId = 2;
                    }else if (accStandId == 2){
                        accStandId = 1;
                    }else if(accStandId == 3){
                        accStandId=3;
                    }
                    $.ajax({
                        url: "${pageContext.request.contextPath}/test/changeUserState",
                        type: "post",
                        async: true,
                        data: "userId=" + userId + "&accStandId=" + accStandId,
                        typeData:"text", //数据类型
                        beforeSend: function () {
                            return confirm("确定修改吗？");
                        },
                        success: function (data) {
                            if (data == "success") {
                                alert("修改状态成功了");
                                if(accStandId==1){
                                    obj.update({
                                        accStandId: accStandId,
                                        title: accStandId==1?'禁用':'启用',
                                    })
                                    obj.tr.find('#open').text("禁用");//按钮是禁用 更新按钮
                                    obj.tr.find('#disopen').text("禁用");
                                };
                                if(accStandId==2){
                                    obj.update({
                                        accStandId: accStandId,
                                        title: accStandId==1?'禁用':'启用',
                                    })
                                    obj.tr.find('#open').text("启用");
                                    obj.tr.find('#disopen').text("启用");
                                };
                            } else{
                                alert("修改状态失败了");
                            }
                        },
                        error: function () { //请求失效时执行的函数
                            alert("网络繁忙");
                        }

                    });
                }else if(layEvent === 'del'){
                    layer.confirm('亲，真的要删除我吗？', function (index){
                        var data = obj.data //获得当前行数据
                            , layEvent = obj.event; //获得 lay-event 对应的值
                        var userId=data.userId;
                        var accStandId=data.accStandId;
                        if(accStandId==1||accStandId==2){
                            accStandId = 3;
                        }
                        $.ajax(
                            {
                                url:"${pageContext.request.contextPath}/test/deleteUser",
                                type: "post",
                                async: true,
                                data: "userId="+userId+"&accStandId="+accStandId,
                                dataType: "text",
                                success: function (data) {//请求成功后，返回的结果
                                    obj.del(); //删除对应行（tr）的DOM结构
                                    layer.close(index);
                                    obj.update({
                                        accStandId: accStandId,
                                        title: accStandId==1||accStandId==2||accStandId==3?'已删除':'已删除',
                                    })
                                    obj.tr.find('#delete').text("已删除");
                                    obj.tr.find('#deleted').text("已删除");
                                    if (data == "success") {
                                        alert("删除成功");
                                    } else if (data == "failed") {
                                        alert("删除失败");
                                    }
                                },
                            });
                    })
                }
            })
        });
    </script>
    <script type="text/html" id="bar">
        {{#  if(d.accStandId == 1){ }}
        <a class="layui-btn layui-btn-sm" lay-event="disable" id="disopen">禁用</a>
        <a class="layui-btn layui-btn-sm" lay-event="del" id="delete">删除</a>
        {{#  } }}

        {{#  if(d.accStandId == 2){ }}
        <a class="layui-btn layui-btn-sm" lay-event="disable" id="open">启用</a>
        <a class="layui-btn layui-btn-sm" lay-event="del" id="deleted">删除</a>
        {{#  } }}

        {{#  if(d.accStandId == 3){ }}
        已删除
        {{#  } }}
    </script>

</form>

</body>
</html>
