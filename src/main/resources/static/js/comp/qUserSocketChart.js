//消息对象数组
var msgObjArr = new Array();

var websocket = null;

//判断当前浏览器是否支持WebSocket， springboot是项目名
if ('WebSocket' in window) {
    var ss = {userID:uID,
        type: 2
    }

    var username = window.btoa(encodeURIComponent(JSON.stringify(ss)))
    websocket = new WebSocket("ws://localhost:8080/springboot/websocket/"+username);
} else {
    console.error("不支持WebSocket");
}

//连接发生错误的回调方法
websocket.onerror = function (e) {
    console.error("WebSocket连接发生错误");
};

//连接成功建立的回调方法
websocket.onopen = function () {

}

//接收到消息的回调方法
websocket.onmessage = function (event) {

    var messageJson = eval("(" + event.data + ")");
    var curID = $("#compID").val();
    var curImg = $("#bPhoto").val();
    //普通消息(私聊)

    //来源用户
    // var srcUser = messageJson.srcUser;
    //目标用户
    var tarUser = messageJson.tarUser;
    //消息
    var message = messageJson.message;

    if(curID==tarUser){
        var $li = $("<li></li>");
        var $div1 = $("<div class='answerHead'><img src='"+ctx+"/uploadLogo"+curImg+"'></div>");
        var $div2 = $("<div class='answers'><img class='jiao' src='"+ctx+"/chat/img/you.jpg'>"+message+"<div>")
        $li.append($div1),
            $li.append($div2),
            $('.newsList').append($li);
        $('.RightCont').scrollTop($('.RightCont')[0].scrollHeight );
        $.ajax({
            url:ctx+"/rec/readCompMsg",
            type:"post",
            data:"compID="+curID,
            typeData:"text",
            async:false,
            success:function (data) {

            }
        })
    }else{
        $('#a'+tarUser).children('.liRight').children('.infor').text("未读消息");
    }
    //最加聊天数据
    // setMessageInnerHTML(srcUser.username,srcUser.username, message);

}



//连接关闭的回调方法
websocket.onclose = function () {
    //alert("WebSocket连接关闭");
}

//将消息显示在对应聊天窗口    对于接收消息来说这里的toUserName就是来源用户，对于发送来说则相反
function setMessageInnerHTML(srcUserName,msgUserName, message) {
    //判断
    var childrens = $("#hz-group-body").children(".hz-group-list");
    var isExist = false;
    for (var i = 0; i < childrens.length; i++) {
        var text = $(childrens[i]).find(".hz-group-list-username").text();
        if (text == srcUserName) {
            isExist = true;
            break;
        }
    }
    if (!isExist) {
        //追加聊天对象
        msgObjArr.push({
            toUserName: srcUserName,
            message: [{username: msgUserName, message: message, date: NowTime()}]//封装数据
        });
        $("#hz-group-body").append("<div class=\"hz-group-list\"><span class='hz-group-list-username'>" + srcUserName + "</span><span id=\"" + srcUserName + "-status\">[在线]</span><div id=\"hz-badge-" + srcUserName + "\" class='hz-badge'>0</div></div>");
    } else {
        //取出对象
        var isExist = false;
        for (var i = 0; i < msgObjArr.length; i++) {
            var obj = msgObjArr[i];
            if (obj.toUserName == srcUserName) {
                //保存最新数据
                obj.message.push({username: msgUserName, message: message, date: NowTime()});
                isExist = true;
                break;
            }
        }
        if (!isExist) {
            //追加聊天对象
            msgObjArr.push({
                toUserName: srcUserName,
                message: [{username: msgUserName, message: message, date: NowTime()}]//封装数据
            });
        }
    }

    // 对于接收消息来说这里的toUserName就是来源用户，对于发送来说则相反
    var username = $("#toUserName").text();

    //刚好打开的是对应的聊天页面
    if (srcUserName == username) {
        $("#hz-message-body").append(
            "<div class=\"hz-message-list\">" +
            "<p class='hz-message-list-username'>"+msgUserName+"：</p>" +
            "<div class=\"hz-message-list-text left\">" +
            "<span>" + message + "</span>" +
            "</div>" +
            "<div style=\" clear: both; \"></div>" +
            "</div>");
    } else {
        //小圆点++
        var conut = $("#hz-badge-" + srcUserName).text();
        $("#hz-badge-" + srcUserName).text(parseInt(conut) + 1);
        $("#hz-badge-" + srcUserName).css("opacity", "1");
    }
}

//发送消息

