var path;
$(function () {
    path=$("#path").val();
    layui.use(["upload","form","element","layer"], function(){
        var upload = layui.upload;
        var element=layui.element;
        var form =layui.form;
        var layer=layui.layer;
        var uploadInst = upload.render({
            elem: '#upload' //绑定元素
            ,url: path+ '/project/uploadDemandFile' //上传接口
            ,accept: 'file'
            ,exts: 'zip|rar|7z'
            ,done: function(res){
                //上传完毕回调
                console.log(res);
                if (res.code===0){
                    $("#uploadState").html("<i class='layui-icon' title='上传成功!'>&#x1005;</i>");
                    $("#docUrl").val(res.data.docUrl);
                    console.log($("#fileUrl").val());
                    layer.msg("上传成功！");
                }else{
                    $("#uploadState").html("<i class='layui-icon' title='上传失败!'>&#x1006;</i>");
                    $("#fileUrl").val("");
                    layer.msg("上传失败！");
                }
                }
            ,progress: function(n, elem){
                var percent = n + '%' //获取进度百分比
                console.log(percent);
                element.progress('progress', percent); //可配合 layui 进度条元素使用
                //以下系 layui 2.5.6 新增
                console.log(elem); //得到当前触发的元素 DOM 对象。可通过该元素定义的属性值匹配到对应的进度条。
            }
            ,error: function(){
                //请求异常回调
                console.log("11111111111");
            }
        });
    });
});

function showText(){
    var texts=$("#projectSynopsis").val().trim();
    texts=textareaTo(texts);
    console.log(texts);
    location.href=$("#path").val()+"/project/projectDetail?projectId=22&projectMiaoShu="+texts;
}
function textareaTo(str){
    var reg=new RegExp("\n","g");
    var regSpace=new RegExp(" ","g");

    str = str.replace(reg,"<br>");
    str = str.replace(regSpace,"&nbsp;");

    return str;
}

function addProject(){

    $.ajax({
        url:path+"/parameter/findCommission",
        type:"post",
        beforeSend:function(){

            return true;
        },success:function (data) {
            layui.use("layer",function () {
                var layer=layui.layer;
                layer.confirm("发布项目需要支付“预算金额”以及 "+data+"% 的佣金，是否继续发布？",function () {
                    var projectName=$("#projectName").val();
                    var money=$("#money").val();
                    var projectSynopsis=textareaTo($("#projectSynopsis").val());
                    var projectCondition=textareaTo($("#projectCondition").val());
                    var fieldId=$("#fieldId").val();
                    var docUrl=$("#docUrl").val();

                    var vNow = new Date();
                    var sNow = "";
                    sNow += String(vNow.getFullYear());
                    sNow += String(vNow.getMonth() + 1);
                    sNow += String(vNow.getDate());
                    sNow += String(vNow.getHours());
                    sNow += String(vNow.getMinutes());
                    sNow += String(vNow.getSeconds());
                    sNow += String(vNow.getMilliseconds());
                    console.log("projectName:"+projectName+"\n"+"money:"+money+"\n"+projectSynopsis+
                        "\n"+projectCondition+"\n"+ fieldId+"\n" +docUrl +"\n" +sNow);
                    $.ajax({
                        url:path+"/project/addProject",
                        type:"post",
                        dataType:"json",
                        data:{
                            "projectName":projectName,
                            "projectSynopsis":projectSynopsis,
                            "money":money,
                            "projectCondition":projectCondition,
                            "fieldId":fieldId,
                            "docUrl":docUrl,
                            "pOrderNum":sNow,
                        },
                        beforeSend:function () {
                            if (!$("#xieYi").prop('checked')){
                                alert("请阅读并同意协议！");
                                return false;
                            }
                            if (!(/^[\d]*$/.test(money))){
                                alert("请输入整数金额！");
                                return false;
                            }

                            if (docUrl==="" || docUrl.length<1){
                                alert("请上传文件！")
                                return false;
                            }

                            if (fieldId==="" || fieldId<1){
                                alert("请选择项目类型！");
                                return false;
                            }

                            if (projectSynopsis==="" || projectSynopsis.trim().length<1){
                                alert("请对项目进行一个简单的描述！")
                            }

                            if (projectCondition==="" || projectCondition.trim().length<1){
                                if (!confirm("您还没有填写申请人的要求，是否继续发布？")){
                                    return false;
                                }
                            }

                            return true;
                        },
                        success:function (res) {
                            console.log(res);
                            if (res!=null){
                                location.href= path +"/project/alipayTradePagePay?WIDout_trade_no="+res.pOrderNum+'&WIDtotal_amount='+res.trueMoney+'&WIDsubject='+"项目预算资金+佣金";
                            }
                        }
                    })
                })
            })

        }
    });



}
function goProjectManage() {
    location.href=path+"/project/findProject";
}