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
    <title>管理员管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

</head>

<body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script charset="UTF-8" src="${pageContext.request.contextPath}/js/value.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

<form class="layui-form" method="post">
    <div class="demoTable" style="margin-left: 0%">
        <div class="layui-form-item" style="margin-left: 10px">
            <div class="layui-inline" style="margin-top: 20px">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline" style="width: 100px;">
                    <input type="text" name="bUserName" id="bUserName" autocomplete="off" class="layui-input"
                           style="width: 195px">
                </div>
            </div>

            <div class="layui-inline" style="margin-top: 20px;margin-left: 10px">
                <label class="layui-form-label">状态</label>
                <div class="layui-input-inline" style="width: 195px;">
                    <select name="stateIdd" id="stateIdd" lay-verify="required" style="margin-top: 140px">
                        <option value=""></option>
                        <option value="1">启用</option>
                        <option value="2">禁用</option>
                    </select>
                </div>
            </div>

            <div class="layui-inline" style="margin-top: 20px;margin-left: 10px">
                <label class="layui-form-label">角色</label>
                <div class="layui-input-inline" style="width: 195px;">
                    <select name="type" id="type" lay-verify="required" style="margin-top: 140px">
                        <option value="">请选择</option>
                        <%--                        <option value="1">企业</option>--%>
                        <%--                        <option value="2">高校</option>--%>
                        <%--                        <option value="3">管理员</option>--%>
                        <%--                        <option value="4">测试</option>--%>
                        <%--                        <option value="5">评审</option>--%>
                        <%--                        <option value="6">审核</option>--%>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item" style="margin-left: 550px;margin-top: -47px;">
            <button type="button" class="layui-btn" style="margin-top: -9px;margin-left: 450px;width: 75px"
                    data-type="reload">搜索
            </button>

        </div>
        <div class="layui-form-item" style="margin-left: 550px;margin-top: -47px;">
            <button type="button" class="layui-btn" style="margin-top: -6px;margin-left: 610px;width: 105px" id="Info">
                新增
            </button>
        </div>
    </div>
    <%--    -----------------------------------------------------------------------------------------------%>
    <div class="Manager" style="margin-left: 0%">
        <div class="container" id="home" style="display:none">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名：</label>
                <div class="layui-input-inline">
                    <input type="text" id="UserName" name="UserName" placeholder="请输入用户名" class="layui-input">
                </div>
                <label class="layui-form-label">账号：</label>
                <div class="layui-input-inline">
                    <input type="text" id="account" name="account" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">密码：</label>
                <div class="layui-input-inline">
                    <input type="password" id="pwd" name="pwd" class="layui-input">
                </div>
                <label class="layui-form-label">联系方式：</label>
                <div class="layui-input-inline">
                    <input type="text" id="contactInfo" name="contactInfo" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <button type="button" class="layui-btn" style="margin-top: 30px;margin-left: 220px;width: 200px"
                        id="commit">
                    提交
                </button>
            </div>
        </div>
    </div>
    <%---------------------------------------------------------------------------------------------------%>
    <div class="container" id="role" style="display:none">
        <div class="layui-form-item" style="margin-top: 20px;margin-left: 20px">
            <label class="layui-form-label">角色：</label>
            <div class="layui-input-inline">
                <select id="roles" name="roles" class="layui-form-select">
                    <option value="" selected="selected">请选择角色</option>
