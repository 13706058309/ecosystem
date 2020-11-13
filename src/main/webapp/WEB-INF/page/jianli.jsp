<%--
  Created by IntelliJ IDEA.
  User: WUWX
  Date: 2020/11/10
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>

<body>
<div id="wrap" class="">
    <div id="main" class="inner">
        <div id="container" class="resume-container">
            <div class="resume-content">
                <!---->

                <div class="resume-content-box">
                    <div class="update-time"><a href="javascript:;" ka="user_resume_preview"
                                                class="link-preview">预览简历</a> 最后更新 <label id="updateTime9">${resume.updateTime}</label> </div>
                    <div class="resume-box">
<%--                        <c:if test="${not empty resume}">--%>
<%--                            <c:set value="${resume}" var="resume">--%>


                            <div id="userinfo" class="resume-item resume-userinfo">
                                <div id="userinfo-show" class="item-primary">
                                    <!---->
                                    <div class="info-flex">
                                        <div class="info-flex-item">
                                            <h2 class="name"><label id="realName9"></label>${resume.realName} <svg class="icon-svg">
                                                <use xlink:href="#icon_man"></use>
                                            </svg></h2>
                                            <div class="info-labels">
                                                <p><span class="prev-line"><i
                                                        class="fz-resume fz-experience"></i ><label id="clan9"></label>${resume.clan}族</span><span
                                                        class="prev-line"><i
                                                        class="fz-resume fz-experience"></i><label id="politicalStatus9"></label>政治面貌：${resume.politicalStatus}</span><span
                                                        class="prev-line"><i
                                                        class="fz-resume fz-experience"></i><label id="wrokYear9"></label>工作年限：${resume.wrokYear}年</span><span
                                                        class="prev-line"><i
                                                        class="fz-resume fz-degree"></i><label id="education9"></label>学历：${resume.education.education}</span></p>
                                                <p><span class="prev-line"><i
                                                        class="fz-resume fz-status"></i><label id="profession9">专业：${resume.profession}</label></span><span class="prev-line"><i
                                                        class="fz-resume fz-experience"></i><label id="school9">毕业学校：${resume.school}</label></span><span
                                                        class="prev-line"><i
                                                        class="fz-resume fz-experience"></i><label id="birthday9">出生年月：${resume.birthday}</label></span>
                                                    <!---->
                                                    <!---->
                                                </p>
                                                <p><span class="prev-line"><i
                                                        class="fz-resume fz-tel"></i><label id="contactInfo9">联系方式：${resume.contactInfo}</label></span>
                                                    <!---->
                                                    <!---->
                                                </p>
                                                <p><span class="prev-line"><i
                                                        class="fz-resume fz-place"></i><label id="address9">现居住地：${resume.address}</label></span>
                                                    <!---->
                                                    <!---->
                                                </p>
                                            </div>
                                        </div>
                                        <div class="info-flex-item header-upload">
                                            <div class="header-box">
                                                <div class="header-mask"></div><img id="headImg"
                                                                                    src="https://paimgcdn.baidu.com/2986AD9ACAF1B0B1?src=http%3A%2F%2Fms.bdimg.com%2Fdsp-image%2F3256454903.jpg&rz=urar_2_968_600&v=0"
                                                                                    class="header-img">
                                                <input type="file" onchange="selectFile()" class="head-input"
                                                       accept="image/*" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="op"><a data-url="/geek/user/info.json" href="javascript:;"
                                                       ka="user-resume-edit-userinfo" class="link-edit"><svg class="icon-svg">
                                        <use xlink:href="#icon-svg-edit"></use>
                                    </svg><span onclick="userInfoUpdate()">编辑</span></a></div>
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
                                <form class="layui-form">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label" style="width: 100px">姓名</label>
                                        <div class="layui-input-inline" >
                                            <input type="text" id="realName" name="realName" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                                        </div>
                                        <label class="layui-form-label" style="width: 100px">民族</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="chan" name="chan" required  lay-verify="required" placeholder="请输入民族" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label" style="width: 100px">政治面貌</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="politicalStatus" name="politicalStatus" required  lay-verify="required" placeholder="请输入政治面貌" autocomplete="off" class="layui-input">
                                        </div>
                                        <label class="layui-form-label" style="width: 100px">联系方式</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="contactInfo" name="contactInfo" required  lay-verify="required" placeholder="请输入联系方式" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <div class="layui-inline">
                                            <label class="layui-form-label" style="width: 100px">出生日期</label>
                                            <div class="layui-input-inline">
                                                <input type="text" class="layui-input" name="birthday" id="birthday" placeholder="yyyy-MM-dd">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">学历</label>
                                        <div class="layui-input-block" style="width: 12%">
                                            <select id="education1" name="education" lay-filter="aihao">
                                                <option value=""></option>
                                                <option value="0">高中</option>
                                                <option value="1" selected="">大专</option>
                                                <option value="2">本科</option>
                                                <option value="3">硕士</option>
                                                <option value="4">博士</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label" style="width: 12%">专业</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="profession" name="profession" required  lay-verify="required" placeholder="请输入专业" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label" style="width: 100px">毕业学校</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="school" name="school" required  lay-verify="required" placeholder="请输入毕业学校" autocomplete="off" class="layui-input">
                                        </div>
                                        <label class="layui-form-label" style="width: 100px">简历隐藏</label>
                                        <div class="layui-input-inline">
                                            <input type="checkbox" id="isShow" name="isShow" lay-skin="switch">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label" style="width: 12%">居住地址</label>
                                        <div class="layui-input-inline">
                                            <input type="text" id="address" name="address" required  lay-verify="required" placeholder="请输入现居住地址" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <div class="layui-input-block">
                                            <input type="button" value="保存" onclick="userInfoSave()" class="layui-btn">
                                            <input type="button" value="取消" onclick="userInfoQuit()" class="layui-btn">
                                        </div>
                                    </div>
                                </form>


