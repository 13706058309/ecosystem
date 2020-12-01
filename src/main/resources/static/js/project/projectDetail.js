var path;
$(function(){
    path=$("#path").val();
    var nav=$("#headerbody"); //得到导航对象
    var win=$(window); //得到窗口对象
    var sc=$(document);//得到document文档对象。
});

function addUserProject(projectId,money){

    $.ajax({
        url:path+"/parameter/findAssureMoney",
        type:"post",
        beforeSend:function(){
            console.log($("#xieYi").prop('checked'));
            if (!$("#xieYi").prop('checked')){
                alert("请阅读并同意协议！");
                return false;
            }
            return true;
        },
        success:function (res) {
            layui.use("layer",function () {
                var layer=layui.layer;
                layer.confirm("申请项目需要提交"+res+"%的保证金，是否继续？",function () {
                    var vNow = new Date();
                    var sNow = "";
                    sNow += String(vNow.getFullYear());
                    sNow += String(vNow.getMonth() + 1);
                    sNow += String(vNow.getDate());
                    sNow += String(vNow.getHours());
                    sNow += String(vNow.getMinutes());
                    sNow += String(vNow.getSeconds());
                    sNow += String(vNow.getMilliseconds());
                    var userProject={"projectId":projectId,"payMoney":money,"orderNum":sNow};
                    $.ajax({
                        url:path+"/userProject/addUserProject",
                        type:"post",
                        data:userProject,
                        ContentType:"application/json;charset=utf-8",
                        dataType:"json",
                        success:function (data) {
                            if (data!=null){
                                layer.msg("申请成功");
                                location.href= path +"/userProject/alipayTradePagePay?WIDout_trade_no="+data.orderNum+'&WIDtotal_amount='+data.payMoney+'&WIDsubject='+"用户承接项目保证金"+'&id='+data.id;
                                // location.href=path+"/userProject/alipayTradePagePay?id="+data.id;
                            }else{
                                layer.confirm("您已申请了该项目，或有未完成的订单，是否跳转到“我的订单”查看？",function () {
                                    location.href=path+"/userProject/projectOfUser";
                                });
                            }
                            console.log(data);
                        }
                    },function () {
                        console.log("不提交");
                    });
                })
            })
        }
    });



}
function projectDetail(projectId){
    console.log(projectId);
    location.href=path+"/project/projectDetail?projectId="+projectId;
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
            layer.msg("文件不存在！");
        });
    }
}
function mouseOut(items){
    $(items).removeClass("search-money-border");
    $(items).children(".project-item-footer").children(".layui-btn").removeClass("layui-btn-danger");
    $(items).children(".project-item-footer").children(".layui-btn").addClass("layui-btn-primary");
}
function mouseIn(items){
    $(items).addClass("search-money-border");
    $(items).children(".project-item-footer").children(".layui-btn").removeClass("layui-btn-primary");
    $(items).children(".project-item-footer").children(".layui-btn").addClass("layui-btn-danger");
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