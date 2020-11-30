
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="../js/jquery-3.5.1.js"></script>
<script src="../layui/layui.js"></script>
<link  type="text/css" rel="stylesheet" href="../layui/css/layui.css">


<html>
<head>
    <title>Title</title>
</head>
<style>
    .layui-table th{
        text-align: center;
    }
    .layui-table{
        text-align: center;
    }

    .layui-table-page{
        text-align: center;
    }

    .layui-form-select dl {
        max-height:200px;
    }
   
</style>
<body>

<script id="btns" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="edit">岗位修改</a>
</script>
<br><br>
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
<div style="display: none;width: 360px;height: 250px;" id="changeDiv">
    <br>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label"  >岗位类型：</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="position">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label" >所属部门：</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="depart" onfocus=this.blur() style="border: none">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label" >所属行业：</label>
            <div class="layui-input-inline">

                <input type="text" class="layui-input" id="industry" onfocus=this.blur() style="border: none">
            </div>
        </div>


        <div class="layui-inline">
            <div class="layui-input-inline">
                <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" style="margin-left: 100px" onclick="sureChange()">确定修改</button>
            </div>
        </div>
    </div>
</div>
<div style="display: none;margin-left: 110px" id="addDiv">
    <br>
    <form class="layui-form" action="" style="margin-left: 10%;margin-right: 10%" id="postPosition">
        <div class="layui-form-item" >

            <div class="layui-inline">
                <label class="layui-form-label"  >所属行业：</label>
                <div class="layui-input-inline">
                    <select name="industry1" id="industry1" lay-filter="industry1"> </select>
                </div>
            </div>

            <div class="layui-inline">
                <br><br>
                <label class="layui-form-label"  >所属部门：</label>
            <div class="layui-input-inline" >

                <select name="depart1" id="depart1" lay-filter="depart1">
                </select>
            </div>
            </div>
            <div class="layui-inline">
                <br><br>
                <label class="layui-form-label"  >岗位类型：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="position1">
                </div>
            </div>

        </div>
        <div class="layui-form-item" style="margin-left: -10px" >
            <div class="layui-input-block">
                <input  type="button" class="layui-btn" onclick="addPosition()" value="确认添加">
            </div>
        </div>
    </form>
</div>
<div style="display: none;margin-left: 110px" id="addDepartDiv">
    <br>
    <form class="layui-form" action="" style="margin-left: 10%;margin-right: 10%" id="postDepart">
        <div class="layui-form-item" >

            <div class="layui-inline">
                <label class="layui-form-label"  >所属行业：</label>
                <div class="layui-input-inline">
                    <select  name="industry2" id="industry2" lay-filter="industry2" > </select>
                </div>
            </div>

            <div class="layui-inline">
                <br><br>
                <label class="layui-form-label"  >部门：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="depart2">
                </div>
            </div>

        </div>
        <div class="layui-form-item" style="margin-left: -10px" >
            <div class="layui-input-block">
                <input  type="button" class="layui-btn" onclick="addDepart()" value="确认添加">
            </div>
        </div>
    </form>
</div>
<div style="display: none;margin-left: 110px" id="addIndustryDiv">
    <br>
    <form class="layui-form" action="" style="margin-left: 10%;margin-right: 10%" id="postIndustry">
        <div class="layui-form-item" >


            <div class="layui-inline">
                <br><br>
                <label class="layui-form-label"  >行业名称：</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="industry3">
                </div>
            </div>

        </div>
        <div class="layui-form-item" style="margin-left: -10px" >
            <div class="layui-input-block">
                <input  type="button" class="layui-btn" onclick="addIndustry()" value="确认添加">
            </div>
        </div>
    </form>
</div>
<div class="demoTable" style="margin-left: 10%;width: 1200px">
    <div class="layui-form-item">
        <label class="layui-form-label">行业:</label>
        <div class="layui-input-inline">
            <input type="tel" id="industryName" lay-verify="required|phone" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">部门:</label>
        <div class="layui-input-inline">
            <input type="tel" id="departName" lay-verify="required|phone" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">岗位:</label>
        <div class="layui-input-inline">
            <input type="tel" id="postName" lay-verify="required|phone" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-input-inline" style="margin-left: 1%">
            <button type="button" class="layui-btn layui-btn-radius layui-btn-lg"  data-type="reload"style="width: 100px">搜索</button>
        </div>
    </div>
