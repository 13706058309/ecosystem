
function jianli() {
    // var account=$("#account").val();
    // var pwd=$("#pwd").val();
    // var vCode=$("#vCode").val();
    // console.log(account+"??"+pwd);
    $.ajax({
        url:"/jianli",
        async:"true",
        type:"post",
        data:"",
        dataType:"text",
        success:function (data) {
            var resume=new JSON.parse(data);
            console.log(resume);
            location.href="/center/center"
        },
        error:function () {
            alert("网络繁忙")
        }

    });
}