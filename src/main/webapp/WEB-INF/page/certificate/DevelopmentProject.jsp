<%--
  Created by IntelliJ IDEA.
  User: WTQ
  Date: 2020/11/12
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">
    <title>开发证书项目</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jianli.css" rel="stylesheet">
    <script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js" crossorigin="anonymous"></script>
    <script src="https://static.zhipin.com/zhipin-geek/v334/web/geek/js/main.js"></script>
    <style>
        #container {
            margin:0 auto 0;
        }
    </style>
</head>
<body>
<div id="header" style="background-color:#00c2b3;height: 80px" >
    <div class="inner home-inner" >
        <div class="logo" style="width: 150px;height: 70px">

            <a  ka="header-home-logo" title="钱程无忧" style="background: url(${pageContext.request.contextPath}/imgs/logo12.jpg) 3px 7px no-repeat;background-size:150px 70px;width: 150px;height: 70px;margin-top: -20px"><span>钱程无忧</span></a>
        </div>
        <div class="nav" style="margin-top: 20px">
            <ul>
                <li class=""><a ka="header-home" href="${pageContext.request.contextPath}/homePage/home">首页</a></li>
                <li class=""><a ka="header-job" href="${pageContext.request.contextPath}/center/job">职位</a></li>
                <li class=""><a class="nav-school" ka="header-school" href="${pageContext.request.contextPath}/homePage/companylist">公司</a></li>
                <%--                <li class=""><a ka="header_brand" href="https://www.zhipin.com/gongsi/">校招</a></li>--%>
                <li><a href="${pageContext.request.contextPath}/project" target="_blank">项目</a></li>
                <li class=""><a ka="header-app" href="${pageContext.request.contextPath}/course/homePage">课程</a></li>
                <li class=""><a ka="header-article" href="${pageContext.request.contextPath}/zhengshu/cshouye">证书</a></li>
            </ul>
        </div>

        <div class="user-nav" style="margin-top: 20px">
            <ul>
                <%--                    <li class=""><a ka="header-message" href="https://www.zhipin.com/web/geek/chat">消息<span class="nav-chat-num"></span></a></li>--%>
                <li class="nav-figure">
                    <a >
                        <span class="label-text">${qUser.userName}</span><img id="topImg"  src="${pageContext.request.contextPath}${qUser.headImgUrl}" alt=""/>
                    </a>
                    <div class="dropdown">
                        <a href="${pageContext.request.contextPath}/center/jianli" ka="header-personal">个人中心<span>编辑简历</span></a>
                        <a href="${pageContext.request.contextPath}/center/accountSet" ka="account_manage">账号设置<span>重置密码|更换手机号|隐私设置|修改用户名</span></a>
                        <a href="${pageContext.request.contextPath}/homePage/quitAccount?city=${workCity}"  ka="header-logout">退出登录</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<div id="wrap" class="">
    <div id="main" class="inner">
    <div id="container" class="resume-container">
        <div class="resume-content">
        <dl class="c_delivery">
            <dt>
                <h1><em></em>开发阶段</h1>
            </dt>
            <dd style="padding: 25px 0 20px 0">
                <div id="deliveryForm">
                    <c:if test="${not empty kaifacerRecordList}">
                        <c:forEach items="${kaifacerRecordList}" var="list">
                            <ul class="reset my_delivery" style="margin: 12px 30px">
                                <li>
                                    <div class="d_item">
                                        <h2 title="随便写">
                                            <em>${list.field.fieldName}证书考核</em>
                                            <span>（项目考核）</span>
                                            </a>
                                        </h2>
                                        <span class="d_time">更新时间：${list.turnoverTime}</span>
                                        <div class="clear"></div>
                                        <label class="d_jobname" target="_blank">
                                            钱程无忧 <span>认证证书</span>
                                        </label>

                                        <span class="d_time">申请时间：${list.beginTime}</span>
                                        <div class="clear"></div>
                                        <div class="d_resume">
                                            下载项目：
                                            <a href="${pageContext.request.contextPath}/zhengshu/filedownload?fileid=${list.field.fieldId}">项目需求</a>
                                        </div>

                                        <label class="btn_showprogress" onclick="zhankai('${list.cerRecordId}')">
                                                ${list.state.paramName}
                                            <i></i></label>
                                        <c:if test="${list.cerFinalScore != 0}">
                                            <label class="btn_showprogress">总成绩:${list.cerFinalScore}</label>
                                        </c:if>
                                    </div>
