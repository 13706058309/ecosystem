function menu_box(industryId) {

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