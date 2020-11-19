
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
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
</script>
<div id="leadDiv" style="display: none;width: 360px;height: 250px;" >

    <br><br>
    <h1 style="text-align: center">人才导入</h1><br>
    <div class="layui-inline">
        <div class="layui-input-inline" style="margin-left: 100px">
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="button" class="layui-btn layui-bg-blue layui-btn-fluid" onclick="downLoad()">下载模板</button>
        </div>
    </div><br><br>

<%--    <form action="upload"  method="post" enctype="multipart/form-data"  accept-charset="UTF-8" >--%>
<%--        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--%>
<%--        <input type="file" name="file" id="file" class="layui-btn layui-btn-normal"><br><br><br>--%>
<%--        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--%>
<%--        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--%>
<%--        <input  type="submit" value="导入"class="layui-bg-orange layui-btn" >--%>
<%--    </form>--%>
    <form class="layui-form layui-form-pane"  enctype="multipart/form-data" id="forms" accept-charset="UTF-8">
        <div class="layui-form-item">
            <div class="layui-upload">
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input type="file" class="layui-btn layui-btn-normal" id="upload" name="upload"></input>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline" style="margin-left: 40%">
                <button type="button" class="layui-bg-orange layui-btn"  onclick="uploads()">导入</button>
            </div>
        </div>
    </form>


</div>
    <div id="detailDiv" style="display: none" >
        <br><br>
        <h1 style="text-align: center">基本信息</h1><br>
        <table width="100%" align="center" border="0" cellspacing="0" cellpadding="0">
        <tr valign="top">
            <td>
        <table class="layui-table" style="width: 800px">
            <tr  >
            <td width="100px">姓名</td>
            <td id="talentName" width="150px"></td>

                <td width="100px">学校名称</td>
                <td id="school" width="150px"></td>

            </tr>
            <tr >
                <td width="100px">出生年月</td>
                <td id="birthday" width="150px"></td>

                <td width="100px">专业</td>
                <td id="profession" width="150px"></td>
            </tr>
            <tr >
                <td width="100px">政治面貌</td>
                <td id="politicalStatus" width="150px"></td>
                <td width="150px">学历</td>
                <td id="education" width="150px"></td>
            </tr>
            <tr>
                <td width="100px">电话</td>
                <td id="contactInfo" width="150px"></td>
                <td width="100px">住址</td>
                <td id="address" width="150px"></td>

            </tr>

        </table>
            </td>
            <td width="120" align="right" style="padding-top: 14px;padding-right: 20px">
                <!--个人照片-->
                <table border="0" cellpadding="2" cellspacing="1" bgcolor="#dddddd" id="Table10">
                    <tr>
                        <td align="center" bgcolor="#FFFFFF">
                            <img id="Image1" src="../imgs/1.jpg" style="height:140px;width:110px;border-width:0px;" />
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
        </table>

        <h1 style="text-align: center">社会经历</h1>
        <textarea  id="workExp" style="resize: none"onfocus=this.blur() class="layui-textarea"></textarea>

        <h1 style="text-align: center">技能证书</h1>
        <textarea   id="certificate" style="resize: none"onfocus=this.blur() class="layui-textarea"></textarea>
        <h1 style="text-align: center">自我评价</h1>
        <textarea   id="selfEva" style="resize: none"onfocus=this.blur() class="layui-textarea"></textarea>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <div class="layui-inline">
            <div class="layui-input-inline" style="margin-left: 100px">
                <button type="button" class="layui-btn layui-btn-lg layui-btn-fluid" onclick="back()">返回</button>

            </div>
        </div>
    </div>



<br><br>
<input type="hidden" value="${pageContext.request.contextPath}" id="path">
<div class="demoTable" style="margin-left: 20%">
    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">起始时间:</label>
            <div class="layui-input-inline">

                <input type="text" class="layui-input" id="beginTime"  >

            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">终止时间:</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="endTime" >

            </div>
        </div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

            <button id="layerDemo" data-method="offset" data-type="auto" class="layui-btn layui-btn-normal">导入人才</button>




    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">高校名称:</label>
        <div class="layui-input-inline">
            <input type="tel" id="school2" lay-verify="required|phone" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">专业:</label>
        <div class="layui-input-inline">
            <input type="tel" id="profession2" lay-verify="required|phone" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-input-inline" style="margin-left: 8%">
            <button type="button" class="layui-btn layui-btn-radius layui-btn-lg" data-type="reload"style="width: 100px">搜索</button>
        </div>
    </div>