$('.sendBtn').on('click',function(){
    var news=$('#dope').val();
    var tarID = $("#compID").val();
    if(news.length>100){
        alert('字符长度不能超过100');
    }
    if(news==''){
        alert('不能为空');
    }else{
        $('#dope').val('');

        var str='';
        str+='<li>'+
            '<div class="nesHead"><img src="'+ctx+'/'+photo+'"/></div>'+
            '<div class="news"><img class="jiao" src="'+ctx+'/chat/img/you.jpg">'+news+'</div>'+
            '</li>';
        $('.newsList').append(str);
        $('.conLeft').find('li.bg').children('.liRight').children('.infor').text(news);
        $('.RightCont').scrollTop($('.RightCont')[0].scrollHeight );

        websocket.send(JSON.stringify({
            "type": 2,
            "tarUser": tarID,
            "srcUser": uID,
            "message": news
        }));
    }

})

$('.ExP').on('mouseenter',function(){
    $('.emjon').show();
})

$('.emjon').on('mouseleave',function(){
    $('.emjon').hide();
})

$('.emjon li').on('click',function(){
    var tarID = $("#compID").val();
    var imgSrc=$(this).children('img').attr('src');
    var str="";
    str+='<li>'+
        '<div class="nesHead"><img src="'+ctx+'/'+photo+'"/></div>'+
        '<div class="news"><img class="jiao" src="'+ctx+'/chat/img/you.jpg"><img class="Expr" src="'+imgSrc+'" style="width: 100%;height: 100%"></div>'+
        '</li>';
    $('.newsList').append(str);
    $('.emjon').hide();
    $('.RightCont').scrollTop($('.RightCont')[0].scrollHeight );
    websocket.send(JSON.stringify({
        "type": 2,
        "tarUser": tarID,
        "srcUser": uID,
        "message": '<img class="Expr" src="'+imgSrc+'" style="width: 100%;height: 100%">',
    }));
});

//监听点击用户
$("body").on("click", ".hz-group-list", function () {
    $(".hz-group-list").css("background-color", "");
    $(this).css("background-color", "whitesmoke");
    $("#toUserName").text($(this).find(".hz-group-list-username").text());

    //清空旧数据，从对象中取出并追加
    $("#hz-message-body").empty();
    $("#hz-badge-" + $("#toUserName").text()).text("0");
    $("#hz-badge-" + $("#toUserName").text()).css("opacity", "0");
    if (msgObjArr.length > 0) {
        for (var i = 0; i < msgObjArr.length; i++) {
            var obj = msgObjArr[i];
            if (obj.toUserName == $("#toUserName").text()) {
                //追加数据
                var messageArr = obj.message;
                if (messageArr.length > 0) {
                    for (var j = 0; j < messageArr.length; j++) {
                        var msgObj = messageArr[j];
                        var leftOrRight = "right";
                        var message = msgObj.message;
                        var msgUserName = msgObj.username;
                        var toUserName = $("#toUserName").text();

                        //当聊天窗口与msgUserName的人相同，文字在左边（对方/其他人），否则在右边（自己）
                        if (msgUserName == toUserName) {
                            leftOrRight = "left";
                        }

                        //但是如果点击的是自己，群聊的逻辑就不太一样了
                        if (username == toUserName && msgUserName != toUserName) {
                            leftOrRight = "left";
                        }

                        if (username == toUserName && msgUserName == toUserName) {
                            leftOrRight = "right";
                        }

                        var magUserName = leftOrRight == "left" ? "<p class='hz-message-list-username'>"+msgUserName+"：</p>" : "";

                        $("#hz-message-body").append(
                            "<div class=\"hz-message-list\">" +
                            magUserName+
                            "<div class=\"hz-message-list-text " + leftOrRight + "\">" +
                            "<span>" + message + "</span>" +
                            "</div>" +
                            "<div style=\" clear: both; \"></div>" +
                            "</div>");
                    }
                }
                break;
            }
        }
    }
});

//获取当前时间
function NowTime() {
    var time = new Date();
    var year = time.getFullYear();//获取年
    var month = time.getMonth() + 1;//或者月
    var day = time.getDate();//或者天
    var hour = time.getHours();//获取小时
    var minu = time.getMinutes();//获取分钟
    var second = time.getSeconds();//或者秒
    var data = year + "-";
    if (month < 10) {
        data += "0";
    }
    data += month + "-";
    if (day < 10) {
        data += "0"
    }
    data += day + " ";
    if (hour < 10) {
        data += "0"
    }
    data += hour + ":";
    if (minu < 10) {
        data += "0"
    }
    data += minu + ":";
    if (second < 10) {
        data += "0"
    }
    data += second;
    return data;
}