<%--                    <option value="2">高校</option>--%>
<%--                    <option value="3">管理员</option>--%>
<%--                    <option value="4">测试</option>--%>
<%--                    <option value="5">评审</option>--%>
<%--                    <option value="6">审核</option>--%>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <button type="button" class="layui-btn" style="margin-top: 100px;margin-left: 130px;width: 200px"
                    id="commits">
                提交
            </button>
        </div>
    </div>
    <%-----------------------------------------------------------------------------------------------%>
    <div class="roleManager" style="margin-left: 0%">
        <div class="container" id="school" style="display:none">
            <div class="layui-form-item">
                <label class="layui-form-label">校长：</label>
                <div class="layui-input-inline">
                    <input type="text" id="headmaster" name="headmaster" class="layui-input">
                </div>
                <label class="layui-form-label">账号：</label>
                <div class="layui-input-inline">
                    <input type="text" id="number" name="number" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">密码：</label>
                <div class="layui-input-inline">
                    <input type="password" id="password" name="password" class="layui-input">
                </div>
                <label class="layui-form-label">联系方式：</label>
                <div class="layui-input-inline">
                    <input type="text" id="contact" name="contact" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">学校简介：</label>
                <div class="layui-input-inline">
                    <input type="text" id="infoIntr" name="infoIntr" class="layui-input">
                </div>

                <label class="layui-form-label">邮箱：</label>
                <div class="layui-input-inline">
                    <input type="text" id="emails" name="emails" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">学校地址：</label>
                <div class="layui-input-inline">
                    <input type="text" id="schooladdress" name="schooladdress" class="layui-input">
                </div>

                <label class="layui-form-label">校名：</label>
                <div class="layui-input-inline">
                    <input type="text" id="names" name="names" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">校训：</label>
                <div class="layui-input-inline">
                    <input type="text" id="schoolMotto" name="schoolMotto" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <button type="button" class="layui-btn" style="margin-top: 30px;margin-left: 220px;width: 200px"
                        id="save">
                    提交
                </button>
            </div>
        </div>
    </div>
    <%--    ------------------------------------------------------------------------------------------------%>
