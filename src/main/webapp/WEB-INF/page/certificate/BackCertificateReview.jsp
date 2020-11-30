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
    <title>后台证书评审列表</title>
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
    <button class="layui-btn  layui-btn-primary  layui-btn-xs" lay-event="chakancs">查看</button>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="pingshen">评审</a>
    {{#  } }}

    {{#  if(d.stateId==30){ }}
    <button class="layui-btn  layui-btn-primary   layui-btn-xs" lay-event="chakanps">查看</button>
    {{#  } }}

    {{#  if(d.stateId==31){ }}
    <button class="layui-btn  layui-btn-primary   layui-btn-xs" lay-event="chakanps">查看</button>
    <a class="layui-btn layui-bg-blue layui-btn-xs" lay-event="fenfazhengshu">证书分发</a>
    {{#  } }}


</script>


<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<div class="layui-row" id="popUpdateTest" style="display:none">
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
                <label class="layui-form-label">证书类型</label>
                <div class="layui-input-block">
                    <input type="text" name="zhengshuss"   id="zhengshuss"   readonly  unselectable="on"  autocomplete="off" placeholder="请输入测试成绩" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">测试分数</label>
                <div class="layui-input-block">
                    <input type="text" name="testfenshu"  id="testfenshu"   readonly  unselectable="on" autocomplete="off" placeholder="请输入测试成绩" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">测试报告</label>
                <div class="layui-input-block">
                    <button class="layui-btn " type="button"  lay-submit lay-filter="xiazaiceshi">下载</button>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top:60px">
                <div class="layui-input-block" style="margin-left: 20px">
                    <button class="layui-btn " type="button"  lay-submit lay-filter="demo11">确认</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="layui-row" id="PSUpdateTest" style="display:none">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane"  style="text-align: center">
            <div class="layui-form-item" style="margin-top: 20px">
                <label class="layui-form-label">申请人</label>
                <div class="layui-input-block">
                    <input type="text" name="username" id="usernames" readonly  unselectable="on"  autocomplete="off" placeholder="请输入测试成绩" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top:20px">
                <label class="layui-form-label">身份证</label>
                <div class="layui-input-block">
                    <input type="text" name="usershenfen" id="usershenfens"   readonly  unselectable="on"  autocomplete="off" placeholder="请输入测试成绩" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 20px">
                <label class="layui-form-label">联系电话</label>
                <div class="layui-input-block">
                    <input type="text" name="userphone"   id="userphones"  readonly  unselectable="on"  autocomplete="off" placeholder="请输入测试成绩" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 20px">
                <label class="layui-form-label">证书类型</label>
                <div class="layui-input-block">
                    <input type="text" name="zhengshuss"   id="zhengshusss"   readonly  unselectable="on"  autocomplete="off" placeholder="请输入测试成绩" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 20px">
                <label class="layui-form-label">测试分数</label>
                <div class="layui-input-block">
                    <input type="text" name="testfenshu"  id="testfenshus"   readonly  unselectable="on"  autocomplete="off" placeholder="请输入测试成绩" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 20px">
                <label class="layui-form-label">测试报告</label>
                <div class="layui-input-block">
                    <button class="layui-btn " type="button"  lay-submit lay-filter="xiazaiceshis">下载</button>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 20px">
                <label class="layui-form-label">评审分数</label>
                <div class="layui-input-block">
                    <input type="text" name="testfenshu"  id="jugefenshus"   readonly  unselectable="on"  autocomplete="off" placeholder="请输入测试成绩" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 20px">
                <label class="layui-form-label">评审报告</label>
                <div class="layui-input-block">
                    <button class="layui-btn " type="button"  lay-submit lay-filter="xiazaipingshen">下载</button>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">总分数</label>
                <div class="layui-input-block">
                    <input type="text" name="testfenshu"  id="zongfenshus"   readonly  unselectable="on"  autocomplete="off" placeholder="请输入测试成绩" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top:20px">
                <div class="layui-input-block" style="margin-left: 20px">
                    <button class="layui-btn " type="button"  lay-submit lay-filter="demo111">确认</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="layui-row" id="uoloadUpdateTest" style="display:none">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane"  style="text-align: center;margin-top: 30px">
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">评审成绩:</label>
                <div class="layui-input-block">
                    <input type="text" name="fenshu" id="fenshu" lay-verify="chengji" autocomplete="off" placeholder="请输入评审成绩" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">评审视频:</label>
                <div class="layui-input-block">
                    <input type="file" id="pingshenvideo" name="pingshenvideo" accept="aplication/zip" class="layui-btn layui-btn-radius layui-btn-normal">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">最终报告:</label>
                <div class="layui-input-block">
                    <input type="file" id="finalbaogao" name="finalbaogao" accept="application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document" class="layui-btn layui-btn-radius layui-btn-normal">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top:60px">
                <div class="layui-input-block" style="margin-left: 20px">
                    <button class="layui-btn " type="button"  lay-submit lay-filter="demo222">确认</button>
                    <input type="button" style="margin-left: 50px" value="取消" class="layui-btn" onclick="guan()">
                </div>
            </div>
        </form>
    </div>
</div>
<script>

    function guan(){
        layer.closeAll();
    }

    window.onload=function () {
        layui.use(['table', 'form'], function () {
            var table = layui.table;
            var form = layui.form;
            //方法级渲染
            table.render({
                elem: '#LAY_table_user'
                , url: '${pageContext.request.contextPath}/backzhengshu/getbackcerpingshenlist'
                , cols: [[
                    {type: 'numbers', title: 'ID', width: 80}
                    , {field: 'trueName',title: '申请人', width: 120}
                    , {field: 'cerPhone',title: '联系号码', width: 150}
                    , {templet: '<div>{{d.field.fieldName}}</div>', title: '证书类型', width: 100}
                    , {field: 'beginTime',title: '申请时间', width: 200, sort: true}
                    , {field: 'turnoverTime',title: '更新时间', width: 200, sort: true}
                    , {field: 'cerTestScore',title: '测试分数', width: 120}
                    , {field: 'cerJudgeScore',title: '评审成绩', width: 120,templet:function (d) {
                        if (d.cerJudgeScore==0){
                            return "未评审";
                        }else {
                            return d.cerJudgeScore;
                        }
                        }}
                    , {templet: '<div>{{d.state.paramName}}</div>', title: '当前状态',  width: 120}
                    , {field: 'score', title: '操作', width: 258, align: 'center', toolbar: '#barDemo'}
                ]]
                , id: 'testReload'
                , page: true
                , height: 500
            });

            table.on('tool(user)', function (obj) {
                var data = obj.data;
                if (obj.event === 'chakancs') {
                    var name = data.trueName;
                    var cerid = data.cerRecordId;
                    $('#username').val(name);
                    $('#usershenfen').val(data.idNumber);
                    $('#userphone').val(data.cerPhone);
                    $('#zhengshuss').val(data.field.fieldName);
                    $('#testfenshu').val(data.cerTestScore);

                    layer.open({
                        //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                        type: 1,
                        title: "查看"+name+"的申请记录",
                        area: ['500px', '600px'],
                        offset: '50px',
                        content: $("#popUpdateTest") //引用的弹出层的页面层的方式加载修改界面表单
                    });
                    form.on('submit(xiazaiceshi)', function(massage) {
                        location.href='${pageContext.request.contextPath}/zhengshu/csbgdownload?cerid='+cerid;
                    });
                    form.on('submit(demo11)', function(massage) {
                        layer.closeAll();
                    });

                }
                else if (obj.event === 'chakanps') {

                    var name = data.trueName;
                    var cerid = data.cerRecordId;
                    $('#usernames').val(name);
                    $('#usershenfens').val(data.idNumber);
                    $('#userphones').val(data.cerPhone);
                    $('#zhengshusss').val(data.field.fieldName);
                    $('#testfenshus').val(data.cerTestScore);
                    $('#jugefenshus').val(data.cerJudgeScore);
                    $('#zongfenshus').val(data.cerFinalScore);

                    layer.open({
                        //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                        type: 1,
                        title: "查看"+name+"的申请记录",
                        area: ['500px', '700px'],
                        offset: '10px',
                        content: $("#PSUpdateTest") //引用的弹出层的页面层的方式加载修改界面表单
                    });

                    form.on('submit(xiazaiceshis)', function(massage) {
                        location.href='${pageContext.request.contextPath}/zhengshu/csbgdownload?cerid='+cerid;
                    });
                    form.on('submit(xiazaipingshen)', function(massage) {
                        location.href='${pageContext.request.contextPath}/zhengshu/finaldownload?cerid='+cerid;
                    });
                    form.on('submit(demo111)', function(massage) {
                        layer.closeAll();
                    });

                }
                else if (obj.event === 'fenfazhengshu') {

                    var filename = data.field.fieldName;
                    var name = data.trueName;
                    var cerid = data.cerRecordId;
                    var userid = data.userId;
                    alert(userid);
                    layer.confirm('是否分发:' + filename + '证书,给予'+name, function (index) {
                        $.ajax({
                            url:  '${pageContext.request.contextPath}/backzhengshu/xiugaicerwanchengzhuangtai?cerid='+cerid+'&userid='+userid,//请求服务端地址值
                            async: true,
                            type: "post",//请求方式
                            dataType: "text",
                            success: function (msg) {
                                if (msg=='success'){
                                    layer.msg('确认成功', {icon: 6});
                                    layer.closeAll();//关闭所有的弹出层
                                    location.href='${pageContext.request.contextPath}/backzhengshu/pingshenzhengshuliebiao'
                                }else if (msg=='fail'){
                                    layer.msg('确认失败，网络波动', {icon: 5});
                                }
                            }
                        });
                    });
                }
                else if (obj.event === 'pingshen') {
                    layer.open({
                        //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                        type: 1,
                        title: "上传评审结果",
                        area: ['400px', '450px'],
                        offset: '100px',
                        content: $("#uoloadUpdateTest") //引用的弹出层的页面层的方式加载修改界面表单
                    });
                    form.on('submit(demo222)', function(massage) {
                       var pingshenshipian = document.getElementById("pingshenvideo").value;
                       var zuizhongbaogao =  document.getElementById("finalbaogao").value;
                       var  filename1 = pingshenshipian.substring(pingshenshipian.lastIndexOf(".")+1).toLowerCase();
                        var  filename2 = zuizhongbaogao.substring(zuizhongbaogao.lastIndexOf(".")+1).toLowerCase();
                        if (filename1 != "zip"){
                            layer.msg('视频请上传压缩文件', {icon: 5});
                            return;
                        }else if (filename1 == ""){
                            layer.msg('请先添加评审视频', {icon: 5});
                            return;
                        }else if (filename2 == ""){
                            layer.msg('请先添加报告', {icon: 5});
                            return;
                        }else if (filename2 != "doc" && filename2 != "docx"){
                            layer.msg('上传文件格式不正确，请重新上传', {icon: 5});
                            return;
                        }
                        var cerid = data.cerRecordId;
                        var finalscore= massage.field.fenshu;
                        var formData= new FormData;
                        formData.append("videoup",$("#pingshenvideo")[0].files[0]);
                        formData.append("fileup",$("#finalbaogao")[0].files[0]);
                        formData.append("cerid",cerid);
                        formData.append("finalsocre",finalscore);

                        $.ajax({
                            url:'${pageContext.request.contextPath}/backzhengshu/pingshenfileupload',//=servlet里要调用的方法名
                            async: true,//true异步请求，false同步请求，不写默认true，ajax嵌套时需要同步请求
                            type: "post",//请求方式
                            data: formData,//要提交的数据
                            processData:false,
                            contentType:false,
                            dataType:"text",
                            success:function (msg) {
                                console.log(msg)
                                if(msg=="success"){
                                    layer.alert('评审成功')
                                    location.href='${pageContext.request.contextPath}/backzhengshu/pingshenzhengshuliebiao'
                                }else if (msg = "fail"){
                                    layer.msg('网络异常404', {icon: 5});

                                }
                            }

                        });
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

            form.verify({
                chengji: [
                    /^([1-9]|[2-4]\d|50)$/
                    ,'成绩0-50正整数'
                ]
            });
        });
    }
</script>

</body>
</html>
