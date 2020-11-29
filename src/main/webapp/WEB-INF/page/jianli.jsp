<%--
  Created by IntelliJ IDEA.
  User: WUWX
  Date: 2020/11/10
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <meta charset="UTF-8">
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
    <title>简历</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">


    <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jianli.css" rel="stylesheet">
    <script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">
    <script src="https://static.zhipin.com/zhipin-geek/v334/web/geek/js/main.js"></script>


</head>

<body>
<input type="text" style="display: none" id="kong">
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<input type="hidden" id="resumeId" value="${resume.resumeId}">
<%--<div id="header" style="background-color: #0d98ff">--%>
<%--<div class="inner home-inner" >--%>
<%--    <div class="logo">--%>
<%--&lt;%&ndash;        <img src="" style="width: 140px,30px" >&ndash;%&gt;--%>
<%--        <a href="https://www.zhipin.com/" ka="header-home-logo" title="钱程无忧" style="background: url(${pageContext.request.contextPath}/imgs/logo20.png) 3px 7px no-repeat;;background-size:150px 30px"><span>钱程无忧</span></a>--%>
<%--    </div>--%>
<%--    <div class="nav">--%>
<%--        <ul>--%>
<%--            <li class=""><a ka="header-home" href="https://www.zhipin.com/" >首页</a></li>--%>
<%--            <li class=""><a ka="header-job" href="https://www.zhipin.com/job_detail/">职位</a></li>--%>
<%--            <li class=""><a class="nav-school" ka="header-school" href="https://www.zhipin.com/xiaoyuan/">公司</a></li>--%>
<%--            <li class="cur"><a ka="tab_overseas_click" href="${pageContext.request.contextPath}/center/jianli">简历</a></li>--%>
<%--            <li class=""><a ka="header_brand" href="https://www.zhipin.com/gongsi/">校招</a></li>--%>
<%--            <li class=""><a ka="header-app" href="https://app.zhipin.com/">课程</a></li>--%>
<%--            <li class=""><a ka="header-article" href="https://news.zhipin.com/">资讯</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>

<%--</div>--%>

<div id="header" style="background-color:#00c2b3;height: 80px" >
    <div class="inner home-inner" >
        <div class="logo" style="width: 150px;height: 70px">

            <a href="https://www.zhipin.com/" ka="header-home-logo" title="钱程无忧" style="background: url(${pageContext.request.contextPath}/imgs/logo12.jpg) 3px 7px no-repeat;background-size:150px 70px;width: 150px;height: 70px"><span>钱程无忧</span></a>
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
                <!---->
                <input type="hidden" id="edId" value="${resume.educationId}">
                <input type="hidden" id="jobId" value="${resume.jobStandId}">
                <div class="resume-content-box">
                    <div class="update-time">
<%--                        <a href="javascript:;" ka="user_resume_preview"--%>
<%--                                                class="link-preview">预览简历</a>--%>
                        最后更新 <label id="updateTime9">${resume.updateTime}</label> </div>
                    <div class="resume-box">
                            <div id="userinfo" class="resume-item resume-userinfo">
                                <div id="userinfo-show" class="item-primary">
                                    <!---->
                                    <div class="info-flex">
                                        <div class="info-flex-item">
                                            <h2 class="name"><label id="realName9">${resume.realName}</label> <svg class="icon-svg">
                                                <use xlink:href="#icon_man"></use>
                                            </svg></h2>
                                            <div class="info-labels">
                                                <p><span class="prev-line"><i
                                                        class="fz-resume fz-experience"></i >民族：<label id="clan9">${resume.clan}</label></span><span
                                                        class="prev-line"><i
                                                        class="fz-resume fz-experience"></i>政治面貌：<label id="politicalStatus9">${resume.politicalStatus}</label></span><span
                                                        class="prev-line"><i
                                                        class="fz-resume fz-experience"></i>工作年限：<label id="wrokYear9">${resume.wrokYear}</label>年</span><span
                                                        class="prev-line"><i
                                                        class="fz-resume fz-degree"></i>学历：<label id="education9">${resume.education.education}</label></span></p>
                                                <p><span class="prev-line"><i
                                                        class="fz-resume fz-status"></i>性别：<label id="sex9">${resume.sex}</label></span><span class="prev-line"><i
                                                        class="fz-resume fz-status"></i>专业：<label id="profession9">${resume.profession}</label></span><span class="prev-line"><i
                                                        class="fz-resume fz-experience"></i>毕业学校：<label id="school9">${resume.school}</label></span><span
                                                        class="prev-line"><i
                                                        class="fz-resume fz-experience"></i>出生日期：<label id="birthday9">${resume.birthday}</label></span>
                                                    <!---->
                                                    <!---->
                                                </p>
                                                <p><span class="prev-line"><i
                                                        class="fz-resume fz-tel"></i>求职状态：<label id="jobStandId9">${resume.parameter.paramName}</label></span>
                                                    <span class="prev-line"><i
                                                            class="fz-resume fz-tel"></i>意向行业：<label id="industry9">${resume.industry}</label></span>
<%--                                                    <span class="prev-line"><i--%>
<%--                                                            class="fz-resume fz-tel"></i>工作年限：<label id="wrokYear9">${resume.wrokYear}年</label></span>--%>
                                                </p>
                                                <p><span class="prev-line"><i
                                                        class="fz-resume fz-tel"></i>联系方式：<label id="contactInfo9">${resume.contactInfo}</label></span>
                                                    <!---->
                                                    <!---->
                                                </p>
                                                <p><span class="prev-line"><i
                                                        class="fz-resume fz-place"></i>现居住地：<label id="address9">${resume.address}</label></span>
                                                    <!---->
                                                    <!---->
                                                </p>
                                            </div>
                                        </div>
                                        <div class="info-flex-item header-upload">
                                            <div class="header-box">
                                                <form class="" id="form"
                                                      method="post"
                                                      enctype="multipart/form-data"
                                                      accept-charset="UTF-8">
                                                <div class="header-mask"></div><img id="headImg"
                                                                                    src="${pageContext.request.contextPath}${resume.photo}"
                                                                                    class="header-img">
                                                <input type="file" onchange="selectFile()" name="imgFile" id="imgFile" class="head-input"
                                                       accept="image/*" />
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="op"><a data-url="/geek/user/info.json" href="javascript:;"
                                                       ka="user-resume-edit-userinfo" class="link-edit"><svg class="icon-svg">
                                        <use xlink:href="#icon-svg-edit"></use>
                                    </svg><span onclick="userInfoUpdate(${resume.educationId})">编辑</span></a></div>
                                    <div class="resume-cropper-upload"><input type="file" accept=""
                                                                              class="upload-input">
                                        <div class="custom-box">
                                            <div></div>
                                        </div>
                                        <div class="cropper-win" style="display: none;">
                                            <div class="custom-cropper-box">
                                                <div class="vue-cropper">
                                                    <div class="cropper-box">
                                                        <div class="cropper-box-canvas"
                                                             style="width: 0px; height: 0px; transform: scale(1, 1) translate3d(0px, 0px, 0px) rotateZ(0deg); display: none;">
                                                            <img src="" alt="cropper-img"></div>
                                                    </div>
                                                    <div class="cropper-drag-box cropper-move"></div>
                                                    <div class="cropper-crop-box"
                                                         style="width: 0px; height: 0px; transform: translate3d(0px, 0px, 0px); display: none;">
                                                        <span class="cropper-view-box"><img src="" alt="cropper-img"
                                                                                            style="width: 0px; height: 0px; transform: scale(1, 1) translate3d(0px, 0px, 0px) rotateZ(0deg);"></span><span
                                                            class="cropper-face cropper-move"></span><span
                                                            class="crop-info" style="top: 0px;">0 × 0</span><span><span
                                                            class="crop-line line-w"></span><span
                                                            class="crop-line line-a"></span><span
                                                            class="crop-line line-s"></span><span
                                                            class="crop-line line-d"></span><span
                                                            class="crop-point point1"></span><span
                                                            class="crop-point point2"></span><span
                                                            class="crop-point point3"></span><span
                                                            class="crop-point point4"></span><span
                                                            class="crop-point point5"></span><span
                                                            class="crop-point point6"></span><span
                                                            class="crop-point point7"></span><span
                                                            class="crop-point point8"></span></span></div>
                                                </div>
                                            </div>
                                            <div class="btns-box"><button type="button"
                                                                          class="btn btn-primary">确定</button><button type="button"
                                                                                                                     class="btn">取消</button></div>
                                        </div>
                                    </div>
                                </div>
