function showDetail2(data) {
    $("#dName").text(data.realName);
    $("#dClen").text(data.clan);
    $("#dPolistatu").text(data.politicalStatus);
    $("#dBir").text(data.contactInfo);
    $("#dSex").text(data.sex);
    $("#DSchool").text(data.school);
    $("#dProf").text(data.profession);
    $("#dWorkYear").text(data.wrokYear);
    $("#dEdu").text(data.education.education);
    $("#DHIndustry").text(data.industry);
    $("#DHwork").text(data.expectWork);
    $("#DAddress").text(data.address);
    $("#DRealInfo").text(data.contactInfo);
    $("#DselfEva").text(data.selfEva);
    var num = data.jobStandId;
    if(num==4){
        $("#jobStand").text("已就业")
    }else if(num==5){
        $("#jobStand").text("未就业")
    }else{
        $("#jobStand").text("在职月内到岗")
    }

    $("#tbody").empty();
    var arr1 = data.educationalBackgrounds;
    var arr2 = data.workExperiences;
    var arr3 = data.projectExperiences;
    for(var i=0;i<arr1.length;i++){
        var $td = $("<tr><td colspan='6'>教育背景"+(i+1)+"</td></tr>");
        var $td1 = $("<tr><td>学校</td><td colspan='2'>"+arr1[i].ebSchool+"</td><td>入学时间</td><td colspan='2'>"+arr1[i].schBeginTime+"</td></tr>")
        var $td2 = $("<tr><td>学历</td><td colspan='2'>"+arr1[i].ebEducation+"</td><td>毕业时间</td><td colspan='2'>"+arr1[i].schEndTime+"</td></tr>")
        var $td3 = $("<tr><td rowspan='1'>学校经历</td><td colspan='5'>"+arr1[i].schExperience+"</td></tr>")
        $("#tbody").append($td);
        $("#tbody").append($td1);
        $("#tbody").append($td2);
        $("#tbody").append($td3);
    }

    for(var i=0;i<arr2.length;i++){
        var $td4 = $("<tr><td colspan='6'>工作经验"+(i+1)+"</td></tr>");
        var $td5 = $("<tr><td>公司名称</td><td colspan='2'>"+arr2[i].companyName+"</td><td>入职时间</td><td colspan='2'>"+arr2[i].beginTime+"</td></tr>")
        var $td6 = $("<tr><td>工作职位</td><td colspan='2'>"+arr2[i].companyPost+"</td><td>离开时间</td><td colspan='2'>"+arr2[i].endTime+"</td></tr>")
        var $td7 = $("<tr><td rowspan='1'>工作内容</td><td colspan='5'>"+arr2[i].duties+"</td></tr>")
        var $td8 = $("<tr><td rowspan='1'>工作业绩</td><td colspan='5'>"+arr2[i].performance+"</td></tr>")
        $("#tbody").append($td4);
        $("#tbody").append($td5);
        $("#tbody").append($td6);
        $("#tbody").append($td7);
        $("#tbody").append($td8);
    }

    for(var i=0;i<arr3.length;i++){
        var $td9 = $("<tr><td colspan='6'>项目经历"+(i+1)+"</td></tr>");
        var $td10 = $("<tr><td>项目名称</td><td colspan='2'>"+arr3[i].proName+"</td><td>开始时间</td><td colspan='2'>"+arr3[i].proBeginTime+"</td></tr>")
        var $td11 = $("<tr><td>担任职位</td><td colspan='2'>"+arr3[i].proPost+"</td><td>结束时间</td><td colspan='2'>"+arr3[i].proEndTime+"</td></tr>")
        var $td12 = $("<tr><td rowspan='1'>项目描述</td><td colspan='5'>"+arr3[i].proDescription+"</td></tr>")
        var $td13 = $("<tr><td rowspan='1'>项目业绩</td><td colspan='5'>"+arr3[i].proPerformance+"</td></tr>")
        $("#tbody").append($td9);
        $("#tbody").append($td10);
        $("#tbody").append($td11);
        $("#tbody").append($td12);
        $("#tbody").append($td13);
    }

    layer.open({
        type:1,
        area:['80%','90%'],
        offset: ['5%', '10%'],
        content:$("#detailDiv"),
    })
}

function showDetails(data) {
    if(datat.isShow==1){
        $("#dName").text(data.realName);
        $("#dBir").text(data.contactInfo);
        $("#DAddress").text(data.address);
    }else{
        $("#dName").text("*********");
        $("#dBir").text("*********");
        $("#DAddress").text("*********");
    }

    $("#dClen").text(data.clan);
    $("#dPolistatu").text(data.politicalStatus);
    $("#dSex").text(data.sex);
    $("#DSchool").text(data.school);
    $("#dProf").text(data.profession);
    $("#dWorkYear").text(data.wrokYear);
    $("#dEdu").text(data.education.education);
    $("#DHIndustry").text(data.industry);
    $("#DHwork").text(data.expectWork);
    $("#DRealInfo").text(data.contactInfo);
    $("#DselfEva").text(data.selfEva);
    var num = data.jobStandId;
    if(num==4){
        $("#jobStand").text("已就业")
    }else if(num==5){
        $("#jobStand").text("未就业")
    }else{
        $("#jobStand").text("在职月内到岗")
    }

    $("#tbody").empty();
}

