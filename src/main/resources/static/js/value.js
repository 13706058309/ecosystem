var path;

$(function () {
    path = $("#path").val();
});

function changeImg() {   //验证码
    $("#vCodeImg").attr("src", path + "/verifyCodeServlet?date=" + new Date());
}

function backUserState(node, Counselor_Id) {   //修改后端用户状态
    var trNode = $(node).parent().parent(); //拿到值
    var Stand_Id = trNode.children().eq(4);
    var Counselor_Id = Counselor_Id;

    // alert("点击切换状态：" + Stand_Id.text());
    // alert("点击切换状态id：" + Counselor_Id);

    $.ajax({
        url: path + "/userServlet?methodName=backUserState",//请求发送路径
        type: "post",  //请求类型
        async: true,   //是否同步，异步true, 同步false
        data: "Counselor_Id=" + Counselor_Id + "&Stand_Id=" + Stand_Id.text(),
        dataType: "text",  //数据类型

        success: function (data) {   //返回的结果
            alert("确认要修改吗？");

            if (data == "success") {
                alert("修改成功");
                if (Stand_Id.text() == "禁用") {
                    Stand_Id.text("启用");
                    $(node).attr("value", "禁用");
                } else {
                    Stand_Id.text("禁用");
                    $(node).attr("value", "启用");
                }
            } else {
                alert("后台用户状态修改失败");
            }
        },
        error: function () {  //请求失效时执行的函数

            alert("网络繁忙");
        }
    })
}

function deleteBackUser(node, userId) {

    var trNode = $(node).parent().parent(); //拿到值
    var Stand_Id = trNode.children().eq(4);
    var user_Id = userId;
    
    // alert("点击后端删除状态：" + Stand_Id.text());
    // alert("点击后端删除切换" + user_Id);

    $.ajax({
        url: path + "/userServlet?methodName=deleteBackUser",//请求发送路径
        type: "post",  //请求类型
        async: true,   //是否同步，异步true, 同步false
        data: "user_Id=" + user_Id + "&Stand_Id=" + Stand_Id.text(),
        dataType: "text",  //数据类型
        success: function (data) {

            if (data == "success") {
                alert("删除成功");
                if (Stand_Id.text() == "启用") {
                    Stand_Id.text("已删除");
                    $(node).attr("value", "已删除");
                } else if (Stand_Id.text() == "禁用") {
                    Stand_Id.text("已删除");
                    $(node).attr("value", "已删除");
                    $(node).parent().empty();
                } else {
                    Stand_Id.text("已删除");
                    $(node).attr("value", "已删除");
                    $(node).parent().empty();
                }
            } else {
                alert("删除用户失败");
            }
        },
        error: function () {  //请求失效时执行的函数
            alert("网络繁忙");
        }
    })

}

function deleteUser(node, userId) {  //删除前端用户

    var trNode = $(node).parent().parent(); //拿到值
    var standID = trNode.children().eq(5);
    var user_Id = userId;

    // alert("点击删除状态："+standID);
    // alert("点击删除切换"+user_Id);

    $.ajax({
        url: path + "/userServlet?methodName=deleteUser",//请求发送路径
        type: "post",  //请求类型
        async: true,   //是否同步，异步true, 同步false
        // data:{"user_Id":user_Id,"standID":standID.val()},
        data: "user_Id=" + user_Id + "&standID=" + standID.text(),
        dataType: "text",  //数据类型
        success: function (data) {   //返回的结果

            if (data == "success") {
                alert("删除成功");
                if (standID.text() == "启用" +
                    "") {
                    standID.text("已删除");
                    $(node).attr("value", "已删除");
                } else if (standID.text() == "禁用") {
                    standID.text("已删除");
                    $(node).attr("value", "已删除");
                    $(node).parent().empty();
                } else {
                    standID.text("已删除");
                    $(node).attr("value", "已删除");
                    $(node).parent().empty();
                }
            } else {
                alert("删除用户失败");

            }
        },
        error: function () {  //请求失效时执行的函数
            alert("网络繁忙");

        }
    })
}


function reg() {   //注册
    var userName = $("#userName").val();
    var userAccount = /^[a-zA-Z0-9_-]{4,16}$/.test($("#userAccount").val());
    var userPwd = $("#userPwd").val();
    var userSex = $("input[name='sex']:checked").val();
    var userAge = $("#userAge").val();
    var userPhone = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\d{8}$/.test($("#userPhone").val());
    var userAddress = $("#userAddress").val();
    if (userAccount) {

    } else {
        alert("输入账号错误（4到16位（字母，数字，下划线，减号））");
    }
    if (userPhone) {

    } else {
        alert("请正确输入11位的手机号!");
    }

    if (userName == "" || userAccount == "" || userPwd == "" || userAge == "" || userPhone == "" || userAddress == "" || userSex == "") {
        alert("填写选项错误");

    } else if (userAddress == "30") {
        alert("通讯地址过长，应在30个字符以内");
    }
    $.ajax(
        {
            url: path + "/userServlet?methodName=reg",
            type: "post",
            async: true,
            data: "u_Name=" + userName + "&account=" + userAccount + "&pwd=" + userPwd + "&sex=" + userSex +
                "&telePhone=" + userPhone + "&age=" + userAge + "&address=" + userAddress,
            dataType: "text",
            beforeSend: function () {   //请求发送前的回调函数，返回值boolean,返回值是true发送数据，否则不发送

                // $("[value='注册']").prop("disabled", "disabled");  //失效
                if (userName.length == 0) {   //对账号的长度进行非空判断
                    return false;
                }
                return true;
            },
            success: function (data) {   //请求成功后，返回的结果

                alert(data);
                if (data == "注册成功") {
                    alert("注册成功");
                    location.href = path + "/jsp/login.jsp";
                } else if (data == "该账号已被使用") {
                    alert("该账号已被使用");
                } else if (data == "注册失败") {
                    alert("注册失败");
                }

            },
            error: function () {//请求失效时执行的函数
                alert("网络繁忙");
            },
            complete: function () {

                $("[value='注册']").prop("disabled", false);//请求完成后执行的函数，success执行完成后，都会
            }
        });
}


