</div>

    <table id="userTable" lay-filter="test"class="layui-table-page"></table>
</body>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">

    </div>
</script>

<script>
    var $;
    var layer;
    var path = $("#path").val();
    var uIDs;
    var objs;
    layui.use(['laydate','layer'],function () {
        var laydate = layui.laydate;
        layer = layui.layer;
        laydate.render({
            elem:'#beginTime'
        });

        laydate.render({
            elem:'#endTime'
        });
    })


    layui.use('table',function () {
        var table = layui.table;
        table.render({
            elem:'#userTable',
            height:325,
            limits:[5,10],
            limit:5,
            url: 'findTalent' ,//数据接口,
            toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print',  { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }],
            page:true,
            id: 'testReload',
                    cols: [[ //表头

                        {field: 'talentId', title: '人才ID',sort: true }
                        ,{field: 'talentName', title: '名字', sort: true}
                        ,{field: 'school', title: '学校', sort: true}
                        ,{field: 'birthday', title: '出生年月日', sort: true}
                        ,{field:'contactInfo',title:'联系方式',sort: true}
                        ,{field:'profession',title:'专业',sort: true}
                        ,{field:'politicalStatus',title:'政治面貌',sort: true}
                        ,{field:'workExp',title:'工作经验',sort: true}
                        ,{field:'selfEva',title:'自我评价',sort: true}
                        ,{field:'education',title:'学历',sort: true}
                        ,{field:'entryTime',title:'上传时间',sort: true}
                        ,{field:'address',title:'地址',sort: true}
                        ,{field:'certificate',title:'技能证书',sort: true}
                        ,{title:'操作',toolbar:'#btns',width:100}
                    ]]


        });

        table.on('tool(test)', function(obj){
            var data = obj.data;
             if(obj.event==='detail'){
                $("#talentName").html(data.talentName);
                $("#school").html(data.school);
                $("#birthday").html(data.birthday);
                $("#profession").html(data.profession);
                $("#politicalStatus").html(data.politicalStatus);
                 $("#education").html(data.education);
                 $("#contactInfo").html(data.contactInfo);
                 $("#address").html(data.address);
                 $("#workExp").html(data.workExp);
                 $("#certificate").html(data.certificate);
                 $("#selfEva").html(data.selfEva);
                layer.open({
                    type: 1,
                    offset: '40px',
                    area:["1000px","600px"],
                    content:$("#detailDiv"),
                })
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
                        profession: $('#profession2').val(),
                        school: $('#school2').val(),
                        beginTime:$('#beginTime').val(),
                        endTime:$('#endTime').val(),
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    })
    function back(){
        layer.close(layer.index);

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
                        ,area:["400px","400px"]
                        ,content:$("#leadDiv")


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


    //下载模板
    function downLoad() {
        window.open("${pageContext.request.contextPath}/talent/download?fileName=简历.doc");

    }
    function uploads() {
        var form = new FormData(document.getElementById("forms"))
        var file= $('#upload').val()
        $.ajax({
            url:path+"/talent/upload",
            data:form,
            processData:false,
            contentType:false,
            type:"post",
            beforeSend:function(){
                if(file.length==0){
                    layer.msg("请先选择简历")
                    return false;
                }
                if(file!="C:\\fakepath\\简历.doc"){
                    layer.msg("不是简历文件")
                    return false;
                }
                return true;

            },
            success:function (info) {
                layer.msg(info,{
                    time:1000,
                    end:function () {
                        if (info=="导入成功"){
                            location.href=path+"/talent/talentList";
                        }
                    }
                })

            },
        })
    }


</script>
</html>
