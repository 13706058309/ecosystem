<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/20
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head>
    <meta charset="UTF-8">
    <title>视频界面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="http://cymooc.org:80/common/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/course/playPage.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/course/playPage2.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/uc.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/ux.css" />
</head>
<%--评价弹出框--%>
<div id="publish" style="display: none;">
    <div id="component-dialog">
        <div id="component-dialog-hd"></div>
        <div id="component-dialog-bd">
            <div id="courseTitle">撰写《Java编程》的评价</div>
        </div>
        <div id="courseRateWrapper">
            <div id="rateLabel">
                <span style="color: red;margin-left: 40px">*</span>
                总评
            </div>
        </div>
        <div id="textareaComponent">
            <label id="evaLabel">
                <span style="color: red;margin-left: 40px">*</span>
                评价内容
            </label>
            <div id="component-course-editor-hd">
                <p id="component-course-editor-warning">至少输入 5 个字</p>
            </div>
            <div id="component-course-editor">
                <textarea id="component-course-editor-textarea" placeholder="可以从课程内容组织、授课方式的角度评价课程，或者分享课程给你带来了什么收获和启发"></textarea>
                <div id="ux-tip-error">请填写评价内容</div>
            </div>
        </div>
    </div>
</div>


<body>
<input type="hidden" id="basePath" value="${pageContext.request.contextPath}">
<input type="hidden" id="listLength" value="${totalNums}"/>
<input type="hidden" id="unitId" value="${unitId}"/>
<input type="hidden" id="userId" value="${qUser.userId}"/>
<div style="width: 100%;height: 20px;"></div>

<!--视频播放板块-->
<div class="playfm safe">
    <div class="playfmL">
        <div class="playfmLBox" data-seq="0">
            <div class="playfmLong" idx="0">
                <c:forEach items="${unitList}" var="unit" varStatus="unitStatus">
                    <div class="cNameSpan" data-chtname="${unit.unitName}" onclick="assignJump(${unit.unitId})" style="color: white; background-color: rgb(231, 68, 52);">
                        ${unitStatus.count}
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="playLast" style="">
            <img src="http://cymooc.org:80/common/images/course/u1045.png">
        </div>
        <div class="playNext">
            <img src="http://cymooc.org:80/common/images/course/u1053.png">
        </div>
        <div class="courseNameTips" style="background-image: url('http://cymooc.org:80/common/images/course/cnameTips.png'); display: none; top: 385px;">
            <p style="width: 100px;height:52px;color: white;font-size: 14px;padding-left: 22px;text-align: center;overflow: hidden;vertical-align: middle;display: table-cell;"></p>
        </div>
    </div>
    <div class="playfmM" id="vdfm" data-prod="10612" data-cht="11132">
        <!--video-->
        <div class="playfmMT">
            <video controls="" controlslist="nodownload" id="video-active" style="background-color: #000000;padding-top:10px;padding-bottom: 10px " class="video-active" width="1000" height="460" autoplay="autoplay">
                <source src="http://117.27.136.49:8078/mp4/1Python语言概述.mp4" type="video/mp4">
                当前浏览器不支持 video直接播放，请更新浏览器版本或者更换浏览器进行视频观看
            </video>
        </div>
        <div class="playfmMB">
            <div class="cnameTitle floatL overText">
                ${currCourseName}
            </div>
            <div class="playfmMBR floatR">
                 <span style="border: none; float:right">
                 <img src="http://cymooc.org:80/common/images/course/fx.png">分享
                 </span>
            </div>
        </div>
        <!--video END-->
    </div>
</div>

