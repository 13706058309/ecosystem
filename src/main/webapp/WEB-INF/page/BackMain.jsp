<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/13
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>后台主页</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/pay/js/amazeui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/pay/js/ui-choose.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pay/css/amazeui.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pay/css/main.css" />
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

    <script>
        //JavaScript代码区域

    </script>
</head>
<body class="layui-layout-body">
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">后台管理首页</div>
        <ul class="layui-nav layui-layout-right" style="margin-top: 0%">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${admin.bUserName}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="#" onclick="showBalance()">积分查看</a></dd>
                    <dd><a href="#" onclick="showPay()">积分充值</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="#" onclick="exitLogin()">注销</a></li>
        </ul>
    </div>
    <div  class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <c:if test="${not empty menuList}">
                    <c:forEach items="${menuList}" var="menu" varStatus="menuIndex">
                        <li class="layui-nav-item <c:if test="${menuIndex.index==0}">layui-nav-itemed</c:if>">
                            <a href="javascript:;">${menu.title}</a>
                        <c:if test="${not empty menu.children}">
                            <dl class="layui-nav-child">
                            <c:forEach items="${menu.children}" var="menuChild">
                                    <dd><a href="${pageContext.request.contextPath}/${menuChild.url}" target="mainFrame">${menuChild.title}</a></dd>
                            </c:forEach>
                            </dl>
                        </c:if>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>
        </div>
    </div>

    <div  class="layui-body" style="bottom: 0px">
        <!-- 内容主体区域 -->
<%--        <div style="padding: 15px;">--%>
        <iframe style="width: 100%;height:100%;border: 0px" id="mainFrame" name="mainFrame"> </iframe>
<%--        </div>--%>
    </div>

<%--    <div class="layui-footer">--%>
<%--        <!-- 底部固定区域 -->--%>
<%--        © layui.com - 底部固定区域--%>
<%--    </div>--%>

</div>

<div class="pay" id="pay" style="display: none">
    <!--主内容开始编辑-->
    <div class="tr_recharge">
        <div class="tr_rechtext">
            <p class="te_retit"><img src="${pageContext.request.contextPath}/pay/images/coin.png" alt="" />充值中心</p>
            <p>1.人才币是钱程无忧退出的虚拟货币，你可以使用人才币购买站内的简历。</p>
            <p>2.人才币与人民币换算为1：1，即1元=1人才币，你可以选择支付宝的付款方式来进行充值，人才币每次10个起充。</p>
        </div>
        <form action="#" class="am-form" id="doc-vld-msg">
            <div class="tr_rechbox">
                <div class="tr_rechhead">
                    <img src="${pageContext.request.contextPath}/pay/images/ys_head2.jpg" />
                    <p>充值帐号：
                        <a>${admin.account}</a>
                    </p>
                    <div class="tr_rechheadcion">
                        <img src="images/coin.png" alt="" />
                        <span>当前余额：<span id="balaces">${admin.balance}招兵币</span></span>
                    </div>
                </div>
                <div class="tr_rechli am-form-group">
                    <ul class="ui-choose am-form-group" id="uc_01">
                        <li>
                            <label class="am-radio-inline">
                                <input type="radio"  value="" name="docVlGender" required data-validation-message="请选择一项充值额度"> 10￥
                            </label>
                        </li>
                        <li>
                            <label class="am-radio-inline">
                                <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 20￥
                            </label>
                        </li>

                        <li>
                            <label class="am-radio-inline">
                                <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 50￥
                            </label>
                        </li>
                        <li>
                            <label class="am-radio-inline">
                                <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 其他金额
                            </label>
                        </li>
                    </ul>
                    <!--<span>1招兵币=1元 10元起充</span>-->
                </div>
                <div class="tr_rechoth am-form-group">
                    <span>其他金额：</span>
                    <input type="number" min="10" max="10000" value="10.00元" class="othbox" data-validation-message="充值金额范围：10-10000元" />
<%--                    <p>充值金额范围：10-10000元</p>--%>
                </div>
                <div class="tr_rechcho am-form-group" style="margin-left: 1%">
                    <span>充值方式：</span>
                    <label class="am-radio" style="margin-right:30px;">
                        <img src="${pageContext.request.contextPath}/pay/images/zfbpay.png">
                    </label>
<%--                    <label class="am-radio" style="margin-right:30px;">--%>
<%--                        <input type="radio" name="radio1" value="" data-am-ucheck data-validation-message="请选择一种充值方式"><img src="${pageContext.request.contextPath}/pay/images/zfbpay.png">--%>
<%--                    </label>--%>
                </div>
                <div class="tr_rechnum">
                    <span>应付金额：</span>
                    <p class="rechnum">0.00元</p>
                </div>
            </div>
            <div class="tr_paybox">
                <input type="button" value="确认支付" class="tr_pay am-btn" onclick="pay()" />
                <span>温馨提示：人才币只限于购买简历，遇到问题请拨打联系电话13706058309。</span>
            </div>
        </form>
    </div>
</div>