<%--                                </c:set>--%>
<%--                        </c:if>--%>

                            <div id="userinfo-update" class="item-form display-hide">
                                <h3 class="title">编辑个人信息</h3>
                                <form class="layui-form" id="userInfoUpdate">
                                    <input type="hidden" value="${resume.resumeId}" id="resumeIdUpdate" name="resumeId">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label" style="width: 100px" >姓名</label>
                                        <div class="layui-input-inline" >
                                            <input type="text" id="realName" name="realName" required  lay-verify="required" placeholder="请输入姓名" maxlength="20" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"        autocomplete="off" class="layui-input" value="${resume.realName}">
                                        </div>
                                        <label class="layui-form-label" style="width: 100px">民族</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="clan" name="clan" required  lay-verify="required" placeholder="请输入民族"  maxlength="4" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')" autocomplete="off" class="layui-input" value="${resume.clan}">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label" style="width: 100px">政治面貌</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="politicalStatus" name="politicalStatus" required  lay-verify="required" placeholder="请输入政治面貌" maxlength="15" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')" autocomplete="off" class="layui-input" value="${resume.politicalStatus}">
                                        </div>
                                        <label class="layui-form-label" style="width: 100px">联系方式</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="contactInfo" name="contactInfo" maxlength="11"  onkeyup="this.value=this.value.replace(/\D/g,'')"   required  lay-verify="required" placeholder="请输入联系方式" autocomplete="off" class="layui-input" value="${resume.contactInfo}">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">性别：</label>
                                        <div class="layui-input-inline">
                                            <input type="radio" name="sex" value="男" title="男"  <c:if test="${resume.sex=='男'}">checked</c:if>>
                                            <input type="radio" name="sex" value="女" title="女" <c:if test="${resume.sex=='女'}">checked</c:if>>
                                        </div>
                                        <label class="layui-form-label" style="width: 100px">工作年限</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="wrokYear" name="wrokYear" required  lay-verify="required" maxlength="2" oninput="if(value>40)value=40" onkeyup="this.value=this.value.replace(/\D/g,'')"  placeholder="请输入年限，不超过40" autocomplete="off" class="layui-input" value="${resume.wrokYear}">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <div class="layui-inline">
                                            <label class="layui-form-label" style="width: 100px">出生日期</label>
                                            <div class="layui-input-inline">
                                                <input type="text" class="layui-input" name="birthday" id="birthday" placeholder="yyyy-MM-dd" value="${resume.birthday}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label" style="width: 12%">就业状态</label>
                                        <div class="layui-input-block" style="width: 12%">
                                            <select class="educationId" id="jobStandId" name="jobStandId" lay-filter="aihao" >

                                                <option value="4" <c:if test="${resume.jobStandId==4}">selected </c:if>
                                                >已就业</option>

                                                <option value="5" <c:if test="${resume.jobStandId==5}">selected</c:if>
                                                >未就业</option>
                                                <option value="13" <c:if test="${resume.jobStandId==13}"> selected</c:if>
                                                >在职月内到岗</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label" style="width: 12%"   >意向行业</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="industry" name="industry" required maxlength="10" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')"  lay-verify="required"  placeholder="请输入意向行业" autocomplete="off" class="layui-input" value="${resume.industry}">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label" style="width: 12%">学历</label>
                                        <div class="layui-input-block" style="width: 12%">
                                            <select class="educationId" id="educationId" name="educationId" lay-filter="aihao" >

<%--                                                <option value="0" <c:if test="${resume.educationId==0}">selected </c:if>--%>
<%--                                                >学历选择</option>--%>
                                                <option value="1"
                                                        <c:if test="${resume.educationId==1}"> selected</c:if>
                                                >高中</option>
                                                <option value="2" <c:if test="${resume.educationId==2}">selected</c:if>
                                                >大专</option>
                                                <option value="3" <c:if test="${resume.educationId==3}"> selected</c:if>
                                                >本科</option>
                                                <option value="4" <c:if test="${resume.educationId==4}">selected </c:if>
                                                >硕士</option>
                                                <option value="5" <c:if test="${resume.educationId==5}">selected </c:if>
                                                >博士</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label" style="width: 12%">专业</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="profession" name="profession" required maxlength="15"  onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" lay-verify="required" placeholder="请输入专业" autocomplete="off" class="layui-input" value="${resume.profession}">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label" style="width: 100px" maxlength="15"  onkeyup="this.value=this.value.replace(/^ +| +$/g,'')">毕业学校</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="school" name="school" required  maxlength="15"  onkeyup="this.value=this.value.replace(/^ +| +$/g,'')"  lay-verify="required" placeholder="请输入毕业学校" autocomplete="off" class="layui-input" value="${resume.school}">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label" style="width: 12%">居住地址</label>
                                        <div class="layui-input-block">
                                            <input type="text"  id="address" name="address" required maxlength="30"  onkeyup="this.value=this.value.replace(/^ +| +$/g,'')"   lay-verify="required" placeholder="请输入现居住地址" autocomplete="off" class="layui-input" value="${resume.address}">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <div class="layui-input-block">
                                            <input type="button" value="保存" onclick="userInfoSave()" class="layui-btn">
                                            <input type="button" value="取消" onclick="userInfoQuit()" class="layui-btn">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div id="summary" class="resume-item resume-summary">
                            <div class="item-primary advantage-show">
                                <h3 class="title"> 个人优势
                                </h3>
                                <ul>
                                    <li ka="user-resume-edit-advantage" class="">
                                        <div class="primary-info">
                                            <div class="info-text advantage-text" style="white-space: normal;">
                                                <p><label id="selfEva9"  >${resume.selfEva}</label></p>
                                            </div>
                                        </div>
                                        <div class="op op-show">
                                            <!----><a href="javascript:;" ka="user-resume-edit-advantage"
                                                      class="link-edit"><svg class="icon-svg">
                                            <use xlink:href="#icon-svg-edit"></use>
                                        </svg><span onclick="summaryUpdate()">编辑</span></a></div>
                                    </li>
                                </ul>
                            </div>
                            <!---->
                        </div>
                        <div id="summary-update" class="item-form display-hide">
                            <h3 class="title">编辑个人优势</h3>
                            <form autocomplete="off" class="ui-form ui-form-label-top">
                                <div class="form-item form-item-required">
<%--                                    <div class="item-label">自我评价描述</div>--%>
                                    <div class="item-content">
                                        <div class="input-wrap input-wrap-text input-group input-group-with-append input-hide-icon"
                                             ka="resume_form_edit_name">
                                            <!---->
