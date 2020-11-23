<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: WUWX
  Date: 2020/11/12
  Time: 0:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>账号设置</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}//layui/layui.js"></script>

    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/findJob.js" charset="utf-8"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">

    <style>
        .layui-tab-title li{
            display: block;
        }
        .layui-tab-title{
            float: left;
            width: 200px;
        }
        .layui-tab-content{
            float: left;
            width: 500px;
        }
    </style>
</head>
<body>

<div id="header" style="background-color: #0cccb5">
    <div class="inner home-inner" >
        <div class="logo">
            <a href="https://www.zhipin.com/" ka="header-home-logo" title="BOSS直聘"><span>BOSS直聘</span></a>
        </div>
        <div class="nav">
            <ul>
                <li class=""><a ka="header-home" href="https://www.zhipin.com/">首页</a></li>
                <li class="cur"><a ka="header-job" href="https://www.zhipin.com/job_detail/">职位</a></li>
                <li class=""><a class="nav-school" ka="header-school" href="https://www.zhipin.com/xiaoyuan/">公司</a></li>
                <li class=""><a ka="tab_overseas_click" href="${pageContext.request.contextPath}/center/jianli">简历</a></li>
                <li class=""><a ka="header_brand" href="https://www.zhipin.com/gongsi/">校招</a></li>
                <li class=""><a ka="header-app" href="https://app.zhipin.com/">课程</a></li>
                <li class=""><a ka="header-article" href="https://news.zhipin.com/">资讯</a></li>
            </ul>
        </div>

    </div>
<div style="width: 60%;height: 50%;margin-top: 5%;margin-left: 20%">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>账号设置</legend>
    </fieldset>

    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
        <ul class="layui-tab-title ">
            <li class="layui-this " style="margin-top: 20%">重置密码</li>
            <li class="layui-this" style="margin-top: 20%">手机号码</li>
            <li class="layui-this" style="margin-top: 20%">绑定微信</li>
            <li class="layui-this" style="margin-top: 20%">隐私设置</li>
        </ul>
        <div class="layui-tab-content" style="height: 12%;">
            <div class="layui-tab-item  layui-show" style="margin-top: 10%;margin-left: 10%">
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 15%">旧密码</label>
                    <div class="layui-input-inline">
                        <input type="password" id="oldpwd" required  lay-verify="required" placeholder="请输入旧密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 15%">新密码</label>
                    <div class="layui-input-inline">
                        <input type="password" id="newpwd" required  lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 15%">确认密码</label>
                    <div class="layui-input-inline">
                        <input type="password" id="newpwd2" required  lay-verify="required" placeholder="再次输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="site-demo-button" id="layerDemo" style="text-align: center" >
<%--                    <div class="layui-input-block">--%>
                        <input id="savePwd" type="button" value="保存"  data-method="offset" data-type="auto" class="layui-btn layui-btn-normal">
<%--                    </div>--%>
                </div>
            </div>
            <div class="layui-tab-item" style="margin-top: 20%;margin-left: 20%">
                <form class="layui-form" action="">
                    <div>
                        <label class="layui-form-label"  style="width: 25%">当前手机号：</label>
                        <label class="layui-form-label" id="oldPhone">${user.telephone}</label>
                        <button id="hidePhone" class="layui-btn layui-btn-sm layui-btn-danger" onclick="showPhone()" lay-filter="formDemo">绑定新手机号</button>
                    </div>
                    <div id="showPhone" style="display: none">
                        <div class="layui-form-item">
                            <label class="layui-form-label"  style="width: 25%">新手机号码：</label>
                            <div class="layui-input-block">
                                <input style="width: 65%" type="text" id="newPhone" name="title" required  lay-verify="required" placeholder="请输入新手机号码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-form-item">
                                <label class="layui-form-label"  style="width: 25%">验证码:</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="password" id="vCode" required lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input">
                                </div>
                                <input class="layui-btn layui-btn-xs" id="vCodeMenu"  value="获取验证码" style="width: 17%">
<%--                                <button class="layui-btn layui-btn-xs" onclick="vCode(this)" lay-filter="formDemo">获取验证码</button>--%>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input class="layui-btn" id="updatePhone" value="立即提交">
<%--                                <button class="layui-btn" id="updatePhone"  >立即提交</button>--%>
                                <button type="reset" class="layui-btn layui-btn-primary" onclick="quitPhone()">取消</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="layui-tab-item">内容3</div>
            <div class="layui-tab-item"  style="margin-top: 20%;margin-left: 20%">
                <form class="layui-form">
                    <label class="layui-form-label" style="width: 100px;margin-left: 15%">简历隐藏</label>
                    <div class="layui-input-inline">
                        <input type="checkbox" id="isShow" name="isShow" lay-text="ON|OFF"   lay-skin="switch" lay-filter="switchTest"   <c:if test="${user.isOpen==2}">checked</c:if>  >
                    </div>
