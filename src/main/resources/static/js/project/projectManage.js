var path;
$(function () {
    path=$("#path").val();
    layui.use(['table','laypage','layer','element'], function(){
        var table = layui.table;
        var layer = layui.layer;
        var laypage= layui.laypage;
        var element = layui.element;
        $(".params").on("click",function () {
            console.log($(this).children().val());
            table.reload("demo",{
                url:path+'/project/findProjectAll'
                ,where:{
                    "stateId":$(this).children().val()
                },page: {curr:1}
            });
        });
        laypage.render({
            elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: 50 //数据总数，从服务端得到
        });
        //第一个实例
        table.render({
            elem: '#demo'
            ,url: path+'/project/findProjectAll' //数据接口
            ,page: "page" //开启分页
            // ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,limit:5
            ,limits:[5,10,15,20]
            ,cols: [[ //表头
                {field: 'pOrderNum', title: '订单号',  fixed: 'left'}
                ,{field: 'projectName', title: '项目名称',  fixed: 'left'}
                ,{field: 'projectSynopsis', title: '项目描述',  fixed: 'left',templet:function (data) {
                        var str=data.projectSynopsis.replaceAll("<br>"," ");
                        return str;
                    }}
                ,{field: 'publishTime', title: '发布时间', fixed: 'center',width:200}
                ,{field: 'money', title: '预算费用（元）',fixed: 'center',width:140}
                ,{field: 'states', title: '状态', fixed: 'center',width:100,
                    templet:function (data) {
                        return data.states.paramName;
                    }
                }
                ,{field:'caozuo',title: '操作',width:300,align:'left',templet:"#toolbar"}
            ]]
        });
        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            console.log(layEvent);
            if(layEvent === 'detail'){
                // layer.msg('查看操作');
                location.href=path+"/project/projectDetail"
            }else if (layEvent === 'downProject'){
                location.href=path+data.projectUrl;
            }else if(layEvent === 'payMoney'){
                location.href= path +"/project/alipayTradePagePay?WIDout_trade_no="+data.pOrderNum+'&WIDtotal_amount='+data.trueMoney+'&WIDsubject='+"项目预算资金+佣金";
            }else if(layEvent === 'del'){
                if (confirm("确定删除该订单吗？")){
                    $.ajax({
                        url:path+"/project/del",
                        tyep:"post",
                        dataType:"text",
                        data:{"stateId":59,"projectId":data.projectId},
                        success:function (res) {
                            if (res=="success"){
                                layer.msg("已删除！");
                                table.reload("demo",{
                                    url:path+'/project/findProjectAll'
                                    ,where:{
                                        "stateId":$(this).children().val()
                                    },page: {curr:1}
                                });
                            }
                        }
                    });
                }
            }else if(layEvent === 'finish'){
                $.ajax({
                    url:path+"/project/finish",
                    tyep:"post",
                    dataType:"text",
                    data:{"stateId":38,"projectId":data.projectId,"userId":data.userId},
                    success:function (res) {
                        if (res=="success"){
                            layer.msg("已完成！");
                            table.reload("demo",{
                                url:path+'/project/findProjectAll'
                                ,where:{
                                    "stateId":37
                                },page: {curr:1}
                            });
                        }
                    }
                });
            }else if(layEvent==='aband'){
                if(confirm("确定放弃该项目吗？")){
                    $.ajax({
                        url: path + "/project/refund",
                        type: "post",
                        data: {'WIDout_trade_no': data.pOrderNum, 'WIDrefund_amount': data.trueMoney},
                        dataType: "text",
                        success: function (data) {
                            if (data.toUpperCase() === "SUCCESS") {
                                layer.confirm("放弃成功,费用已退还到您的账户!");
                                table.reload("demo", {
                                    url: path + '/project/findProjectAll',
                                    where: {
                                        "stateId": $(this).children().val()
                                    }, page: {curr: 1}
                                });
                            } else {
                                layer.confirm("放弃失败，请刷新页面后重试！");
                            }
                            console.log(data);
                        }
                    });
                }
            }
        });
    });
})

function initUserInfo() {
    document.getElementById("userInfoForm").reset();
}

// function changeUserState(obj,code) {
//     var obj=obj;
//     var code=code;
//     $.ajax({
//         url:path+"/userManager/changeUserState",
//         type:'post',
//         data:{"user":JSON.stringify(obj.data),"code":code},
//         dataType:'json',
//         success:function (res) {
//             console.log(res);
//             if (res.code=='success'){
//                 obj.data=res.userInfo;
//                 console.log(res.userInfo);
//                 obj.update(obj.data);
//                 layer.alert("修改成功！")
//             }else{
//                 layer.alert("修改失败！")
//             }
//         }
//     })
// }


