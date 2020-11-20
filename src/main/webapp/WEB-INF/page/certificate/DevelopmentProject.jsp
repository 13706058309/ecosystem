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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>开发证书项目</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>

</head>
<body>
<div id="body">
    <div id="container">
        <dl class="c_delivery">
            <dt>
                <h1><em></em>开发阶段</h1>
            </dt>
            <dd>
                <div id="deliveryForm">
                    <c:if test="${not empty kaifacerRecordList}">
                        <c:forEach items="${kaifacerRecordList}" var="list">
                            <ul class="reset my_delivery">
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
                                            <a>项目需求</a>
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
                                            <li class="status_text_1">上传状态</li>
                                            <li class="status_text_2" style="margin-left:90px">审核状态</li>
                                            <li class="status_text_3" style="margin-left:90px">评审状态</li>
                                            <li class="status_text_4" style="margin-left:90px">成功</li>
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
                                                <li class="status_text_1">上传状态</li>
                                                <li class="status_text_2" style="margin-left:90px">审核状态</li>
                                                <li class="status_text_3" style="margin-left:90px">评审状态</li>
                                                <li class="status_text_4" style="margin-left:90px">成功</li>
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
                                                            <div>您的项目已收到，但目前您的项目不合格，因此很抱歉地通知您无法获得证书。PS:技术成长有教学视频，可前往学习</div>
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
                                                <li class="status_text_1">上传状态</li>
                                                <li class="status_text_2" style="margin-left:90px">审核状态</li>
                                                <li class="status_text_3" style="margin-left:90px">评审状态</li>
                                                <li class="status_text_4" style="margin-left:90px">成功</li>
                                            </ul>
                                            <c:if test="${list.stateId==29}">
                                                <ul class="status_list">
                                                    <li class="top">
                                                        <div class="list_time"><em></em>${list.turnoverTime}</div>
                                                        <div class="list_body">
                                                            待评审通知
                                                            <div>1-3工作日，评审人员会联系您预约时间进行评审</div>
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
                                                <li class="status_text_1">上传状态</li>
                                                <li class="status_text_2" style="margin-left:90px">审核状态</li>
                                                <li class="status_text_3" style="margin-left:90px">评审状态</li>
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
    </div><!-- end #container -->
</div><!-- end #body -->
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