<%--                                 上传状态框--%>
                                    <c:if test="${list.stateId==25 || list.stateId==26}">
                                    <div class="progress_status" id="${list.cerRecordId}" style="display: none">
                                        <ul class="status_steps">
                                            <li class="status_done status_1">1</li>
                                        </ul>
                                        <ul class="status_text">
                                            <li class="status_text_1">上传阶段</li>
                                        </ul>
                                        <c:if test="${list.stateId==25}">
                                        <ul class="status_list">
                                            <li class="top">
                                                <div class="list_time"><em></em>${list.turnoverTime}</div>
                                                <div class="list_body">
                                                    <input type="file" name="file_xmload" id="file_xmload" accept="application/zip" class="file" multiple data-min-file-count="2" >
                                                    <input type="button" value="提交" onclick="upxiangmu('${list.cerRecordId}')">
                                                    <div>待上传项目</div>
                                                </div>
                                            </li>
                                        </ul>
                                        </c:if>
                                        <c:if test="${list.stateId==26}">
                                            <ul class="status_list">
                                                <li class="top">
                                                    <div class="list_time"><em></em>${list.turnoverTime}</div>
                                                    <div class="list_body">
                                                        <input type="file" value="上传">
                                                        <input type="button" value="提交">
                                                        <div>上传失败，请重新上传</div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </c:if>
                                        <button class="btn_closeprogress" onclick="zhankai('${list.cerRecordId}')"></button>
                                    </div>
                                    </c:if>
                                        <%--测试状态框--%>
                                    <c:if test="${list.stateId==27 || list.stateId==28}">
                                        <div class="progress_status" id="${list.cerRecordId}" style="display: none">
                                            <ul class="status_steps">
                                                <li class="status_done status_1">1</li>
                                                <li class="status_line status_line_done"><span></span></li>
                                                <li class="status_done">2</li>
                                            </ul>
                                            <ul class="status_text">
                                                <li class="status_text_1">上传阶段</li>
                                                <li class="status_text_2" style="margin-left:90px">审核阶段</li>
                                            </ul>
                                            <c:if test="${list.stateId==27}">
                                                <ul class="status_list">
                                                    <li class="top">
                                                        <div class="list_time"><em></em>${list.turnoverTime}</div>
                                                        <div class="list_body">
                                                            您上传的项目正在被测试中
                                                            <div>请耐心等待测试人员精确测试</div>
                                                        </div>
                                                    </li>
                                                    <li class="bottom">
                                                        <div class="list_body">
                                                            上传项目成功
                                                        </div>
                                                    </li>
                                                </ul>
                                            </c:if>
                                            <c:if test="${list.stateId==28}">
                                                <ul class="status_list">
                                                    <li class="top">
                                                        <div class="list_time"><em></em>${list.turnoverTime}</div>
                                                        <div class="list_body">
                                                            证书项目被标记为不合格.<br>
                                                            查看测试成绩:<input type="button" value="查看" onclick="chakanchengji('测试','${list.cerTestScore}')"><br>
                                                            查看测试报告:<input type="button" value="下载" onclick="xiazaipingcebaogao('${list.cerRecordId}')">
                                                            <div>您的项目已收到，但目前您的项目不合格，因此很抱歉地通知您无法获得证书。技术成长有教学视频，可
                                                                <a href="${pageContext.request.contextPath}/course/homePage" target="_blank" style="color: #bd2130">前往学习</a></div>
                                                        </div>
                                                    </li>
                                                    <li class="bottom">
                                                        <div class="list_body">
                                                            上传项目成功
                                                        </div>
                                                    </li>
                                                </ul>
                                            </c:if>
                                            <button class="btn_closeprogress" onclick="zhankai('${list.cerRecordId}')"></button>
                                        </div>
                                    </c:if>
