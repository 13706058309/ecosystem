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
    <title>证书申请列表</title>
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

    {{#  if(d.stateId==29){ }}
    <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit">查看</button>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="downxuqiu">下载报告</a>
    <a class="layui-btn layui-bg-blue layui-btn-xs" lay-event="tiaozhun">评审</a>
    {{#  } }}

    {{#  if(d.stateId==30){ }}
    <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit">查看</button>
    {{#  } }}

    {{#  if(d.stateId==31){ }}
    <a class="layui-btn layui-bg-blue layui-btn-xs" lay-event="tiaozhun">证书分发</a>
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
                , url: '${pageContext.request.contextPath}/backzhengshu/getbackcerpingshenlist'
                , cols: [[
                    {type: 'numbers', title: 'ID', width: 80}
                    , {field: 'trueName',title: '申请人', width: 150}
                    , {field: 'cerPhone',title: '联系号码', width: 150}
                    , {templet: '<div>{{d.field.fieldName}}</div>', title: '证书类型', width: 150}
                    , {field: 'beginTime',title: '申请时间', width: 200, sort: true}
                    , {field: 'turnoverTime',title: '更新时间', width: 200, sort: true}
                    , {field: 'cerTestScore',title: '测试分数', width: 200}
                    , {templet: '<div>{{d.state.paramName}}</div>', title: '当前状态',  width: 150}
                    , {field: 'score', title: '操作', width: 258, align: 'center', toolbar: '#barDemo'}
                ]]
                , id: 'testReload'
                , page: true
                , height: 500
            });

            table.on('tool(user)', function (obj) {
                var data = obj.data;
                if (obj.event === 'chehui') {

                } else if (obj.event === 'daifukuan') {

                } else if (obj.event === 'downxuqiu') {

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
</script>

</body>
</html>
