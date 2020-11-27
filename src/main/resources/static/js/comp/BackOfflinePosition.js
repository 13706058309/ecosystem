
var layer;
var path;
var objs;
var index;
var form;
layui.use(['laydate','layer','form'],function () {
    path = $("#path").val();
    form = layui.form;
    form.render('select','industry');
    var laydate = layui.laydate;
    layer = layui.layer;
    laydate.render({
        elem:'#beginTime'
    });
    laydate.render({
        elem:'#endTime'
    });

    form.on('select(industry)', function(data){
        $.ajax({
            url:path+"/rec/findDepartByID",
            data:"industryID="+data.value,
            type:"post",
            typeData:"text",
            success:function (info) {
                var arr = JSON.parse(info);
                $("#depart").empty();
                $("#postId").empty();
                var $option1 = $("<option>"+'请选择'+"</option>");
                $("#depart").append($option1);
                for(var i=0;i<arr.length;i++){
                    var $option = $("<option value='"+arr[i].departId+"' >"+arr[i].departName+"</option>");
                    $("#depart").append($option);
                    form.render();
                }
            },
        })
    })

    form.on('select(depart)', function(data){

        $.ajax({
            url:path+"/rec/findPositionByID",
            data:"departID="+data.value,
            type:"post",
            typeData:"text",
            success:function (info) {
                var arr = JSON.parse(info);
                $("#postId").empty();
                var $option1 = $("<option>"+'请选择'+"</option>");
                $("#postId").append($option1);
                for(var i=0;i<arr.length;i++){
                    var $option = $("<option value='"+arr[i].postId+"' >"+arr[i].postName+"</option>");
                    $("#postId").append($option);
                    form.render();
                }
            },
        })
    })

    form.on('select(province)', function(data){
        $.ajax({
            url:path+"/rec/findCityByID",
            data:"provinceID="+data.value,
            type:"post",
            typeData:"text",
            success:function (info) {
                var arr = JSON.parse(info);
                $("#workCity").empty();
                var $option1 = $("<option>"+'请选择'+"</option>");
                $("#workCity").append($option1);
                for(var i=0;i<arr.length;i++){
                    var $option = $("<option value='"+arr[i].cityName+"' >"+arr[i].cityName+"</option>");
                    $("#workCity").append($option);
                    form.render();
                }
            },
        })
    })
})