<%--                                    评测阶段--%>
                                    <c:if test="${list.stateId==29 || list.stateId==30}">
                                        <div class="progress_status" id="${list.cerRecordId}" style="display: none">
                                            <ul class="status_steps">
                                                <li class="status_done status_1">1</li>
                                                <li class="status_line status_line_done"><span></span></li>
                                                <li class="status_done">2</li>
                                                <li class="status_line status_line_done"><span></span></li>
                                                <li class="status_done">3</li>
                                            </ul>
                                            <ul class="status_text">
                                                <li class="status_text_1">上传阶段</li>
                                                <li class="status_text_2" style="margin-left:90px">审核阶段</li>
                                                <li class="status_text_3" style="margin-left:90px">评审阶段</li>
                                            </ul>
                                            <c:if test="${list.stateId==29}">
                                                <ul class="status_list">
                                                    <li class="top">
                                                        <div class="list_time"><em></em>${list.turnoverTime}</div>
                                                        <div class="list_body">
                                                            <a href="${pageContext.request.contextPath}/rec/userChat?compID=5" target="_blank" style="color: #009688">临时会话</a>
                                                            <div>1-3工作日请主动联系评审人员</div>
                                                        </div>
                                                    </li>
                                                    <li class="bottom">
                                                        <div class="list_body">
                                                            证书项目合格
                                                            <div>
                                                                查看测试成绩:<input type="button" value="查看" onclick="chakanchengji('测试','${list.cerTestScore}')"><br>
                                                                查看测试报告:<input type="button" value="下载" onclick="xiazaipingcebaogao('${list.cerRecordId}')">
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="bottom">
                                                        <div class="list_body">
                                                            上传项目成功
                                                        </div>
                                                    </li>
                                                </ul>
                                            </c:if>
                                            <c:if test="${list.stateId==30}">
                                                <ul class="status_list">
                                                    <li class="top">
                                                        <div class="list_time"><em></em>${list.turnoverTime}</div>
                                                        <div class="list_body">
                                                            您的评审不合格<br>
                                                        查看评审成绩:<input type="button" value="查看" onclick="chakanchengji('评审','${list.cerJudgeScore}')"><br>
                                                        查看最终报告:<input type="button" value="下载" onclick="xiazaifinalbaogao('${list.cerRecordId}')">
                                                            <div>很抱歉您在评审阶段不合格，希望您加强理论知识</div>
                                                        </div>
                                                    </li>
                                                    <li class="bottom">
                                                        <div class="list_body">
                                                            证书项目合格
                                                            <div>
                                                                查看测试成绩:<input type="button" value="查看" onclick="chakanchengji('测试','${list.cerTestScore}')"><br>
                                                                查看测试报告:<input type="button" value="下载" onclick="xiazaipingcebaogao('${list.cerRecordId}')">
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="bottom">
                                                        <div class="list_body">
                                                            上传项目成功
                                                        </div>
                                                    </li>
                                                </ul>
                                            </c:if>
                                            <button class="btn_closeprogress" onclick="zhankai('${list.cerRecordId}')"></button>
                                        </div>
                                    </c:if>