function showDetail(data) {

    $("#dName").text(data.realName);
    $("#dBir").text(data.contactInfo);
    $("#DAddress").text(data.address);
    $("#dClen").text(data.clan);
    $("#dPolistatu").text(data.politicalStatus);
    $("#dSex").text(data.sex);
    $("#DSchool").text(data.school);
    $("#dProf").text(data.profession);
    $("#dWorkYear").text(data.wrokYear);
    $("#dEdu").text(data.education.education);
    $("#DHIndustry").text(data.industry);
    $("#DHwork").text(data.expectWork);
    $("#DRealInfo").text(data.contactInfo);
    $("#DselfEva").text(data.selfEva);
    var num = data.jobStandId;
    if(num==4){
        $("#jobStand").text("已就业")
    }else if(num==5){
        $("#jobStand").text("未就业")
    }else{
        $("#jobStand").text("在职月内到岗")
    }

    $("#tbody").empty();
}

function findDetailResume(resumeID) {
    $.ajax({
        url:path+"/rec/findResumeDetail",
        data:"resumeID="+resumeID,
        type:"post",
        typeData:"text",
        success:function (info) {

            var resumes = JSON.parse(info);

            var arr1 = resumes.educationalBackgrounds;
            var arr2 = resumes.workExperiences;
            var arr3 = resumes.projectExperiences;
            for(var i=0;i<arr1.length;i++){
                var $td = $("<tr><td colspan='6'>教育背景"+(i+1)+"</td></tr>");
                var $td1 = $("<tr><td>学校</td><td colspan='2'>"+arr1[i].ebSchool+"</td><td>入学时间</td><td colspan='2'>"+arr1[i].schBeginTime+"</td></tr>")
                var $td2 = $("<tr><td>学历</td><td colspan='2'>"+arr1[i].ebEducation+"</td><td>毕业时间</td><td colspan='2'>"+arr1[i].schEndTime+"</td></tr>")
                var $td3 = $("<tr><td rowspan='1'>学校经历</td><td colspan='5'>"+arr1[i].schExperience+"</td></tr>")
                $("#tbody").append($td);
                $("#tbody").append($td1);
                $("#tbody").append($td2);
                $("#tbody").append($td3);
            }

            for(var i=0;i<arr2.length;i++){
                var $td4 = $("<tr><td colspan='6'>工作经验"+(i+1)+"</td></tr>");
                var $td5 = $("<tr><td>公司名称</td><td colspan='2'>"+arr2[i].companyName+"</td><td>入职时间</td><td colspan='2'>"+arr2[i].beginTime+"</td></tr>")
                var $td6 = $("<tr><td>工作职位</td><td colspan='2'>"+arr2[i].companyPost+"</td><td>离开时间</td><td colspan='2'>"+arr2[i].endTime+"</td></tr>")
                var $td7 = $("<tr><td rowspan='1'>工作内容</td><td colspan='5'>"+arr2[i].duties+"</td></tr>")
                var $td8 = $("<tr><td rowspan='1'>工作业绩</td><td colspan='5'>"+arr2[i].performance+"</td></tr>")
                $("#tbody").append($td4);
                $("#tbody").append($td5);
                $("#tbody").append($td6);
                $("#tbody").append($td7);
                $("#tbody").append($td8);
            }

            for(var i=0;i<arr3.length;i++){
                var $td9 = $("<tr><td colspan='6'>项目经历"+(i+1)+"</td></tr>");
                var $td10 = $("<tr><td>项目名称</td><td colspan='2'>"+arr3[i].proName+"</td><td>开始时间</td><td colspan='2'>"+arr3[i].proBeginTime+"</td></tr>")
                var $td11 = $("<tr><td>担任职位</td><td colspan='2'>"+arr3[i].proPost+"</td><td>结束时间</td><td colspan='2'>"+arr3[i].proEndTime+"</td></tr>")
                var $td12 = $("<tr><td rowspan='1'>项目描述</td><td colspan='5'>"+arr3[i].proDescription+"</td></tr>")
                var $td13 = $("<tr><td rowspan='1'>项目业绩</td><td colspan='5'>"+arr3[i].proPerformance+"</td></tr>")
                $("#tbody").append($td9);
                $("#tbody").append($td10);
                $("#tbody").append($td11);
                $("#tbody").append($td12);
                $("#tbody").append($td13);
            }

            layer.open({
                type:1,
                area:['80%','90%'],
                offset: ['5%', '10%'],
                content:$("#detailDiv"),
            })

        },
    })

}
