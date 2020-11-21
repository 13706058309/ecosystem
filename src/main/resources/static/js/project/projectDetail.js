var path;
$(function(){
    console.log($("#fieldId").val());
    path=$("#path").val();
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
function findProject(){
    location.href=path+"/project?projectName="+$("#projectName").val();
}