<%--                                    成功申请证书阶段--%>
                                    <c:if test="${list.stateId==31 || list.stateId==33}">
                                        <div class="progress_status" id="${list.cerRecordId}" style="display: none">
                                            <ul class="status_steps">
                                                <li class="status_done status_1">1</li>
                                                <li class="status_line status_line_done"><span></span></li>
                                                <li class="status_done">2</li>
                                                <li class="status_line status_line_done"><span></span></li>
                                                <li class="status_done">3</li>
                                                <li class="status_line status_line_done"><span></span></li>
                                                <li class="status_done">4</li>
                                            </ul>
                                            <ul class="status_text">
                                                <li class="status_text_1">上传阶段</li>
                                                <li class="status_text_2" style="margin-left:90px">审核阶段</li>
                                                <li class="status_text_3" style="margin-left:90px">评审阶段</li>
                                                <li class="status_text_4" style="margin-left:90px">成功</li>
                                            </ul>
                                            <c:if test="${list.stateId==31}">
                                                <ul class="status_list">
                                                    <li class="top">
                                                        <div class="list_time"><em></em>${list.turnoverTime}</div>
                                                        <div class="list_body">
                                                            等待证书证明上传
                                                            <div>请稍等1-3工作日，工作人员会上传证书证明，届时请前往已获得证书查看</div>
                                                        </div>
                                                    </li>
                                                    <li class="bottom">
                                                        <div class="list_time"><em></em></div>
                                                        <div class="list_body">
                                                            证书评审阶段合格
                                                            <div>
                                                                查看评审成绩:<input type="button" value="查看" onclick="chakanchengji('评审','${list.cerJudgeScore}')"><br>
                                                                查看最终报告:<input type="button" value="下载" onclick="xiazaifinalbaogao('${list.cerRecordId}')">
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="bottom">
                                                        <div class="list_time"><em></em></div>
                                                        <div class="list_body">
                                                            证书项目合格
                                                            <div>
                                                                查看测试成绩:<input type="button" value="查看" onclick="chakanchengji('测试','${list.cerTestScore}')"><br>
                                                                查看测试报告:<input type="button" value="下载" onclick="xiazaipingcebaogao('${list.cerRecordId}')"></div>
                                                        </div>
                                                    </li>
                                                    <li class="bottom">
                                                        <div class="list_time"><em></em></div>
                                                        <div class="list_body">
                                                            上传项目成功
                                                        </div>
                                                    </li>
                                                </ul>
                                            </c:if>
                                            <c:if test="${list.stateId==33}">
                                                <ul class="status_list">
                                                    <li class="top">
                                                        <div class="list_time"><em></em>${list.turnoverTime}</div>
                                                        <div class="list_body">
                                                            证书证明已上传
                                                            <div>请前往已获得证书查看</div>
                                                        </div>
                                                    </li>
                                                    <li class="bottom">
                                                        <div class="list_body">
                                                            证书评审阶段合格
                                                            <div>
                                                                查看评审成绩:<input type="button" value="查看" onclick="chakanchengji('评审','${list.cerJudgeScore}')"><br>
                                                                查看最终报告:<input type="button" value="下载" onclick="xiazaifinalbaogao('${list.cerRecordId}')"></div>
                                                        </div>
                                                    </li>
                                                    <li class="bottom">
                                                        <div class="list_body">
                                                            证书项目合格
                                                            <div>
                                                                查看测试成绩:<input type="button" value="查看" onclick="chakanchengji('测试','${list.cerTestScore}')"><br>
                                                                查看测试报告:<input type="button" value="下载" onclick="xiazaipingcebaogao('${list.cerRecordId}')"></div>
                                                        </div>
                                                    </li>
                                                    <li class="bottom">
                                                        <div class="list_body">
                                                            上传项目成功
                                                        </div>
                                                    </li>
                                                </ul>
                                            </c:if>
                                            <button class="btn_closeprogress" onclick="zhankai('${list.cerRecordId}')"></button>
                                        </div>
                                    </c:if>

                                </li>
                            </ul>
                        </c:forEach>
                    </c:if>
                </div>
            </dd>
        </dl>
        <div class="clear"></div>
        <input type="hidden" value="" id="resubmitToken">
        <a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
        </div>
        <div class="user-sider" style="height: 600px;background: #fff;">
            <div data-v-3b220faa="" class="sider-box sider-resume">
                <%--                    <div data-v-3b220faa="" class="resume-attachment">--%>
                <%--                        <h3 data-v-3b220faa="" class="sider-title">附件管理--%>
                <%--                        </h3>--%>
                <%--                        <div data-v-3b220faa="" class="btns"><button data-v-3b220faa="" type="button"--%>
                <%--                                                                     class="btn btn-primary">上传简历</button>--%>
                <%--                        </div>--%>
                <%--                        <div data-v-3b220faa="" class="">--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                    <div style="text-align: center">--%>
                <%--                        <div class="info-flex-item header-upload">--%>
                <%--                            <div class="header-box">--%>
                <%--                        <div class="header-mask" ></div><img style="height: 10%;width: 30%" id="headImg2"--%>
                <%--                                                                src="${pageContext.request.contextPath}${resume.photo}"--%>
                <%--                                                       class="header-img"></div></div>--%>
                <%--                        <div>${resume.realName}</div>--%>
                <%--                    </div>--%>
                <div style="margin-top: 20px">
                    <h2 style="color: #0cccb5">我的信息</h2>
                    <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/center/resumeInfo"  >收藏岗位</a></div>
                    <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/center/accountSet" >账号设置</a></div>
                    <%--                        <div style="margin-left: 20%"><a href=""  >收藏课程</a></div>--%>
                    <%--                        <div style="margin-left: 20%"><a href=""  >观看历史</a></div>--%>
                    <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/zhengshu/zxzsliebiao"  >证书申请</a></div>
                    <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/zhengshu/zxzstushi"  >证书展示</a></div>
                    <div style="margin-left: 20%"><a href="${pageContext.request.contextPath}/zhengshu/zxzskaifa"  >证书项目</a></div>
                </div>
            </div>
        </div>
    </div><!-- end #container -->
