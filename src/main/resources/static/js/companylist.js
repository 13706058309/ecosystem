var chooseCity=$("#chooseCity").text();
var chooseType=$("#chooseType").text();
var chooseFinan=$("#chooseFinan").text();
var chooseScale=$("#chooseScale").text();

$(function () {

    chooseCity=$("#chooseCity").text();
    chooseType=$("#chooseType").text();
    chooseFinan=$("#chooseFinan").text();
    chooseScale=$("#chooseScale").text();

})

//选中公司地址
function CityList(node) {
    var city = $(node);
    $("#chooseCity").text(city.text());
    chooseCity = $("#chooseCity").text();
    console.log(chooseCity);
    sel();
    // location.reload();
}

//选中行业类型
function Type(node) {
    var type = $(node);
    $("#chooseType").text(type.text());
    chooseType = $("#chooseType").text();
    console.log(chooseType);
    sel();
}

//选中融资阶段
function Finan(node) {
    var finan = $(node);
    $("#chooseFinan").text(finan.text());
    chooseFinan = $("#chooseFinan").text();
    console.log(chooseFinan);
    sel();
}

//选中公司规模
function Scale(node) {
    var scale = $(node);
    $("#chooseScale").text(scale.text());
    chooseScale = $("#chooseScale").text();
    console.log(chooseScale);
    sel();
}

//传值给后台
function sel() {

    location.href="companylist?chooseCity="+chooseCity+
        "&chooseType="+chooseType+
        "&chooseFinan="+chooseFinan+
        "&chooseScale="+chooseScale;
}

//页面分页
layui.use(['laypage', 'layer'], function(){
    var laypage = layui.laypage,
        layer = layui.layer;
    //自定义样式
    laypage.render({
        elem: 'paging',
        theme: '#44D0C7',
        count:$('#size').val(),
        limit:4,
        curr:$('#curr').val(),
        jump: function(obj,first){
            if(!first){
                var curr = obj.curr;
                var limit = obj.limit;
                location.href="companylist?chooseCity="+chooseCity+
                    "&chooseType="+chooseType+
                    "&chooseFinan="+chooseFinan+
                    "&chooseScale="+chooseScale+
                    "&curr="+curr+
                    "&limit="+limit;
            }
        }
    });
});

function companyProfile(bUserID) {

    console.log(bUserID);
    location.href="compProfile?bUserId="+bUserID;

}