<%--                                <form autocomplete="off" class="ui-form ui-form-label-top">--%>
<%--                                    <div class="form-item form-item-required">--%>
<%--                                        <div class="item-label">姓名</div>--%>
<%--                                        <div class="item-content">--%>
<%--                                            <div class="input-wrap input-wrap-text input-group input-group-with-append input-hide-icon"--%>
<%--                                                 ka="resume_form_edit_name">--%>
<%--                                                <!---->--%>
<%--                                                <!----><input autocomplete="on" spellcheck="false" type="text"--%>
<%--                                                              placeholder="请输入您的姓名" maxlength="24" class="input">--%>
<%--                                                <!---->--%>
<%--                                                <!---->--%>
<%--                                                <!---->--%>
<%--                                                <div class="input-group-append" style="">--%>
<%--                                                    <div class="append-tip" style="display: none;">--%>
<%--                                                        <p class="gray">已实名认证，真实姓名不可修改，可显示对展示名</p>--%>
<%--                                                        <!---->--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <!---->--%>
<%--                                            <!---->--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-item" ka="resume_form_edit_applyStatus">--%>
<%--                                        <div class="item-label">当前求职状态</div>--%>
<%--                                        <div class="item-content">--%>
<%--                                            <div class="ui-select ui-select-single" autocomplete="off">--%>
<%--                                                <div tabindex="0" class="ui-select-selection"><input type="hidden"--%>
<%--                                                                                                     value="2">--%>
<%--                                                    <div class="ui-select-inner"><span--%>
<%--                                                            class="ui-select-selected-value">在职-考虑机会</span>--%>
<%--                                                        <!---->--%>
<%--                                                        <!----><i class="ui-icon-arrow-down"></i></div>--%>
<%--                                                </div>--%>
<%--                                                <div class="ui-select-dropdown" style="display: none;">--%>
<%--                                                    <ul class="ui-dropdown-not-found" style="display: none;">--%>
<%--                                                        <li>无匹配数据</li>--%>
<%--                                                    </ul>--%>
<%--                                                    <ul class="ui-dropdown-list">--%>
<%--                                                        <li class="ui-select-item">离职-随时到岗</li>--%>
<%--                                                        <li class="ui-select-item">在职-暂不考虑</li>--%>
<%--                                                        <li class="ui-select-item ui-select-item-selected">在职-考虑机会--%>
<%--                                                        </li>--%>
<%--                                                        <li class="ui-select-item">在职-月内到岗</li>--%>
<%--                                                    </ul>--%>
<%--                                                    <ul class="ui-dropdown-loading" style="display: none;">加载中</ul>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <!---->--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-item">--%>
<%--                                        <div class="item-label">性别</div>--%>
<%--                                        <div class="item-content">--%>
<%--                                            <div name="radioGroup_1605008124544_1"--%>
<%--                                                 class="radio-group radio-group-rectangle" autocomplete="off"><label--%>
<%--                                                    class="radio radio-item radio-checked"><span--%>
<%--                                                    class="radio-inner"><input type="radio" class="radio-input"--%>
<%--                                                                               name="radioGroup_1605008124544_1"><i--%>
<%--                                                    class="radio-edging"></i></span>男</label><label--%>
<%--                                                    class="radio radio-item"><span class="radio-inner"><input--%>
<%--                                                    type="radio" class="radio-input"--%>
<%--                                                    name="radioGroup_1605008124544_1"><i--%>
<%--                                                    class="radio-edging"></i></span>女</label>--%>
<%--                                                <!---->--%>
<%--                                            </div>--%>
<%--                                            <!---->--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-item" ka="resume_form_edit_freshGraduate">--%>
<%--                                        <div class="item-label">我的牛人身份</div>--%>
<%--                                        <div class="item-content">--%>
<%--                                            <div class="ui-select ui-select-disabled ui-select-single"--%>
<%--                                                 autocomplete="off">--%>
<%--                                                <div tabindex="-1" class="ui-select-selection"><input type="hidden"--%>
<%--                                                                                                      value="0">--%>
<%--                                                    <div class="ui-select-inner"><span--%>
<%--                                                            class="ui-select-selected-value">职场人</span>--%>
<%--                                                        <!---->--%>
<%--                                                        <!----><i class="ui-icon-arrow-down"></i></div>--%>
<%--                                                </div>--%>
<%--                                                <div class="ui-select-dropdown" style="display: none;">--%>
<%--                                                    <ul class="ui-dropdown-not-found" style="display: none;">--%>
<%--                                                        <li>无匹配数据</li>--%>
<%--                                                    </ul>--%>
<%--                                                    <ul class="ui-dropdown-list">--%>
<%--                                                        <li class="ui-select-item ui-select-item-selected">职场人</li>--%>
<%--                                                        <li class="ui-select-item">学生</li>--%>
<%--                                                    </ul>--%>
<%--                                                    <ul class="ui-dropdown-loading" style="display: none;">加载中</ul>--%>
<%--                                                </div>--%>
<%--                                                <div class="append-tip">--%>
<%--                                                    <p class="gray">牛人身份需要到BOSS直聘APP中修改</p>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <!---->--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-item">--%>
<%--                                        <div class="item-label">生日</div>--%>
<%--                                        <div class="item-content">--%>
<%--                                            <div class="datepicker-wrap" ka="resume_form_edit_birthday"--%>
<%--                                                 autocomplete="off">--%>
<%--                                                <div class="input-wrap">--%>
<%--                                                    <!----><input placeholder="请选择生日" readonly="readonly"--%>
<%--                                                                  autocomplete="off" class="input">--%>
<%--                                                    <!---->--%>
<%--                                                    <!---->--%>
<%--                                                </div>--%>
<%--                                                <!---->--%>
<%--                                                <div class="datepicker-pannel datepicker-month"--%>
<%--                                                     style="display: none;">--%>
<%--                                                    <div class="picker-header"><span class="prev"></span><span--%>
<%--                                                            class="month-year-btn up">1991年</span><span--%>
<%--                                                            class="next"></span></div>--%>
<%--                                                    <div class="picker-content"><span--%>
<%--                                                            class="cell month">一月</span><span--%>
<%--                                                            class="cell month">二月</span><span--%>
<%--                                                            class="cell month">三月</span><span--%>
<%--                                                            class="cell month">四月</span><span--%>
<%--                                                            class="cell month">五月</span><span--%>
<%--                                                            class="cell month">六月</span><span--%>
<%--                                                            class="cell month">七月</span><span--%>
<%--                                                            class="cell month">八月</span><span--%>
<%--                                                            class="cell month">九月</span><span--%>
<%--                                                            class="cell month selected">十月</span><span--%>
<%--                                                            class="cell month">十一月</span><span--%>
<%--                                                            class="cell month">十二月</span>--%>
<%--                                                        <!---->--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                                <div class="datepicker-pannel datepicker-year"--%>
<%--                                                     style="display: none;">--%>
<%--                                                    <div class="picker-header"><span class="prev"></span><span>1990--%>
<%--                                                                - 1999年</span><span class="next"></span></div>--%>
<%--                                                    <div class="picker-content"><span--%>
<%--                                                            class="cell year">1990</span><span--%>
<%--                                                            class="cell year selected">1991</span><span--%>
<%--                                                            class="cell year">1992</span><span--%>
<%--                                                            class="cell year">1993</span><span--%>
<%--                                                            class="cell year">1994</span><span--%>
<%--                                                            class="cell year">1995</span><span--%>
<%--                                                            class="cell year">1996</span><span--%>
<%--                                                            class="cell year">1997</span><span--%>
<%--                                                            class="cell year">1998</span><span--%>
<%--                                                            class="cell year">1999</span>--%>
<%--                                                        <!---->--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <!---->--%>
<%--                                            <!---->--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-item">--%>
<%--                                        <div class="item-label">微信号 (选填)</div>--%>
<%--                                        <div class="item-content">--%>
<%--                                            <div class="input-wrap input-wrap-text" ka="resume_form_edit_weixin">--%>
<%--                                                <!---->--%>
<%--                                                <!----><input autocomplete="off" spellcheck="false" type="text"--%>
<%--                                                              placeholder="请输入您的微信号" maxlength="100" class="input">--%>
<%--                                                <!---->--%>
<%--                                                <!---->--%>
<%--                                                <!---->--%>
<%--                                                <!---->--%>
<%--                                            </div>--%>
<%--                                            <!---->--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-item">--%>
<%--                                        <div class="item-label">电话</div>--%>
<%--                                        <div class="item-content">--%>
<%--                                            <div class="input-wrap input-wrap-text input-group input-group-with-append input-hide-icon"--%>
<%--                                                 ka="resume_form_edit_phone">--%>
<%--                                                <!---->--%>
<%--                                                <!----><input autocomplete="off" spellcheck="false" type="text"--%>
<%--                                                              placeholder="请输入您的手机号" disabled="disabled"--%>
<%--                                                              class="input input-disabled">--%>
<%--                                                <!---->--%>
<%--                                                <!---->--%>
<%--                                                <!---->--%>
<%--                                                <div class="input-group-append" style="">--%>
<%--                                                    <div class="append-tip">--%>
<%--                                                        <p class="gray"> 电话即为登录账号，如需修改可直接在 <a--%>
<%--                                                                href="/web/geek/account?type=mobile">账号设置</a> 中修改--%>
<%--                                                        </p>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <!---->--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-item">--%>
<%--                                        <div class="item-label">邮箱 (选填)</div>--%>
<%--                                        <div class="item-content">--%>
<%--                                            <div class="input-wrap input-wrap-text" ka="resume_form_edit_email">--%>
<%--                                                <!---->--%>
<%--                                                <!----><input autocomplete="off" spellcheck="false" type="text"--%>
<%--                                                              placeholder="请输入您的邮箱" maxlength="80" class="input">--%>
<%--                                                <!---->--%>
<%--                                                <!---->--%>
<%--                                                <!---->--%>
<%--                                                <!---->--%>
<%--                                            </div>--%>
<%--                                            <!---->--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <!---->--%>
<%--                                    <div class="form-btns form-btn-normal"><button type="button"--%>
<%--                                                                                   ka="resume_form_baseinfo_cancel"--%>
<%--                                                                                   class="btn btn-outline"--%>
<%--                                                                                   onclick="userInfoUpdateCancel()">取消</button><button type="submit"--%>
<%--                                                                                                                                       ka="resume_form_baseinfo_ok" class="btn btn-primary"--%>
<%--                                                                                                                                       onclick="userInfoUpdateComfirm()">--%>
<%--                                        <!---->完成 </button></div>--%>
<%--                                </form>--%>
                            </div>
                        </div>
                        <div id="summary" class="resume-item resume-summary">
                            <div class="item-primary advantage-show">
                                <h3 class="title"> 个人优势
                                    <!---->
                                </h3>
                                <ul>
                                    <li ka="user-resume-edit-advantage" class="">
                                        <div class="primary-info">
                                            <div class="info-text advantage-text" style="white-space: normal;">
                                                <p>${resume.selfEva}</p>
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
                                            <textarea autocomplete="on" spellcheck="false" class="input" style="height: 5%"
                                                      placeholder="输入内容" maxlength="50" id="selfEva" name="selfEva" ></textarea>
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
                                <h3 class="title"> 期望职位 <a href="javascript:;" ka="user-resume-add-expectation"
                                                           class="link-add"><svg class="icon-svg">
                                    <use xlink:href="#icon-svg-add"></use>
                                </svg><span onclick="workUpdate()">编辑</span></a></h3>
                                <ul>
                                    <li ka="user-resume-edit-expectation0" class="">
                                        <div class="primary-info">
                                            <div class="info-labels"><span class="prev-line"><span
                                                    class="label-text"><i class="fz-resume fz-job"></i> ${resume.expectWork}
                                                        </span></span>
