var path;
var pageCounts=$("#pageCounts").val();
$(function(){
    console.log($("#fieldId").val());
    path=$("#path").val();
    findProject(1,9);
    var nav=$("#headerbody"); //得到导航对象
    var win=$(window); //得到窗口对象
    var sc=$(document);//得到document文档对象。
    win.scroll(function(){
        if(sc.scrollTop()>=116){
            nav.addClass("fixednav");
            $(".navTmp").fadeIn();
        }else{
            nav.removeClass("fixednav");
            $(".navTmp").fadeOut();
        }
    });
});

function chooseMoney(object,lowerMoney,higherMoney){
    var a=$(object);
    console.log(a.text());
    $("#moneyLower").val(lowerMoney);
    $("#moneyHigher").val(higherMoney);
    if (lowerMoney===null){
        $("#money").css("display","none");
        if ($("#field").css("display")==="none"){
            $("#searched").css("display","none");
        }
    }else{
        $("#moneyName").text(a.text());
        $("#money").css("display","inline-block");
        $("#searched").css("display","block");
    }
    moneyClear();
    findProject(1,9);
    a.parent().parent().children().children().removeClass("cate-name-select");
    a.addClass("cate-name-select");
}
function chooseField(object,fieldId){
    var a=$(object);
    console.log(a.text());
    $("#fieldName").text(a.text());
    $("#fieldId").val(fieldId);
    if (fieldId==null){
        $("#field").css("display","none");
        if ($("#money").css("display")==="none"){
            $("#searched").css("display","none");
        }
    }else{
        $("#field").css("display","inline-block");
        $("#searched").css("display","block");
    }
    a.parent().parent().children().children().removeClass("cate-name-select");
    a.addClass("cate-name-select");
    findProject(1,9);
}
function deleteMoney() {
    $("#money").css("display","none");
    if ($("#field").css("display")==="none"){
        $("#searched").css("display","none");
    }
    $("#moneyLower").val("");
    $("#moneyHigher").val("");
    $("#moneyAll").parent().parent().children().children().removeClass("cate-name-select");
    $("#moneyAll").addClass("cate-name-select");
    findProject(1,9);
    moneyClear();
}
function deleteField() {
    $("#field").css("display","none");
    $("#fieldId").val("");
    findProject(1,9);
    if ($("#money").css("display")==="none"){
        $("#searched").css("display","none");
    }
    $("#fieldAll").parent().parent().children().children().removeClass("cate-name-select");
    $("#fieldAll").addClass("cate-name-select");
}
function getPage(){
    console.log(pageCounts);
    layui.use('laypage', function(){
        var laypage = layui.laypage;
        //执行一个laypage实例
        laypage.render({
            elem: 'projectPage' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: pageCounts  //数据总数，从服务端得到
            ,limit:9
            ,curr:1
            ,layout: ['count', 'prev', 'page', 'next', 'refresh', 'skip']
            ,jump: function(obj, first){
                //obj包含了当前分页的所有参数，比如：
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数
                if(!first){
                    findProject(obj.curr,obj.limit);
                    // obj.count=pageCounts;
                }
            }
        });
    });
}
function findProject(curr,limit){
    if (curr==null){
        curr=1;
    }
    if (limit==null){
        limit=9;
    }

    var projectName=$("#projectName").val();
    $.ajax({
        url: path+"/project/findProject",
        data:{"page":curr,"limit":limit,"projectName":projectName,"moneyLower":$("#moneyLower").val(),"moneyHigher":$("#moneyHigher").val(),"fieldId":$("#fieldId").val()},
        dataType:"json",
        success:function (res) {
            console.log(res)
            var projectList=$("#projectList");
            if (pageCounts!=res.count){
                $("#pageCounts").val(res.count);
                pageCounts=$("#pageCounts").val();
                getPage();
            }
            projectList.children().remove();
            if (res.data!=null && res.data.length>0){
                for (var i=0;i<res.data.length;i++){
                    var project=res.data[i];
                    projectList.append(
                    "                <div class=\"project-list-items\" onmouseover=\"mouseIn(this)\" onmouseout=\"mouseOut(this)\" onclick=\"projectDetail("+project.projectId+")\">\n" +
                    "                    <div class=\"project-item-title\">\n" +
                    "                        <span style=\"float: left\">"+project.backUser.bUserName+" 于"+ project.publishTime+" 发布"+"</span>\n" +
                    "                    </div>\n" +
                    "                    <div class=\"project-item-body\">\n" +
                    "                        <div class=\"project-item-name\">\n" +
                                                  project.projectName +
                    "                        </div>\n" +
                    "                        <div class=\"project-item-price\">\n" +
                    "                            ￥"+project.money+"\n" +
                    "                        </div>\n" +
                    "                        <div class=\"project-item-synopsis\">\n" +
                    "                            <label>"+project.projectSynopsis+"</label>\n" +
                    "                        </div>\n" +
                    "                    </div>\n" +
                    "                    <div class=\"project-item-footer\">\n" +
                "                            <span style=\"font-size: 12px;float: left;display: inline-block;margin-top: 10px\">"+project.field.paramName+"</span>\n" +
                "                            <button class=\"layui-btn layui-btn-primary layui-btn-sm\" style=\"padding:0px 10px;display: inline-block;float: right;border:1px solid orangered;height: 28px\"  onclick=\"projectDetail("+project.projectId+")\">查看详情</button>\n" +
                    "                    </div>\n" +
                    "                </div>\n" )
                }
            }
        }
    })
}

