
var form;
layui.use('form',function () {
    form = layui.form;
    form.render(null,'test1');
})

$(function () {
    $.ajax({
        url:path+"/rec/delUnviTalent",
        data:"compAndTalId="+compAndTalId,
        type:"get",
        typeData:"text",
        success:function (info) {
            layer.msg(info);
            if(info=='删除成功'){
                obj.del();
            }
        },
    })
})