<!--左下角tab切换区域-->
<div class="safe">
    <div class="courseLeft">
        <div class="layui-tab layui-tab-card" lay-filter="test">
            <ul class="layui-tab-title">
                <li class="layui-this" lay-id="11">资料下载</li>
                <li lay-id="22">发表评论</li>
                <li lay-id="33">章节测验</li>
            </ul>
            <div class="layui-tab-content" style="background-color: rgba(255, 255, 255, 1);min-height: 800px;-moz-box-shadow: 1px 5px 10px rgba(215, 215, 215, 0.349019607843137);-webkit-box-shadow: 1px 5px 10px rgba(215, 215, 215, 0.349019607843137);box-shadow: 1px 5px 10px rgba(215, 215, 215, 0.349019607843137);">
                <%--资料区--%>
                <div class="layui-tab-item layui-show" id="unitFiles">
                </div>

                <%--评论区--%>
                <div class="layui-tab-item">
                    <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
                        <button data-method="offset" data-type="auto" class="layui-btn layui-btn-normal" style=" background-color: #009688;">
                            发表评价
                        </button>
                    </div>
                    <hr class="layui-bg-green">
                    <%--课程评价--%>
                    <ul class="flow-default" id="LAY_demo1"></ul>
                </div>

                <%--答题区--%>
                <div class="layui-tab-item" id="topicText">

                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div class="clear"></div>
<!-- foot -->