<%--                                                <span class="prev-line"><i--%>
<%--                                                    class="fz-resume fz-salary"></i> 面议 </span><span--%>
<%--                                                    class="prev-line"><i class="fz-resume fz-industry"></i>--%>
<%--                                                        移动互联网·互联网·电子商务 </span><span class="prev-line"><i--%>
<%--                                                    class="fz-resume fz-place"></i> 厦门 </span></div>--%>
                                        </div>
<%--                                        <div class="op op-show">--%>
<%--                                            <!----><a href="javascript:;" ka="user-resume-edit-expectation0"--%>
<%--                                                      class="link-edit"><svg class="icon-svg">--%>
<%--                                            <use xlink:href="#icon-svg-edit"></use>--%>
<%--                                        </svg><span>编辑</span></a></div>--%>
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
                                            <!---->
<%--                                            <!----><input autocomplete="on" spellcheck="false" type="text"--%>
<%--                                                          placeholder="输入内容" maxlength="44" class="input">--%>
                                            <textarea autocomplete="on" spellcheck="false" class="input" style="height: 5%"
                                                      placeholder="输入内容" maxlength="50"
                                                      id="expectWork" name="expectWork"></textarea>
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
                                </svg><span onclick="historyUpdate()">添加</span></a></h3>
                                <c:if test="${not empty resume.workExperiences}">
                                    <c:forEach var="works" items="${resume.workExperiences}">
                                        <ul>
                                            <li ka="user-resume-edit-workexp3" class="">
                                                <div class="primary-info">
                                                    <!---->
                                                    <div class="info-text">
                                                        <h4 class="name">公司：${works.companyName}</h4><span
                                                            class="gray period">项目时间：${works.beginTime}-${works.endTime}</span>
                                                    </div>
                                                    <h4><span class="prev-line">行业：${works.companyTrade}</span><span
                                                            class="prev-line">担任角色：${works.companyPost}</span></h4>
                                                    <div class="info-text" style="white-space: normal"><span
                                                            class="text-type">内容：</span>
                                                        ${works.duties}</div>
                                                    <div class="info-text"><span class="text-type">业绩：</span>${works.performance}</div>