</div>
<button id="layerDemo" data-method="offset" data-type="auto" class="layui-btn layui-btn-normal"style="margin-left: 70%">添加岗位类型</button>
<button id="layerDemo1" data-method="offset" data-type="auto" class="layui-btn layui-btn-normal">添加部门</button>
<button id="layerDemo2" data-method="offset" data-type="auto" class="layui-btn layui-btn-normal">添加行业</button>
    <table id="userTable" lay-filter="test"class="layui-table-page"></table>

</body>

<style>
    .layui-table-cell .layui-form-checkbox[lay-skin="primary"]{
        top: 50%;
        transform: translateY(-50%);
    }
</style>
<script>
    var form;
    var id;
    var $;
    var layer;
    var path = $("#path").val();
    var uIDs;
    var objs;
    var departId;
    var industryId;
    layui.use(['laydate','layer'],function () {
        layer = layui.layer;

    })


    layui.use('table',function () {
        var table = layui.table;
        table.render({
            elem:'#userTable',
            height:500,
            limits:[10,20],
            limit:10,
            url: 'selectPosition' ,//数据接口,
            page:true,
            id: 'testReload',
                    cols: [[ //表头

                        {field: 'postID', title: '岗位ID',sort: true }
                        ,{field: 'postName', title: '岗位类型', sort: true}
                        ,{field: 'departName', title: '所属部门', sort: true}
                        ,{field: 'industryName', title: '所属行业', sort: true}
                        ,{title:'操作',toolbar:'#btns',width:100}
                    ]]
        });
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event==='edit'){
                $("#position").val(data.postName);
                $("#industry").val(data.industryName);
                $("#depart").val(data.departName);
                layer.open({
                    type: 1,
                    offset: '40px',
                    area:["400px","300px"],
                    content:$("#changeDiv"),
                })
                id=data.postID;
            }
        });

        $ = layui.$, active = {
            reload: function(){
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                    where: {
                        postName: $('#postName').val(),
                        departName: $('#departName').val(),
                        industryName: $('#industryName').val(),
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    })
    function sureChange() {
        var postName = $("#position").val().trim();
        $.ajax({
            url:path+"/talent/changePosition",
            data:"postName="+postName+"&postID="+id,
            type:"get",
            typeData:"text",
            beforeSend:function () {
                if(postName.length==0){
                    layer.msg("请填写完整");
                    return false;
                }
                if(postName.length>10){
                    layer.msg("岗位类型限制10字");
                    return false;
                }
                return confirm("确定修改？");
            },
            success:function (info) {
                if(info=='1'){
                    layer.msg("修改成功",{
                        time:1000,
                        end:function () {
                            location.reload();
                        }
                    })

                }else{
                    layer.msg(info);
                }
            },
        })
    }
    layui.use('layer', function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

        //触发事件
        var active = {
            offset: function(othis){
                var type = othis.data('type')
                    ,text = othis.text();

                layer.open({
                    type: 1
                    ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,id: 'layerDemo'+type //防止重复弹出
                    ,area:["600px","350px"]
                    ,content:$("#addDiv")


                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    ,yes: function(){
                        layer.closeAll();
                    }
                });
            }
        };

        $('#layerDemo ').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

    });
    layui.use('layer', function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

        //触发事件
        var active = {
            offset: function(othis){
                var type = othis.data('type')
                    ,text = othis.text();

                layer.open({
                    type: 1
                    ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,id: 'layerDemo1'+type //防止重复弹出
                    ,area:["600px","250px"]
                    ,content:$("#addDepartDiv")


                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    ,yes: function(){
                        layer.closeAll();
                    }
                });
            }
        };

        $('#layerDemo1 ').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

    });
    layui.use('layer', function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

        //触发事件
        var active = {
            offset: function(othis){
                var type = othis.data('type')
                    ,text = othis.text();

                layer.open({
                    type: 1
                    ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,id: 'layerDemo2'+type //防止重复弹出
                    ,area:["600px","250px"]
                    ,content:$("#addIndustryDiv")


                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    ,yes: function(){
                        layer.closeAll();
                    }
                });
            }
        };

        $('#layerDemo2 ').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

    });
    function back(){
        layer.close(layer.index);
    }
    $(function () {
        path = $("#path").val();
        $.ajax({
            url:path+"/rec/findAllIndustry",
            type:"post",
            typeData:"text",
            success:function (info) {
                var arr = JSON.parse(info);
                $("#industry1").empty();
                var $option1 = $("<option>"+'请选择'+"</option>");
                $("#industry1").append($option1);
                for(var i=0;i<arr.length;i++){
                    var $option = $("<option value='"+arr[i].industryId+"' onclick='findDepart(1)'>"+arr[i].industryName+"</option>");
                    $("#industry1").append($option);
                    form.render();
                }
            },
        })
    })
    $(function () {
        path = $("#path").val();
        $.ajax({
            url:path+"/rec/findAllIndustry",
            type:"post",
            typeData:"text",
            success:function (info) {
                var arr = JSON.parse(info);
                $("#industry2").empty();
                var $option1 = $("<option>"+'请选择'+"</option>");
                $("#industry2").append($option1);
                for(var i=0;i<arr.length;i++){
                    var $option = $("<option value='"+arr[i].industryId+"' onclick='findDepart(1)'>"+arr[i].industryName+"</option>");
                    $("#industry2").append($option);
                    form.render();
                }
            },
        })
    })

    layui.use('form',function () {
        form = layui.form;
        form.on('select(industry1)', function(data){
            $.ajax({
                url:path+"/rec/findDepartByID",
                data:"industryID="+data.value,
                type:"post",
                typeData:"text",
                success:function (info) {
                    var arr = JSON.parse(info);
                    $("#depart1").empty();
                    var $option1 = $("<option>"+'请选择'+"</option>");
                    $("#depart1").append($option1);
                    for(var i=0;i<arr.length;i++){
                        var $option = $("<option value='"+arr[i].departId+"' >"+arr[i].departName+"</option>");
                        $("#depart1").append($option);
                        form.render();
                    }
                },
            })
        })
        form.on('select(industry2)', function(data){
            industryId=data.value
        })
        form.on('select(depart1)', function(data){
            departId=data.value
        })

    })
