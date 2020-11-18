<%--
  Created by IntelliJ IDEA.
  User: WUWX
  Date: 2020/11/16
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>岗位信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <link href="${pageContext.request.contextPath}/css/vendor.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <script src="https://static.zhipin.com/library/js/lib/jquery-1.12.2.min.js" crossorigin="anonymous"></script>

    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <script>
        function postDel(id) {
            $.ajax({
                url: 'postDel',
                charset:"UTF-8",
                async: "true",
                type: "post",
                data: "pPostId="+id,
                dataType: "text",
                success: function (data) {
                    if (data == "succes") {
                        //向服务端发送删除指令
                        layer.msg('删除成功')
                        location.reload()
                    } else if (data == "lose") {
                        layer.msg("添加失败")
                    }
                },
                error: function () {
                    layer.msg('网络繁忙')
                }
            })
        }
    </script>
</head>
<body>
<form class="layui-form">
<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" style="width: 70%">
    <input type="hidden" id="count" value="${count}">
    <input type="hidden" id="limit" value="${limit}">
    <input type="hidden" id="curr" value="${curr}">
    <ul class="layui-tab-title" >
        <li  <c:if test="${not empty posts}">class="layui-this"</c:if> lay-id="resumeInfo">感兴趣</li>
        <li  <c:if test="${not empty postss}">class="layui-this"</c:if> lay-id="resumeCommit">已投递</li>
        <li lay-id="interview">面试</li>
        <li lay-id="communication">沟通过</li>
    </ul>
    <div class="layui-tab-content" style="height: 90%">
        <div class="layui-tab-item <c:if test="${not empty posts}"> layui-show</c:if>">
            <c:if test="${not empty posts}">

            <div id="wrap" class=""><c:if test="${not empty posts}">
                <div id="main" class="inner"><c:if test="${not empty posts}">
                    <div id="container" class="resume-container">
                        <div class="resume-content">
                            <!---->
                            <div class="resume-content-box">

                                <div class="resume-box"><c:if test="${not empty posts}">
                                    <div id="userinfo" class="resume-item resume-userinfo"><c:if test="${not empty posts}">
                                        <div id="purpose" class="resume-item resume-purpose">
                                            <c:if test="${not empty posts}">
                                                <c:forEach var="post" items="${posts}">
                                                    <div class="item-primary">
                                                        <h3 class="title"> ${posts.backUesr.bUserName} <a href="javascript:;" ka="user-resume-add-expectation"
                                                                                  class="link-add"><svg class="icon-svg">
                                                            <use xlink:href="#icon-svg-add"></use>
                                                        </svg><span onclick="postDel(${post.pPostId})">取消感兴趣</span></a>
                                                        </h3>
                                                        <ul>
                                                            <li ka="user-resume-edit-expectation0" class="">
                                                                <div class="primary-info">
                                                                    <div class="info-labels"><span class="prev-line"><span
                                                                            class="label-text"><i class="fz-resume fz-job"></i><a onclick="">${post.postName}</a>
                                                        </span></span><span class="prev-line"><i
                                                                            class="fz-resume fz-salary"></i> 面议 </span>
                                                                        <span class="prev-line"><i
                                                                                class="fz-resume fz-place"></i> ${post.jobDescription} </span></div>
                                                                </div>
                                                                <div class="op op-show">
                                                                    <!----><a href="javascript:;" ka="user-resume-edit-expectation0"
                                                                              class="link-edit"><svg class="icon-svg">
                                                                    <use xlink:href="#icon-svg-edit"></use>
                                                                </svg><span>公司名字</span></a><a href="javascript:;" ka="user-resume-edit-expectation0"
                                                                                              class="link-edit"><svg class="icon-svg">
                                                                    <use xlink:href="#icon-svg-edit"></use>
                                                                </svg><span>继续沟通</span></a></div>
                                                            </li>
                                                            <li ka="user-resume-edit-expectation0" class="">
                                                                <div class="primary-info">
                                                                    <div class="info-labels"><span class="prev-line"><span
                                                                            class="label-text"><i class="fz-resume fz-job"></i> 工作年限
                                                        </span></span><span class="prev-line"><i
                                                                            class="fz-resume fz-salary"></i> 学历 </span><span
                                                                            class="prev-line"><i class="fz-resume fz-salary"></i>
                                                        福利包吃包住的巨额嘿嘿 </span></div>
                                                                </div>

                                                            </li>
                                                        </ul>
                                                    </div>
                                                </c:forEach>
                                            </c:if>

                                        </div></c:if>
                                    </div></c:if>
                                </div>
                                <div id="fenye" style="text-align: center"></div>
                            </div>
                        </div>
