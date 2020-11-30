var path;
var pageCounts=$("#pageCounts").val();
$(function(){
    layui.use(["element","upload"],function () {
        var element=layui.element;
        var upload=layui.upload;
        var uploadInst = upload.render({
            elem: '#upload' //绑定元素
            ,url: path+ '/project/uploadDemandFile' //上传接口
            ,accept: 'file'
            ,exts: 'zip|rar|7z'
            ,done: function(res){
                //上传完毕回调
                console.log(res);
                if (res.code===0){
                    $("#uploadState").html("<i class='layui-icon' title='上传成功!'>&#x1005;</i>");
                    $("#docUrl").val(res.data.docUrl);
                    console.log($("#fileUrl").val());
                    layer.msg("上传成功！");
                }else{
                    $("#uploadState").html("<i class='layui-icon' title='上传失败!'>&#x1006;</i>");
                    $("#fileUrl").val("");
                    layer.msg("上传失败！");
                }
            }
            ,progress: function(n, elem){
                var percent = n + '%' //获取进度百分比
                console.log(percent);
                element.progress('progress', percent); //可配合 layui 进度条元素使用
                //以下系 layui 2.5.6 新增
                console.log(elem); //得到当前触发的元素 DOM 对象。可通过该元素定义的属性值匹配到对应的进度条。
            }
            ,error: function(){
                //请求异常回调
                console.log("11111111111");
            }
        });
    });

    path=$("#path").val();
    findProjectOrder(1,5);
    var nav=$("#headerbody"); //得到导航对象
    var win=$(window); //得到窗口对象
    var sc=$(document);//得到document文档对象。
    win.scroll(function(){
        if(sc.scrollTop()>=116){
            nav.addClass("fixednav");
            $(".navTmp").fadeIn();
        }else{
            nav.removeClass("fixednav");
            $(".navTmp").fadeOut();
        }
    });
});
function chooseState(stateId) {
    $("#stateId").val(stateId);
    findProjectOrder();
}


