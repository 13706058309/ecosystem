var path;
$(function(){
    path=$("#path").val();
});

$(function () {
    layui.use(['table','laypage','layer','element'], function(){
        var table = layui.table;
        var layer = layui.layer;
        var laypage= layui.laypage;
        var element = layui.element;
        //第一个实例
        table.render({
            elem: '#userTable'
            ,url: path+'/project/findUser' //数据接口
            ,page: "page" //开启分页
            // ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,limit:10
            ,limits:[5,10,15,20]
            ,where:{
                "projectId":$("#projectId").val()
            }
            ,cols: [[ //表头
                {field: 'realName', title: '申请人姓名'}
                ,{field: 'school', title: '毕业院校'}
                ,{field: 'profession', title: '专业'}
                ,{field: 'wrokYear', title: '工作年限',
                    templet:function (data) {
                        return data.wrokYear+"年";
                    }
                }
                ,{field:'caozuo',title: '操作',width:150,templet:"#toolbar"}
            ]]
        });
        //监听行工具事件
        table.on('tool(userTable)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            console.log(layEvent);
            if(layEvent ==='chooseApplicant'){
                // layer.msg('查看操作');
                $.ajax({
                    url:path+"/project/chooseApplicant",
                    data:{"userId":data.userId,"projectId":$("#projectId").val()}
                    ,type:"post"
                    ,dataType:"text"
                    ,beforeSend:function () {
                        if (!confirm("确定选择 "+data.realName+"作为此项目的承接人吗？")){
                            return false;
                        }
                        return true;
                    },
                    success:function (dataMsg) {
                        console.log(dataMsg);
                        if (dataMsg==="success"){
                            location.href=path+"/project/projectManage";
                        }
                    },error:function () {
                        console.log("网络异常！")
                    }
                })
            }
        });
    });
})

function demandFile(docUrl) {
    if (docUrl!=null && docUrl.trim()!==""){
        location.href=path+docUrl;
    }else{
        layui.use("layer", function() {
            var layer = layui.layer;
            layer.msg("文件不存在！");
        });
    }
}

function show_Hide(obj){
    if ($(obj).parent().prev().css("display")==="none"){
        $(obj).parent().prev().css("display","block");
        $(obj).text("收起 ^");
    }else{
        $(obj).parent().prev().css("display","none");
        $(obj).text("展开 v");
    }

}