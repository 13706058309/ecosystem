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
    <link rel="stylesheet" href="${pageContext.request.contextPath}//layui/css/layui.css">
    <script src="${pageContext.request.contextPath}//layui/layui.js"></script>
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
                        <input type="password" name="title" required  lay-verify="required" placeholder="请输入旧密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 15%">新密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="title" required  lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 15%">确认密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="title" required  lay-verify="required" placeholder="再次输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <input type="button" value="保存" onclick="" class="layui-btn">
                        <input type="button" value="取消" onclick="" class="layui-btn">
                    </div>
                </div>
            </div>
            <div class="layui-tab-item">内容2</div>
            <div class="layui-tab-item">内容3</div>
            <div class="layui-tab-item">内容4</div>

        </div>
    </div>
</div>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('element', function(){
        var $ = layui.jquery
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

    });
</script>

</body>

</html>
