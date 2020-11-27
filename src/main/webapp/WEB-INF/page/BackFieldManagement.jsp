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
    <title>后台领域管理</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

</head>
<style>
    #input_search{/*这是搜索栏样式*/
        float: left;
    }

        #courseName{/*这是搜索栏样式*/
            float: left;
        }
    #layui-btn{/*这是搜索按钮样式*/
        float: left;
    }
    #dropDownMenu{/*这是下拉菜单样式*/
        float: left;
    }
    #AddField_button{/*这是增加课程样式*/
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
<%--    <a class="layui-btn layui-btn-xs" lay-event="query">查看</a>--%>
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改提示</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除领域</a>
</script>



<%--<script type="text/javascript">
    $(function  () {
        layui.use('form', function(){
        var form = layui.form;

            //监听提交【增加课程  按钮的监听】
            form.on('submit(AddUnit)', function(data){
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


            form.on('submit(search)', function(data){

                console.log(data);
                var courseName = $("#input_search").val();
                console.log("courseName的值为："+courseName+",接下来将响应搜索按钮监听");

                /*$.ajax({
                    type:"GET",
                    dataType: "json",//预期服务器返回的数据类型
                    url: "../course/findCourse" ,//url
                    data: "courseName="+courseName,
                    async:true,
                    success:function () {
                        alert("成功")

                    },
                    error:function () {
                        alert("异常")
                    },




                })*/

            });
        });
    })
</script>--%>

<script type="text/html" id="toolbarDemo">
    <div class="demoTable" style="margin-left: 10%">
    <div class="layui-form-item">
        <div class="layui-input-block">
            <input id="input_search" class="layui-input " type="text"  lay-verify="title" autocomplete="off" placeholder="请输入领域名"  style="width: 200px">
            <input id="layui-btn" class="layui-btn layui-btn-warm" type="button" lay-submit lay-filter="search"  data-type="reload" value="搜索">

            <button id="AddField_button" type="button" class="layui-btn " lay-submit lay-filter="AddField">
                            增加领域
            </button>
<%--            <button id="DeleteCourse_button" type="button" class="layui-btn "lay-submit lay-filter="DeleteCourse">--%>
<%--&lt;%&ndash;                <i class="layui-icon">&#xe67e;</i>&ndash;%&gt;--%>
<%--                            删除课程--%>
<%--            </button>--%>
<%--            <button id="ReviseCourse_button" type="button" class="layui-btn " lay-submit lay-filter="ReviseCourse">--%>
<%--                            修改课程--%>
<%--            </button>--%>
            <button id="OperationRecord_button" type="button" class="layui-btn " lay-submit lay-filter="OperationRecord">
                            操作记录
            </button>
        </div>
    </div>
    </div>
</script>

<script>
    layui.use(['table','form'], function(){
        var table = layui.table;
        var form = layui.form;
        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 570
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: []//取消头部工具栏右侧的按钮
            ,url: '../field/findField' //数据接口
            ,data:['fieldName']
            ,page: true //开启分页
            , limits: [5,8,10]
            , limit: 10
            ,id:'testReload'

            ,cols: [[ //表头
                {field: 'fieldId', title: '序号', width:80, sort: true, fixed: 'left'}
                ,{field: 'fieldName', title: '领域名称', width:250,event:'fieldName'}
                ,{field: '', title: '操作', width: 240,toolbar:'#barDemo'}
            ]]

        });
        var $ = layui.$, active = {
            reload: function(){
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                    where: {
                        fieldName: $('#input_search').val(),
                        fieldId: $('#fieldId').val(),
                    }
                }, 'data');
            }
        };
        $('.demoTable .layui-btn').on('click', function(){
            // debugger;
            // var type = $(this).data('type');
            // active[type] ? active[type].call(this) : '';
        });


        //搜索 按钮监听
        form.on('submit(search)', function(data){

            console.log(data);

            var fieldName = $("#input_search").val();
            console.log("fieldName的值为："+fieldName+",接下来将响应搜索按钮监听");
            //获取select对象
            // var myselect=document.getElementById("field_dropDownMenu");
            //取到选中项的索引
            // var index = myselect.selectedIndex;// selectedIndex是所选中的项的index
            // var selectvalue = myselect.options[index].text;
            // console.log("selectvalue的值为："+selectvalue+",接下来将响应搜索按钮监听");
            table.reload('testReload', {
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                    fieldName: $('#input_search').val(),
                    fieldId: $('#fieldId').val(),
                }
            }, 'data');
            /*$.ajax({
                type:"GET",
                dataType: "json",//预期服务器返回的数据类型
                url: "../course/findCourse" ,//url
                data: "courseName="+courseName,
                async:true,
                success:function () {
                    alert("成功")

                },
                error:function () {
                    alert("异常")
                },




            })*/

        });

        //监听提交【增加领域  按钮的监听】
        form.on('submit(AddField)', function(data){
            console.log(data);
            // alert("成功提交“增加操作”");
            layui.use('layer', function(){
                var layer = layui.layer;

                layer.open({
                    title: '增加'
                    ,area: ['500px', '150px']//设定弹窗的宽、高
                    ,btn:[ '确认提交', '取消']//设定按钮组
                    ,shade: [0.7, '#393D49']
                    ,closeBtn:2
                    ,yes: function(index, layero){
                        //按钮【按钮一】的回调
                        layer.close(index); //如果设定了yes回调，需进行手工关闭

                        var fieldName = document.getElementById('fieldName').value;//获取新增的领域名
                        $.ajax({
                            type:"POST",
                            dataType: "json",//预期服务器返回的数据类型
                            url: "../field/insertField" ,//url
                            data: "fieldName="+fieldName,
                            async:true,

                        });

                        alert("增加成功！")
                        table.reload('testReload', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            },
                            where: {
                                fieldName: $('#input_search').val(),
                                fieldId: $('#fieldId').val(),
                            }
                        }, 'data');

                    }
                    ,btn2: function(index, layero){
                        //按钮【按钮二】的回调
                        // alert("取消提交按钮被触发")

                        table.reload('testReload', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            },
                            where: {
                                fieldName: $('#input_search').val(),
                                fieldId: $('#fieldId').val(),
                            }
                        }, 'data');
                        //return false 开启该代码可禁止点击该按钮关闭
                    }
                    ,type:1
                    ,content:'<style>input,select{ border-radius: 10px;padding: 6px 0px;}' +
                        '.file {position: relative;display: inline-block;background: #D0EEFF;border: 1px solid #99D3F5; border-radius: 20px; padding: 4px 12px; overflow: hidden; color: #1E88C7; text-decoration: none;text-indent: 0; line-height: 20px;}' +
                        '.file input { position: absolute; font-size: 100px;  right: 0;  top: 0;  opacity: 0; }'  +
                        '.file:hover { background: #AADFFD;  border-color: #78C3F3;  color: #004974; text-decoration: none;}</style>'+

                        '<input id="fieldName" placeholder="领域名"  style="width: 250px;margin:5px 110px">'
                });
            });
            // return false;
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




        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值

            //这是工具栏里“删除章节”的监听
            if(layEvent === 'del'){
                var fieldId=data.fieldId;
                alert(fieldId);
                layui.use('layer', function(){
                    var layer = layui.layer;
                    console.log("走入删除提示框");

                    layer.open({
                        content: '确定要删除吗？' //这里content是一个普通的String
                        ,btn:[ '确定', '取消']//设定按钮组
                        ,shade: [0.7, '#393D49']
                        ,closeBtn:2
                        ,yes: function(index, layero){
                            //按钮【按钮一】的回调
                            $.ajax({
                                type:"GET",
                                dataType: "json",//预期服务器返回的数据类型
                                url: "../field/deleteField" ,//url
                                data: "fieldId="+fieldId,
                                async:true,
                                success:function () {
                                    // alert("成功")
                                    table.reload('testReload', {
                                        page: {
                                            curr: 1 //重新从第 1 页开始
                                        },
                                        where: {
                                            fieldName: $('#input_search').val(),
                                            fieldId: $('#unitId').val(),
                                        }
                                    }, 'data');

                                },
                                error:function () {
                                    // alert("异常")
                                    table.reload('testReload', {
                                        page: {
                                            curr: 1 //重新从第 1 页开始
                                        },
                                        where: {
                                            fieldName: $('#input_search').val(),
                                            fieldId: $('#unitId').val(),
                                        }
                                    }, 'data');
                                },

                            });
                            alert("删除成功！");
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                        }
                        ,btn2: function(index, layero){
                            //按钮【按钮二】的回调
                            //return false 开启该代码可禁止点击该按钮关闭
                        }
                    });
                });
                // layer.confirm('真的删除行么', function(index){
                //     obj.del(); //删除对应行（tr）的DOM结构
                //     layer.close(index);
                //     //向服务端发送删除指令
                // });
            }
            //这是工具栏里“修改课程”的监听
            else if(layEvent == 'edit'){
                alert("这里是温馨提示！只允许修改章节名称、路径。直接点击需要修改部分即可修改！");
            }
            //这里是“查看功能”的监听
            else if (layEvent == 'query'){
                var unitId=data.unitId;
                var courseId = data.courseId;
                var unitName = data.unitName;
                var timeLength = data.timeLength;
                var preUnitId = data.preUnitId;
                var preUnitName = data.preUnitName;
                var layer = layui.layer;
                        layer.open({
                            title: '详细信息'
                            ,area: ['500px', '300px']//设定弹窗的宽、高
                            ,btn:[ '查看完毕']//设定按钮组
                            ,shade: [0.7, '#393D49']
                            ,content:
                            '<div style="font-size: 20px">所属课程：'+courseId+'</div>'+
                            '<div style="font-size: 20px">章节名：'+unitName+'</div>'+
                            '<div style="font-size: 20px">时长：'+timeLength+'</div>'+
                            '<div style="font-size: 20px">前一章节：'+preUnitName+'</div>'+
                            '<div style="font-size: 20px;color: red" >【若显示为undefined,则本章为第一章】</div>'
                            // ,success: function(layero, index){
                            //     // console.log(layero, index);
                            //     $.ajax({
                            //           type:"POST",
                            //           dataType: "json",//预期服务器返回的数据类型
                            //           url: "../course/selectunitName" ,//url
                            //           data:"preUnitId"
                            //
                            //           });
                            // }

                        })
            }

            // else if(layEvent === 'edit'){
            //     layer.msg('编辑操作');
            //     console.log(data);
            //     //alert("修改完毕")
            //     var courseId_table = data.courseId;
            //     var courseName_table = data.courseName;
            //     var courseImgURL_table = data.courseImgURL;
            //     var courseIntroduce_table = data.courseIntroduce;
            //     var speakerHeadImgUrl_table = data.speakerHeadImgUrl;
            //     layui.use('layer', function(){
            //         var layer = layui.layer;
            //         layer.open({
            //             title: '修改窗口'
            //             ,area: ['500px', '300px']//设定弹窗的宽、高
            //             ,btn:[ '确认提交', '取消']//设定按钮组
            //             ,shade: [0.7, '#393D49']
            //             ,closeBtn:2
            //             ,yes: function(index, layero){
            //                 //按钮【按钮一】的回调
            //                 var courseName = document.getElementById("courseName").value;//修改后的课程名
            //                 var courseIntroduce = document.getElementById("courseIntroduce").value;//修改后的课程介绍
            //                 var courseImgURL = document.getElementById('courseImgURL').value;//修改后的文件路径
            //                 var speakerHeadImgUrl = document.getElementById('speakerHeadImgUrl').value;//修改后的文件图片路径
            //                 console.log("修改后的课程名："+courseName+";修改后的课程介绍:"+courseIntroduce+";修改后的文件路径="+courseImgURL+";修改后的文件图片路径="+speakerHeadImgUrl);
            //                 console.log("表格中的id："+courseId_table+";表格中的课程名："+courseName_table+";表格中的课程介绍:"+courseIntroduce_table+";表格中的文件路径="+courseImgURL_table+";表格中的文件图片路径="+speakerHeadImgUrl_table)
            //
            //
            //                 $.ajax({
            //                     type:"POST",
            //                     dataType: "json",//预期服务器返回的数据类型
            //                     url: "../course/updateCourse" ,//url
            //                     data: 'courseId_table='+courseId_table+'&courseName_table='+courseName_table+'&courseImgURL_table='+courseImgURL_table
            //                         +'&courseIntroduce_table='+courseIntroduce_table+'&speakerHeadImgUrl_table='+speakerHeadImgUrl_table+'&courseName='+courseName
            //                         +'&courseIntroduce='+courseIntroduce+'&courseImgURL='+courseImgURL+'&speakerHeadImgUrl='+speakerHeadImgUrl,
            //                     async:true,
            //
            //                 });
            //
            //                 alert("修改成功！")
            //                 layer.close(index); //如果设定了yes回调，需进行手工关闭
            //             }
            //             ,btn2: function(index, layero){
            //                 //按钮【按钮二】的回调
            //                 alert("取消提交按钮被触发")
            //
            //                 //return false 开启该代码可禁止点击该按钮关闭
            //             }
            //             ,type:1
            //             ,content:
            //                 '<style>' +
            //                 'input{ border-radius: 10px;padding: 8px 0px;}' +
            //                 '.file {position: relative;display: inline-block;background: #D0EEFF;border: 1px solid #99D3F5; border-radius: 20px; padding: 4px 12px; overflow: hidden; color: #1E88C7; text-decoration: none;text-indent: 0; line-height: 20px;}\n' +
            //                 '.file input { position: absolute; font-size: 100px;  right: 0;  top: 0;  opacity: 0; }\n' +
            //                 '.file:hover { background: #AADFFD;  border-color: #78C3F3;  color: #004974; text-decoration: none;}' +
            //                 '$("#courseName").val(courseName_table);'+
            //                 '</style>'+
            //
            //
            //                 '<input id="courseName" placeholder="请输入修改后的课程名"  style="width: 200px;margin:5px 135px ;" :value="courseName_table">' +
            //                 '<input id="courseIntroduce" placeholder="请输入课程介绍"  style="width: 200px;margin:5px 135px">'+
            //                 '<a href="javascript:;" class="file" style="width: 120px;margin:5px 135px">选择修改后的路径<input type="file" name="file" id="courseImgURL"></a>' +
            //                 '<a href="javascript:;" class="file" style="width: 150px;margin:5px 135px">选择修改后的图片路径<input type="file" name="file" id="speakerHeadImgUrl"></a>'
            //                 // '<input type="file" id="upload_file" style="display: none;" accept="image/jpeg, image/gif" />'
            //         });
            //     });
            //     return false;
            // }

            //修改课程名称监听
            else if (obj.event === 'fieldName'){
                var layer = layui.layer;
                layer.prompt({
                    formType: 2
                    ,title: '修改 ID 为 ['+ data.fieldId +'] 的章节名称'
                    ,value: data.fieldName
                }, function(value, index){
                    layer.close(index);
                    var fieldId = data.fieldId;
                    console.log("unitId的值为："+fieldId);
                    //这里一般是发送修改的Ajax请求
                    $.ajax({
                         type:"POST",
                          dataType: "json",//预期服务器返回的数据类型
                          url: "../unit/updateUnitName" ,//url
                          data: 'unitName='+value+'&unitId='+unitId,
                          async:true,

                          });
                    //同步更新表格和缓存对应的值
                    obj.update({
                        unitName: value
                    });
                });
            }
            //修改课程路径监听
            else if (obj.event === 'courseImgURL'){
                var layer = layui.layer;
                layer.prompt({
                    formType: 2
                    ,title: '修改 ID 为 ['+ data.courseId +'] 的课程路径'
                    ,value: data.courseImgURL
                }, function(value, index){
                    layer.close(index);
                    var courseId = data.courseId;
                    console.log("courseId的值为："+courseId);
                    //这里一般是发送修改的Ajax请求
                    $.ajax({
                        type:"POST",
                        dataType: "json",//预期服务器返回的数据类型
                        url: "../course/updatecourseImgURL" ,//url
                        data: 'courseImgURL='+value+'&courseId='+courseId,
                        async:true,

                    });
                    //同步更新表格和缓存对应的值
                    obj.update({
                        courseImgURL: value
                    });
                });
            }
            //修改课程介绍监听
            else if (obj.event === 'courseIntroduce'){
                layer.prompt({
                    formType: 2
                    ,title: '修改 ID 为 ['+ data.courseId +'] 的课程介绍'
                    ,value: data.courseIntroduce
                }, function(value, index){
                    layer.close(index);
                    var courseId = data.courseId;
                    console.log("courseId的值为："+courseId);
                    //这里一般是发送修改的Ajax请求
                    $.ajax({
                        type:"POST",
                        dataType: "json",//预期服务器返回的数据类型
                        url: "../course/updatecourseIntroduce" ,//url
                        data: 'courseIntroduce='+value+'&courseId='+courseId,
                        async:true,

                    });
                    //同步更新表格和缓存对应的值
                    obj.update({
                        courseIntroduce: value
                    });
                });
            }
            //修改课程介绍监听
            else if (obj.event === 'speakerHeadImgUrl'){
                layer.prompt({
                    formType: 2
                    ,title: '修改 ID 为 ['+ data.courseId +'] 的课程介绍'
                    ,value: data.speakerHeadImgUrl
                }, function(value, index){
                    layer.close(index);
                    var courseId = data.courseId;
                    console.log("courseId的值为："+courseId);
                    //这里一般是发送修改的Ajax请求
                    $.ajax({
                        type:"POST",
                        dataType: "json",//预期服务器返回的数据类型
                        url: "../course/updatespeakerHeadImgUrl" ,//url
                        data: 'speakerHeadImgUrl='+value+'&courseId='+courseId,
                        async:true,

                    });
                    //同步更新表格和缓存对应的值
                    obj.update({
                        speakerHeadImgUrl: value
                    });
                });
            }


        });



    });
</script>
</body>
</html>
