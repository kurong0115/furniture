<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Parlo - eCommerce Bootstrap 4 Template</title>
    
    <script type="text/javascript" src="assets/js/vendor/jquery-1.12.4.min.js"></script>
    
	<!-- 引入首部链接 -->
    <%@include file="common/header_link.jsp" %>
    
</head>

<body>
<div class="wrapper">
    
     <!-- 引入首部 -->
    <%@include file="common/header.jsp" %>
    
    
    <div class="breadcrumb-area pt-35 pb-35 bg-gray">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <ul>
                    <li>
                        <a href="index">首页</a>
                    </li>
                    <li class="active">联系我们 </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="contact-area pt-100 pb-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-6">
                    <div class="contact-info-area">
                        <h2>联系我们</h2>
                        <p>如果您有对我们的一些建议或需要解决的问题，以及相关咨询等，欢迎选择以下方式联系我们，
                        	或直接填写右侧信息发送给我们的线上客服，我们将尽快给您解决. </p>
                        <div class="contact-info-wrap">
                            <div class="single-contact-info">
                                <div class="contact-info-icon">
                                    <i class="sli sli-location-pin"></i>
                                </div>
                                <div class="contact-info-content">
                                    <p>地址：湖南省衡阳市珠晖区酃湖乡衡花路18号湖南工学院.</p>
                                </div>
                            </div>
                            <div class="single-contact-info">
                                <div class="contact-info-icon">
                                    <i class="sli sli-envelope"></i>
                                </div>
                                <div class="contact-info-content">
                                    <p><a href="#">邮箱：869872053@qq.com</a> / <a href="#">1181209156@qq.com</a></p>
                                </div>
                            </div>
                            <div class="single-contact-info">
                                <div class="contact-info-icon">
                                    <i class="sli sli-screen-smartphone"></i>
                                </div>
                                <div class="contact-info-content">
                                    <p>手机：+86 17576301254  /  +86 15574856542</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7 col-md-6">
                    <div class="contact-from contact-shadow">
                        <form id="contact-form" method="post" enctype="multipart/form-data">
                            <input name="name" type="text" placeholder="用户名">
                            <input name="password" type="password" placeholder="密码">
                            <input name="title" type="text" placeholder="主题">
                            <textarea name="content" placeholder="你的留言"></textarea>
                            <button class="submit" type="button" onclick="submitForm()">发送消息</button>
                        </form>
                    </div>
                </div>
                <!-- 对表单进行序列化发送并接收返回值 -->
                <script type="text/javascript">
	                function submitForm(){
	                	$.ajax({
	                		type: 'post',
							url: 'sendInfo.do',
		                 	data: $("#contact-form").serialize(),
		                 	success: function(data) {
			                 	if(data.code == 0){
			                 		//未填写完整或用户不存在
			             			getInfoMsg(data.message);
			             		}else if(data.code == 1){
			             			//发送成功提醒并清空表单
			             			getSuccessMsg(data.message);
			             			document.getElementById("contact-form").reset()
			             		}
			                 }
			             });
		             }
                </script>
            </div>
            <div class="contact-map pt-100">
                <div id="map"></div>
            </div>
        </div>
    </div>
    
	<!-- 引入底部 -->
    <%@include file="common/footer.jsp" %>
    
    
</div>


<!-- 引入底部链接 -->
<%@include file="common/footer_link.jsp" %>
<!-- 表单序列化提交的js -->
<script type="text/javascript" src="js/jquery-form.js"></script>

<script src="http://ditu.google.cn/maps/api/js?key=AIzaSyCGM-62ap9R-huo50hJDn05j3x-mU9151Y"></script>
<script>
	//初始化，Google地图api根据经纬度显示地图
    function init() {
        var mapOptions = {
            zoom: 11,
            scrollwheel: false,
            //center: new google.maps.LatLng(40.709896, -73.995481),
            center: new google.maps.LatLng(26.880287, 112.684896),
            styles: 
            [
                {
                    "featureType": "landscape",
                    "stylers": [
                        {
                            "hue": "#FFBB00"
                        },
                        {
                            "saturation": 43.400000000000006
                        },
                        {
                            "lightness": 37.599999999999994
                        },
                        {
                            "gamma": 1
                        }
                    ]
                },
                {
                    "featureType": "road.highway",
                    "stylers": [
                        {
                            "hue": "#FFC200"
                        },
                        {
                            "saturation": -61.8
                        },
                        {
                            "lightness": 45.599999999999994
                        },
                        {
                            "gamma": 1
                        }
                    ]
                },
                {
                    "featureType": "road.arterial",
                    "stylers": [
                        {
                            "hue": "#FF0300"
                        },
                        {
                            "saturation": -100
                        },
                        {
                            "lightness": 51.19999999999999
                        },
                        {
                            "gamma": 1
                        }
                    ]
                },
                {
                    "featureType": "road.local",
                    "stylers": [
                        {
                            "hue": "#FF0300"
                        },
                        {
                            "saturation": -100
                        },
                        {
                            "lightness": 52
                        },
                        {
                            "gamma": 1
                        }
                    ]
                },
                {
                    "featureType": "water",
                    "stylers": [
                        {
                            "hue": "#0078FF"
                        },
                        {
                            "saturation": -13.200000000000003
                        },
                        {
                            "lightness": 2.4000000000000057
                        },
                        {
                            "gamma": 1
                        }
                    ]
                },
                {
                    "featureType": "poi",
                    "stylers": [
                        {
                            "hue": "#00FF6A"
                        },
                        {
                            "saturation": -1.0989010989011234
                        },
                        {
                            "lightness": 11.200000000000017
                        },
                        {
                            "gamma": 1
                        }
                    ]
                }
            ]
        };
        var mapElement = document.getElementById('map');
        var map = new google.maps.Map(mapElement, mapOptions);
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(26.880287, 112.684896),
            //position: new google.maps.LatLng(40.709896, -73.995481),
            map: map,
            icon: 'assets/img/icon-img/2.png',
            animation:google.maps.Animation.BOUNCE,
            title: 'Snazzy!'
        });
    }
    google.maps.event.addDomListener(window, 'load', init);
    
    //消息弹窗
    function getSuccessMsg(msg) {
    	$.message({
    		message : msg,
    		type : 'success',
    		duration : '3000'
    	});
    }
    function getInfoMsg(msg) {
    	$.message({
    		message : msg,
    		type : 'info',
    		duration : '3000'
    	});
    }
</script>
</body>
</html>
