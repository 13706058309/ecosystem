
var form;
var path;
layui.use('form',function () {
    form = layui.form;
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
                $("#position").empty();
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
                $("#position").empty();
                var $option1 = $("<option>"+'请选择'+"</option>");
                $("#position").append($option1);
                for(var i=0;i<arr.length;i++){
                    var $option = $("<option value='"+arr[i].postId+"' >"+arr[i].postName+"</option>");
                    $("#position").append($option);
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
                $("#city").empty();
                var $option1 = $("<option>"+'请选择'+"</option>");
                $("#city").append($option1);
                for(var i=0;i<arr.length;i++){
                    var $option = $("<option value='"+arr[i].cityId+"' >"+arr[i].cityName+"</option>");
                    $("#city").append($option);
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
    alert($("#position").val());
}



