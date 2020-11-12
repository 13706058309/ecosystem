<%--
  Created by IntelliJ IDEA.
  User: 汤某某
  Date: 2020/11/2
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>table模块快速使用</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<style>
    #input_search{/*这是搜索栏样式*/
        float: left;
    }
    #button_search{/*这是搜索按钮样式*/
        float: left;
    }
    #dropDownMenu{/*这是下拉菜单样式*/
        float: left;
    }
    #AddCourses_button{/*这是增加课程样式*/
        margin-left: 30px;
    }
    #OperationRecord_button{/*这是操作记录样式*/
        float: right;
    }
</style>
<body>

<%--<p style="font-size: 100px">这里是 table面板</p>--%>
<table id="demo" lay-filter="test"></table>

<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script type="text/javascript">
    $(function  () {
        layui.use('form', function(){
        var form = layui.form;

            //监听提交【增加课程  按钮的监听】
            form.on('submit(AddCourses)', function(data){
            console.log(data);
            // alert("成功提交“增加操作”");
                layui.use('layer', function(){
                    var layer = layui.layer;

                    layer.open({
                        title: '增加'
                        ,area: ['500px', '300px']//设定弹窗的宽、高
                        ,btn:[ '确认提交', '取消']//设定按钮组
                        ,shade: [0.7, '#393D49']
                        ,closeBtn:2
                        ,yes: function(index, layero){
                            //按钮【按钮一】的回调
                            alert("增加成功！")
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                        }
                        ,btn2: function(index, layero){
                            //按钮【按钮二】的回调
                            alert("取消提交按钮被触发")

                            //return false 开启该代码可禁止点击该按钮关闭
                        }
                        ,type:1
                        ,content:'<style>input,select{ border-radius: 10px;padding: 6px 0px;}</style>'+
                            '<select name="city" style="width: 150px;margin:10px 160px" >\n' +
                            '                    <option value="">--请选择领域--</option>\n' +
                            '                    <option value="0">JAVA</option>\n' +
                            '                    <option value="1">HTML</option>\n' +
                            '                    <option value="2">PYTHON</option>\n' +
                            '                    <option value="3">C</option>\n' +
                            '                    <option value="4">PHP</option>\n' +
                            '                </select>' +
                            '<input placeholder="请输入课程名"  style="width: 150px;margin:5px 160px">' +
                            '<input placeholder="请输入课程图片路径"  style="width: 150px;margin:5px 160px">' +
                            '<input placeholder="请输入讲师名"  style="width: 150px;margin:5px 160px">' +
                            '<input placeholder="请输入课程介绍"  style="width: 150px;margin:5px 160px">' +
                            '<input placeholder="请输入课程时长"  style="width: 150px;margin:5px 160px">'
                    });
                });
                return false;
            });

            //监听提交【删除课程  按钮的监听】
            form.on('submit(DeleteCourse)', function(data){
                console.log(data);
                // alert("成功提交“删除操作”");
                layui.use('layer', function(){
                    var layer = layui.layer;

                    layer.open({
                        content: '确定要删除吗？' //这里content是一个普通的String
                        ,btn:[ '确定', '取消']//设定按钮组
                        ,shade: [0.7, '#393D49']
                        ,closeBtn:2
                        ,yes: function(index, layero){
                            //按钮【按钮一】的回调
                            alert("删除成功！")
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                        }
                        ,btn2: function(index, layero){
                            //按钮【按钮二】的回调
                            //return false 开启该代码可禁止点击该按钮关闭
                        }
                    });

                });
                return false;
            });

            //监听提交【修改课程  按钮的监听】
            form.on('submit(ReviseCourse)', function(data){
                console.log(data);
                //alert("修改完毕")
                layui.use('layer', function(){
                    var layer = layui.layer;

                    layer.open({
                        title: '增加'
                        ,area: ['500px', '300px']//设定弹窗的宽、高
                        ,btn:[ '确认提交', '取消']//设定按钮组
                        ,shade: [0.7, '#393D49']
                        ,closeBtn:2
                        ,yes: function(index, layero){
                            //按钮【按钮一】的回调
                            alert("增加成功！")
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                        }
                        ,btn2: function(index, layero){
                            //按钮【按钮二】的回调
                            alert("取消提交按钮被触发")

                            //return false 开启该代码可禁止点击该按钮关闭
                        }
                        ,type:1
                        ,content:'<style>' +
                            'input{ border-radius: 10px;padding: 8px 0px;}</style>'+
                            '<input placeholder="请输入修改后的课程名"  style="width: 200px;margin:5px 135px ;">' +
                            '<input placeholder="请输入课程图片路径"  style="width: 200px;margin:5px 135px">' +
                            '<input type="file" id="upload_file" style="display: none;" accept="image/jpeg, image/gif" />' +
                            '<input placeholder="请输入课程介绍"  style="width: 200px;margin:5px 135px">' +
                            '<script>   <'/'script>'
                    });
                });
                return false;
            });

            //监听提交【日志管理  按钮的监听】
            form.on('submit(OperationRecord)', function(data){
                console.log(data);
                layer.open({
                    title: '操作日志'
                    ,area: ['500px', '300px']//设定弹窗的宽、高
                    ,btn:[ '查看完毕']//设定按钮组
                    ,shade: [0.7, '#393D49']
                    ,closeBtn:2
                    ,yes: function(index, layero){
                        //按钮【按钮一】的回调
                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                    }
                    ,type:1
                    ,content:'看到这个是的猪！看到这个是的猪！看到这个是的猪！看到这个是的猪！看到这个是的猪！看到这个是的猪！看到这个是的猪！看到这个是的猪！看到这个是的猪！看到这个是的猪！'

            });
                return false;
            });
        });
    })
