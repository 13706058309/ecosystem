var path;
$(function () {
    path = $("#path").val();
});

var num = 0;
function menu_box(industryId, dos) {
    if (industryId != num) {
        // alert($(dos).next().find("a").eq(0).text());
        $(dos).next().find("dl").eq(0).empty();
        // $(dos).next().find("dd").eq(0).empty();
        num = industryId;
        $.ajax({
            url: path + "/homePage/findDepart",
            async: true,
            type: "post",
            data: "industryId=" + industryId,
            dataType: "text",
            success: function (data) {
                var depart = JSON.parse(data);
                $.each(depart, function (key, values) {
                    var $dt = $("<dt></dt>")
                    var $a = $("<a style='display: block' >" + key + "</a>");
                    $dt.append($a);
                    $(dos).next().find("dl").eq(0).append($dt);
                    var $dt = $("<dd></dd>");
                    $(values).each(function (i, domel) {
                        var $a2 = $("<a onclick='postName(this)'>" + domel.postName + "</a>");
                        $dt.append($a2);
                    });
                    $(dos).next().find("dl").eq(0).append($dt);
                });
                num = 0;
            }
        });
    }
}

//第三岗位的值，跳转界面
function postName(node) {
    location.href=path+"/center/job?findWorkCity="+$("#city").text()+"&findPosition="+node.innerText;
}
//搜索第三岗位，跳转界面
function searchBut() {
    var search = $("#search_input").val()
    location.href=path+"/center/job?findWorkCity="+$("#city").text()+"&findSearch="+search;

}

//显示隐藏三级菜单
function show() {
    var hidden = document.getElementById("hidden");
    hidden.setAttribute("class", "mainNavs1");
    $("#aShow").css('display','none');
    $("#packUp").css('display','block');
}

var currCity = $("#city").text();
$(function () {
    currCity = $("#city").text();
});

//定位当前城市



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
    location.href="homes?city="+$("#city").text();
    console.log("!!!!!!!!!!!!!!!!!!!!!"+$("#city").text());
}

//热门企业
function compName(bUserId) {
    location.href=path+"/homePage/compProfile?bUserId="+bUserId;
}

//最新岗位
function post(pPostID) {
    location.href=path+"/center/postInfo?lid="+pPostID;
}