<%--                                                    <div class="keywords"><span>java--%>
<%--                                                        web</span><span>Java</span><span>jsp</span></div>--%>
                                                </div>
                                                <div class="op"><a href="javascript:;" ka="user-resume-del-workexp3"
                                                                   class="link-delete"><svg class="icon-svg">
                                                    <use xlink:href="#icon-svg-delete"></use>
                                                </svg><span>删除</span></a><a href="javascript:;"
                                                                            ka="user-resume-edit-workexp3" class="link-edit"><svg
                                                        class="icon-svg">
                                                    <use xlink:href="#icon-svg-edit"></use>
                                                </svg><span>编辑</span></a></div>
                                            </li>
                                        </ul>
                                    </c:forEach>
                                </c:if>

                            </div>
                            <!---->
                        </div>

                        <div id="history-update" class="item-form display-hide">
                            <h3 class="title">编辑工作经历</h3>
                            <form class="layui-form">
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 12%">公司</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="companyName" name="companyName" required  lay-verify="required" placeholder="请输入公司名称" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 12%">行业</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="companyTrade" name="companyTrade" required  lay-verify="required" placeholder="请输入公司行业" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 12%">职位</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="companyPost" name="companyPost" required  lay-verify="required" placeholder="请输入担任职务" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label" style="width: 100px">在职时间</label>
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" id="beginTime" name="beginTime" placeholder="yyyy-MM-dd">
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">至</label>
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" name="endTime" id="endTime" placeholder="yyyy-MM-dd">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label" style="width: 12%">工作内容</label>
                                    <div class="layui-input-block">
                                        <textarea name="duties" id="duties" placeholder="请输入内容" class="layui-textarea" style="width: 50%"></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label" style="width: 12%">工作业绩</label>
                                    <div class="layui-input-block">
                                        <textarea name="performance" id="performance" placeholder="请输入内容" class="layui-textarea" style="width: 50%"></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <input type="button" value="保存" onclick="historySave()" class="layui-btn">
                                        <input type="button" value="取消" onclick="historyQuit()" class="layui-btn">
                                    </div>
                                </div>
                            </form>
                        </div>



                        <div id="project" class="resume-item resume-project">
                            <div class="item-primary">
                                <h3 class="title"> 项目经历 <a href="javascript:;" ka="user-resume-add-project"
                                                           class="link-add"><svg class="icon-svg">
                                    <use xlink:href="#icon-svg-add"></use>
                                </svg><span onclick="projectUpdate()">添加</span></a></h3>
                                <c:if test="${not empty resume.projectExperiences}">
                                    <c:forEach var="projects" items="${resume.projectExperiences}">
                                        <ul>
                                            <li ka="user-resume-edit-project2" class="">
                                                <div class="primary-info">
                                                    <!---->
                                                    <div class="info-text">
                                                        <h4 class="name">项目名称：${projects.proName}</h4><span
                                                            class="gray period">${projects.proBeginTime}-${projects.proEndTime}</span>
                                                    </div>
                                                    <div class="info-text">
                                                        <h4><span class="prev-line">担任职位：${projects.proPost}</span></h4>
                                                    </div>
                                                    <div class="info-text"><span
                                                            class="text-type">内容：</span>${projects.proDescription}
                                                    </div>
                                                    <div class="info-text"><span
                                                            class="text-type">业绩：</span>${projects.proPerformance}</div>
                                                    <!---->
                                                </div>
                                                <div class="op"><a href="javascript:;" ka="user-resume-del-project2"
                                                                   class="link-delete"><svg class="icon-svg">
                                                    <use xlink:href="#icon-svg-delete"></use>
                                                </svg><span>删除</span></a><a href="javascript:;"
                                                                            ka="user-resume-edit-project2" class="link-edit"><svg
                                                        class="icon-svg">
                                                    <use xlink:href="#icon-svg-edit"></use>
                                                </svg><span >编辑</span></a></div>
                                            </li>
                                        </ul>
                                    </c:forEach>
                                </c:if>

                            </div>
                            <!---->
                        </div>

                        <div id="project-update" class="item-form display-hide">
                            <h3 class="title">编辑项目经历</h3>
                            <form class="layui-form">
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 12%">项目名称</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="proName" name="proName" required  lay-verify="required" placeholder="请输入项目名称" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 12%">担任职务</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="proPost" name="proPost" required  lay-verify="required" placeholder="请输入担任职务" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label" style="width: 100px">项目时间</label>
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" name="proBeginTime" id="proBeginTime" placeholder="yyyy-MM-dd">
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">至</label>
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" name="proEndTime" id="proEndTime" placeholder="yyyy-MM-dd">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label" style="width: 12%">项目描述</label>
                                    <div class="layui-input-block">
                                        <textarea id="proDescription" name="proDescription" placeholder="请输入内容" class="layui-textarea" style="width: 50%"></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label" style="width: 12%">项目业绩</label>
                                    <div class="layui-input-block">
                                        <textarea id="proPerformance" name="proPerformance" placeholder="请输入内容" class="layui-textarea" style="width: 50%"></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <input type="button" value="保存" onclick="projectSave()" class="layui-btn">
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
                                </svg><span onclick="educationtUpdate()">添加</span></a></h3>
                                <c:if test="${not empty resume.educationalBackgrounds}">
                                    <c:forEach var="educationalBackgrounds" items="${resume.educationalBackgrounds}">
                                        <ul>
                                            <li ka="user-resume-edit-eduexp0" class="">
                                                <div class="primary-info">
                                                    <!---->
                                                    <div class="info-text">
                                                        <h4 class="name">${educationalBackgrounds.ebSchool}</h4>
                                                        <!----><span class="gray period">${educationalBackgrounds.schBeginTime}--${educationalBackgrounds.schEndTime}</span>
                                                    </div>
                                                    <div class="info-text">
                                                        <h4><span class="prev-line">专业：${educationalBackgrounds.major}</span><span
                                                                class="prev-line">学历：${educationalBackgrounds.ebEducation}
                                                            <!----></span></h4>
                                                    </div>
                                                    <!---->
                                                </div>
                                                <div class="op">
                                                    <!----><a href="javascript:;" ka="user-resume-edit-eduexp0"
                                                              class="link-edit"><svg class="icon-svg">
                                                    <use xlink:href="#icon-svg-edit"></use>
                                                </svg><span>编辑</span></a></div>
                                            </li>
                                        </ul>
                                    </c:forEach>
                                </c:if>

                            </div>
                            <!---->
                        </div>

                        <div id="education-update" class="item-form display-hide">
                            <h3 class="title">编辑教育背景</h3>
                            <form class="layui-form">
                                <div class="layui-form-item">
                                    <label class="layui-form-label"  style="width: 12%">学校</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="school2"  name="school" required  lay-verify="required" placeholder="请输入学校名称" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label"  style="width: 12%">学历</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="education2" name="education" required  lay-verify="required" placeholder="请输入学历" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label"  style="width: 12%">专业</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="major" name="major" required  lay-verify="required" placeholder="请输入所学专业" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label" style="width: 100px">学习时间</label>
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" name="schBeginTime" id="schBeginTime" placeholder="yyyy-MM-dd">
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">至</label>
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" name="schEndTime" id="schEndTime" placeholder="yyyy-MM-dd">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label" style="width: 12%">在校经历</label>
                                    <div class="layui-input-block">
                                        <textarea id="schExperience" name="schExperience" placeholder="请输入内容" class="layui-textarea" style="width: 50%"></textarea>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <input type="button" value="保存" onclick="educationSave()" class="layui-btn">
                                        <input type="button" value="取消" onclick="educationQuit()" class="layui-btn">
                                    </div>
                                </div>
                            </form>
                        </div>