<%--                                            <!----><input autocomplete="on" spellcheck="false" type="text"--%>
<%--                                                          placeholder="输入内容" maxlength="44" class="input">--%>
                                            <textarea   onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" maxlength="100"  autocomplete="on" spellcheck="false" class="input" style="height: 8%"
                                                      placeholder="输入内容" id="selfEva" name="selfEva" >${resume.selfEva}</textarea>
                                        </div>
                                        <!---->
                                        <!---->
                                    </div>
                                </div>
                                <!---->
                                <div class="form-btns form-btn-normal"><button type="button"
                                                                               ka="resume_form_baseinfo_cancel"
                                                                               class="btn btn-outline"
                                                                               onclick="summaryQuit()">取消</button><button type="submit"
                                                                                                                       ka="resume_form_baseinfo_ok" class="btn btn-primary"
                                                                                                                       onclick="summarySave()">
                                    <!---->完成 </button></div>
                            </form>
                        </div>





                        <div id="purpose" class="resume-item resume-purpose">
                            <div class="item-primary">
                                <h3 class="title"> 期望职位
                                </h3>
                                <ul>
                                    <li ka="user-resume-edit-expectation0" class="">
                                        <div class="primary-info">
                                            <div class="info-labels"><span class="prev-line"><span
                                                    class="label-text"><i class="fz-resume fz-job"></i>
                                                <label id="expectWork9" title="${resume.expectWork}">${resume.expectWork}</label>
                                            </span></span></div>
                                        </div>
                                        <div class="op op-show">
                                            <!----><a href="javascript:;" ka="user-resume-edit-expectation0"
                                                      class="link-edit"><svg class="icon-svg">
                                            <use xlink:href="#icon-svg-edit"></use>
                                        </svg><span onclick="workUpdate()">编辑</span></a></div>
                                    </li>
                                </ul>
                            </div>
                            <!---->
                        </div>


                        <div id="purpose-update" class="item-form display-hide">
                            <h3 class="title">编辑期望工作</h3>
                            <form autocomplete="off" class="ui-form ui-form-label-top">
                                <div class="form-item form-item-required">
                                    <div class="item-label">期望工作描述</div>
                                    <div class="item-content">
                                        <div class="input-wrap input-wrap-text input-group input-group-with-append input-hide-icon"
                                               ka="resume_form_edit_name">
                                            <textarea  onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" autocomplete="on" spellcheck="false" class="input" style="height: 5%"
                                                      placeholder="输入内容" maxlength="50"
                                                      id="expectWork" name="expectWork" >${resume.expectWork}</textarea>
                                        </div>
                                        <!---->
                                        <!---->
                                    </div>
                                </div>
                                <!---->
                                <div class="form-btns form-btn-normal"><button type="button"
                                                                               ka="resume_form_baseinfo_cancel"
                                                                               class="btn btn-outline"
                                                                               onclick="workQuit()">取消</button><button type="submit"
                                                                                                                                   ka="resume_form_baseinfo_ok" class="btn btn-primary"
                                                                                                                                   onclick="workSave()">
                                    <!---->完成 </button></div>
                            </form>
                        </div>



                        <div id="history" class="resume-item resume-history">
                            <div class="item-primary">
                                <h3 class="title"> 工作经历 <a href="javascript:;" ka="user-resume-add-workexp"
                                                           class="link-add"><svg class="icon-svg">
                                    <use xlink:href="#icon-svg-add"></use>
                                </svg>
                                    <c:if test="${fn:length(resume.workExperiences)<2}">
                                        <span onclick="historyInsert()">添加</span>
                                    </c:if>
                                    </a>
                                    </h3>

                                <c:if test="${not empty resume.workExperiences}">
                                    <c:forEach var="works" items="${resume.workExperiences}">

                                        <div id="works${works.weId}">

                                        <ul>
                                            <li ka="user-resume-edit-workexp3" class="">
                                                <div class="primary-info">
                                                    <!---->
                                                    <div class="info-text">
                                                        <h4 class="name">公司：<label id="companyName9">${works.companyName}</label></h4><span
                                                            class="gray period">项目时间：<label id="beginTime9">${works.beginTime}</label>--<label id="endTime9">${works.endTime}</label></span>
                                                    </div>
                                                    <h4><span class="prev-line">行业：<label id="companyTrade9">${works.companyTrade}</label></span><span
                                                            class="prev-line">担任角色：<label id="companyPost9"> ${works.companyPost}</label></span></h4>
                                                    <div class="info-text" style="white-space: normal"><span
                                                            class="text-type">内容：</span>
                                                        <label id="duties9"> ${works.duties}</label></div>
                                                    <div class="info-text"><span class="text-type">业绩：</span><label id="performance9">${works.performance}</label> </div>
<%--                                                    <div class="keywords"><span>java--%>
<%--                                                        web</span><span>Java</span><span>jsp</span></div>--%>
                                                </div>
                                                <div class="op"><a href="javascript:;" ka="user-resume-del-workexp3"
                                                                   class="link-delete"><svg class="icon-svg">
                                                    <use xlink:href="#icon-svg-delete"></use>
                                                </svg>
                                                    <c:if test="${fn:length(resume.workExperiences)==2}">
                                                    <span onclick="historyDelete(${works.weId})">删除</span></a><a href="javascript:;"
                                                                            ka="user-resume-edit-workexp3" class="link-edit"><svg
                                                        class="icon-svg">
                                                    <use xlink:href="#icon-svg-edit"></use>
                                                </svg></c:if><span onclick="historyUpdate(${works.weId})">编辑</span></a></div>
                                            </li>
                                        </ul>
                                        </div>
                                    </c:forEach>
                                </c:if>

                            </div>
                            <!---->
                        </div>

                        <div id="history-update" class="item-form display-hide">
                            <h3 class="title">编辑工作经历</h3>
                            <form class="layui-form" id="workInsert">
                                <input type="hidden" id="weId" name="weId" >
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 12%">公司</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="companyName" name="companyName" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" maxlength="18"  required  lay-verify="required" placeholder="请输入公司名称" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 12%">行业</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="companyTrade" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" name="companyTrade" maxlength="18"  required  lay-verify="required" placeholder="请输入公司行业" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 12%">职位</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="companyPost" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" maxlength="8" name="companyPost" required  lay-verify="required" placeholder="请输入担任职务" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label" style="width: 100px">在职时间</label>
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" lay-verify="date" id="beginTime" name="beginTime" placeholder="yyyy-MM-dd">
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">至</label>
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" lay-verify="date" name="endTime" id="endTime" placeholder="yyyy-MM-dd">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label" style="width: 12%">工作内容</label>
                                    <div class="layui-input-block">
                                        <textarea name="duties" id="duties" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" maxlength="100" placeholder="请输入内容" class="layui-textarea" style="width: 50%"></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label" style="width: 12%">工作业绩</label>
                                    <div class="layui-input-block">
                                        <textarea name="performance" id="performance" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" maxlength="100" placeholder="请输入内容" class="layui-textarea" style="width: 50%"></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item">
<%--                                    <div class="layui-input-inline">--%>
                                        <input type="button" value="保存" id="historySave" onclick="historySave2()" class="layui-btn">
                                        <input type="button" value="提交" id="historyCommit" onclick="historyCommit2()" class="layui-btn">
                                        <input type="button" value="取消" onclick="historyQuit()" class="layui-btn">
