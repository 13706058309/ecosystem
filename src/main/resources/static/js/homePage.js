var path;
$(function () {
    path = $("#path").val();
});

function menu_box(industryId,dos) {

    if(industryId != num){
        // alert($(dos).next().find("a").eq(0).text());
        $(dos).next().find("dt").eq(0).empty();
        $(dos).next().find("dd").eq(0).empty();
        num = industryId;
        $.ajax({
            url:path+"/homePage/findDepart",
            async: true,
            type: "post",
            data: "industryId=" + industryId,
            dataType: "text",
            success: function (data) {
                var depart = JSON.parse(data);
                $.each(depart,function(key,values) {
                    var $a = $("<a style='display: inline-block' >" + key + "</a>");
                    $(dos).next().find("dt").eq(0).append($a);

                    $(values).each(function (i,domel) {
                        var $a2 = $("<a>"+domel.postName+"</a>")
                        $(dos).next().find("dd").eq(0).append($a2);
                    });
                });

                num=0;
            }
        });
    }
}


//定位当前城市
var position = new BMap.Geolocation();
position.getCurrentPosition(function (r) {
//    判断定位是否成功
    if (this.getStatus() == BMAP_STATUS_SUCCESS) {
        //    获取经度，维度，省份
        lat = r.positionLat;
        lng = r.positionLng;
        city = r.address.city;
        $("#city").text(city);
        $("#bCity").text(city);
    }
})

//切换城市弹窗
function cutCity() {
    layui.use('layer', function () {
        var layer = layui.layer;
        layer.open({
            type: 1,
            title: '城市选择',
            content: $('#choiceCity'),//不允许出现滚动条
            area: ['680px', '530px']
        });
    });
}

//切换当前城市
function City(node) {
    var currentCity = $(node);
    console.log(currentCity.text());
    $("#city").text(currentCity.text());
    $("#bCity").text(currentCity.text());
    layer.closeAll();
}