<%--                        <div id="certification" class="resume-item resume-certification">--%>
<%--                            <div class="item-primary">--%>
<%--                                <h3 class="title"> 资格证书 <a href="javascript:;" ka="add-certificate-click"--%>
<%--                                                           class="link-add"><svg class="icon-svg">--%>
<%--                                    <use xlink:href="#icon-svg-add"></use>--%>
<%--                                </svg><span>添加</span></a></h3>--%>
<%--                                <ul></ul>--%>
<%--                            </div>--%>
<%--                            <!---->--%>
<%--                        </div>--%>
<%--                        <div id="social" class="resume-item resume-social">--%>
<%--                            <div class="item-primary">--%>
<%--                                <h3 class="title"> 社交主页 <a href="javascript:;" ka="user-resume-add-website"--%>
<%--                                                           class="link-add"><svg class="icon-svg">--%>
<%--                                    <use xlink:href="#icon-svg-add"></use>--%>
<%--                                </svg><span>添加</span></a></h3>--%>
<%--                                <ul></ul>--%>
<%--                            </div>--%>
<%--                            <!---->--%>
<%--                        </div>--%>
<%--                        <div id="volunteer" class="resume-item resume-volunteer">--%>
<%--                            <div class="item-primary">--%>
<%--                                <h3 class="title"> 志愿服务经历 <a href="javascript:;" ka="user-resume-add-volunteer"--%>
<%--                                                             class="link-add"><svg class="icon-svg">--%>
<%--                                    <use xlink:href="#icon-svg-add"></use>--%>
<%--                                </svg><span>添加</span></a></h3>--%>
<%--                                <ul></ul>--%>
<%--                            </div>--%>
<%--                            <!---->--%>
<%--                        </div>--%>
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
                    <div data-v-3b220faa="" class="resume-attachment">
                        <h3 data-v-3b220faa="" class="sider-title">附件管理
                        </h3>
                        <div data-v-3b220faa="" class="btns"><button data-v-3b220faa="" type="button"
                                                                     class="btn btn-primary">上传简历</button>
                        </div>
                        <div data-v-3b220faa="" class="">
                        </div>
                    </div>
                    <div style="margin-top: 20px">
                        <h3 >我的信息</h3>
                        <div><a href=""  >收藏岗位</a></div>
                        <div><a href="" >账号设置</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div id="footer" style="min-height: 120px;">
            <div class="inner home-inner">

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


    });