function addPosition() {
    var postName = $("#position1").val().trim();
    $.ajax({
        url:path+"/talent/addPosition",
        data:"postName="+postName+"&departId="+departId,
        type:"get",
        typeData:"text",
        beforeSend:function () {
            if(postName.length==0){
                layer.msg("请填写完整");
                return false;
            }
            if($("#industry1").val().trim()=="请选择"){
                layer.msg("请选择所属行业");
                return false;
            }
            if($("#depart1").val().trim()=="请选择"){
                layer.msg("请选择所属部门");
                return false;
            }
            if(postName.length>10){
                layer.msg("岗位类型限制10字");
                return false;
            }
            return confirm("确定添加？");
        },
        success:function (info) {
                layer.msg(info,{
                    time:1000,
                    end:function () {
                        if (info=="添加岗位成功"){
                            location.reload();
                        }

                    }
                })


        },
    })
}
    function addDepart() {
        var departName = $("#depart2").val().trim();
        $.ajax({
            url:path+"/talent/addDepart",
            data:"departName="+departName+"&industryId="+industryId,
            type:"get",
            typeData:"text",
            beforeSend:function () {
                if(departName.length==0){
                    layer.msg("请填写完整");
                    return false;
                }
                if($("#industry2").val().trim()=="请选择"){
                    layer.msg("请选择所属行业");
                    return false;
                }
                if(departName.length>10){
                    layer.msg("部门限制10字");
                    return false;
                }
                return confirm("确定添加？");
            },
            success:function (info) {
                layer.msg(info,{
                    time:1000,
                    end:function () {
                        if (info=="添加部门成功"){
                            location.reload();
                        }

                    }
                })


            },
        })
    }
    function addIndustry() {
        var industryName = $("#industry3").val().trim();
        $.ajax({
            url:path+"/talent/addIndustry",
            data:"industryName="+industryName,
            type:"get",
            typeData:"text",
            beforeSend:function () {
                if(industryName.length==0){
                    layer.msg("请填写完整");
                    return false;
                }
                if(industryName.length>10){
                    layer.msg("行业限制10字");
                    return false;
                }
                return confirm("确定添加？");
            },
            success:function (info) {
                layer.msg(info,{
                    time:1000,
                    end:function () {
                        if (info=="添加行业成功"){
                            location.reload();
                        }
                    }
                })
            },
        })
    }


</script>
</html>
