<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<%
	String path = request.getContextPath()+"/";
%>
<meta charset="utf-8">
<title></title>
</head>
<script>


</script>
<body>
<p align="center">
<input type= "button" value="本周" style="width: 100px;height: 40px" onclick="week()"  > &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<input type= "button" value="本月" style="width: 100px;height: 40px" onclick="mon()"  > &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<input type= "button" value="近半年" style="width: 100px;height: 40px" onclick="half()"  >
</p>
<div id="main" style="width: 1000px;height:600px;margin:auto;margin-top:50px;">


</div>

</body>
<script>
	function week() {
		location.href= '<%=path %>talent/backUserNumWeek';
	}
	function mon() {
		location.href= '<%=path %>talent/backUserNumMonth';
	}
	function half() {
		location.href= '<%=path %>talent/backUserNumHalfYear';
	}
</script>

	<script src="${pageContext.request.contextPath}/js/echarts.js"></script>

<script type="text/javascript">
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