<script src="${pageContext.request.contextPath}/style/js/jquery-3.5.1.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script>

    // 点击视频播放区左侧章节列表的章节，跳转到该章节的播放页
    function assignJump(unitId){
        var basePath = $('#basePath').val();//项目上下文
        location.href=basePath+"/courseAppraise/playPage?unitId="+unitId;
    }

    // 选项卡切换
    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element //Tab的切换功能，切换事件监听等，需要依赖element模块

        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);
        element.on('tab(test)', function(elem){
            var val=$(this).attr("lay-id");
            if (val == '11'){
                loadUnitFiles();
            }
            if (val == '22'){
                loadMoreEvaluations();
            }
            if (val == '33'){
                loadTopics();
            }
            location.hash = 'test='+ $(this).attr('lay-id');
        });
    });
    
    // 加载章节资料
    function loadUnitFiles() {
        var basePath = $('#basePath').val();//项目上下文
        var unitId=$('#unitId').val(); // 章节ID
        var controllerUrl=basePath+"/unit/downloadFile?fileUrl="; // 下载资料的方法的访问路径
        $.ajax({
            url: basePath + "/unit/unitFiles?unitId=" + unitId
            , dataType: 'json'
            , success:function (data) {
                if (data.length>0){
                    for (var i=0;i<data.length;i++){
                        $('#unitFiles').append("<div class=\"fileDiv\">\n" +
                            "                        <div class=\"iconDiv\">\n" +
                            "                            <a href=\""+controllerUrl+data[i].dataUrl+"&dataId="+data[i].dataId+"\"><i class=\"layui-icon layui-icon-file-b\" style=\"font-size: 20px\"></i></a>\n" +
                            "                        </div>\n" +
                            "\n" +
                            "                        <div class=\"dataDiv\">\n" +
                            "                            <a href=\""+controllerUrl+data[i].dataUrl+"&dataId="+data[i].dataId+"\"><span>"+data[i].dataName.split(".")[0]+"</span></a>\n" +
                            "                        </div>\n" +
                            "                    </div>");
                    }
                } else {
                        var html = "";

                        html+="<div style=\"margin-left: 40px;margin-top: 20px\">"
                        html+="该章节暂无资料下载"
                        html+="</div>";

                        $('#unitFiles').html(html);
                }
            }
        });
    }

    // 加载测试题
    function loadTopics() {
        var basePath = $('#basePath').val();//项目上下文
        var unitId=$('#unitId').val(); // 章节ID

        $.ajax({
            url:basePath+"/topic/loadTopics?unitId="+unitId
            ,dataType:'json'
            ,success:function (data) {
                console.log(data);
                if (data.length>0){
                    for (var i=0;i<data.length;i++){
                        var html = "";

                        html+="<div id='title"+(i+1)+"' style=\"margin-left: 40px;margin-top: 20px\">"
                        html+="<div id='topicAnswer"+(i+1)+"' class='"+data[i].rightKey+"'>"+(i+1)+"&nbsp;&nbsp;"+data[i].topicDescribe+"</div>";
                        html+="<div>";
                        html+="<ul>";

                        html+="<li>";
                        html+="<input type=\"radio\" name=\"topic"+(i+1)+"\" value=\"A\">";
                        html+="<span>";
                        html+=data[i].optionA;
                        html+="</span>";
                        html+="</li>";

                        html+="<li>";
                        html+="<input type=\"radio\" name=\"topic"+(i+1)+"\" value=\"B\">";
                        html+="<span>";
                        html+=data[i].optionB;
                        html+="</span>";
                        html+="</li>";

                        html+="<li>";
                        html+="<input type=\"radio\" name=\"topic"+(i+1)+"\" value=\"C\">";
                        html+="<span>";
                        html+=data[i].optionC;
                        html+="</span>";
                        html+="</li>";

                        html+="<li>";
                        html+="<input type=\"radio\" name=\"topic"+(i+1)+"\" value=\"D\">";
                        html+="<span>";
                        html+=data[i].optionD;
                        html+="</span>";
                        html+="</li>";

                        html+="</ul>";
                        html+="</div>";
                        html+="</div>";
                        html+="</div>";

                        $('#topicText').append(html);
                    }
                    var button = "";
                    button+="<button type=\"button\" id='submitBtn' class=\"layui-btn\" style='margin-left: 50%' onclick='submitAnswer("+data.length+")'>";
                    button+="提交";
                    button+="</button>";

                    $('#topicText').append(button);
                }else {
                    var html = "";

                    html+="<div style=\"margin-left: 40px;margin-top: 20px\">"
                    html+="该章节暂无测试题"
                    html+="</div>";

                    $('#topicText').html(html);
                }
            }
        });
    }

    // 提交测试题答案
    function submitAnswer(titleNums) {
        layui.use('layer', function(){
            var layer = layui.layer;

            layer.open({
                type: 1,
                content: '<div style="width:300px;height: 60px;text-align: center;margin-top: 20%;color: green;">提交后答案不可更改，确定提交吗？</div>', //这里content是一个普通的String
                btn:['提交','取消'],
                yes:function (index) {
                    checkAnswer(titleNums);
                    layer.close(index);
                },
                btn2:function (index) {
                    layer.close(index);
                }
            });
        });
    }
    
    // 测试题的答案检验
    function checkAnswer(titleNums) {
        for (var i=1;i<=titleNums;i++){
            var nm="topic"+i;//每道题中四个选项所在input的name
            var answerId = "topicAnswer"+i;//答案所在div的ID
            var titleId = "title"+i;// 题目所在div的父div的ID
            var answer = $("#"+answerId+"").attr("class");//题目的正确答案
            var choice=$('input[name='+nm+']:checked').val();//用户第i道题的答案

            if (choice==answer){
                // correctNum++;
                $("#"+titleId+"").append("<div class=\"analysisInfo-right\">\n" +
                    "                            <div>\n" +
                    "                                <span class=\"tt1 right\">正确答案：</span>\n" +
                    "                                <span class=\"tt2 right\">"+answer+"</span>\n" +
                    "                                <span class=\"tt3 right\">你选对了</span>\n" +
                    "                            </div>\n" +
                    "                        </div>");
            }else if (choice == undefined){
                $("#"+titleId+"").append("<div class=\"analysisInfo-wrong\">\n" +
                    "                            <div>\n" +
                    "                                <span class=\"tt1 wrong\">正确答案：</span>\n" +
                    "                                <span class=\"tt2 wrong\">"+answer+"</span>\n" +
                    "                                <span class=\"tt3 wrong\">你没选择任何选项</span>\n" +
                    "                            </div>\n" +
                    "                        </div>");
            }else {
                $("#"+titleId+"").append("<div class=\"analysisInfo-wrong\">\n" +
                    "                            <div>\n" +
                    "                                <span class=\"tt1 wrong\">正确答案：</span>\n" +
                    "                                <span class=\"tt2 wrong\">"+answer+"</span>\n" +
                    "                                <span class=\"tt3 wrong\">你错选为"+choice+"</span>\n" +
                    "                            </div>\n" +
                    "                        </div>");
            }
        }
        // 将提交按钮移除
        // $('#topicText')
        $('#submitBtn').remove();
        // 选项所在的单选按钮设置为不可选
        $('input[type=radio]').attr("disabled",true);
    }

    // 加载更多评论
    function loadMoreEvaluations(){
        layui.use('flow',function () {
            var flow = layui.flow;
            var basePath = $('#basePath').val();//项目上下文
            var unitId=$('#unitId').val(); // 章节ID
            var limit = 5; //每页显示的条数
            var length = $('#listLength').val(); // 总的数据量
            var pages = Math.ceil(parseInt(length)/limit); // 向上取整获得页数
            flow.load({
                elem: '#LAY_demo1' //流加载容器
                ,scrollElem: '#LAY_demo1' //滚动条所在元素，一般不用填，此处只是演示需要。
                ,done: function(page, next){ //执行下一页的回调
                    //数据插入
                    setTimeout(function(){
                        var lis = [];
                        $.ajax({
                            url:basePath+"/courseAppraise/loadMore?unitId="+unitId+"&page="+page+"&limit="+limit,
                            dataType:"json",
                            success:function (data) {
                                // data = JSON.parse()
                                for(var i = 0; i < data.length; i++){
                                    var html = "";
                                    html += "<li>";
                                    html += "<div class=\"ux-mooc-comment-course-comment_comment-list\" style='margin-left: 40px'>";
                                    html += "<div class=\"ux-mooc-comment-course-comment_comment-list_item\">";

                                    html += "<div class=\"ux-mooc-comment-course-comment_comment-list_item_avatar\">";
                                    html += "<a href=\"此处填去个人中心的路径\" target=\"_top\">";
                                    html += "<img src=\""+basePath+data[i].userInfo.headImgUrl+"\" width=\"40\" height=\"40\">";
                                    html += "</a>";
                                    html += "</div>";

                                    html += "<div class=\"ux-mooc-comment-course-comment_comment-list_item_body\">";
                                    html += "<div class=\"ux-mooc-comment-course-comment_comment-list_item_body_user-info\">";
                                    html += "<a class=\"primary-link ux-mooc-comment-course-comment_comment-list_item_body_user-info_name\" href=\"此处填去个人中心的路径\" target=\"_top\">";
                                    html += data[i].userInfo.userName;
                                    html += "</a>";
                                    html += "</div>";
                                    html += "<div class=\"ux-mooc-comment-course-comment_comment-list_item_body_content\">";
                                    html += "<span>";
                                    html += data[i].appraiseText;
                                    html += "</span>";
                                    html += "</div>";
                                    html += "<div class=\"ux-mooc-comment-course-comment_comment-list_item_body_comment-info\">";
                                    html += "<div class=\"ux-mooc-comment-course-comment_comment-list_item_body_comment-info_time\">";
                                    html += data[i].appraiseTime;
                                    html += "</div>";
                                    html += "</div>";
                                    html += "</div>";

                                    html += "</div>";
                                    html += "</div>";
                                    html += "</li>";

                                    lis.push(html);
                                }
                                //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                                //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                                next(lis.join(''), page<pages);
                            }
                        });

                    }, 500);
                }
            });
        });
    }

    // 点击发表评价按钮，显示评价弹窗
    layui.use('layer', function() {
        var $ = layui.jquery, layer = layui.layer;
        //触发事件
        var active = {
            offset: function(othis){
                var type = othis.data('type')

                layer.open({
                    type: 1
                    ,offset: type
                    ,id: 'layerDemo'+type //防止重复弹出
                    ,area: ['640px', '588px']
                    ,content: $('#publish')
                    ,btn: ['提交','取消']
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    ,anim:1//弹窗从上掉落
                    ,yes: function(index){
                        // ajax异步提交评价内容
                        publish();
                        layer.close(index);
                    }
                    ,btn2:function (index) {
                        layer.close(index);
                    }
                });
            }
        }

        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });

    // 评价内容提交到后台
    function publish(){
        var appraiseText = $('#component-course-editor-textarea').val();
        var appraiseTime = getNowTime();
        // var userId = $('#userId').val();
        var userId = 1;
        var unitId = $('#unitId').val();
        var basePath = $('#basePath').val();
        var jsonData = {"unitId":unitId,"userId":userId,"appraiseText":appraiseText,"appraiseTime":appraiseTime};

        $.ajax({
            url:basePath+"/courseAppraise/publish"
            ,data:jsonData
            ,dataType: 'text'
            ,success:function (msg) {
                console.log(msg)
                if (msg=='success'){
                    layui.layer.open({
                        content: '谢谢您的评价'
                        ,success:function () {
                            $('#LAY_demo1').empty();
                            loadMoreEvaluations();
                        }
                    });
                }else {
                    layui.layer.open({
                        title:'温馨提示'
                        ,content: '服务器繁忙，请稍后提交'
                    })
                }
            }
        });
    }
    
    // 获取当前系统时间
    function getNowTime() {
        var myDate = new Date();

        var year=myDate.getFullYear();        //获取当前年
        var month=myDate.getMonth()+1;   //获取当前月
        var date=myDate.getDate();            //获取当前日


        var h=myDate.getHours();              //获取当前小时数(0-23)
        var m=myDate.getMinutes();          //获取当前分钟数(0-59)
        var s=myDate.getSeconds();

        var now=year+'-'+getNow(month)+"-"+getNow(date)+" "+getNow(h)+':'+getNow(m)+":"+getNow(s);
        return now;
    }

    // 当月，日，时，分，秒小于10时以0x形式显示
    function getNow(s){
        return s < 10 ? '0' + s: s;
    }

    $(function(){
        //左侧视频list移入显示课程名称，样式变化
        $('.cNameSpan').mouseenter(function(){
            var top = $(this).offset().top-30;
            $(this).css({color:"white",backgroundColor:"rgba(231, 68, 52, 1)"});
            $(".courseNameTips p").html($(this).data("chtname"));
            $('.courseNameTips').css({display:"table","top":top+"px"});
        }).mouseleave(function(){
            var dataSeq = parseInt($(".playfmLBox").data("seq"));
            var videoId = parseInt($(this).text()) - 1;
            $('.courseNameTips').css({display:"none"})
            if(dataSeq != videoId){
                $(this).css({color:"#979797",backgroundColor:"#646464"});
            }
        }).click(function(){

        });
        $('.cNameSpan').eq($(".playfmLBox").data("seq")).css({color:"white",backgroundColor:"rgba(231, 68, 52, 1)"});
        /*------------视频向上按钮--------------*/
        $('.playLast').click(function(){
            var index = parseInt($('.playfmLong').attr('idx'));
            index--;
            // console.log(index);
            if(index==-1){
                alert('当前已经是第一个视频啦~~')
            }
            var spanCount = $('.playfmLong').children().length;
            if (index<=-(spanCount-10)) {
                index = 0;
            }
            $('.playfmLong').attr('idx',index);
            var top = 50*index;
            // console.log(top)
            $('.playfmLong').animate({top:-top+'px'},1000,'swing');
        });
        /*------------视频向下按钮--------------*/
        $('.playNext').click(function(){
            var index = parseInt($('.playfmLong').attr('idx'));
            index++;
            // console.log(index)
            var spanCount = $('.playfmLong').children().length;
            if (index>spanCount-10) {
                index = 0;
            }
            $('.playfmLong').attr('idx',index);
            var top = 50*index;
            // console.log(top)
            $('.playfmLong').animate({top:-top+'px'},1000,'swing');
        });
    });
</script>
<div class="xl-chrome-ext-bar" id="xl_chrome_ext_{4DB361DE-01F7-4376-B494-639E489D19ED}" style="position: fixed; left: 186.5px; top: -408px; width: 98px; height: 24px; z-index: 1000000; display: none;">
    <div class="xl-chrome-ext-bar__logo"></div>
    <a id="xl_chrome_ext_download" href="javascript:;" class="xl-chrome-ext-bar__option">下载视频</a>
    <a id="xl_chrome_ext_close" href="javascript:;" class="xl-chrome-ext-bar__close"></a>
</div>
</body>
</html>
