var layer;
var path;
var objs;
var index;
var form;
layui.use(['laydate','layer','form'],function () {
    path = $("#path").val();
    form = layui.form;
    form.render();
    var laydate = layui.laydate;
    layer = layui.layer;
})

layui.use('table',function () {
    var table = layui.table;
    table.render({
        elem:'#onLineTable',
        height:332,
        limits:[5],
        limit:5,
        url:path+"/rec/findOnlinePosition",
        page:true,
        id: 'testReload',
        cols:[[
            {field:'postName',title:'岗位名称',sort:true},
            {field:'department',title:'部门'},
            {field:'education',title:'学历'},
            {field:'workNature',title:'工作性质'},
            {field:'workYear',title:'工作时间'},
            {field:'releaseTime',title:'发布时间'},
            {title:'操作',toolbar:'#btns',width:250}
        ]]
    });

    table.on('tool(test)', function(obj){
        var data = obj.data;
        var pPostId = data.pPostId;

        if(obj.event === 'del'){
            layer.confirm('是否删除',{
                btn:['删除','取消'],
                time:20000,
            },function (index) {
                $.ajax({
                    url:path+"/rec/delPositionStand",
                    data:"pPostId="+pPostId,
                    type:"post",
                    typeData:"text",
                    success:function (info) {
                        layer.msg(info);
                        if(info=='删除成功'){
                            obj.del();
                        }
                    },
                })
            })
        } else if(obj.event === 'offLine'){
            layer.confirm('是否下线岗位',{
                btn:['下线','取消'],
                time:20000,
            },function (index) {
                $.ajax({
                    url:path+"/rec/offLinePosition",
                    data:"pPostId="+pPostId,
                    type:"post",
                    typeData:"text",
                    success:function (info) {
                        if(info=='1'){
                            layer.msg("下线成功");
                            obj.del();
                        }else{
                            layer.msg("网络繁忙，下线失败");
                        }
                    },
                })
            })
        }else if(obj.event==='detail'){
            var postID = data.postId;
            $.ajax({
                url:path+"/rec/findPostName",
                data:"postID="+postID,
                type:"post",
                typeData:"text",
                success:function (info) {
                    $("#dPostType").text(info);
                    detail(data);
                    showDetail();
                },
            })
        }
    });

    var $ = layui.$, active = {
        reload: function(){
            //执行重载
            table.reload('testReload', {
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                    postName: $('#postName').val(),
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
function closeLayer() {
    layer.close(index);
}

function detail(data) {
    $("#pID").val(data.pPostId);
    $("#dPostName").text(data.postName);
    $("#dDepart").text(data.department);
    $("#salary").text(data.minSalary+"k-"+data.maxSalary+"k");
    $("#dWorkCity").text(data.workCity);
    $("#num").text(data.recruitsNum);
    $("#dWorkExp").text(data.workYear);
    $("#dEducation").text(data.education);
    $("#workType").text(data.workNature);
    $("#dEmail").text(data.contactEmail);
    $("#dAddress").text(data.detailAddress);
    $("#fuli").text(data.jobBenefits);
    $("#workDes").text(data.jobDescription);
    $("#dContact").text(data.contact);
}

function showDetail() {
    layer.open({
        title:"岗位查看编辑",
        type:1,
        area:['80%','90%'],
        offset: ['5%', '10%'],
        content:$("#postPositionDetailDiv"),
    })
}