</script>


<script>
    function selectFile() {
        let files = event.target.files;
        if (files.length === 0) return false;
        let reader = new FileReader();
        reader.readAsDataURL(files[0]);
        reader.onloadend = () => {
            $("#headImg").attr("src", reader.result)
        }
    }
    // 基础信息
    function userInfoUpdate() {
        $("#userinfo-show").hide()
        $("#userinfo-update").show()
    }
    function userInfoSave() {
        event.preventDefault()
        $("#userinfo-show").show()
        $("#userinfo-update").hide()
    }
    function userInfoQuit() {
        event.preventDefault()
        $("#userinfo-show").show()
        $("#userinfo-update").hide()
    }
    // 期望工作
    function workUpdate() {
        $("#purpose").hide()
        $("#purpose-update").show()
    }
    function workSave() {
        event.preventDefault()
        $("#purpose").show()
        $("#purpose-update").hide()
    }
    function workQuit() {
        event.preventDefault()
        $("#purpose").show()
        $("#purpose-update").hide()
    }
    // 自我评价
    function summaryUpdate() {
        $("#summary").hide()
        $("#summary-update").show()
    }
    function summarySave() {
        event.preventDefault()
        $("#summary").show()
        $("#summary-update").hide()
    }
    function summaryQuit() {
        event.preventDefault()
        $("#summary").show()
        $("#summary-update").hide()
    }
    // 工作经历
    function historyUpdate() {
        $("#history").hide()
        $("#history-update").show()
    }
    function historySave() {
        event.preventDefault()
        $("#history").show()
        $("#history-update").hide()
    }
    function historyQuit() {
        event.preventDefault()
        $("#history").show()
        $("#history-update").hide()
    }
    // 项目经历
    function projectUpdate() {
        $("#project").hide()
        $("#project-update").show()
    }
    function projectSave() {
        event.preventDefault()
        $("#project").show()
        $("#project-update").hide()
    }
    function projectQuit() {
        event.preventDefault()
        $("#project").show()
        $("#project-update").hide()
    }
    // 教育背景
    function educationtUpdate() {
        $("#education").hide()
        $("#education-update").show()
    }
    function educationSave() {
        event.preventDefault()
        $("#education").show()
        $("#education-update").hide()
    }
    function educationQuit() {
        event.preventDefault()
        $("#education").show()
        $("#education-update").hide()
    }
</script>
</body>

</html>