</script>

<script type="text/html" id="toolbarDemo">
    <div class="layui-form-item">
        <div class="layui-input-block">
            <input id="input_search" class="layui-input " type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入课程名"  style="width: 200px">
            <input id="button_search" class="layui-btn layui-btn-warm" type="button" lay-submit=""  value="搜索">
            <div id="dropDownMenu" class="layui-input-block" style="width: 200px">
                <select name="city" ><%--lay-verify="required"--%>
                    <option value=""></option>
                    <option value="0">JAVA</option>
                    <option value="1">HTML</option>
                    <option value="2">PYTHON</option>
                    <option value="3">C</option>
                    <option value="4">PHP</option>
                </select>
            </div>
            <button id="AddCourses_button" type="button" class="layui-btn " lay-submit lay-filter="AddCourses">
<%--                <i class="layui-icon">&#xe654;</i>--%>
                            增加课程
            </button>
            <button id="DeleteCourse_button" type="button" class="layui-btn "lay-submit lay-filter="DeleteCourse">
<%--                <i class="layui-icon">&#xe67e;</i>--%>
                            删除课程
            </button>
            <button id="ReviseCourse_button" type="button" class="layui-btn " lay-submit lay-filter="ReviseCourse">
                            修改课程
            </button>
            <button id="OperationRecord_button" type="button" class="layui-btn " lay-submit lay-filter="OperationRecord">
                            操作记录
            </button>
        </div>
    </div>
</script>

<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 312
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: []//取消头部工具栏右侧的按钮
            ,url: '/demo/table/user/' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'id', title: '序号', width:80, sort: true, fixed: 'left'}
                ,{field: 'username', title: '课程所在领域', width:130}
                ,{field: 'sex', title: '课程名称', width:130}
                ,{field: 'city', title: '上传时间', width:130,sort: true}
                ,{field: 'sign', title: '操作', width: 177,toolbar:'#barDemo'}
            ]]

        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.prompt({
                    formType: 2
                    ,value: data.email
                }, function(value, index){
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });
            }
        });

    });
</script>
</body>
</html>
