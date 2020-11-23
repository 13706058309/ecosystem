<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/20
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>输入提示</title>
    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=7c1d325554fabccbfb414e1ec058cf40&plugin=AMap.Autocomplete"></script>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=85f285069a023533ccfb926369538910&plugin=AMap.Geocoder"></script>
    <script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
    <style>
        html,
        body,
        #container {
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<div id="container"></div>

<script>

    $(function () {
        // var map = new AMap.Map("container", {
        // });
        // var marker = new AMap.Marker({
        //     icon: "//a.amap.com/jsapi_demos/static/demo-center/icons/poi-marker-red.png",
        //     // position: new AMap.LngLat(lnglatArray[0],lnglatArray[1]),
        //     position: new AMap.LngLat(118.085730, 24.623940),// 经纬度对象，也可以是经纬度构成的一维数组[116.39, 39.9]
        //     offset: new AMap.Pixel(-13, -30)
        // });
        // map.setZoom(15);
        // map.add(marker);

        var map = new AMap.Map('container', {
            center: [118.085730, 24.623940],
            zoom: 20
        });
        map.plugin(["AMap.ToolBar"], function() {
            map.addControl(new AMap.ToolBar());
        });

        <!-- 上面是定位，下面是打上标记 -->

        var marker;
        var icon = new AMap.Icon({
            image: 'http://vdata.amap.com/icons/b18/1/2.png',
            size: new AMap.Size(24, 24)
        });
        marker = new AMap.Marker({
            offset: new AMap.Pixel(-12, -12),
            zIndex: 101,
            map: map
        });


        var geocoder = new AMap.Geocoder({
        });
        $(function () {
            var address  ="厦门理工学院";
            geocoder.getLocation(address, function(status, result) {
                if (status === 'complete'&&result.geocodes.length) {
                    var lnglat = result.geocodes[0].location
                    alert(lnglat);
                    alert(lnglat.lng);
                    alert(lnglat.lat)
                }else{
                    alert("error");
                }
            });
        })
    })

</script>

</body>
</html>