<%--                                    </div>--%>
                                </div>
                            </form>
                        </div>



                        <div id="project" class="resume-item resume-project">
                            <div class="item-primary">
                                <h3 class="title"> 项目经历 <a href="javascript:;" ka="user-resume-add-project"
                                                           class="link-add"><svg class="icon-svg">
                                    <use xlink:href="#icon-svg-add"></use>
                                </svg>
                                    <c:if test="${fn:length(resume.projectExperiences)<2}">
                                    <span onclick="projectInsert()">添加</span>
                                    </c:if></a></h3>
                                <c:if test="${not empty resume.projectExperiences}">
                                    <c:forEach var="projects" items="${resume.projectExperiences}">
                                        <form id="projects${projects.peId}">
                                        <ul>
                                            <li ka="user-resume-edit-project2" class="">
                                                <div class="primary-info">
                                                    <!---->
                                                    <div class="info-text">
                                                        <h4 class="name">项目名称：<label id="proName9">${projects.proName}</label> </h4><span
                                                            class="gray period">项目时间：<label id="proBeginTime9">${projects.proBeginTime}</label> --<label id="proEndTime9">${projects.proEndTime}</label> </span>
                                                    </div>
                                                    <div class="info-text">
                                                        <h4><span class="prev-line">担任职位：<label id="proPost9">${projects.proPost}</label> </span></h4>
                                                    </div>
                                                    <div class="info-text"><span
                                                            class="text-type">内容：</span><label id="proDescription9">${projects.proDescription}</label>
                                                    </div>
                                                    <div class="info-text"><span
                                                            class="text-type">业绩：</span><label id="proPerformance9">${projects.proPerformance}</label> </div>
                                                    <!---->
                                                </div>
                                                <div class="op"><a href="javascript:;" ka="user-resume-del-project2"
                                                                   class="link-delete"><svg class="icon-svg">
                                                    <use xlink:href="#icon-svg-delete"></use>
                                                </svg>
                                                    <c:if test="${fn:length(resume.projectExperiences)==2}">
                                                    <span onclick="projectDelete(${projects.peId})">删除</span></a><a href="javascript:;"
                                                                            ka="user-resume-edit-project2" class="link-edit"><svg
                                                        class="icon-svg">
                                                    <use xlink:href="#icon-svg-edit"></use>
                                                </svg></c:if><span onclick="projectUpdate(${projects.peId})" >编辑</span></a></div>
                                            </li>
                                        </ul>
                                        </form>
                                    </c:forEach>
                                </c:if>

                            </div>
                            <!---->
                        </div>

                        <div id="project-update" class="item-form display-hide">
                            <h3 class="title">编辑项目经历</h3>
                            <form class="layui-form" id="projectInsert">
                                <input type="hidden" id="peId" name="peId" >
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 12%">项目名称</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="proName" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" maxlength="18" name="proName" required  lay-verify="required" placeholder="请输入项目名称" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 12%">担任职务</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="proPost" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" maxlength="18" name="proPost" required  lay-verify="required" placeholder="请输入担任职务" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label" style="width: 100px">项目时间</label>
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" name="proBeginTime" id="proBeginTime" placeholder="yyyy-MM-dd">
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">至</label>
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" name="proEndTime" id="proEndTime" placeholder="yyyy-MM-dd">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label" style="width: 12%">项目描述</label>
                                    <div class="layui-input-block">
                                        <textarea id="proDescription" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" maxlength="100" name="proDescription" placeholder="请输入内容" class="layui-textarea" style="width: 50%"></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label" style="width: 12%">项目业绩</label>
                                    <div class="layui-input-block">
                                        <textarea id="proPerformance" maxlength="100" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" name="proPerformance" placeholder="请输入内容" class="layui-textarea" style="width: 50%"></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <input type="button" value="保存" id="projectSave" onclick="projectSave2()" class="layui-btn">
                                        <input type="button" value="提交" id="projectCommit" onclick="projectCommit2()" class="layui-btn">
                                        <input type="button" value="取消" onclick="projectQuit()" class="layui-btn">
                                    </div>
                                </div>
                            </form>
                        </div>



                        <div id="education" class="resume-item resume-education">
                            <div class="item-primary">
                                <h3 class="title"> 教育经历 <a href="javascript:;" ka="user-resume-add-eduexp"
                                                           class="link-add"><svg class="icon-svg">
                                    <use xlink:href="#icon-svg-add"></use>
                                </svg>
                                    <c:if test="${fn:length(resume.educationalBackgrounds)<2}">
                                    <span onclick="educationtInsert()">添加</span>
                                    </c:if></a></h3>
                                <c:if test="${not empty resume.educationalBackgrounds}">
                                    <c:forEach var="educationalBackgrounds" items="${resume.educationalBackgrounds}">
                                        <form id="educationalBackgrounds${educationalBackgrounds.ebId}">
                                        <ul>
                                            <li ka="user-resume-edit-eduexp0" class="">
                                                <div class="primary-info">
                                                    <!---->

                                                    <div class="info-text">
                                                        <h4 class="name">学校：<label id="ebSchool9">${educationalBackgrounds.ebSchool}</label></h4><span
                                                            class="gray period">在校时间：<label id="schBeginTime9">${educationalBackgrounds.schBeginTime}</label>--<label id="schEndTime9">${educationalBackgrounds.schEndTime}</label></span>
                                                    </div>

                                                    <div class="info-text">
                                                        <h4><span class="prev-line">专业：<label id="major9">${educationalBackgrounds.major}</label> </span><span
                                                                class="prev-line">学历：<label id="ebEducation9">${educationalBackgrounds.ebEducation}</label>
                                                            <!----></span></h4>
                                                    </div>
                                                    <div class="info-text">
                                                        <h4><span class="prev-line">在校经历：<label id="schExperience9">${educationalBackgrounds.schExperience}</label> </span></h4>
                                                    </div>
                                                    <!---->
                                                </div>
                                                <div class="op"><a href="javascript:;" ka="user-resume-del-project2"
                                                                   class="link-delete"><svg class="icon-svg">
                                                    <use xlink:href="#icon-svg-delete"></use>
                                                </svg>
                                                    <c:if test="${fn:length(resume.educationalBackgrounds)==2}">
                                                    <span onclick="educationDelete(${educationalBackgrounds.ebId})">删除</span></a>
                                                    <!----><a href="javascript:;" ka="user-resume-edit-eduexp0"
                                                              class="link-edit"><svg class="icon-svg">
                                                    <use xlink:href="#icon-svg-edit"></use>
                                                </svg></c:if>
                                                        <span onclick="educationtUpdate(${educationalBackgrounds.ebId})">编辑</span></a></div>
                                            </li>
                                        </ul>
                                        </form>
                                    </c:forEach>
                                </c:if>

                            </div>
                            <!---->
                        </div>

                        <div id="education-update" class="item-form display-hide">
                            <h3 class="title">编辑教育背景</h3>
                            <form class="layui-form" id="educationInsert">
                                <input type="hidden" id="ebId" name="ebId" >
                                <div class="layui-form-item">
                                    <label class="layui-form-label"  style="width: 12%">学校</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="ebSchool" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" maxlength="18" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"  name="ebSchool" required  lay-verify="required" placeholder="请输入学校名称" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label"  style="width: 12%">学历</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="ebEducation" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" maxlength="8" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')" name="ebEducation" required  lay-verify="required" placeholder="请输入学历" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label"  style="width: 12%">专业</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="major" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" maxlength="10" name="major" required  lay-verify="required" placeholder="请输入所学专业" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label" style="width: 100px">学习时间</label>
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" name="schBeginTime" id="schBeginTime" placeholder="yyyy-MM-dd">
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">至</label>
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" name="schEndTime" id="schEndTime" placeholder="yyyy-MM-dd">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label" style="width: 12%">在校经历</label>
                                    <div class="layui-input-block">
                                        <textarea id="schExperience" maxlength="100" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" name="schExperience" placeholder="请输入内容" class="layui-textarea" style="width: 50%"></textarea>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <input type="button" value="保存" id="educationSave" onclick="educationSave2()" class="layui-btn">
                                        <input type="button" value="提交" id="educationCommit" onclick="educationCommit2()" class="layui-btn">
                                        <input type="button" value="取消" onclick="educationQuit()" class="layui-btn">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div id="work-display1" class="resume-item resume-work-display">
                            <!---->
                            <!---->
                        </div>
                        <div id="work-display2" class="resume-item resume-work-display">
                            <!---->
                            <!---->
                        </div>
                        <div id="work-display3" class="resume-item resume-work-display">
                            <!---->
                            <!---->
                        </div>
                    </div>
                </div>
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
        </div>
    </div>
    <div>
        <div id="footer" style="min-height: 120px;">
            <div class="inner home-inner">
                <div class="links links-friends">
                    <dl class="links-item">
                        <dt>友情链接：</dt>
                        <dd>
                            <a href="http://lieyunwang.com/" target="_blank">猎云网</a> <span>|</span>
                            <a href="http://www.chuanke.com/" target="_blank">传课网</a> <span>|</span>
                            <a href="http://se.360.cn/" target="_blank">360安全浏览器</a> <span>|</span>
                            <a href="http://www.zhongchou.cn" target="_blank">众筹网</a><span>|</span>
                            <a href="http://www.zhubajie.com/" target="_blank">创意服务外包</a><span>|</span>
                            <a href="http://www.thinkphp.cn/" target="_blank">thinkphp</a><span>|</span>
                            <a href="http://www.meitu.com/" target="_blank">美图公司</a><span>|</span>
                            <a href="http://iwebad.com/" target="_blank">网络广告人社区</a>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>

    </div>
