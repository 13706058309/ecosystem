<%--
  Created by IntelliJ IDEA.
  User: WTQ
  Date: 2020/11/20
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台测试证书项目</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">

</head>
<body>
<div id="body">
    <div id="container" >
        <table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>
    </div>
</div>
<script type="text/html" id="barDemo">

    <button class="layui-btn layui-bg-blue layui-btn-xs" lay-event="xiazai">下载证书项目</button>

    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="pingce">测评</a>

</script>

<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    window.onload=function () {

        layui.use(['table', 'form', 'upload'], function () {
            var table = layui.table;
            var form = layui.form;
            var $ = layui.jquery
                ,upload = layui.upload;


            //方法级渲染
            table.render({
                elem: '#LAY_table_user'
                , url: '${pageContext.request.contextPath}/backzhengshu/getbackcerceshilist'
                , cols: [[
                    {type: 'numbers', title: 'ID', width: 80}
                    , {field: 'trueName',title: '申请人', width: 150}
                    , {field: 'cerPhone',title: '联系号码', width: 150}
                    , {templet: '<div>{{d.field.fieldName}}</div>', title: '证书类型', width: 150}
                    , {field: 'beginTime',title: '申请时间', width: 200, sort: true}
                    , {field: 'turnoverTime',title: '更新时间', width: 200, sort: true}
                    , {templet: '<div>{{d.state.paramName}}</div>', title: '当前状态',  width: 150}
                    , {field: 'score', title: '操作', width: 258, align: 'center', toolbar: '#barDemo'}
                ]]
                , id: 'testReload'
                , page: true
                , height: 500
            });

            table.on('tool(user)', function (obj) {
                var data = obj.data;
                if (obj.event === 'xiazai') {
                    var mingzi = data.trueName;
                    var id = data.cerRecordId;
                    layer.confirm('是否下载:' + mingzi + '的证书项目', function (index) {
                        location.href='${pageContext.request.contextPath}/backzhengshu/backzsxmdownload?cerid='+id;
                    });
                } else if (obj.event === 'pingce') {
                    var cerid = data.cerRecordId;
                    console.log("asdsadasdasd"+cerid);
                    layer.open({
                        //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                        type: 1,
                        title: "上传测试结果",
                        area: ['450px', '400px'],
                        content: $("#popUpdateTest") //引用的弹出层的页面层的方式加载修改界面表单
                    });
//选完文件后不自动上传
                    upload.render({
                        elem: '#test8'
                        ,url: '${pageContext.request.contextPath}/backzhengshu/ceshifileupload?cerid='+cerid //改成您自己的上传接口
                        ,auto: false
                        ,bindAction: '#test9'
                        ,exts: 'doc|docx'
                        ,done: function(res){
                            if (res.msg=='success'){
                                layer.msg('上传成功');
                                $('#guankong').val("success");
                            }else if (res.msg=='fail'){
                                layer.msg('上传失败');
                            }
                        }
                    });
                    form.on('submit(demo11)', function(massage) {
                        var guankong = $('#guankong').val();
                        if (guankong=="success"){
                            var name = massage.field.cerTestScore;
                            $.ajax({
                                url:  '${pageContext.request.contextPath}/backzhengshu/uptestsorce?cerid='+cerid+'&score='+name,//请求服务端地址值
                                async: true,
                                type: "post",//请求方式
                                dataType: "text",
                                success: function (msg) {
                                    if (msg=='success'){
                                        layer.msg('确认成功', {icon: 6});
                                        layer.closeAll();//关闭所有的弹出层
                                        location.href = '${pageContext.request.contextPath}/backzhengshu/ceshizhengshuliebiao';
                                    }else if (msg=='faile'){
                                        layer.msg('输入错误', {icon: 5});
                                    }
                                }
                            });

                        }else {
                            layer.msg('请先上传文件后才确认', {icon: 5});
                        }
                    });
                }
            });

            $('.demoTable .layui-btn').on('click', function () {
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });

            form.verify({
                chengji: [
                    /^([1-9]|[2-4]\d|50)$/
                    ,'成绩0-50正整数'
                ]
            });
        });
    }
</script>
<%--//这里是弹出层的表单信息--%>
<%--//表单的id用于表单的选择，style是在本页隐藏，只有点击编辑才会弹出--%>
<div class="layui-row" id="popUpdateTest" style="display:none">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane"  style="text-align: center;margin-top: 30px">

            <div class="layui-upload">
                <label class="layui-form-label"> 测试报告(doc|docx):</label>
                <button type="button" style="margin-left: -170px;margin-top: 8px"  class="layui-btn layui-btn-normal"  id="test8">选择文件</button>
                <br>
                <button type="button" style="margin-left: 220px" class="layui-btn" id="test9">开始上传</button>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">成绩(0-50)</label>
                <div class="layui-input-block">
                    <input type="text" name="cerTestScore"  required  lay-verify="chengji" autocomplete="off" placeholder="请输入测试成绩" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" style="margin-top:60px">
                <div class="layui-input-block" style="margin-left: 20px">
                    <button class="layui-btn " type="button"  lay-submit lay-filter="demo11">确认</button>
                    <input type="button" value="取消" class="layui-btn" onclick="guan()">
                </div>
            </div>
        </form>
    </div>
</div>
<input type="hidden" value="" id="guankong">

<script>
    function guan(){
        layer.closeAll();
    }
</script>
</body>
</html>