</div><!-- end #body -->
</div>


<script>
    function upxiangmu(id) {
        var formData= new FormData;
        formData.append("fileup",$("#file_xmload")[0].files[0]);
        formData.append("cerid",id);
        // var file = new FormData(document.getElementById("idCardform"));
        $.ajax({
            url:"${pageContext.request.contextPath}/zhengshu/fileupload",//=servlet里要调用的方法名
            async: true,//true异步请求，false同步请求，不写默认true，ajax嵌套时需要同步请求
            type: "post",//请求方式
            data: formData,//要提交的数据
            processData:false,
            contentType:false,
            dataType:"text",
            success:function (msg) {
                console.log(msg)
                if(msg=="success"){
                    alert("上传成功");
                    location.href='${pageContext.request.contextPath}/zhengshu/zxzskaifa'
                }else if (msg = "fail"){
                    alert("上传失败");
                }else if (msg = "time"){
                    alert("超过规定时间上传");
                }else if (msg = "nozip"){
                    alert("该文件类型暂不支持上传");
                }
            }

        });
    }
    function xiazaipingcebaogao(id) {
        layui.use('layer', function() {
            layer = layui.layer;
            layer.confirm('是否下载测试报告', function (index) {
                location.href='${pageContext.request.contextPath}/zhengshu/csbgdownload?cerid='+id;
            });
        });
    }
    function xiazaifinalbaogao(id) {
        layui.use('layer', function() {
            layer = layui.layer;
            layer.confirm('是否下载最终报告', function (index) {
                location.href='${pageContext.request.contextPath}/zhengshu/finaldownload?cerid='+id;
            });
        });
    }

    function chakanchengji(text,score) {
        layui.use('layer', function() {
            layer = layui.layer;
            layer.msg('当前'+text+'成绩：'+ score + '分');
        });
    }
    function zhankai(id) {
        // 获取 <span> 元素，用于关闭弹窗
        var span = document.getElementById(id);
        if (span.style.display == "none") {
            span.style.display = "block"
        } else {
            span.style.display = "none";
        }
    }
</script>
</body>
</html>
