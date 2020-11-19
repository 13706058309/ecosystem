
var form;
var path;
var layer;
layui.use('form',function () {
    form = layui.form;
    layer = layui.layer;
    form.render(null,'test1');
    path = $("#path").val();
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

    form.on('select(position)', function(data){

    })
})

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
                var $option = $("<option value='"+arr[i].industryId+"' onclick='findDepart(1)'>"+arr[i].industryName+"</option>");
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

function findDepart(ID) {
    alert(ID);

}

function sumb() {
    path = $("#path").val();
    var form = new FormData(document.getElementById("postPosition"));
    $.ajax({
        url:path+"/rec/postPosition",
        data:form,
        processData:false,
        contentType:false,
        type:"post",
        typeData:"text",
        beforeSend:function(){
            var post = $("#postId").val();
            if(post==null||post=='请选择'||post.length==0){
                alert("请选择岗位");
                return false;
            }
            var department = $("#department").val();
            if(department.trim().length==0){
                alert("请填写部门");
                return false;
            }
            if(department.trim().length>10){
                alert("部门长度不能超过10");
                return false;
            }

            var postName = $("#postName").val();
            if(postName.trim().length==0){
                alert("请填写岗位名称");
                return false;
            }
            if(postName.trim().length>10){
                alert("岗位名称不能超过10");
                return false;
            }
            var minSalary = 0;
            var maxSalary = 0;
            minSalary = $("#minSalary").val();
            maxSalary = $("#maxSalary").val();
            var pattern = /^\+?[1-9][0-9]*$/;
            if(!pattern.test(minSalary)||!pattern.test(maxSalary)){
                alert("工资只能是整数");
                return false;
            }

            if(parseInt($("#minSalary").val())>= parseInt($("#maxSalary").val())){
                alert("最低工资不能大于最大工资");
                return false;
            }

            var workCity = $("#workCity").val();
            if(workCity==null||workCity=='请选择'||workCity.length==0){
                alert("工作城市不能为空");
                return false;
            }

            var detailAddress = $("#detailAddress").val();
            if(detailAddress.trim().length==0){
                alert("请填写详细地址");
                return false;
            }
            if(detailAddress.trim().length>20){
                alert("地址长度不能超过20");
                return false;
            }

            var recruitsNum = $("#recruitsNum").val();
            if(recruitsNum.trim().length==0){
                alert("招收人数未填写");
                return false;
            }
            if(recruitsNum.trim().length>6){
                alert("招收人数长度不能超过6");
                return false;
            }

            var jobBenefits = $("#jobBenefits").val();
            if(jobBenefits.trim().length==0){
                alert("福利描述未填写");
                return false;
            }
            if(jobBenefits.trim().length>20){
                alert("福利描述长度不能超过20");
                return false;
            }

            var contactEmail = $("#contactEmail").val();
            var patterns = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if(!patterns.test(contactEmail)){
                alert("请输入正确邮箱格式");
                return false;
            }

            var contact = $("#contact").val();
            if(contact.trim().length==0){
                alert("联系方式未填写");
                return false;
            }
            if(contact.trim().length>30){
                alert("联系方式长度不能超过30");
                return false;
            }

            var jobDescription = $("#jobDescription").val();
            if(jobDescription.trim().length==0){
                alert("工作描述未填写");
                return false;
            }
            if(jobDescription.trim().length<=10){
                alert("工作描述过于简单，长度起码10以上");
                return false;
            }

            if(jobDescription.trim().length>100){
                alert("工作描述长度不能超过100");
                return false;
            }
        },
        success:function (info) {
            if(info=='1'){
                layer.alert("发布成功")
            }
        },
    })
}

function showDetail() {
    $("#dPostName").text($("#postName").val());
    $("#dDepart").text($("#department").val());
    $("#workType").text($("input[name='workNature']:checked").val());

    $("#salary").text($("#minSalary").val()+'-'+$("#maxSalary").val()+'k');
    $("#dWorkCity").text($("#workCity").val());
    $("#num").text($("#recruitsNum").val());


    $("#dWorkExp").text($("#workYear").val());
    $("#dEducation").text($("#education").val());
    $("#dEmail").text($("#contactEmail").val());

    $("#dContact").text($("#contact").val());
    $("#dAddress").text($("#detailAddress").val());
    $("#fuli").text($("#jobBenefits").val());
    $("#workDes").text($("#jobDescription").val());
    layer.open({
        type:1,
        area:['70%','70%'],
        offset: ['10%', '15%'],
        content:$("#postPositionDetailDiv"),
    })
}