<%--                        <div class="user-sider" style="height: 600px;background: #fff;">--%>
<%--                            <div data-v-3b220faa="" class="sider-box sider-resume">--%>
<%--                                <div data-v-3b220faa="" class="resume-attachment">--%>
<%--                                    <h3 data-v-3b220faa="" class="sider-title">附件管理--%>
<%--                                    </h3>--%>
<%--                                    <div data-v-3b220faa="" class="btns"><button data-v-3b220faa="" type="button"--%>
<%--                                                                                 class="btn btn-primary">上传简历</button>--%>
<%--                                    </div>--%>
<%--                                    <div data-v-3b220faa="" class="">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                </div></c:if>
            </div></c:if>
            </c:if>
        </div>
        <div class="layui-tab-item <c:if test="${not empty postss}">layui-show</c:if>">
            <c:if test="${not empty postss}">
                <div id="wrap" class=""><c:if test="${not empty postss}">
                    <div id="main" class="inner"><c:if test="${not empty postss}">
                        <div id="container" class="resume-container">
                            <div class="resume-content">
                                <!---->
                                <div class="resume-content-box">

                                    <div class="resume-box"><c:if test="${not empty postss}">
                                        <div id="userinfo" class="resume-item resume-userinfo"><c:if test="${not empty postss}">
                                            <div id="purpose" class="resume-item resume-purpose">
                                                <c:if test="${not empty postss}">
                                                    <c:forEach var="post" items="${postss}">
                                                        <div class="item-primary">
                                                            <h3 class="title"> 发布人 <a href="javascript:;" ka="user-resume-add-expectation"
                                                                                      class="link-add"><svg class="icon-svg">
                                                                <use xlink:href="#icon-svg-add"></use>
                                                            </svg><span onclick="postDel(${post.pPostId})">取消感兴趣</span></a>
                                                            </h3>
                                                            <ul>
                                                                <li ka="user-resume-edit-expectation0" class="">
                                                                    <div class="primary-info">
                                                                        <div class="info-labels"><span class="prev-line"><span
                                                                                class="label-text"><i class="fz-resume fz-job"></i><a onclick="">${post.postName}</a>
                                                        </span></span><span class="prev-line"><i
                                                                                class="fz-resume fz-salary"></i> 面议 </span>
                                                                            <span class="prev-line"><i
                                                                                    class="fz-resume fz-place"></i> ${post.jobDescription} </span></div>
                                                                    </div>
                                                                    <div class="op op-show">
                                                                        <!----><a href="javascript:;" ka="user-resume-edit-expectation0"
                                                                                  class="link-edit"><svg class="icon-svg">
                                                                        <use xlink:href="#icon-svg-edit"></use>
                                                                    </svg><span>公司名字</span></a><a href="javascript:;" ka="user-resume-edit-expectation0"
                                                                                                  class="link-edit"><svg class="icon-svg">
                                                                        <use xlink:href="#icon-svg-edit"></use>
                                                                    </svg><span>继续沟通</span></a></div>
                                                                </li>
                                                                <li ka="user-resume-edit-expectation0" class="">
                                                                    <div class="primary-info">
                                                                        <div class="info-labels"><span class="prev-line"><span
                                                                                class="label-text"><i class="fz-resume fz-job"></i> 工作年限
                                                        </span></span><span class="prev-line"><i
                                                                                class="fz-resume fz-salary"></i> 学历 </span><span
                                                                                class="prev-line"><i class="fz-resume fz-salary"></i>
                                                        福利包吃包住的巨额嘿嘿 </span></div>
                                                                    </div>

                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>

                                            </div></c:if>
                                        </div></c:if>
                                    </div>
                                    <div id="fenye2" style="text-align: center"></div>
                                </div>
                            </div>
                                <%--                        <div class="user-sider" style="height: 600px;background: #fff;">--%>
                                <%--                            <div data-v-3b220faa="" class="sider-box sider-resume">--%>
                                <%--                                <div data-v-3b220faa="" class="resume-attachment">--%>
                                <%--                                    <h3 data-v-3b220faa="" class="sider-title">附件管理--%>
                                <%--                                    </h3>--%>
                                <%--                                    <div data-v-3b220faa="" class="btns"><button data-v-3b220faa="" type="button"--%>
                                <%--                                                                                 class="btn btn-primary">上传简历</button>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div data-v-3b220faa="" class="">--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                                <%--                            </div>--%>
                                <%--                        </div>--%>
                        </div>
                    </div></c:if>
                </div></c:if>
            </c:if>


        </div>
        <div class="layui-tab-item">内容3</div>
        <div class="layui-tab-item">内容4</div>
    </div>

</div>

</form>


<script>
    layui.use(['element','form'], function(){
        var $ = layui.jquery
            ,form=layui.form
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

        element.on('test(555)',function (data) {
            console.log("9999999999999999999999999")
        })

        element.on('tab(docDemoTabBrief)', function(data){
            console.log('efheiughuirehieguhi')
            console.log(this); //当前Tab标题所在的原始DOM元素
            console.log(data.index); //得到当前Tab的所在下标
            console.log(data.elem); //得到当前的Tab大容器
            var layid=$(this).attr("lay-id");
            console.log($(this).attr("layid")); //得到当前的Tab大容器

            location.href=layid;
            // $.ajax({
            //     url: layid,
            //     charset:"UTF-8",
            //     async: "true",
            //     type: "post",
            //     data: "",
            //     dataType: "text",
            //     success: function (data) {
            //         if (data == "succes") {
            //             //向服务端发送删除指令
            //             layer.msg('删除成功')
            //             location.reload()
            //         } else if (data == "lose") {
            //             layer.msg("添加失败")
            //         }
            //     },
            //     error: function () {
            //         layer.msg('网络繁忙')
            //     }
            // })


        });

    });
</script>



<script>
    var count=$('#count').val();
    var limit=$('#limit').val();
    var curr=$('#curr').val();
    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
            ,layer = layui.layer;


        //自定义样式
        laypage.render({
            elem: 'fenye'
            ,count: count
            ,curr:curr
            ,theme: '#1E9FFF'
            ,limit:limit
            ,jump:function (obj,first) {
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数
                if(!first){
                    location.href="resumePage?curr="+obj.curr+"&limit="+obj.limit;
                }
            }
        });
        laypage.render({
            elem: 'fenye2'
            ,count: count
            ,curr:curr
            ,theme: '#1E9FFF'
            ,limit:limit
            ,jump:function (obj,first) {
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数
                if(!first){
                    location.href="resumePage?curr="+obj.curr+"&limit="+obj.limit;
                }
            }
        });



    });
</script>
</body>
</html>