</div>
</div>

<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });

        //表单赋值
        layui.$('#LAY-component-form-setval').on('click', function(){
            form.val('example', {
                "username": "贤心" // "name": "value"
                ,"password": "123456"
                ,"interest": 1
                ,"like[write]": true //复选框选中状态
                ,"close": true //开关状态
                ,"sex": "女"
                ,"desc": "我爱 layui"
            });
        });

        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>

<%--<script>--%>
<%--    //Demo--%>
<%--    layui.use('form', function(){--%>
<%--        var form = layui.form;--%>

<%--        //监听提交--%>
<%--        // form.on('submit(formDemo)', function(data){--%>
<%--        //     layer.msg(JSON.stringify(data.field));--%>
<%--        //     return false;--%>
<%--        // });--%>
<%--    });--%>
<%--</script>--%>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //常规用法
        laydate.render({
            elem: '#beginTime',
        });
        laydate.render({
            elem: '#proBeginTime',
        });
        laydate.render({
            elem: '#proEndTime',
        });
        laydate.render({
            elem: '#endTime',
        });
        laydate.render({
            elem: '#schBeginTime',
        });
        laydate.render({
            elem: '#schEndTime',
        });
        laydate.render({
            elem: '#birthday',
        });

    });
</script>


<script>
    var path=$('#path').val();
    //基本信息
    var resumeId=$('#resumeId').val();
    var name;
    var statu;
    var clan;
    var info;
    var day;
    var id;
    var sion;
    var school;
    var address;
    var sex;
    var industry;
    var jobStand;
    var educationId;
    var jobStandId;
    // 个人优势
    var selfEva;
    // 期望工作
    var expectWork;
    // 工作经历
    var worksid;
    var companyName;
    var companyTrade;
    var companyPost;
    var beginTime;
    var endTime;
    var duties;
    var performance;
    // 项目经历
    var projects;
    var proName;
    var proPost;
    var proBeginTime;
    var proEndTime;
    var proDescription;
    var proPerformance;

    // 教育背景
    var educationsid;
    var ebSchool;
    var major;
    var ebEducation;
    var schBeginTime;
    var schEndTime;
    var schExperience;

    var kong=$('#kong').val()

    Date.prototype.format = function(fmt){
        var o = {
            "M+" : this.getMonth()+1,                 //月份
            "d+" : this.getDate(),                    //日
            "h+" : this.getHours(),                   //小时
            "m+" : this.getMinutes(),                 //分
            "s+" : this.getSeconds(),                 //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S"  : this.getMilliseconds()             //毫秒
        };

        if(/(y+)/.test(fmt)){
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        }

        for(var k in o){
            if(new RegExp("("+ k +")").test(fmt)){
                fmt = fmt.replace(
                    RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
            }
        }

        return fmt;
    }

    function selectFile() {

        var fm=new FormData(document.getElementById("form"))
        $.ajax({
            url: 'photoUpdate',
            charset:"UTF-8",
            async: "true",
            type: "post",
            data: fm,
            processData:false,
            contentType:false,
            dataType: "text",
            success: function (data) {
                // if (data == "succes") {
                //     //向服务端发送删除指令
                //     // layer.msg('修改成功')
                //
                // } else if (data == "lose") {
                //     layer.msg("修改失败")
                // }
                document.getElementById('topImg').src=path+data;
            },
            error: function () {
                layer.msg('网络繁忙')
            }
        })

        let files = event.target.files;
        if (files.length === 0) return false;
        let reader = new FileReader();
        reader.readAsDataURL(files[0]);
        reader.onloadend = () => {
            $("#headImg").attr("src", reader.result)
        }

    }
    // 基础信息
    function userInfoUpdate(educationid) {
        // document.getElementById('ooo').style.textOverflow
        // $('#ooo').remo
        name=$('#realName').val()
        clan=$('#clan').val()
        statu=$('#politicalStatus').val()
        info=$('#contactInfo').val()
        day=$('#birthday').val()
        id=$('#educationId').val()
        sion=$('#profession').val()
        school=$('#school').val()
        address=$('#address').val()
        industry=$('#industry').val();
        // sex=$("input[name='sex']:checked").val();
        sex=$("input[name='sex']:checked").val();
        console.log(sex+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11")
        jobStand=$('#jobStandId').val();
        educationId=$('#edId').val();
        jobStandId=$('#jobId').val();
        wrokyear=$('#wrokyear').val();
        // $("#educationId").find("option[text='1']").attr("selected",true);
        // $(".sex").find("input[value='男']").attr("checked",true);


        $("#userinfo-show").hide()
        $("#userinfo-update").show()

        // console.log(educationid)
        // $('#education1').val(educationid);

    }
    function userInfoSave(resumeId) {
        if (!contactInfoTest()&&$('#contactInfo').val()!=""){
            layer.msg('联系方式填写错误')
            return;
        }
        event.preventDefault()
        var information=new FormData(document.getElementById("userInfoUpdate"))
        var time=new Date().format("yyyy-MM-dd  hh:mm:ss");
        if ($('#wrokYear').val()==""){
            console.log("*******88888888888888")
            $('#wrokYear').val(0)
        }
        var information=new FormData(document.getElementById("userInfoUpdate"))
        console.log(time)
        // var resumeId=resumeId;
        $.ajax({
            url: 'userInfoUpdate?time='+time,
            charset:"UTF-8",
            async: "true",
            type: "post",
            data: information,
            processData:false,
            contentType:false,
            dataType: "text",
            success: function (data) {
                if (data == "succes") {
                    //向服务端发送删除指令
                    layer.msg('修改成功')


                    $('#realName9').text($('#realName').val())
                    $('#clan9').text($('#clan').val())
                    $('#politicalStatus9').text($('#politicalStatus').val())
                    $('#contactInfo9').text($('#contactInfo').val())
                    $('#birthday9').text($('#birthday').val())
                    $('#education9').text($("#educationId").find("option:selected").text())
                    $('#profession9').text($('#profession').val())
                    $('#school9').text($('#school').val())
                    $('#address9').text($('#address').val())
                    $('#updateTime9').text(time)
                    $('#sex9').text($("input[name='sex']:checked").val())
                    $('#industry9').text($('#industry').val())
                    $('#wrokYear9').text($('#wrokYear').val())
                    $('#jobStandId9').text($('#jobStandId').find("option:selected").text())
                    // location.href = path+"/jsp/user.jsp";
                } else if (data == "lose") {
                    layer.msg("修改失败")
                }
            },
            error: function () {
                layer.msg('网络繁忙')
            }
        })

        $("#userinfo-show").show()
        $("#userinfo-update").hide()


    }
    function userInfoQuit() {
        event.preventDefault()
        $("#userinfo-show").show()
        console.log(clan+"???"+name)

        $('#realName').val(name)
        $('#clan').val(clan)
        $('#politicalStatus').val(statu)
        $('#contactInfo').val(info)
        $('#birthday').val(day)
        $('#educationId').val(educationId)
        $('#jobStandId').val(jobStandId)
        $('#profession').val(sion)
        $('#school').val(school)
        $('#address').val(address)
        $('#wrokYear').val(wrokyear)
        $('#industry').val(industry)
        var radio=document.getElementsByName('sex');
        console.log(sex+"???????????????????????????/")
        for (var i=0;i<radio.length;i++){
            if (radio[i].value==sex){
                radio[i].checked=true;
                console.log(radio[i].value+"99999999999999")
                break;
            }
        }
        // $('.sex').val(sex)
        console.log($('#educationId').val())
        layui.form.render('select')
        layui.form.render('radio')
        $("#userinfo-update").hide()

    }
    // 期望工作
    function workUpdate() {
        $("#purpose").hide()
        $("#purpose-update").show()
        expectWork=$('#expectWork9').text();
    }
    function workSave() {
        expectWork=$('#expectWork').val();
        var information=new FormData(document.getElementById("userInfoUpdate"))
        var time=new Date().format("yyyy-MM-dd  hh:mm:ss");
        // $('#expectWork').text(expectWork)
        $.ajax({
            url: 'expectWorkUpdate',
            charset:"UTF-8",
            async: "true",
            type: "post",
            data: "expectWork="+expectWork+"&resumeId="+resumeId+'&time='+time,
            // processData:false,
            // contentType:false,
            dataType: "text",
            success: function (data) {
                if (data == "succes") {
                    //向服务端发送删除指令
                    layer.msg('修改成功')
                    $('#expectWork9').text(expectWork)
                    $('#updateTime9').text(time)

                } else if (data == "lose") {
                    layer.msg("修改失败")
                }
            },
            error: function () {
                layer.msg('网络繁忙')
            }
        })
        event.preventDefault()
        $("#purpose").show()
        $("#purpose-update").hide()
    }
    function workQuit() {
        event.preventDefault()
        $("#purpose").show()
        $("#purpose-update").hide()
        $('#expectWork').val(expectWork)
    }
    // 个人优势
    function summaryUpdate() {
        $("#summary").hide()
        $("#summary-update").show()
        selfEva=$('#selfEva9').text();
    }
    function summarySave() {
        selfEva=$('#selfEva').val();
        console.log(resumeId+"??????????")
        var information=new FormData(document.getElementById("userInfoUpdate"))
        var time=new Date().format("yyyy-MM-dd  hh:mm:ss");
        $.ajax({
            url: 'selfEvaUpdate',
            charset:"UTF-8",
            async: "true",
            type: "post",
            data: "selfEva="+selfEva+"&resumeId="+resumeId+'&time='+time,
            // processData:false,
            // contentType:false,
            dataType: "text",
            success: function (data) {
                if (data == "succes") {
                    //向服务端发送删除指令
                    layer.msg('修改成功')
                    $('#selfEva9').text(selfEva)
                    $('#updateTime9').text(time)

                } else if (data == "lose") {
                    layer.msg("修改失败")
                }
            },
            error: function () {
                layer.msg('网络繁忙')
            }
        })


        event.preventDefault()
        $("#summary").show()
        $("#summary-update").hide()
    }
    function summaryQuit() {
        event.preventDefault()
        $("#summary").show()
        $("#summary-update").hide()
        $('#selfEva').val(selfEva)
    }
    // 工作经历
    function historyInsert() {
        document.getElementById('historySave').hidden=true;
        document.getElementById('historyCommit').hidden=false;
        $("#history").hide()
        $("#history-update").show()
        $('#companyName').val(null);
        $('#companyTrade').val(null);
        $('#companyPost').val(null);
        $('#beginTime').val(null);
        $('#endTime').val(null);
        $('#duties').val(null);
        $('#performance').val(null);

    }

    function historyUpdate(weid) {
        document.getElementById('historySave').hidden=false;
        document.getElementById('historyCommit').hidden=true;
        worksid="works"+weid;
        companyName=$('#'+worksid).find('#companyName9').text();
        companyTrade=$('#'+worksid).find('#companyTrade9').text();
        companyPost=$('#'+worksid).find('#companyPost9').text();
        beginTime=$('#'+worksid).find('#beginTime9').text();
        endTime=$('#'+worksid).find('#endTime9').text();
        duties=$('#'+worksid).find('#duties9').text();
        performance=$('#'+worksid).find('#performance9').text();


        $('#weId').val(weid);
        $('#companyName').val(companyName);
        $('#companyTrade').val(companyTrade);
        $('#companyPost').val(companyPost);
        $('#beginTime').val(beginTime);
        $('#endTime').val(endTime);
        $('#duties').val(duties);
        $('#performance').val(performance);

        $("#history").hide()
        $("#history-update").show()
    }
    function historyDelete(weid) {
        console.log(weid+"???????????");
        var information=new FormData(document.getElementById("userInfoUpdate"))
        var time=new Date().format("yyyy-MM-dd  hh:mm:ss");
        $.ajax({
            url: 'historyDelete',
            charset:"UTF-8",
            async: "true",
            type: "post",
            data: "weId="+weid+'&time='+time,
            // processData:false,
            // contentType:false,
            dataType: "text",
            success: function (data) {
                if (data == "succes") {
                    //向服务端发送删除指令
                    layer.msg('删除成功')

                    // $('#updateTime9').text(time)
                    location.reload()
                } else if (data == "lose") {
                    layer.msg("删除失败")
                }
            },
            error: function () {
                layer.msg('网络繁忙')
            }
        })
    }
    function historyCommit2() {
        if ($('#companyName').val().trim()==""||$('#companyTrade').val().trim()==""||$('#performance').val().trim()==""||$('#duties').val().trim()==""||$('#beginTime').val().trim()==""||$('#endTime').val().trim()==""||$('#companyPost').val().trim()==""){
            layer.msg("内容不能为空")
        }else {
            if (new Date($('#beginTime').val()).format("yyyy-MM-dd  hh:mm:ss")<new Date($('#endTime').val()).format("yyyy-MM-dd  hh:mm:ss")&&new Date($('#endTime').val()).format("yyyy-MM-dd  hh:mm:ss")<new Date().format("yyyy-MM-dd  hh:mm:ss")){
                $('#weId').val(0);
                var  workInsert=new FormData(document.getElementById("workInsert"));
                var information=new FormData(document.getElementById("userInfoUpdate"))
                var time=new Date().format("yyyy-MM-dd  hh:mm:ss");
                console.log(workInsert)
                $.ajax({
                    url: 'historyCommit?time='+time,
                    charset:"UTF-8",
                    async: "true",
                    type: "post",
                    data: workInsert,
                    processData:false,
                    contentType:false,
                    dataType: "text",
                    success: function (data) {
                        if (data == "succes") {
                            //向服务端发送删除指令
                            layer.msg('添加成功')
                            location.reload()
                        } else if (data == "lose") {
                            layer.msg("添加失败")
                        }
                    },
                    error: function () {
                        layer.msg('网络繁忙')
                    }
                })
                event.preventDefault()
                $("#history").show()
                $("#history-update").hide()
            }else {
                layer.msg("时间填写有误")
            }
        }

    }
    function historySave2() {
        console.log("!!!!!!!"+new Date($('#beginTime').val()).format("yyyy-MM-dd  hh:mm:ss")+"?????")
        console.log("!!!!!!!"+new Date($('#endTime').val()).format("yyyy-MM-dd  hh:mm:ss")+"?????")
        console.log("!!!!!!!"+$('#endTime').val()+"?????")
        console.log("!!!!!!!"+new Date().format("yyyy-MM-dd  hh:mm:ss")+"?????")
        if ($('#companyName').val().trim()==""||$('#companyTrade').val().trim()==""||$('#performance').val().trim()==""||$('#duties').val().trim()==""||$('#beginTime').val().trim()==""||$('#endTime').val().trim()==""||$('#companyPost').val().trim()==""){
            layer.msg("内容不能为空")
        }else {
            if (new Date($('#beginTime').val()).format("yyyy-MM-dd  hh:mm:ss")<new Date($('#endTime').val()).format("yyyy-MM-dd  hh:mm:ss")&&new Date($('#endTime').val()).format("yyyy-MM-dd  hh:mm:ss")<new Date().format("yyyy-MM-dd  hh:mm:ss")){
                var  workInsert=new FormData(document.getElementById("workInsert"));
                var information=new FormData(document.getElementById("userInfoUpdate"))
                var time=new Date().format("yyyy-MM-dd  hh:mm:ss");
                console.log(workInsert)
                $.ajax({
                    url: 'historySave?time='+time,
                    charset:"UTF-8",
                    async: "true",
                    type: "post",
                    data: workInsert,
                    processData:false,
                    contentType:false,
                    dataType: "text",
                    success: function (data) {
                        if (data == "succes") {
                            //向服务端发送删除指令
                            layer.msg('添加成功')
                            $('#'+worksid).find('#companyName9').text($('#companyName').val());
                            $('#'+worksid).find('#companyTrade9').text($('#companyTrade').val());
                            $('#'+worksid).find('#companyPost9').text($('#companyPost').val());
                            $('#'+worksid).find('#beginTime9').text($('#beginTime').val());
                            $('#'+worksid).find('#endTime9').text($('#endTime').val());
                            $('#'+worksid).find('#duties9').text($('#duties').val());
                            $('#'+worksid).find('#performance9').text($('#performance').val());
                            $('#updateTime9').text(time)
                            // location.reload()
                        } else if (data == "lose") {
                            layer.msg("修改失败")
                        }
                    },
                    error: function () {
                        layer.msg('网络繁忙')
                    }
                })
                event.preventDefault()
                $("#history").show()
                $("#history-update").hide()
            }else {
                layer.msg("时间填写有误")
            }

        }






    }
    function historyQuit() {
        event.preventDefault()
        $("#history").show()
        $("#history-update").hide()

    }
    // 项目经历
    function projectInsert() {
        document.getElementById('projectSave').hidden=true;
        document.getElementById('projectCommit').hidden=false;

        $('#proName').val(null);
        $('#proPost').val(null);
        $('#proBeginTime').val(null);
        $('#proEndTime').val(null);
        $('#proDescription').val(null);
        $('#proPerformance').val(null);
        $("#project").hide()
        $("#project-update").show()
    }
    function projectDelete(peid) {
        var peId=peid;
        console.log(peId+"?????????")
        var information=new FormData(document.getElementById("userInfoUpdate"))
        var time=new Date().format("yyyy-MM-dd  hh:mm:ss");
        $.ajax({
            url: 'projectDelete',
            charset:"UTF-8",
            async: "true",
            type: "post",
            data: "peId="+peId+'&time='+time,
            // processData:false,
            // contentType:false,
            dataType: "text",
            success: function (data) {
                if (data == "succes") {
                    //向服务端发送删除指令
                    layer.msg('删除成功')
                    location.reload()
                } else if (data == "lose") {
                    layer.msg("删除失败")
                }
            },
            error: function () {
                layer.msg('网络繁忙')
            }
        })
    }
    function projectUpdate(peid) {
        document.getElementById('projectSave').hidden=false;
        document.getElementById('projectCommit').hidden=true;
        projects="projects"+peid;
        proName=$('#'+projects).find('#proName9').text();
        proPost=$('#'+projects).find('#proPost9').text();
        proBeginTime=$('#'+projects).find('#proBeginTime9').text();
        proEndTime=$('#'+projects).find('#proEndTime9').text();
        proDescription=$('#'+projects).find('#proDescription9').text();
        proPerformance=$('#'+projects).find('#proPerformance9').text();


        $('#peId').val(peid);
        $('#proName').val(proName);
        $('#proPost').val(proPost);
        $('#proBeginTime').val(proBeginTime);
        $('#proEndTime').val(proEndTime);
        $('#proDescription').val(proDescription);
        $('#proPerformance').val(proPerformance);


        $("#project").hide()
        $("#project-update").show()
    }
    function projectSave2() {
        if ($('#proName').val().trim()==""||$('#proPost').val().trim()==""||$('#proBeginTime').val().trim()==""||$('#proEndTime').val().trim()==""||$('#proDescription').val().trim()==""||$('#proPerformance').val().trim()==""){
            layer.msg("内容不能为空")
        }else {
            if (new Date($('#proBeginTime').val()).format("yyyy-MM-dd  hh:mm:ss")<new Date($('#proEndTime').val()).format("yyyy-MM-dd  hh:mm:ss")&&new Date($('#proEndTime').val()).format("yyyy-MM-dd  hh:mm:ss")<new Date().format("yyyy-MM-dd  hh:mm:ss")){
                var  projectInsert=new FormData(document.getElementById("projectInsert"));
                console.log(workInsert);
                var information=new FormData(document.getElementById("userInfoUpdate"))
                var time=new Date().format("yyyy-MM-dd  hh:mm:ss");
                $.ajax({
                    url: 'projectSave?time='+time,
                    charset:"UTF-8",
                    async: "true",
                    type: "post",
                    data: projectInsert,
                    dataType: "text",
                    processData:false,
                    contentType:false,
                    success: function (data) {
                        if (data == "succes") {
                            //向服务端发送删除指令
                            layer.msg('修改成功')
                            $('#'+projects).find('#proName9').text($('#proName').val());
                            $('#'+projects).find('#proPost9').text($('#proPost').val());
                            $('#'+projects).find('#proBeginTime9').text($('#proBeginTime').val());
                            $('#'+projects).find('#proEndTime9').text($('#proEndTime').val());
                            $('#'+projects).find('#proDescription9').text($('#pproDescription').val());
                            $('#'+projects).find('#proPerformance9').text($('#proPerformance').val());
                            $('#updateTime9').text(time)
                        } else if (data == "lose") {
                            layer.msg("修改失败")
                        }
                    },
                    error: function () {
                        layer.msg('网络繁忙')
                    }
                })


                event.preventDefault()
                $("#project").show()
                $("#project-update").hide()
            }else {
                layer.msg("时间填写有误")
            }
        }

    }
    function projectCommit2() {
        if ($('#proName').val().trim()==""||$('#proPost').val().trim()==""||$('#proBeginTime').val().trim()==""||$('#proEndTime').val().trim()==""||$('#proDescription').val().trim()==""||$('#proPerformance').val().trim()==""){
            layer.msg("内容不能为空")
        }else {
            if (new Date($('#proBeginTime').val()).format("yyyy-MM-dd  hh:mm:ss")<new Date($('#proEndTime').val()).format("yyyy-MM-dd  hh:mm:ss")&&new Date($('#proEndTime').val()).format("yyyy-MM-dd  hh:mm:ss")<new Date().format("yyyy-MM-dd  hh:mm:ss")){
                $('#peId').val(0);
                var  projectInsert=new FormData(document.getElementById("projectInsert"));
                var information=new FormData(document.getElementById("userInfoUpdate"))
                var time=new Date().format("yyyy-MM-dd  hh:mm:ss");
                console.log(workInsert)
                $.ajax({
                    url: 'projectCommit?time='+time,
                    charset:"UTF-8",
                    async: "true",
                    type: "post",
                    data: projectInsert,
                    dataType: "text",
                    processData:false,
                    contentType:false,
                    success: function (data) {
                        if (data == "succes") {
                            //向服务端发送删除指令
                            layer.msg('添加成功')
                            location.reload()
                        } else if (data == "lose") {
                            layer.msg("添加失败")
                        }
                    },
                    error: function () {
                        layer.msg('网络繁忙')
                    }
                })


                event.preventDefault()
                $("#project").show()
                $("#project-update").hide()
            }else {
                layer.msg("时间填写有误")
            }
        }

    }
    function projectQuit() {
        event.preventDefault()
        $("#project").show()
        $("#project-update").hide()
    }
    // 教育背景
    function educationtInsert() {
        document.getElementById('educationSave').hidden=true;
        document.getElementById('educationCommit').hidden=false;

        $('#ebSchool').val(null);
        $('#major').val(null);
        $('#ebEducation').val(null);
        $('#schBeginTime').val(null);
        $('#schEndTime').val(null);
        $('#schExperience').val(null);


        $("#education").hide()
        $("#education-update").show()
    }
    function educationDelete(ebid) {
        console.log(ebid+"?????????")
        var information=new FormData(document.getElementById("userInfoUpdate"))
        var time=new Date().format("yyyy-MM-dd  hh:mm:ss");
        $.ajax({
            url: 'educationDelete',
            charset:"UTF-8",
            async: "true",
            contentType:'application/x-www-form-urlencoded',
            type: "post",
            data: "ebId="+ebid+'&time='+time,
            dataType: "text",
            success: function (data) {
                if (data == "succes") {
                    //向服务端发送删除指令
                    layer.msg('删除成功')
                    location.reload();
                    // location.reload()
                } else if (data == "lose") {
                    layer.msg("删除失败")
                }
            },
            error: function () {
                layer.msg('网络繁忙')
            }
        })
    }
    function educationtUpdate(ebid) {
        document.getElementById('educationSave').hidden=false;
        document.getElementById('educationCommit').hidden=true;
        educationsid="educationalBackgrounds"+ebid;
        ebSchool=$('#'+educationsid).find('#ebSchool9').text();
        major=$('#'+educationsid).find('#major9').text();
        ebEducation=$('#'+educationsid).find('#ebEducation9').text();
        schBeginTime=$('#'+educationsid).find('#schBeginTime9').text();
        schEndTime=$('#'+educationsid).find('#schEndTime9').text();
        schExperience=$('#'+educationsid).find('#schExperience9').text();


        $('#ebId').val(ebid);
        $('#ebSchool').val(ebSchool);
        $('#major').val(major);
        $('#ebEducation').val(ebEducation);
        $('#schBeginTime').val(schBeginTime);
        $('#schEndTime').val(schEndTime);
        $('#schExperience').val(schExperience);


        $("#education").hide()
        $("#education-update").show()
    }
    function educationSave2() {
        if ($('#schEndTime').val().trim()==""||$('#schExperience').val().trim()==""||$('#schBeginTime').val().trim()==""||$('#ebEducation').val().trim()==""||$('#major').val().trim()==""||$('#ebSchool').val().trim()==""){
            layer.msg("内容不能为空")
        }else {
            if (new Date($('#schBeginTime').val()).format("yyyy-MM-dd  hh:mm:ss")<new Date($('#schEndTime').val()).format("yyyy-MM-dd  hh:mm:ss")&&new Date($('#schEndTime').val()).format("yyyy-MM-dd  hh:mm:ss")<new Date().format("yyyy-MM-dd  hh:mm:ss")){
                var  educationInsert=new FormData(document.getElementById("educationInsert"));
                var information=new FormData(document.getElementById("userInfoUpdate"))
                var time=new Date().format("yyyy-MM-dd  hh:mm:ss");
                $.ajax({
                    url: 'educationSave?time='+time,
                    charset:"UTF-8",
                    async: "true",
                    type: "post",
                    data: educationInsert,
                    processData:false,
                    contentType:false,
                    dataType: "text",
                    success: function (data) {
                        if (data == "succes") {
                            //向服务端发送删除指令
                            layer.msg('修改成功')
                            $('#'+educationsid).find('#ebSchool9').text($('#ebSchool').val());
                            $('#'+educationsid).find('#major9').text($('#major').val());
                            $('#'+educationsid).find('#ebEducation9').text($('#ebEducation').val());
                            $('#'+educationsid).find('#schBeginTime9').text($('#schBeginTime').val());
                            $('#'+educationsid).find('#schEndTime9').text($('#schEndTime').val());
                            $('#'+educationsid).find('#schExperience9').text($('#schExperience').val());
                            $('#updateTime9').text(time)
                        } else if (data == "lose") {
                            layer.msg("修改失败")
                        }
                    },
                    error: function () {
                        layer.msg('网络繁忙')
                    }
                })



                event.preventDefault()
                $("#education").show()
                $("#education-update").hide()
            }else {
                layer.msg("时间填写有误")
            }
        }



    }
    function educationCommit2() {
        if ($('#schEndTime').val().trim()==""||$('#schExperience').val().trim()==""||$('#schBeginTime').val().trim()==""||$('#ebEducation').val().trim()==""||$('#major').val().trim()==""||$('#ebSchool').val().trim()==""){
            layer.msg("内容不能为空")
        }else {
            if (new Date($('#schBeginTime').val()).format("yyyy-MM-dd  hh:mm:ss")<new Date($('#schEndTime').val()).format("yyyy-MM-dd  hh:mm:ss")&&new Date($('#schEndTime').val()).format("yyyy-MM-dd  hh:mm:ss")<new Date().format("yyyy-MM-dd  hh:mm:ss")){
                $('#ebId').val(0);
                console.log($('#ebId'))
                var information=new FormData(document.getElementById("userInfoUpdate"))
                var time=new Date().format("yyyy-MM-dd  hh:mm:ss");
                var  educationInsert=new FormData(document.getElementById("educationInsert"));
                $.ajax({
                    url: 'educationCommit?time='+time,
                    charset:"UTF-8",
                    async: "true",
                    type: "post",
                    data: educationInsert,
                    processData:false,
                    contentType:false,
                    dataType: "text",
                    success: function (data) {
                        if (data == "succes") {
                            //向服务端发送删除指令
                            layer.msg('添加成功')
                            location.reload()
                        } else if (data == "lose") {
                            layer.msg("添加失败")
                        }
                    },
                    error: function () {
                        layer.msg('网络繁忙')
                    }
                })


                event.preventDefault()
                $("#education").show()
                $("#education-update").hide()
            }else {
                layer.msg("时间填写有误")
            }
        }

    }
    function educationQuit() {
        event.preventDefault()
        $("#education").show()
        $("#education-update").hide()
    }

    function contactInfoTest(){
        var flag=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/.test($("#contactInfo").val());
        return flag;
    }
</script>
</body>

</html>