<div id="payDetail" style="display: none;padding: 3%">
    <form action="${pageContext.request.contextPath}/alipayTradePagePay" method=post>
        <table class="layui-table" >
            <tr>
                <td>订单号</td>
                <td><input readonly="true" id="WIDout_trade_no" name="WIDout_trade_no" style="border: none"></td>
            </tr>
            <tr>
                <td>订单名称</td>
                <td><input readonly="true" id="WIDsubject" name="WIDsubject" value="人才币充值" style="border: none"></td>
            </tr>
            <tr>
                <td>商品描述</td>
                <td><input readonly="true" id="WIDbody" name="WIDbody" value="虚拟货币" style="border: none"></td>
            </tr>
            <tr>
                <td>充值金额(元)</td>
                <td><input readonly="true" id="WIDtotal_amount" name="WIDtotal_amount" style="border: none"></td>
            </tr>

        </table>
        <div class="layui-input-inline" style="margin-left: 39%">
            <input type="submit" class="layui-btn layui-btn-lg layui-btn-fluid" value="确认" >
        </div>
    </form>
</div>

<div id="balanceDetail" style="display: none;padding: 3%">
    <table class="layui-table" >
        <tr>
            <td>用户</td>
            <td>${admin.bUserName}</td>
        </tr>
        <tr>
            <td>当前持有人才币</td>
            <td id="balancess">${admin.balance}</td>
        </tr>
    </table>
</div>
</body>
<script>
    var resumeID = "";
    var path = $("#path").val();
    var layer;
    layui.use(['element','layer'], function(){
        var element = layui.element;
        layer=layui.layer;
    });
<%--    <%--%>
<%--        String resumeID = (String) request.getSession().getAttribute("resumeID");--%>
<%--        if(resumeID!=null){--%>
<%--            out.write("resumeID="+resumeID);--%>
<%--            request.getSession().removeAttribute("resumeID");--%>
<%--        }--%>

<%--    %>--%>


    // $(function () {
    //     if(resumeID.length!=0){
    //         location.href = path+"/rec/outResume?resumeID="+resumeID;
    //         resumeID == "";
    //     }
    // })

    function exitLogin() {
        layer.confirm('确认退出',{
            btn:['确定','取消'],
                time:20000,
        },function (index) {
            location.href = path+"/rec/exitsLogin";
        })
    }

    function showPay() {
        $.ajax({
            url:path+"/rec/getBlance",
            type:"post",
            typeData:"text",
            success:function (info) {
                $("#balaces").text(info+"人才币");
                layer.open({
                    type:1,
                    title:"人才币充值",
                    area:['60%','80%'],
                    offset: ['10%', '30%'],
                    content:$("#pay")
                })
            },
        })
    }

    function showBalance() {
        $.ajax({
            url:path+"/rec/getBlance",
            type:"post",
            typeData:"text",
            success:function (info) {
                $("#balancess").text(info+"人才币");
                layer.open({
                    type:1,
                    title:"人才币查看",
                    area:['30%','30%'],
                    offset: ['10%', '30%'],
                    content:$("#balanceDetail")
                })
            },
        })
    }

//
    // 将所有.ui-choose实例化
    $('.ui-choose').ui_choose();
    // uc_01 ul 单选
    var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
    uc_01.click = function(index, item) {
        console.log('click', index, item.text())
    }
    uc_01.change = function(index, item) {
        console.log('change', index, item.text())
    }
    $(function() {
        $('#uc_01 li:eq(3)').click(function() {
            $('.tr_rechoth').show();
            $('.tr_rechoth').find("input").attr('required', 'true')
            $('.rechnum').text('10.00元');
            $('.othbox').val('10');
        })
        $('#uc_01 li:eq(0)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('10.00元');
            $('.othbox').val('');
        })
        $('#uc_01 li:eq(1)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('20.00元');
            $('.othbox').val('');
        })
        $('#uc_01 li:eq(2)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('50.00元');
            $('.othbox').val('');
        })
        $(document).ready(function() {
            $('.othbox').on('input propertychange', function() {
                var num = $(this).val();
                $('.rechnum').html(num + ".00元");
            });
        });
    })

    $(function() {
        $('#doc-vld-msg').validator({
            onValid: function(validity) {
                $(validity.field).closest('.am-form-group').find('.am-alert').hide();
            },
            onInValid: function(validity) {
                var $field = $(validity.field);
                var $group = $field.closest('.am-form-group');
                var $alert = $group.find('.am-alert');
                // 使用自定义的提示信息 或 插件内置的提示信息
                var msg = $field.data('validationMessage') || this.getValidationMessage(validity);

                if(!$alert.length) {
                    $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
                    appendTo($group);
                }
                $alert.html(msg).show();
            }
        });
    });

    function RandomRange() {
        var returnStr = "";
        var arr = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
        for(var i=0; i<12 ; i++){
            var index = Math.round(Math.random() * (arr.length-1));
            returnStr += arr[index];
        }
        return returnStr;
    }

    function pay() {
        var money = $(".othbox").val();
        if(money.length!=0){
            var pattern = /^\+?[1-9][0-9]*$/;
            if(!pattern.test(money)){
                layer.msg("请输入正整数");
                return false;
            }
            if(parseInt(money)<10||parseInt(money)>(10000)){
                layer.msg("充值金额范围：10-10000元");
                return false;
            }
        }
        var pay = $('.rechnum').text();
        if(pay==".00元"){
            layer.msg("请输入正整数");
            return false;
        }
        if(pay=="0.00元"){
            layer.msg("请选择或输入充值金额");
            return false;
        }

        $("#WIDout_trade_no").val(RandomRange);
        $("#WIDtotal_amount").val(pay.replace(".00元",""));

        layer.open({
            type:1,
            title:"充值明细",
            area:['40%','50%'],
            offset: ['20%', '40%'],
            content:$("#payDetail")
        })

    }
</script>
</html>
