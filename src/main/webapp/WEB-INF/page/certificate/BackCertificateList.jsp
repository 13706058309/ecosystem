<%--
  Created by IntelliJ IDEA.
  User: WTQ
  Date: 2020/11/24
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台证书列表</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
    <style>
        img{
            width: 50px;
        }
    </style>
</head>
<body>
<div id="body">
    <div id="container" >
        <div class="demoTable" style="margin-top: 50px;margin-left: 200px">
            证书类型：
            <div class="layui-inline">
                <input class="layui-input" name="fieldName" id="fieldName" style="width: 250px;height: 40px" type="text" autocomplete="off" placeholder="请输入文档标题" >
            </div>

            <button class="layui-btn" data-type="reload">搜索</button>
            <button class="layui-btn" onclick="yanzheng()"  style="margin-left: 10%">新增</button>
        </div>
        <table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>
    </div>
</div>
<script type="text/html" id="barDemo">

    {{#  if(d.cershowState==1){ }}
    <a class="layui-btn layui-bg-red layui-btn-xs" lay-event="zhunagtai">下架</a>
    {{#  } }}
    {{#  if(d.cershowState==2){ }}
    <a class="layui-btn layui-bg-red layui-btn-xs" lay-event="zhunagtai">上架</a>
    {{#  } }}
    <a class="layui-btn layui-bg-blue layui-btn-xs" lay-event="xiugaixinxi">修改信息</a>
    <a class="layui-btn layui-bg-blue layui-btn-xs" lay-event="xiugaifile">修改需求</a>



</script>

<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<input type="hidden" id="filedname" value="">
<input type="hidden" id="filedname1" value="">
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<div class="layui-row" id="popUpdateTest" style="display:none">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane"  style="text-align: center;margin-top: 30px">
            <div class="layui-form-item"  id="app" style="margin-top: 30px">
                <label class="layui-form-label">证书名:</label>
                <div class="layui-input-block" >
                    <input type="text" name="zhengshuname" v-model.lazy='uname'  id="zhengshuname" style="float: left;width: 70%" autocomplete="off" placeholder="请输入证书名" class="layui-input">
                    <label class="layui-form-label" id="panduan">{{tip}}</label>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">证书费用:</label>
                <div class="layui-input-block">
                    <input type="number" name="feiyong" style="float: left;width: 70%"  id="feiyong" autocomplete="off" placeholder="请输入证书费用" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">证书特点:</label>
                <div class="layui-input-block">
                    <input type="text" name="tdian" style="float: left;width: 70%"  id="tdian"  autocomplete="off" placeholder="请输入证书特点" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">证书需求:</label>
                <div class="layui-input-block">
                    <input type="file" id="cerxuqiu" name="cerxuqiu"  style="float: left;width: 70%" accept="application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document" class="layui-btn layui-btn-radius layui-btn-normal">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">证书头像:</label>
                <div class="layui-input-block">
                    <input type="file" id="certouxiang" style="float: left;width: 70%" name="certouxiang" accept="image/*" onchange="showImg(this,img1)" class="layui-btn layui-btn-radius layui-btn-normal">
                    <img src="" alt="" id="img1">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">证书图片:</label>
                <div class="layui-input-block">
                    <input type="file" id="cerimage" style="float: left;width: 70%" name="cerimage" accept="image/*" onchange="showImg(this,img2)" class="layui-btn layui-btn-radius layui-btn-normal">
                    <img src="" alt="" id="img2">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">证书简述:</label>
                <div class="layui-input-block">
                   <textarea class="layui-input" id="jiansu" name="jiansu" style="width: 384px;height: 72px" ></textarea>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top:60px">
                <div class="layui-input-block" style="margin-left: 20px">
                    <button class="layui-btn " type="button"  lay-submit lay-filter="demo11">确认</button>
                    <input type="button" style="margin-left: 50px" value="取消" class="layui-btn" onclick="guan()">
                </div>
            </div>
        </form>
    </div>
</div>
<div class="layui-row" id="xiugaiUpdateTest" style="display:none">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane"  style="text-align: center;margin-top: 30px">
            <div class="layui-form-item"  id="apps" style="margin-top: 30px">
                <label class="layui-form-label">证书名:</label>
                <div class="layui-input-block" >
                    <input type="text" name="zhengshunames"  readonly  unselectable="on"  id="zhengshunames" style="float: left;width: 70%" autocomplete="off" placeholder="请输入证书名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">证书费用:</label>
                <div class="layui-input-block">
                    <input type="number" name="feiyongs" style="float: left;width: 70%"  id="feiyongs" autocomplete="off" placeholder="请输入证书费用" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">证书特点:</label>
                <div class="layui-input-block">
                    <input type="text" name="tdians" style="float: left;width: 70%"  id="tdians"  autocomplete="off" placeholder="请输入证书特点" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">证书简述:</label>
                <div class="layui-input-block">
                    <textarea class="layui-input" id="jiansus" name="jiansus" style="width: 384px;height: 72px" ></textarea>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top:60px">
                <div class="layui-input-block" style="margin-left: 20px">
                    <button class="layui-btn " type="button"  lay-submit lay-filter="demo22">修改</button>
                    <input type="button" style="margin-left: 50px" value="取消" class="layui-btn" onclick="guan()">
                </div>
            </div>
        </form>
    </div>
</div>
<div class="layui-row" id="fileUpdateTest" style="display:none">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane"  style="text-align: center;margin-top: 30px">
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">证书需求:</label>
                <div class="layui-input-block">
                    <input type="file" id="cerxuqius" name="cerxuqius"  style="float: left;width: 70%" accept="application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document" class="layui-btn layui-btn-radius layui-btn-normal">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top:60px">
                <div class="layui-input-block" style="margin-left: 20px">
                    <button class="layui-btn " type="button"  lay-submit lay-filter="demo33">修改</button>
                    <input type="button" style="margin-left: 50px" value="取消" class="layui-btn" onclick="guan()">
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
                , url: '${pageContext.request.contextPath}/backzhengshu/getbackzhengshulist'
                , cols: [[
                    {type: 'numbers', title: 'ID', width: 80}
                    , {templet: '<div>{{d.field.fieldName}}</div>', title: '证书类型', width: 150}
                    , {field: 'cerTrait',title: '证书特点', width: 300, sort: true}
                    , {field: 'cerChangeTime',title: '更新时间', width: 150, sort: true}
                    , {field: 'certificationFee',title: '证书费用', width: 150, sort: true}
                    , {field: 'cershowState',title: '当前状态', width: 200, sort: true,templet:function (d) {
                if (d.cershowState==1){
                    return "已上架";
                }else if (d.cershowState==2) {
                    return "已下架";
                }
            }}
                    , {field: 'score', title: '操作', width: 258, align: 'center', toolbar: '#barDemo'}
                ]]
                , id: 'testReload'
                , page: true
                , height: 500
            });

            table.on('tool(user)', function (obj) {
                var data = obj.data;
                if (obj.event === 'zhunagtai') {
                    var btnNode = $(this);
                    var curStateid = data.cershowState;
                    var name = data.field.fieldName;
                    var stateName = null;
                    var stateId = 0;
                    if (curStateid == 1) {
                        stateId = 2
                        stateName = "确认"+name+"下架吗？";
                    } else {
                        stateId = 1;
                        stateName = "确认"+name+"上架吗？";
                    }
                    layer.confirm(stateName, function (index) {
                        var id = data.cerId;//获取用户id
                        console.log("用户id：" + id);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/backzhengshu/upcershowState",//请求服务端地址值
                            async: true,
                            type: "post",//请求方式
                            data: "id=" + id + "&stateId=" + stateId,
                            dataType: "text",
                            success: function (msg) {
                                if (msg == "1") {
                                    layer.msg('上架成功', {icon: 6});
                                    obj.update({
                                        cershowState: 1,
                                    });
                                } else {
                                    layer.msg('下架成功', {icon: 6});
                                    obj.update({
                                        cershowState: 2,
                                    });
                                }
                                changeBtnText(btnNode)
                            }

                        });

                    });

                }
                else if (obj.event === 'xiugaixinxi') {
                    var id = data.cerId;
                    var filena = data.field.fieldName;
                    var money = data.certificationFee;
                    var lianagdian = data.cerTrait;
                    var jianji = data.cerSketch;

                    $('#zhengshunames').val(filena);
                    $('#feiyongs').val(money);
                    $('#tdians').val(lianagdian);
                    $('#jiansus').val(jianji);

                    layer.open({
                        //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                        type: 1,
                        title: "修改证书操作中",
                        area: ['600px', '500px'],
                        offset: '100px',
                        content: $("#xiugaiUpdateTest") //引用的弹出层的页面层的方式加载修改界面表单
                    });
                    form.on('submit(demo22)', function(massage) {


                        var feiyong= massage.field.feiyongs;
                        var tdian= massage.field.tdians;
                        var jiansu= massage.field.jiansus;


                        if (feiyong == ""||tdian == ""||jiansu == ""){
                            layer.msg('有未填选项，请认真填写', {icon: 5});
                            return;
                        }else if (feiyong == ""||tdian == ""||jiansu == ""){
                            layer.msg('有未填选项，请认真填写', {icon: 5});
                            return;
                        }
                        var formData= new FormData;
                        formData.append("feiyong",feiyong);
                        formData.append("tdian",tdian);
                        formData.append("jiansu",jiansu);
                        formData.append("cerId",id);
                        $.ajax({
                            url:'${pageContext.request.contextPath}/backzhengshu/backxiugaizhengshu',//=servlet里要调用的方法名
                            async: true,//true异步请求，false同步请求，不写默认true，ajax嵌套时需要同步请求
                            type: "post",//请求方式
                            data: formData,//要提交的数据
                            processData:false,
                            contentType:false,
                            dataType:"text",
                            success:function (msg) {
                                console.log(msg)
                                if(msg=="success"){
                                    layer.alert('修改成功')
                                    location.href='${pageContext.request.contextPath}/backzhengshu/backzhengshuliebiao'
                                }else if (msg = "fail"){
                                    layer.msg('网络异常404', {icon: 5});
                                }
                            }
                        });
                    });

                }
                else if (obj.event === 'xiugaifile') {
                    layer.open({
                        //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                        type: 1,
                        title: "修改证书需求中",
                        area: ['500px', '350px'],
                        offset: '100px',
                        content: $("#fileUpdateTest") //引用的弹出层的页面层的方式加载修改界面表单
                    });
                    var id = data.cerId;
                    form.on('submit(demo33)',function (massage) {

                        var cerxuqiu = document.getElementById("cerxuqius").value;
                        var  xuqiu = cerxuqiu.substring(cerxuqiu.lastIndexOf(".")+1).toLowerCase();
                        if (xuqiu == ""){
                            layer.msg('请先添加报告', {icon: 5});
                            return;
                        }else if (xuqiu != "doc" && xuqiu != "docx"){
                            layer.msg('上传文件格式不正确，请重新上传', {icon: 5});
                            return;
                        }
                        var formData= new FormData;
                        formData.append("xuqiu",$("#cerxuqius")[0].files[0]);
                        formData.append("cerId",id);
                        $.ajax({
                            url:'${pageContext.request.contextPath}/backzhengshu/backxiugaizhengshuxuqiu',//=servlet里要调用的方法名
                            async: true,//true异步请求，false同步请求，不写默认true，ajax嵌套时需要同步请求
                            type: "post",//请求方式
                            data: formData,//要提交的数据
                            processData:false,
                            contentType:false,
                            dataType:"text",
                            success:function (msg) {
                                console.log(msg)
                                if(msg=="success"){
                                    layer.msg('修改证书需求', {icon: 6});
                                }else if (msg = "fail"){
                                    layer.msg('网络异常404', {icon: 5});
                                }
                            }
                        });
                    });
                }
            });
            form.on('submit(demo11)', function(massage) {

                var cerxuqiu = document.getElementById("cerxuqiu").value;
                var certouxiang =  document.getElementById("certouxiang").value;
                var cerimage =  document.getElementById("cerimage").value;
                var  xuqiu = cerxuqiu.substring(cerxuqiu.lastIndexOf(".")+1).toLowerCase();
                var  touxiang = certouxiang.substring(certouxiang.lastIndexOf(".")+1).toLowerCase();
                var  zhengjiantu = cerimage.substring(cerimage.lastIndexOf(".")+1).toLowerCase();

                var zhengshuname= massage.field.zhengshuname;
                var feiyong= massage.field.feiyong;
                var tdian= massage.field.tdian;
                var jiansu= massage.field.jiansu;
                var qqq = $('#filename').val();

                if (touxiang != "jpg"&& touxiang != "png"){
                    layer.msg('视频请上传jpg/png图片', {icon: 5});
                    return;
                }else if (zhengjiantu != "jpg"&& zhengjiantu != "png"){
                    layer.msg('视频请上传jpg/png图片', {icon: 5});
                    return;
                }else if (touxiang == "" ||zhengjiantu == "" ){
                    layer.msg('请先添加图片', {icon: 5});
                    return;
                }else if (xuqiu == ""){
                    layer.msg('请先添加报告', {icon: 5});
                    return;
                }else if (xuqiu != "doc" && xuqiu != "docx"){
                    layer.msg('上传文件格式不正确，请重新上传', {icon: 5});
                    return;
                }else if (zhengshuname == ""||feiyong == ""||tdian == ""||jiansu == ""){
                    layer.msg('有未填选项，请认真填写', {icon: 5});
                    return;
                }else if (zhengshuname == ""||feiyong == ""||tdian == ""||jiansu == ""){
                    layer.msg('有未填选项，请认真填写', {icon: 5});
                    return;
                }else if (qqq == 'no' || qqq==''){
                    layer.msg('证书名错误，请认真填写', {icon: 5});
                    return;
                }


                var formData= new FormData;
                formData.append("xuqiu",$("#cerxuqiu")[0].files[0]);
                formData.append("touxiang",$("#certouxiang")[0].files[0]);
                formData.append("cerimage",$("#cerimage")[0].files[0]);
                formData.append("zhengshuname",zhengshuname);
                formData.append("feiyong",feiyong);
                formData.append("tdian",tdian);
                formData.append("jiansu",jiansu);

                $.ajax({
                    url:'${pageContext.request.contextPath}/backzhengshu/insertzhengshu',//=servlet里要调用的方法名
                    async: true,//true异步请求，false同步请求，不写默认true，ajax嵌套时需要同步请求
                    type: "post",//请求方式
                    data: formData,//要提交的数据
                    processData:false,
                    contentType:false,
                    dataType:"text",
                    success:function (msg) {
                        console.log(msg)
                        if(msg=="success"){
                            layer.alert('新增成功')
                            location.href='${pageContext.request.contextPath}/backzhengshu/backzhengshuliebiao'
                        }else if (msg = "fail"){
                            layer.msg('网络异常404', {icon: 5});
                        }
                    }
                });
            });
            var $ = layui.$, active = {
                reload: function () {
                    //执行重载
                    table.reload('testReload', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        , where: {
                            fieldName: $('#fieldName').val()
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


    function showImg(obj,id) {
        var file=$(obj)[0].files[0];    //获取文件信息
        var imgdata='';
        if(file)
        {
            var reader=new FileReader();  //调用FileReader
            reader.readAsDataURL(file); //将文件读取为 DataURL(base64)
            reader.onload=function(evt){   //读取操作完成时触发。
                $(id).attr('src',evt.target.result)  //将img标签的src绑定为DataURL
            };
        }
        else{
            alert("上传失败");
        }
    }
    function yanzheng() {
        layer.open({
            //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
            type: 1,
            title: "新增证书操作中",
            area: ['600px', '750px'],
            offset: '10px',
            content: $("#popUpdateTest") //引用的弹出层的页面层的方式加载修改界面表单
        });
    }

    //监听器
    // 1.采用监听器监听用户名变化
    // 2.调用后台接口进行啊验证
    // 3.根据验证结果调整提示信息
    var vm = new Vue({
        el:'#app',
        data:{
            uname:'',
            tip:'',
        },
        methods:{
            checkName:function (uname) {
                //调用接口，但是可用定时任务模拟接口调用
                var that = this;
                $.ajax({
                    url:  '${pageContext.request.contextPath}/backzhengshu/vuefiledname?uname='+uname,//请求服务端地址值
                    async: true,
                    type: "post",//请求方式
                    dataType: "text",
                    success: function (msg) {
                        setTimeout(function () {
                            //模拟接口调用
                            if(msg == 'success'){
                                //修改提示信息
                                that.tip = '重复使用！'
                                $('#panduan').css('color','red');
                                $('#filedname').val("no");
                            }else{
                                that.tip = '可以使用'
                                $('#panduan').css('color','#009688');
                                $('#filedname').val("yes");
                            }
                        },2000);
                    }
                });
            }
        },
        watch:{
            uname:function(val){
                //调用后台接口验证用户名的合法性
                this.checkName(val);
                this.tip = '正在验证'
                $('#panduan').css('color','blue');
            }
        }
    });

    function changeBtnText(node) {

        var text = $(node).text();
        if (text == "上架") {
            $(node).text("下架")
        } else {
            $(node).text("上架")
        }
    }
    function guan(){
        layer.closeAll();
    }
</script>

</body>
</html>