function moneyClear() {
$("#lower-price").val("");
$("#higher-price").val("");
}

function mouseOut(items){
    $(items).removeClass("search-money-border");
    $(items).children(".project-item-footer").children(".layui-btn").removeClass("layui-btn-danger");
    $(items).children(".project-item-footer").children(".layui-btn").addClass("layui-btn-primary");
}
function mouseIn(items){
    $(items).addClass("search-money-border");
    $(items).children(".project-item-footer").children(".layui-btn").removeClass("layui-btn-primary");
    $(items).children(".project-item-footer").children(".layui-btn").addClass("layui-btn-danger");
}

function moneySearch(btn) {
    var lower_price=$("#lower-price").val();
    var higher_price=$("#higher-price").val();
    let reg=/^[0-9]*$/;
    if (!reg.test(lower_price) || lower_price<0){
        lower_price="";
        $("#lower-price").val("");
    }
    if (!reg.test(higher_price) || lower_price<0){
        higher_price="";
        $("#higher-price").val("");
    }
    $("#moneyLower").val(lower_price);
    $("#moneyHigher").val(higher_price);
    $("#money").css("display","inline-block");
    $("#searched").css("display","block");
    if (higher_price=="" && lower_price==""){
        $("#moneyName").text("全部");
        $("#money").css("display","none");
        if ($("#field").css("display")==="none"){
            $("#searched").css("display","none");
        }
    }else if (higher_price=="" && lower_price!=""){
        $("#moneyName").text(lower_price+"元以上");
    }else if (higher_price!="" && lower_price==""){
        $("#moneyName").text(higher_price+"元以下");
    }else{
        $("#moneyName").text(lower_price+"~"+higher_price+"元");
    }
    findProject(1,9);
    $(btn).parent().parent().parent().parent().children().children().removeClass("cate-name-select");
    $("#moneyAll").addClass("cate-name-select");
}

function onMouse(){
    $("#searchBtn").removeClass("price-act");
    $("#searchMoney").addClass("search-money-border");

}
function outMouse(){
    $("#searchBtn").addClass("price-act");
    $("#searchMoney").removeClass("search-money-border");
}

function projectDetail(projectId){
    console.log(projectId);
    location.href=path+"/project/projectDetail?projectId="+projectId;
}

function userExit(){
    if (confirm("确定注销吗?")){
        $.ajax({
            url:path+"/userProject/userExit",
            success:function (res) {
                if (res=="success"){
                    alert("退出成功！")
                    location.href=path+"/project"
                }
            }
        })
    }
}