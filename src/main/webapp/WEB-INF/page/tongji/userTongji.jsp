<%--
  Created by IntelliJ IDEA.
  User: yuzhen
  Date: 2020/11/27
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%
        String path = request.getContextPath()+"/";
    %>
    <meta charset="UTF-8">
    <title>前台统计</title>
</head>
<body>
<p align="center">
    <input type= "button" value="本周" style="width: 100px;height: 40px" onclick="weekTj()"  > &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type= "button" value="本月" style="width: 100px;height: 40px" onclick="monthTj()"  > &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type= "button" value="近半年" style="width: 100px;height: 40px" onclick="halfYearTj()" >
</p>
<div id="main" style="width: 1000px;height:600px;margin:auto;margin-top:50px;">


</div>
</body>
<script>
    
    function weekTj() {
        location.href = '<%=path %>Tj/userNumWeek';
    }
    
    function monthTj() {
        location.href = '<%=path %>Tj/userNumMon';
    }
    
    function halfYearTj() {
        location.href = '<%=path %>Tj/userNumHalfYear';
    }
    
</script>
<script src="${pageContext.request.contextPath}/js/echarts.js"></script>
<script>
    var myChart = echarts.init(document.getElementById('main'));
    var xData=[];
    var yData=[];
    var count=null;
    var s='${s}';
    <c:forEach items="${list}" var="list">
    xData.push("${list.name}");
    yData.push("${list.num}");
    count +=${list.num};

    </c:forEach>
    option = {
        title:{
            text:s+count
        },
        xAxis: {
            position:'bottom',data: xData
        },
        yAxis: {
            show:true,position:'left'
        },
        series: [{
            type: 'bar',data: yData,itemStyle: {
                normal: {
                    label: {
                        show: true,		//开启显示
                        position: 'top',	//在上方显示
                        textStyle: {	    //数值样式
                            color: 'black',
                            fontSize: 16
                        }
                    }
                }
            }
        }]
    };
    myChart.setOption(option);

</script>
</html>
