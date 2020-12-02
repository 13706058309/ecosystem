<%--
  Created by IntelliJ IDEA.
  User: WTQ
  Date: 2020/11/22
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台证书申请列表</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">

</head>
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
            <div class="layui-inline"><input class="layui-input" name="fieldName" id="fieldName" style="width: 250px;height: 40px" type="text" autocomplete="off" placeholder="请输入文档标题" ></div>
            申请人：
            <div class="layui-inline"><input class="layui-input" name="trueName" id="trueName" style="width: 250px;height: 40px" type="text" autocomplete="off" placeholder="请输入申请人" ></div>
            <button class="layui-btn" data-type="reload">搜索</button>
        </div>
        <table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>
    </div>
</div>
<script type="text/html" id="barDemo">

    <a class="layui-btn  layui-btn-primary  layui-btn-xs" lay-event="chakancs">查看</a>

    {{#  if(d.stateId==22){ }}
    <a class="layui-btn layui-bg-orange layui-btn-xs" lay-event="shenhe">审核</a>
    {{#  } }}

    {{#  if(d.stateId==23){ }}
    <a class="layui-btn layui-bg-red layui-btn-xs" lay-event="quxiao">取消</a>
    {{#  } }}
</script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<div class="layui-row" id="popUpdateTest" style="display:none">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane"  style="text-align: center;margin-top: 30px">
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">当前:</label>
                <div class="layui-input-block">
                    <label class="layui-form-label" style="width: 220px" id="shenqingtext"></label>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top:60px">
                <div class="layui-input-block" style="margin-left: 20px">
                    <button class="layui-btn " type="button"  lay-submit lay-filter="demo11">申请通过</button>
                    <button class="layui-btn layui-bg-red " type="button"  lay-submit lay-filter="demo22">申请失败</button>
                    <button class="layui-btn " type="button"  lay-submit lay-filter="demo33">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="layui-row" id="chakanUpdateTest" style="display:none">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane"  style="text-align: center;margin-top: 30px">
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">申请人</label>
                <div class="layui-input-block">
                    <input type="text" name="username" id="username" readonly  unselectable="on"  autocomplete="off" placeholder="请输入测试成绩" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">身份证</label>
                <div class="layui-input-block">
                    <input type="text" name="usershenfen" id="usershenfen"   readonly  unselectable="on"  autocomplete="off" placeholder="请输入测试成绩" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">联系电话</label>
                <div class="layui-input-block">
                    <input type="text" name="userphone"   id="userphone"  readonly  unselectable="on" autocomplete="off" placeholder="请输入测试成绩" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">申请时间</label>
                <div class="layui-input-block">
                    <input type="text" name="begintime"   id="begintime"  readonly  unselectable="on" autocomplete="off" placeholder="请输入测试成绩" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">证书类型</label>
                <div class="layui-input-block">
                    <input type="text" name="zhengshuss"   id="zhengshuss"   readonly  unselectable="on"  autocomplete="off" placeholder="请输入测试成绩" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">当前状态</label>
                <div class="layui-input-block">
                    <input type="text" name="zhuangtais"   id="zhuangtais"   readonly  unselectable="on"  autocomplete="off" placeholder="请输入测试成绩" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top:60px">
                <div class="layui-input-block" style="margin-left: 20px">
                    <button class="layui-btn " type="button"  lay-submit lay-filter="demo44">确认</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    window.onload=function () {
        layui.use(['table', 'form'], function () {
            var table = layui.table;
            var form = layui.form;
            //方法级渲染
            table.render({
                elem: '#LAY_table_user'
                , url: '${pageContext.request.contextPath}/backzhengshu/getbackSQshenhelist'
                , cols: [[
                    {type: 'numbers', title: 'ID', width: 60}
                    , {field: 'trueName',title: '申请人', width: 100}
                    , {field: 'cerPhone',title: '联系号码', width: 120}
                    , {templet: '<div>{{d.field.fieldName}}</div>', title: '证书类型', width: 80}
                    , {field: 'beginTime',title: '申请时间', width: 120}
                    , {field: 'turnoverTime',title: '更新时间', width: 120}
                    , {templet: '<div>{{d.state.paramName}}</div>', title: '当前状态',  width: 100}
                    , {field: 'score', title: '操作', width: 258, align: 'center', toolbar: '#barDemo'}
                ]]
                , id: 'testReload'
                , page: true
                , height: 500

            });

            table.on('tool(user)', function (obj) {
                var data = obj.data;
                if (obj.event === 'shenhe') {
                    var name = data.trueName;
                    var fieldname = data.field.fieldName;
                    var cerid = data.cerRecordId;
                    $('#shenqingtext').text("审核"+name+"申请"+fieldname+"证书请求")
                    layer.open({
                        //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                        type: 1,
                        title: "审核"+name+"的申请记录",
                        area: ['600px', '300px'],
                        offset: 'auto',
                        content: $("#popUpdateTest") //引用的弹出层的页面层的方式加载修改界面表单
                    });
                    form.on('submit(demo11)', function(massage) {
                        layer.confirm('是否确认申请成功', function (index) {
                            xiugaistandid('25',cerid);
                        });
                    });
                    form.on('submit(demo22)', function(massage) {
                        layer.confirm('是否确认申请失败', function (index) {
                            xiugaistandid('24',cerid);
                        });
                    });
                    form.on('submit(demo33)', function(massage) {
                        layer.closeAll();
                    });
                }
                else  if (obj.event === 'quxiao') {
                    var cerid = data.cerRecordId;
                    layer.confirm('是否确认申请失败', function (index) {
                        xiugaistandid('24',cerid);
                    });
                }
                else  if (obj.event === 'chakancs') {
                    var name = data.trueName;
                    $('#username').val(name);
                    $('#usershenfen').val(data.idNumber);
                    $('#userphone').val(data.cerPhone);
                    $('#begintime').val(data.beginTime);
                    $('#zhengshuss').val(data.field.fieldName);
                    $('#zhuangtais').val(data.state.paramName);
                    layer.open({
                        //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                        type: 1,
                        title: "查看当前"+name+"申请记录",
                        area: ['500px', '500px'],
                        offset: 'auto',
                        content: $("#chakanUpdateTest") //引用的弹出层的页面层的方式加载修改界面表单
                    });
                    form.on('submit(demo44)', function(massage) {
                        layer.closeAll();
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

    function xiugaistandid(standid,cerid) {
        $.ajax({
            url:  '${pageContext.request.contextPath}/backzhengshu/upbackzhengshustandid?standid='+standid+'&cerid='+cerid,//请求服务端地址值
            async: true,
            type: "post",//请求方式
            dataType: "text",
            success: function (msg) {
                if (msg=='success'){
                    layer.msg('确认成功', {icon: 6});
                    layer.closeAll();//关闭所有的弹出层
                    location.href='${pageContext.request.contextPath}/backzhengshu/backSQchulizhengshuliebiao';
                }else if (msg=='fail'){
                    layer.msg('确认失败，网络波动', {icon: 5});
                }
            }
        });
    }
</script>

</body>
</html>