<%--                    <div class="layui-input-block" style="margin-top: 10%">--%>
<%--                        <input type="button" value="保存" onclick="" class="layui-btn">--%>
<%--                        <input type="button" value="取消" onclick="" class="layui-btn">--%>
<%--                    </div>--%>
                </form>
            </div>

        </div>
    </div>
</div>

</div>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'element','layer'], function(){
        var $ = layui.jquery
            ,form=layui.form
            , layer = layui.layer
            ,$ = layui.jquery
            ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function(){
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: '新选项'+ (Math.random()*1000|0) //用于演示
                    ,content: '内容'+ (Math.random()*1000|0)
                    ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                })
            }
            ,tabDelete: function(othis){
                //删除指定Tab项
                element.tabDelete('demo', '44'); //删除：“商品管理”


                othis.addClass('layui-btn-disabled');
            }
            ,tabChange: function(){
                //切换到指定Tab项
                element.tabChange('demo', '22'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);

        element.on('tab(test)', function(elem){
            location.hash = 'test='+ $(this).attr('lay-id');
        });

        $('#savePwd').on('click',function () {
            var oldpwd=$('#oldpwd').val();
            var newpwd=$('#newpwd').val();
            var newpwd2=$('#newpwd2').val();
            console.log("22222222222222")
            if (newpwd==newpwd2){
                $.ajax({
                    url: 'savePwd',
                    charset:"UTF-8",
                    async: "true",
                    type: "post",
                    data: "oldpwd="+oldpwd+"&newpwd="+newpwd,
                    dataType: "text",
                    success: function (data) {
                        if (data == "succes") {
                            //向服务端发送删除指令
                            layer.msg('修改成功')
                            location.reload()
                        } else if (data == "lose") {
                            layer.msg("旧密码错误")
                        }
                    },
                    error: function () {
                        layer.msg('网络繁忙')
                    }
                })
            }else {

                layer.open({
                    title: '信息'
                    ,content: '两次密码不一致'

                })
            }
        })

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            var start=data.othis.text();
            if (data.othis.text()=='OFF'){
                var isOpen=1;
                // layer.msg('您的简历已恢复展示状态');
            }else {
                var isOpen=2;
                // layer.msg('您的简历已设置成隐藏状态');
            }
            $.ajax({
                url: 'saveShow',
                charset:"UTF-8",
                async: "true",
                type: "post",
                data: "isOpen="+isOpen,
                dataType: "text",
                success: function (data) {
                    if (data == "succes") {
                        //向服务端发送删除指令

                        if (start=='OFF'){
                            console.log("!!!!!!!!!!")
                            layer.msg('您的简历已恢复展示状态');
                        }else {
                            console.log("!!!!!？？？？？？？？？？？!!!!!")
                            layer.msg('您的简历已设置成隐藏状态');
                        }
                    } else if (data == "lose") {
                        layer.msg("修改失败")
                    }
                },
                error: function () {
                    layer.msg('网络繁忙')
                }
            })


            // layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
            // if(){
            //
            // }
        });

        $('#updatePhone').on('click',function () {
            var newPhone=$('#newPhone').val();
            var vCode=$('#vCode').val();
            console.log(newPhone);
            console.log(vCode);
            $.ajax({
                url: 'updatePhone',
                charset:"UTF-8",
                async: "true",
                type: "post",
                data: "vCode="+vCode,
                dataType: "text",
                success: function (data) {
                    if (data == "succes") {
                        layer.msg("手机号修改成功")
                        document.getElementById("hidePhone").style.display='block';
                        document.getElementById("showPhone").style.display='none';
                        $('#oldPhone').text(newPhone);
                        $('#newPhone').val("");
                        $('#vCode').val("");

                    } else if (data == "lose") {
                        layer.msg("验证码错误")
                    }
                },
                error: function () {
                    layer.msg('网络繁忙')
                }
            })

        })
        $('#vCodeMenu').on('click',function () {
            $.ajax({
                url: 'vCodeMenu',
                charset:"UTF-8",
                async: "true",
                type: "post",
                data: "newPhone="+$('#newPhone').val(),
                dataType: "text",
                success: function (data) {
                    if (data == "succes") {
                        layer.msg("已发送验证码，请注意查看");
                        $('#vCodeMenu').val("已发送")

                    } else if (data == "lose") {
                        layer.msg("手机号已被绑定")
                    }
                },
                error: function () {
                    layer.msg('网络繁忙')
                }
            })
        })



    });
    function showPhone() {
        document.getElementById("showPhone").style.display='block';
        document.getElementById("hidePhone").style.display='none';
    }
    function quitPhone() {
        document.getElementById("hidePhone").style.display='block';
        document.getElementById("showPhone").style.display='none';
    }


</script>
<script>

</script>
</body>

</html>