</form>
<table id="demo" lay-filter="test" style="margin-left: -600px"></table>
<script>
    var layer;
    var path = $("#path").val();
    var docID;
    var objs;
    var index;
    var form;
    var roleId;
    var state = 1;

    //手机号验证方法
    $("#contact").blur(function () {
        var pattern = /0?(13|14|15|18|17)[0-9]{9}/;
        if(!pattern.test($(this).val())){
            alert("请输入正确手机号");
            $(this).val("");
        }
    })
    $("#contactInfo").blur(function () {
        var pattern = /0?(13|14|15|18|17)[0-9]{9}/;
        if(!pattern.test($(this).val())){
            alert("请输入正确手机号");
            $(this).val("");
        }
    });

    $("#emails").blur(function () {
        var pattern = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        if(!pattern.test($(this).val())){
            layer.msg("请输入正确邮箱格式");
            $(this).val("");
        }
    })

    layui.use(['laydate', 'layer', 'form'], function () {
        form = layui.form;
        form.render();
        var laydate = layui.laydate;
        layer = layui.layer;
        laydate.render({
            elem: '#startTime'
        });

        laydate.render({
            elem: '#endTime'
        });
    })

    $(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/test/findAll",
            type: "post",
            typeData: "text",
            success: function (data) {
                var arr = JSON.parse(data);
                $("#type").empty();
                var $sel = $("<option>" + '请选择' + "</option>");
                $("#type").append($sel)
                for (var i = 0; i < arr.length; i++) {
                    var $option = $("<option>" + arr[i].roleName + "</option>");
                    $("#type").append($option);
                }
                form.render();
            },
        });
    })


    $(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/test/findRole",
            type: "post",
            typeData: "text",
            success: function (data) {
                var arr = JSON.parse(data);
                $("#roles").empty();
                var $sel = $("<option>" + '' + "</option>");
                $("#roles").append($sel)
                for (var i = 0; i < arr.length; i++) {
                    var $option = $("<option>" + arr[i].roleName + "</option>");
                    $("#roles").append($option);
                }
                form.render();
            },
        });
    })

    var index;
    layui.use('table', function () {
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            , height: 470
            , url: "${pageContext.request.contextPath}/test/getTableInfoManage"
            , page: true //开启分页
            , limits: [10, 20]
            , limit: 10
            , id: 'testReload'
            , cols: [[ //表头
                {field: 'bUserId', title: '序列', width: 80, sort: true, fixed: 'left', align: "center"}
                , {field: 'bUserName', title: '用户名', width: 180, align: "center"}
                , {field: 'account', title: '账号', width: 180, align: "center", sort: true}
                , {field: 'contactInfo', title: '联系方式', width: 180, sort: true, align: "center"}
                , {
                    field: 'roleName',
                    title: '角色',
                    width: 280,
                    align: "center",
                    templet: '<div>{{d.roleInfo.roleName}}</div>'
                }
                , {
                    field: 'stateId', title: '账号状态', width: 180, align: "center", templet: function (d) {
                        if (d.stateId == 1) {
                            return '启用';
                        } else if (d.stateId == 2) {
                            return '禁用';
                        } else if (d.stateId == 3) {
                            return '已删除';
                        }
                    }
                }
                , {field: '', title: '操作', width: 240, toolbar: "#bar", align: "center"}
            ]],
        })
        var $ = layui.$, active = {
            reload: function () {
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                    where: {
                        bUserName: $('#bUserName').val(),
                        stateId: $('#stateIdd').val(),
                        type: $('#type').val(),
                    }
                }, 'data');
            }
        };
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        $('#Info').on('click', function (obj) {//点击新增按钮
            layer.open({
                type: 1,
                skin: 'myDiv', //加上边框
                area: ['450px', '400px'], //宽高
                content: $('#role'),//打开选择角色界面
            });
            $('#commits').on('click', function (obj) {//选择好了角色。点击提交按钮
                var roleIds = $("#roles").val();
                stateId = state;
              if(roleIds.length==0){
                  alert("请先选择角色");
                  return false;
              }
                if (roleIds == '高校') {
                    roleIds=2;
                    layer.open({
                        type: 1,
                        skin: 'myDiv', //加上边框
                        area: ['650px', '400px'], //宽高
                        content: $('#school'),//打开选择角色界面
                    });
                    $('#save').on('click', function (obj) {//填写学校好了内容。点击提交按钮
                        var bUserName = $("#headmaster").val();
                        var account = $("#number").val();
                        var pwd = $("#password").val();
                        var contactInfo = $("#contact").val();
                        var address = $("#schooladdress").val();
                        var infoIntr = $("#infoIntr").val();//学校简介
                        var email = $("#emails").val();
                        var compName = $("#names").val();
                        var coreValue = $("#schoolMotto").val();

                        if (bUserName.length == 0) {
                            layer.msg("校长名称不能为空");
                            return false;
                        }
                        if (bUserName.length > 6) {
                            layer.msg("校长名称不能大于6个字");
                            return false;
                        }
                        if (account.length == 0) {
                            layer.msg("账号不能为空");
                            return false;
                        }
                        if (pwd.length == 0){
                            layer.msg("密码不能为空");
                            return false;
                        }
                        if (contactInfo.length == 0) {
                            layer.msg("联系方式不能为空");
                            return false;
                        }

                        if (infoIntr.length == 0){
                            layer.msg("学校简介不能为空");
                            return false;
                        }
                        if (email.length == 0){
                            layer.msg("邮箱不能为空");
                            return false;
                        }
                        if (address.length == 0){
                            layer.msg("地址不能为空");
                            return false;
                        }
                        if (compName.length == 0){
                            layer.msg("校名不能为空");
                            return false;
                        }
                        if (coreValue.length == 0){
                            layer.msg("校训不能为空");
                            return false;
                        }


                        $.ajax({
                            url: "${pageContext.request.contextPath}/test/addSchool",
                            type: "post",
                            async: true,
                            data: "bUserName=" + bUserName + "&account=" + account + "&pwd=" + pwd + "&contactInfo=" + contactInfo + "&address=" + address + "&infoIntr=" + infoIntr + "&email=" + email + "&roleIds=" + roleIds + "&stateId=" + stateId + "&compName=" + compName + "&coreValue=" + coreValue,
                            dataType: "text",
                            beforeSend: function () {
                                return confirm("确定提交吗？");
                            },
                            success: function (data) {//请求成功后，返回的结果--%>
                                if (data == 'success') {
                                    alert("新增成功");
                                } else if (data == 'failed') {
                                    alert("新增失败");
                                } else if (data == 'existing') {
                                    alert("该账号已存在");
                                } else if(data == 'exist'){
                                    alert("该手机号已存在");
                                }
                                window.parent.location.reload();
                                layer.closeAll();
                            }
                        });
                    })
                } else {
                    var roleIds = $("#roles").val();
                    // alert("打印一下角色ID"+roleIds);
                    if(roleIds=='管理员'){
                        roleIds=3;
                    }else if(roleIds=='测试'){
                        roleIds=4;
                    }else if(roleIds=='评审'){
                        roleIds=5;
                    }else if(roleIds=='审核'){
                        roleIds=6;
                    }
                    layer.open({
                        type: 1,
                        skin: 'myDiv', //加上边框
                        area: ['650px', '400px'], //宽高
                        content: $('#home'),//打开选择角色界面
                    });
                    $('#commit').on('click', function (obj) {//填写好了管理员内容。点击提交按钮

                        var bUserName = $("#UserName").val();
                        var account = $("#account").val();
                        var pwd = $("#pwd").val();
                        var contactInfo = $("#contactInfo").val();

                        if (bUserName.length == 0) {
                            layer.msg("用户名不能为空");
                            return false;
                        }
                        if (bUserName.length > 6) {
                            layer.msg("用户名不能大于6个字");
                            return false;
                        }
                        if (account.length == 0) {
                            layer.msg("账号不能为空");
                            return false;
                        }
                        if (pwd.length == 0) {
                            layer.msg("密码不能为空");
                            return false;
                        }
                        if (contactInfo.length == 0) {
                            layer.msg("手机号不能为空");
                            return false;
                        }
                        $.ajax({
                            url: "${pageContext.request.contextPath}/test/add",
                            type: "post",
                            async: true,
                            data: "bUserName=" + bUserName + "&account=" + account + "&pwd=" + pwd + "&contactInfo=" + contactInfo + "&roleIds=" + roleIds + "&stateId=" + stateId,
                            dataType: "text",
                            beforeSend: function () {
                                return confirm("确定提交吗？");
                            },
                            success: function (data) {//请求成功后，返回的结果--%>
                                if (data == 'success') {
                                    alert("新增成功");
                                } else if (data == 'failed') {
                                    alert("新增失败");
                                } else if (data == 'existing') {
                                    alert("该账号已存在");
                                }else if(data == 'exist'){
                                    alert("该手机号已存在");
                                }
                                window.parent.location.reload();
                                layer.closeAll();
                            }
                        });
                    })
                }
            })

        })
        table.on('tool(test)', function (obj) {
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'disable') {
                var bUserId = data.bUserId;
                var stateId = data.stateId;
                if (stateId == 1) {
                    stateId = 2;
                } else if (stateId == 2) {
                    stateId = 1;
                } else if (stateId == 3) {
                    stateId = 3;
                }
                $.ajax({
                    url: "${pageContext.request.contextPath}/test/changeBackUserState",
                    type: "post",
                    async: true,
                    data: "bUserId=" + bUserId + "&stateId=" + stateId,
                    typeData: "text", //数据类型
                    beforeSend: function () {
                        return confirm("确定修改吗？");
                    },
                    success: function (data) {
                        // alert(stateId+"只能为1,2,3,这个是什么值");
                        if (data == "success") {
                            alert("修改状态成功了");
                            if (stateId == 1) {
                                obj.update({
                                    stateId: stateId,
                                    title: stateId == 1 ? '禁用' : '启用',
                                })
                                obj.tr.find('#open').text("禁用");
                                obj.tr.find('#disopen').text("禁用");
                            }
                            if (stateId == 2) {
                                obj.update({
                                    stateId: stateId,
                                    title: stateId == 1 ? '禁用' : '启用',
                                })
                                obj.tr.find('#open').text("启用");
                                obj.tr.find('#disopen').text("启用");
                            }
                            if (stateId == 3) {
                                obj.update({
                                    stateId: stateId,
                                    title: stateId == 1 || stateId == 2 || stateId == 3 ? '已删除' : '已删除',
                                })
                                obj.tr.find('#open').text("已删除");
                                obj.tr.find('#disopen').text("已删除");
                            }
                        } else{
                            alert("修改状态失败了");
                        }
                    },
                    error: function () { //请求失效时执行的函数
                        alert("网络繁忙");
                    }
                })

            } else if (layEvent === 'del') {
                layer.confirm('亲，真的要删除我吗？', function (index) {
                    var data = obj.data //获得当前行数据
                        , layEvent = obj.event; //获得 lay-event 对应的值
                    var bUserId = data.bUserId;
                    var stateId = data.stateId;
                    if (stateId == 1 || stateId == 2) {
                        stateId = 3;
                    }
                    $.ajax(
                        {
                            url: "${pageContext.request.contextPath}/test/deleteBackUser",
                            type: "post",
                            async: true,
                            data: "bUserId=" + bUserId + "&stateId=" + stateId,
                            dataType: "text",
                            success: function (data) {//请求成功后，返回的结果

                                obj.del(); //删除对应行（tr）的DOM结构
                                layer.close(index);
                                obj.update({
                                    stateId: stateId,
                                    title: stateId == 1 || stateId == 2 || stateId == 3 ? '已删除' : '已删除',
                                });
                                obj.tr.find('#delete').text("已删除");
                                obj.tr.find('#deleted').text("已删除");
                                if (data == "success") {
                                    alert("删除成功");
                                } else if (data == "failed") {
                                    alert("删除失败");
                                }
                            },
                        })
                });
            } else if (layEvent === 'resetPassword') {
                var data = obj.data //获得当前行数据
                    , layEvent = obj.event; //获得 lay-event 对应的值
                var bUserId = data.bUserId;
                var pwd1 = data.pwd;
                var pwd = $("#pwd1").val();
                // alert("当前用户id"+bUserId);
                // alert("当前密码为"+pwd1);
                // alert("当前密码为"+pwd);
                if (pwd == 123456) {
                    pwd = 111111;
                } else if (pwd == 111111) {
                    alert("密码已经为重置密码");
                    return false;
                } else {
                    pwd = 111111;
                }
                $.ajax(
                    {
                        url: "${pageContext.request.contextPath}/test/resetPassword",
                        type: "post",
                        async: true,
                        data: "bUserId=" + bUserId + "&pwd=" + pwd,
                        dataType: "text",
                        beforeSend: function () {
                            return confirm("确定要重置密码吗？");
                        },
                        success: function (data) {//请求成功后，返回的结果
                            alert("重置密码成功,密码为六个1");
                            obj.update({
                                pwd: pwd,
                            });

                        },
                    });
            }
        })
    });
</script>
<script type="text/html" id="bar">
    {{#  if(d.stateId == 1){ }}
    <a class="layui-btn layui-btn-sm" lay-event="disable" id="disopen">禁用</a>
    <a class="layui-btn layui-btn-sm" lay-event="del" id="delete">删除</a>
    <a class="layui-btn layui-btn-sm" lay-event="resetPassword" id="reset">重置密码</a>
    {{#  } }}

    {{#  if(d.stateId == 2){ }}
    <a class="layui-btn layui-btn-sm" lay-event="disable" id="open">启用</a>
    <a class="layui-btn layui-btn-sm" lay-event="del" id="deleted">删除</a>
    <a class="layui-btn layui-btn-sm" lay-event="resetPassword">重置密码</a>
    {{#  } }}

    {{#  if(d.stateId == 3){ }}
    已删除
    {{#  } }}
</script>
</form>

</body>
</html>