function findProjectOrder(curr,limit){
    if (curr==null){
        curr=1;
    }
    if (limit==null){
        limit=5;
    }
    var orderNum=$("#orderNum").val();
    if (orderNum !== ""){
        orderNum=orderNum.trim();
    }
    $.ajax({
        url: path+"/userProject/findUserProject",
        type:"post",
        data:{"page":curr,"limit":limit,"orderNum":orderNum,"stateId":$("#stateId").val()},
        dataType:"json",
        success:function (res) {
            console.log(res);
            var projectList=$("#order_list");
            if (pageCounts!==res.count){
                $("#pageCounts").val(res.count);
                pageCounts=$("#pageCounts").val();
                getPage();
            }
            projectList.children().remove();
            if (res.data!=null && res.data.length>0){
                for (var i=0;i<res.data.length;i++){
                    var project=res.data[i];
                    projectList.append("<div style=\"margin-top:10px;float: left\">\n" +
                        "                <div class=\"order-info\" style=\"display: block;\">\n" +
                        "                    <div class=\"order-title\" style=\"border-right: 1px solid #efefef;background-color:#eff1ff\">\n" +
                        "                        <p class=\"order-no\" >\n" +
                        "                            <span style=\"margin-left: 10px\">订单号：</span>\n" +
                        "                            <span>"+project.orderNum+"</span>\n" +
                        "                        </p>\n" +
                        "                        <p class=\"create-time\">\n" +
                        "                            申请时间:\n" +
                        "                            <span>\n" +
                                                     project.appTime +
                        "                        </span>\n" +
                        "                        </p>\n" +
                        "                        <p class=\"additional-info\">\n" +
                        "                            联系电话:\n" +
                        "                            <span>\n" +
                                                 project.projectInfo.backUser.contactInfo+
                        "                        </span>\n" +
                        "                        </p>\n" +
                        "                    </div>\n" +
                        "                </div>\n" +
                        "                <div class=\"\" style=\"background-color: white;border:0px solid #efefef;\">\n" +
                        "                    <div class=\"fl\" style=\"width: 435px;height:100px;background-color:white;border-left: 1px solid #efefef;border-bottom: 1px solid #efefef; padding:0px 10px\">\n" +
                        "                        <p class=\"order-Name\" style=\"border:0px solid #efefef;\">\n" +
                        "                            "+project.projectInfo.projectName+
                        "                        </p>\n" +
                        "                        <div class=\"order-desc\" style=\"white-space:normal; word-break:break-all;overflow:hidden;\">\n"+project.projectInfo.projectSynopsis+
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                    <div class=\"fl\" style=\"width: 182px;height: 100px;background-color:white;border-bottom: 1px solid #efefef;border-left: 1px solid #efefef;\">\n" +
                        "                        <p class=\"total\" style=\"\">项目金额: ￥"+project.projectInfo.money+"</p>\n" +
                        "                        <p class=\"payMoney\">保证金： ￥"+project.payMoney+"</p>\n" +
                        "                    </div>\n" +
                        "                    <div class=\"fl\" style=\"width: 200px;height: 100px;background-color:white;border-left: 1px solid #efefef;border-bottom: 1px solid #efefef;\">\n" +
                        "                        <p class=\"state\">订单状态 <span style=\"color: #000000\"> : &nbsp;"+project.states.paramName+"</span></p>\n" +
                        "                        <p class=\"state\">项目需求 <span style=\"color: #000000\"> : &nbsp;<a onclick=\"downloadFile('"+project.projectInfo.docUrl+"')\"><i class='layui-icon layui-icon-down'></i> 文件下载 </a></span></p>\n"+
                        "                    </div>\n" +
                        "                    <div id=caoZuo"+project.id+" class=\"fl\" style=\"width: 206px;height:100px;background-color:white;border-left: 1px solid #efefef;border-right: 1px solid #efefef;border-bottom: 1px solid #efefef;\">\n" +
                        "                    </div>\n" +
                        "                </div>\n" +
                        "            </div>");


                    if (project.states.paramName==='待付款'){
                        $("#caoZuo"+project.id).append(
                            "                        <div class=\"text-center\" style=\"margin-top: 10px\">\n" +
                            "                            <a href='javascript:;' onclick=\"xiangQing('"+project.projectId+"')\">查看详情</a>\n" +
                            "                        </div>");
                        $("#caoZuo"+project.id).append(
                    "                       <div class=\"text-center\" style=\"margin-top: 10px\">\n" +
                    "                            <a href='javascript:;' class=\"layui-btn layui-btn-xs layui-btn-danger\" style=\"width: 100px\" onclick=\"payMoney("+project.orderNum+","+project.payMoney+")\">立即付款</a>\n" +
                    "                                </div>\n" +
                    "                        <div class=\"text-center\" style=\"margin-top: 10px\">\n" +
                    "                            <a href='javascript:;' onclick=\"delOrder('"+project.id+"')\"> 删除订单</a>\n" +
                    "                        </div>\n");
                    }
                    if (project.states.paramName==='已申请'){
                        $("#caoZuo"+project.id).append(
                            "                        <div class=\"text-center\" style=\"margin-top: 10px\">\n" +
                            "                            <a href='javascript:;' onclick=\"xiangQing('"+project.projectId+"')\">查看详情</a>\n" +
                            "                        </div>");
                        $("#caoZuo"+project.id).append(
                            "                        <div class=\"text-center\" style=\"margin-top: 10px\">\n" +
                            "                            <a href='javascript:;' onclick='abandonProject("+project.orderNum+","+project.payMoney+")'> 放弃申请</a>\n" +
                            "                        </div>\n");
                    }

                    if (project.states.paramName==='申请成功'){
                        $("#caoZuo"+project.id).append(
                            "                        <div class=\"text-center\" style=\"margin-top: 10px\">\n" +
                            "                            <a href='javascript:;' onclick=\"xiangQing('"+project.projectId+"')\">查看详情</a>\n" +
                            "                        </div>");
                        $("#caoZuo"+project.id).append(" <div class=\"text-center\" style=\"margin-top: 10px\">\n" +
                            "                            <a href='javascript:;' onclick='uploadProject("+project.projectInfo.projectId+")'> 上传项目</a>\n" +
                            "                        </div>\n");
                    }
                    if (project.states.paramName==='申请失败'){
                        $("#caoZuo"+project.id).append(
                            "                        <div class=\"text-center\" style=\"margin-top: 10px\">\n" +
                            "                            <a href='javascript:;' onclick=\"xiangQing('"+project.projectId+"')\">查看详情</a>\n" +
                            "                        </div>");
                    }
                    if (project.states.paramName==='已完成'){
                        $("#caoZuo"+project.id).append(
                        "                        <div class=\"text-center\" style=\"margin-top: 10px\">\n" +
                        "                            <a href='javascript:;' onclick=\"xiangQing('"+project.projectId+"')\">查看详情</a>\n" +
                        "                        </div>");
                    }
                    if (project.states.paramName==='已终止'){
                        $("#caoZuo"+project.id).append(
                            "                        <div class=\"text-center\" style=\"margin-top: 10px\">\n" +
                            "                            <a href='javascript:;' onclick=\"xiangQing('"+project.projectId+"')\">查看详情</a>\n" +
                            "                        </div>");
                    }
                }
            }
        }
    })
}