layui.use('table',function () {
    var table = layui.table;
    table.render({
        elem:'#userTable',
        height:332,
        limits:[5],
        limit:5,
        url:path+"/rec/findOfflinePosition",
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
        //删除岗位
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
        } else if(obj.event === 'onLine'){
            //重新发布岗位
            layer.confirm('是否重新上线岗位',{
                btn:['确定','取消'],
                time:20000,
            },function (index) {
                $.ajax({
                    url:path+"/rec/onLinePosition",
                    data:"position="+JSON.stringify(data),
                    type:"post",
                    typeData:"text",
                    success:function (info) {
                        if(info=='1'){
                            layer.msg("重新上线成功");
                            obj.del();
                        }else{
                            layer.msg("网络繁忙，上线失败");
                        }
                    },
                })
            })
        }else if(obj.event==='edit'){
            var postID = data.postId;
            $.ajax({
                url:path+"/rec/findPostName",
                data:"postID="+postID,
                type:"post",
                typeData:"text",
                success:function (info) {
                    $("#dPostType").text(info);
                    objs = obj;
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

function showDetail() {
    layer.open({
        title:"岗位查看编辑",
        type:1,
        area:['80%','70%'],
        offset: ['5%', '10%'],
        content:$("#postPositionDetailDiv"),
    })
}
//查找所有省份


$(function () {
    path = $("#path").val();
    $.ajax({
        url:path+"/rec/findAllIndustry",
        type:"post",
        typeData:"text",
        success:function (info) {
            var arr = JSON.parse(info);
            $("#industry").empty();
            var $option1 = $("<option>"+'请选择'+"</option>");
            $("#industry").append($option1);
            for(var i=0;i<arr.length;i++){
                var $option = $("<option value='"+arr[i].industryId+"' >"+arr[i].industryName+"</option>");
                $("#industry").append($option);
                form.render();
            }
        },
    })
})

$(function () {
    path = $("#path").val();
    $.ajax({
        url:path+"/rec/findAllProvince",
        type:"post",
        typeData:"text",
        success:function (info) {
            var arr = JSON.parse(info);
            $("#province").empty();
            var $option1 = $("<option>"+'请选择'+"</option>");
            $("#province").append($option1);
            for(var i=0;i<arr.length;i++){
                var $option = $("<option value='"+arr[i].provinceId+"'>"+arr[i].provinceName+"</option>");
                $("#province").append($option);
                form.render();
            }
        },
    })
})


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

function changePostName() {
    $("#newPostName").val("");
    var postIDs = $("#pID").val();
    layer.open({
        type:1,
        title:"岗位名称修改",
        area:['30%','30%'],
        offset: ['10%', '30%'],
        content:$("#changePostName"),
        btn:['修改','取消'],
        btn1: function (index,layero) {
            var postName = $("#newPostName").val();
            $.ajax({
                url:path+"/rec/changePostPosition",
                data:"pPostId="+postIDs+"&postName="+postName,
                type:"post",
                typeData:"text",
                beforeSend:function(){
                    if(postName.trim().length==0){
                        layer.alert("请填写岗位名称");
                        return false;
                    }
                    if(postName.trim().length>10){
                        layer.alert("岗位名称不能超过10");
                        return false;
                    }
                },
                success:function (info) {
                    layer.close(index);
                    if(info==1){
                        layer.alert("修改成功");
                        objs.update({
                            postName: postName,
                        });
                        $("#dPostName").text(postName);
                    }else{
                        layer.alert("网络繁忙，通知失败")
                    }
                },
            })
        },
        btn2:function (index,layero) {
            layer.close(index);
        }
    })
}

function changeDepartName() {
    $("#newDepart").val("");
    var postIDs = $("#pID").val();
    layer.open({
        type:1,
        title:"部门名称修改",
        area:['30%','30%'],
        offset: ['10%', '30%'],
        content:$("#changeDepartMent"),
        btn:['修改','取消'],
        btn1: function (index,layero) {
            var newDepartName = $("#newDepart").val();
            $.ajax({
                url:path+"/rec/changePostPosition",
                data:"pPostId="+postIDs+"&department="+newDepartName,
                type:"post",
                typeData:"text",
                beforeSend:function(){
                    if(newDepartName.trim().length==0){
                        alert("请填写部门");
                        return false;
                    }
                    if(newDepartName.trim().length>10){
                        alert("部门长度不能超过10");
                        return false;
                    }
                },
                success:function (info) {
                    layer.close(index);
                    if(info==1){
                        layer.alert("修改成功");
                        objs.update({
                            department: newDepartName,
                        });
                        $("#dDepart").text(newDepartName);
                    }else{
                        layer.alert("网络繁忙，通知失败")
                    }
                },
            })
        },
        btn2:function (index,layero) {
            layer.close(index);
        }
    })
}
//修改岗位类型
function changePostType() {
    // findAllIndustry();
    var postIDs = $("#pID").val();
    layer.open({
        type:1,
        title:"岗位类型修改",
        area:['80%','70%'],
        offset: ['5%', '10%'],
        content:$("#changePost"),
        btn:['修改','取消'],
        btn1: function (index,layero) {
            var postID = $("#postId").val();
            $.ajax({
                url:path+"/rec/changePostID",
                data:"pPostId="+postIDs+"&postId="+postID,
                type:"post",
                typeData:"text",
                beforeSend:function(){
                    if(postID==null||postID=='请选择'||postID.length==0){
                        alert("请选择岗位");
                        return false;
                    }
                },
                success:function (info) {
                    layer.close(index);
                    if(info!=2){
                        layer.alert("修改成功");
                        objs.update({
                            postId: postID,
                        });
                        $("#dPostType").text(info);
                    }else{
                        layer.alert("网络繁忙，通知失败")
                    }
                },
            })
        },
        btn2:function (index,layero) {
            layer.close(index);
        }
    })
}

function changeSalary() {
    $("#minSalary").val("");
    $("#maxSalary").val("");
    var postIDs = $("#pID").val();
    layer.open({
        type:1,
        title:"修改工资",
        area:['50%','30%'],
        offset: ['10%', '30%'],
        content:$("#changeSalary"),
        btn:['修改','取消'],
        btn1: function (index,layero) {
            var minSalary = $("#minSalary").val();
            var maxSalary = $("#maxSalary").val();
            $.ajax({
                url:path+"/rec/changePostPosition",
                data:"pPostId="+postIDs+"&minSalary="+minSalary+"&maxSalary="+maxSalary,
                type:"post",
                typeData:"text",
                beforeSend:function(){

                    var pattern = /^\+?[1-9][0-9]*$/;
                    if(!pattern.test(minSalary)||!pattern.test(maxSalary)){
                        alert("工资只能是整数");
                        return false;
                    }
                    if(minSalary>=maxSalary){
                        alert("最低工资不能大于最大工资");
                        return false;
                    }

                },
                success:function (info) {
                    layer.close(index);
                    if(info==1){
                        layer.alert("修改成功");
                        objs.update({
                            minSalary: minSalary,
                            maxSalary: maxSalary,
                        });
                        $("#salary").text(minSalary+"k-"+maxSalary+"k");
                    }else{
                        layer.alert("网络繁忙，修改失败")
                    }
                },
            })
        },
        btn2:function (index,layero) {
            layer.close(index);
        }
    })
}
//修改工作城市
function changeCity() {
    var postIDs = $("#pID").val();
    layer.open({
        type:1,
        title:"修改工作城市",
        area:['60%','50%'],
        offset: ['5%', '10%'],
        content:$("#changeCity"),
        btn:['修改','取消'],
        btn1: function (index,layero) {
            var province = $("#province").val();
            var workCity = $("#workCity").val();
            $.ajax({
                url:path+"/rec/changePostPosition",
                data:"pPostId="+postIDs+"&province="+province+"&workCity="+workCity,
                type:"post",
                typeData:"text",
                beforeSend:function(){

                    if(workCity==null||workCity=='请选择'||workCity.length==0){
                        alert("工作城市不能为空");
                        return false;
                    }

                },
                success:function (info) {
                    layer.close(index);
                    if(info==1){
                        layer.alert("修改成功");
                        objs.update({
                            workCity: workCity,
                        });
                        $("#dWorkCity").text(workCity);
                    }else{
                        layer.alert("网络繁忙，修改失败")
                    }
                },
            })
        },
        btn2:function (index,layero) {
            layer.close(index);
        }
    })
}
//修改招收人数
function changeNum() {
    $("#newNum").val("");
    var postIDs = $("#pID").val();
    layer.open({
        type:1,
        title:"招收人数修改",
        area:['30%','30%'],
        offset: ['10%', '30%'],
        content:$("#changNum"),
        btn:['修改','取消'],
        btn1: function (index,layero) {
            var recruitsNum = $("#newNum").val();
            $.ajax({
                url:path+"/rec/changePostPosition",
                data:"pPostId="+postIDs+"&recruitsNum="+recruitsNum,
                type:"post",
                typeData:"text",
                beforeSend:function(){
                    if(recruitsNum.trim().length==0){
                        alert("招收人数未填写");
                        return false;
                    }
                    if(recruitsNum.trim().length>15){
                        alert("招收人数长度不能超过15");
                        return false;
                    }
                },
                success:function (info) {
                    layer.close(index);
                    if(info==1){
                        layer.alert("修改成功");
                        objs.update({
                            recruitsNum: recruitsNum,
                        });
                        $("#num").text(recruitsNum);
                    }else{
                        layer.alert("网络繁忙，通知失败")
                    }
                },
            })
        },
        btn2:function (index,layero) {
            layer.close(index);
        }
    })
}

function changeWorkYear() {
    var postIDs = $("#pID").val();
    layer.open({
        type:1,
        title:"修改工作时间",
        area:['40%','60%'],
        offset: ['30%', '20%'],
        content:$("#changeWorkYear"),
        btn:['修改','取消'],
        btn1: function (index,layero) {
            var workYear = $("#workYear").val();
            $.ajax({
                url:path+"/rec/changePostPosition",
                data:"pPostId="+postIDs+"&workYear="+workYear,
                type:"post",
                typeData:"text",
                success:function (info) {
                    layer.close(index);
                    if(info==1){
                        layer.alert("修改成功");
                        objs.update({
                            workYear: workYear,
                        });
                        $("#dWorkExp").text(workYear);
                    }else{
                        layer.alert("网络繁忙，修改失败")
                    }
                },
            })
        },
        btn2:function (index,layero) {
            layer.close(index);
        }
    })
}

function changeEdu() {
    var postIDs = $("#pID").val();
    layer.open({
        type:1,
        title:"修改学历",
        area:['40%','60%'],
        offset: ['30%', '20%'],
        content:$("#changeEdu"),
        btn:['修改','取消'],
        btn1: function (index,layero) {
            var education = $("#education").val();
            $.ajax({
                url:path+"/rec/changePostPosition",
                data:"pPostId="+postIDs+"&education="+education,
                type:"post",
                typeData:"text",
                success:function (info) {
                    layer.close(index);
                    if(info==1){
                        layer.alert("修改成功");
                        objs.update({
                            education: education,
                        });
                        $("#dEducation").text(education);
                    }else{
                        layer.alert("网络繁忙，修改失败")
                    }
                },
            })
        },
        btn2:function (index,layero) {
            layer.close(index);
        }
    })
}

function changeWorkType() {
    var postIDs = $("#pID").val();
    layer.open({
        type:1,
        title:"修改工作性质",
        area:['40%','40%'],
        offset: ['30%', '30%'],
        content:$("#changeWorkType"),
        btn:['修改','取消'],
        btn1: function (index,layero) {
            var workNature = $("input[name='workNature']:checked").val();
            $.ajax({
                url:path+"/rec/changePostPosition",
                data:"pPostId="+postIDs+"&workNature="+workNature,
                type:"post",
                typeData:"text",
                success:function (info) {
                    layer.close(index);
                    if(info==1){
                        layer.alert("修改成功");
                        objs.update({
                            workNature: workNature,
                        });
                        $("#workType").text(workNature);
                    }else{
                        layer.alert("网络繁忙，修改失败")
                    }
                },
            })
        },
        btn2:function (index,layero) {
            layer.close(index);
        }
    })
}
//修改接受邮箱
function changeEmail() {
    $("#contactEmail").val("");
    var postIDs = $("#pID").val();
    layer.open({
        type:1,
        title:"接受邮箱修改",
        area:['30%','30%'],
        offset: ['10%', '30%'],
        content:$("#changEmail"),
        btn:['修改','取消'],
        btn1: function (index,layero) {
            var contactEmail = $("#contactEmail").val();
            $.ajax({
                url:path+"/rec/changePostPosition",
                data:"pPostId="+postIDs+"&contactEmail="+contactEmail,
                type:"post",
                typeData:"text",
                beforeSend:function(){
                    var patterns = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                    if(!patterns.test(contactEmail)){
                        alert("请输入正确邮箱格式");
                        return false;
                    }
                },
                success:function (info) {
                    layer.close(index);
                    if(info==1){
                        layer.alert("修改成功");
                        objs.update({
                            contactEmail: contactEmail,
                        });
                        $("#dEmail").text(contactEmail);
                    }else{
                        layer.alert("网络繁忙，通知失败")
                    }
                },
            })
        },
        btn2:function (index,layero) {
            layer.close(index);
        }
    })
}
//修改联系方式
function changeContact() {
    $("#contact").val("");
    var postIDs = $("#pID").val();
    layer.open({
        type:1,
        title:"修改联系方式",
        area:['30%','30%'],
        offset: ['10%', '30%'],
        content:$("#changContact"),
        btn:['修改','取消'],
        btn1: function (index,layero) {
            var contact = $("#contact").val();
            $.ajax({
                url:path+"/rec/changePostPosition",
                data:"pPostId="+postIDs+"&contact="+contact,
                type:"post",
                typeData:"text",
                beforeSend:function(){
                    if(contact.trim().length==0){
                        alert("联系方式未填写");
                        return false;
                    }
                    if(contact.trim().length>30){
                        alert("联系方式长度不能超过30");
                        return false;
                    }
                },
                success:function (info) {
                    layer.close(index);
                    if(info==1){
                        layer.alert("修改成功");
                        objs.update({
                            contact: contact,
                        });
                        $("#dContact").text(contact);
                    }else{
                        layer.alert("网络繁忙，通知失败")
                    }
                },
            })
        },
        btn2:function (index,layero) {
            layer.close(index);
        }
    })
}
//修改工作地址
function changeAddre() {
    $("#detailAddress").val("");
    var postIDs = $("#pID").val();
    layer.open({
        type:1,
        title:"修改工作地址",
        area:['40%','40%'],
        offset: ['10%', '30%'],
        content:$("#changeAddress"),
        btn:['修改','取消'],
        btn1: function (index,layero) {
            var detailAddress = $("#detailAddress").val();
            $.ajax({
                url:path+"/rec/changePostPosition",
                data:"pPostId="+postIDs+"&detailAddress="+detailAddress,
                type:"post",
                typeData:"text",
                beforeSend:function(){
                    if(detailAddress.trim().length==0){
                        layer.alert("请填写详细地址");
                        return false;
                    }
                    if(detailAddress.trim().length>20){
                        layer.alert("地址长度不能超过20");
                        return false;
                    }
                },
                success:function (info) {
                    layer.close(index);
                    if(info==1){
                        layer.alert("修改成功");
                        objs.update({
                            detailAddress: detailAddress,
                        });
                        $("#dAddress").text(detailAddress);
                    }else{
                        layer.alert("网络繁忙，通知失败")
                    }
                },
            })
        },
        btn2:function (index,layero) {
            layer.close(index);
        }
    })
}
//修改福利描述
function changeJobBenf() {
    $("#jobBenefits").val("");
    var postIDs = $("#pID").val();
    layer.open({
        type:1,
        title:"修改福利描述",
        area:['40%','40%'],
        offset: ['10%', '30%'],
        content:$("#changeFuli"),
        btn:['修改','取消'],
        btn1: function (index,layero) {
            var jobBenefits = $("#jobBenefits").val();
            $.ajax({
                url:path+"/rec/changePostPosition",
                data:"pPostId="+postIDs+"&jobBenefits="+jobBenefits,
                type:"post",
                typeData:"text",
                beforeSend:function(){
                    if(jobBenefits.trim().length==0){
                        layer.alert("福利描述未填写");
                        return false;
                    }
                    if(jobBenefits.trim().length>20){
                        layer.alert("福利描述长度不能超过20");
                        return false;
                    }
                },
                success:function (info) {
                    layer.close(index);
                    if(info==1){
                        layer.alert("修改成功");
                        objs.update({
                            jobBenefits: jobBenefits,
                        });
                        $("#fuli").text(jobBenefits);
                    }else{
                        layer.alert("网络繁忙，通知失败")
                    }
                },
            })
        },
        btn2:function (index,layero) {
            layer.close(index);
        }
    })
}
//修改工作描述
function changeJobDes() {
    $("#jobDescription").val("");
    var postIDs = $("#pID").val();
    layer.open({
        type:1,
        title:"修改工作描述",
        area:['40%','40%'],
        offset: ['10%', '30%'],
        content:$("#changeWorkDes"),
        btn:['修改','取消'],
        btn1: function (index,layero) {
            var jobDescription = $("#jobDescription").val();
            $.ajax({
                url:path+"/rec/changePostPosition",
                data:"pPostId="+postIDs+"&jobDescription="+jobDescription,
                type:"post",
                typeData:"text",
                beforeSend:function(){
                    if(jobDescription.trim().length==0){
                        layer.alert("工作描述未填写");
                        return false;
                    }
                    if(jobDescription.trim().length<=10){
                        layer.alert("工作描述过于简单，长度起码10以上");
                        return false;
                    }

                    if(jobDescription.trim().length>100){
                        layer.alert("工作描述长度不能超过100");
                        return false;
                    }
                },
                success:function (info) {
                    layer.close(index);
                    if(info==1){
                        layer.alert("修改成功");
                        objs.update({
                            jobDescription: jobDescription,
                        });
                        $("#workDes").text(jobDescription);
                    }else{
                        layer.alert("网络繁忙，通知失败")
                    }
                },
            })
        },
        btn2:function (index,layero) {
            layer.close(index);
        }
    })
}
