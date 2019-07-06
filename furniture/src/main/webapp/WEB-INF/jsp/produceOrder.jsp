<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Parlo - eCommerce Bootstrap 4 Template</title>
    
	<!-- 引入首部链接 -->
    <%@include file="common/header_link.jsp" %>
</head>
<body>
<div class="wrapper" >
    
    
    <!-- 引入首部 -->
    <%@include file="common/header.jsp" %>
    
    <div class="breadcrumb-area pt-35 pb-35 bg-gray">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <ul>
                    <li>
                        <a href="index">首页</a>
                    </li>
                    <li class="active">订购信息</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="checkout-main-area pt-70 pb-70">
        <div class="container">
            
            <div class="checkout-wrap pt-30">
                <div class="row">
                    
                    <div class="col-lg-12">
                        <div class="your-order-area">
                        	<c:if test="${reason==null }">
	                            <div class="your-order-wrap gray-bg-4" style="text-align: center;">
									<img alt="" src="assets/img/produceOrderSucceed.jpg">
									<p style="font-size: 20px;color:b0b0b0;">订购成功，订单编号为[${orderNo }]</p>
									<p>您可以在 [<a href="my-account">我的账户</a>] 中查看订单</p>
	                            </div>
							</c:if>
							<c:if test="${reason!=null }">
								<div class="your-order-wrap gray-bg-4" style="text-align: center;">
									<p style="font-size: 20px;color:b0b0b0;">订购失败，失败原因[${reason }]</p>
	                            </div>
							</c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 引入底部 -->
    <%@include file="common/footer.jsp" %>
    
</div>


<!-- 引入底部链接 -->
<%@include file="common/footer_link.jsp" %>

</body>

</html>