function xiangQing(projectId) {
    location.href=path+"/project/projectDetail/?projectId="+projectId;
}

function updateProjectFile(){
    var projectId=$("#projectId").val();
    var projectUrl=$("#docUrl").val();
    console.log("projectId+  "+$("#projectId").val());
    console.log($("#docUrl").val());
    $.ajax({
        url:path+"/userProject/updateUrl",
        type:"post",
        data:{"projectId":projectId,"projectUrl":projectUrl},
        dataType:"text",
        beforeSend:function () {
            if (projectUrl==""){
                layer.use("layer",function () {
                    var layer=layui.layer;
                    layer.msg("请上传文件");
                })
            }
        }, success:function (res) {
            console.log(res);
            if (res=="success"){
                layui.use("layer",function () {
                    var layer=layui.layer;
                    layer.msg("上传成功，请等待对方验收！");
                    closeUp();
                    findProjectOrder(1,5);
                })

            }
        },
        error:function () {
            console.log("错误！");
        }
    })
}

function uploadProject(projectId){
    $("#projectId").val(projectId);
    console.log(projectId);
    layui.use("layer",function () {
        var layer=layui.layer;
        layer.open({
            //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
            type: 1,
            title: "上传项目",
            area: ['400px',"200px"],
            offset: '100px',
            content: $("#uploadUpdateTest") //引用的弹出层的页面层的方式加载修改界面表单
        });
    })
}

function delOrder(id) {
    if (confirm("确定删除该订单吗？")){
        $.ajax({
            url:path+"/userProject/del",
            tyep:"post",
            dataType:"text",
            data:{"paramId":60 , "id":id},
            success:function (res) {
                if (res=="success"){
                    layer.msg("已删除！");
                    findProjectOrder(1,5);
                }
            }
        });
    }
}

function getPage(){
    console.log(pageCounts);
    layui.use('laypage', function(){
        var laypage = layui.laypage;
        //执行一个laypage实例
        laypage.render({
            elem: 'projectPage' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: pageCounts  //数据总数，从服务端得到
            ,limit:5
            ,curr:1
            ,layout: ['count', 'prev', 'page', 'next', 'refresh', 'skip']
            ,jump: function(obj, first){
                //obj包含了当前分页的所有参数，比如：
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数
                if(!first){
                    findProjectOrder(obj.curr,obj.limit);
                    // obj.count=pageCounts;
                }
            }
        });
    });
}

/**
 * 立即付款
 */
function payMoney(orderNum,payMoney){
    console.log(orderNum   +"  "  + payMoney);
    location.href= path +"/userProject/alipayTradePagePay?WIDout_trade_no="+orderNum+'&WIDtotal_amount='+payMoney+'&WIDsubject='+"用户承接项目保证金";
}

/**
 * 放弃申请
 */
function abandonProject(orderNum,payMoney) {
    layui.use("layer",function () {
        var layer=layui.layer;
        layer.confirm("确定放弃该项目申请吗？",function () {
            $.ajax({
                url: path + "/userProject/refund?WIDout_trade_no=" + orderNum + '&WIDrefund_amount=' + payMoney,
                dataType: "text",
                success: function (data) {
                    if (data.toUpperCase() === "SUCCESS") {
                        alert("放弃成功,保证金将在1~3个工作日内退还到您的账户!");
                        findProjectOrder(1,5);
                    }else{
                        layer.msg("放弃失败，请刷新页面后重试！");
                    }
                    console.log(data);
                }
            })
        })
    });
}


function closeUp() {
    layui.use(["layer","element"],function () {
        var layer=layui.layer;
        var element=layui.element;
        layer.closeAll();
        element.progress('progress', 0);
    });
    $("#uploadState").html("");
    $("#projectId").val("");
    $("#docUrl").val("");
    $("#uploadUpdateTest").css("display","none");
}
function findProject(){
    location.href=path+"/project?projectName="+$("#projectName").val();
}

function downloadFile(docUrl) {
    if (docUrl!=null && docUrl.trim()!==""){
        location.href=path+docUrl;
    }else{
        layui.use("layer", function() {
            var layer = layui.layer;
            layer.msg("对方未上传文件！");
        });
    }
}

function userExit(){
    if (confirm("确定注销吗?")){
        $.ajax({
            url:path+"/userProject/userExit",
            success:function (res) {
                if (res=="success"){
                    alert("退出成功！")
                    location.href=path+"/project"
                }
            }
        })
    }
}