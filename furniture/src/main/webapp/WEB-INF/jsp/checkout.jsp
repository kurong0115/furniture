<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Parlo - eCommerce Bootstrap 4 Template</title>
    
	<!-- 引入首部链接 -->
    <%@include file="common/header_link.jsp" %>
</head>

<body>
<div class="wrapper">
    <!-- 引入首部 -->
    <%@include file="common/header.jsp" %>
    <script type="text/javascript">
    	function produceOrder() {
			if($('input[name="addr"]:checked').val()==null){
				getInfoMsg("请选择收货地址")
			}else if($('input[name="payment_method"]:checked').val()==null){
				getInfoMsg("请选择支付方式")
			}else{
				location.href="produceOrder?addressid="+$('input[name="addr"]:checked').val()+"&sum="+$('#sum').val()+"";
			}
		}
    </script>
    
   
    <div class="breadcrumb-area pt-35 pb-35 bg-gray">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <ul>
                    <li>
                        <a href="index">首页</a>
                    </li>
                    <li class="active">结算 </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- compare main wrapper start -->
    <div class="checkout-main-area pt-70 pb-70">
        <div class="container">
            <div class="customer-zone mb-20">
                <p>确认收货地址<span style="float: right;"><a href="#">管理收货地址</a></span></p>
                <div>
                	<form action="" style="vertical-align: middle;">
                		<ul id="addrUl">
                			<c:forEach items="${addrList }" var="addr">
		                		<li>
		                			<input id="${addr.id }" value="${addr.id }" type="radio" class="input-radio" name="addr" style="height: 15px;width: 15px;margin-top: 15px;margin-left: 50px;color: 1f2226">
		                			<label for="${addr.id }">
		                				<span style="font-size: 15px;margin-left: 10px;color: 1f2226">地址：${addr.address }</span>
		                				<span style="font-size: 15px;margin-left: 10px;color: 1f2226">联系人：${addr.name }</span>
		                				<span style="font-size: 15px;margin-left: 10px;color: 1f2226">联系电话：${addr.phone }</span>
		                			</label>
		                		<li>
	                		</c:forEach>
                		</ul>
                	</form>              
                </div>
            </div>
            <div class="checkout-wrap pt-30">
                <div class="row">
                    
                    <div class="col-lg-12">
                        <div class="your-order-area">
                            <h3>您的订单</h3>
                            <div class="your-order-wrap gray-bg-4">
                                <div class="your-order-info-wrap">
                                    <div class="your-order-info">
                                        <ul>
                                            <li>货品 <span>费用</span></li>
                                        </ul>
                                    </div>
                                    <div class="your-order-middle">
                                        <ul>
                                        	<c:forEach items="${cartProductList}" var="cartProduct">
                                        		<li>${cartProduct.product.productname}  X  ${cartProduct.count} <span>￥${cartProduct.product.price*cartProduct.count} </span></li>
                                        	</c:forEach>                                           
                                        </ul>
                                    </div>
                                    <div class="your-order-info order-total">
                                        <ul>
                                            <li>总计 <span>￥<span>${allSum} </span></span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="payment-method">                                    
                                    <div class="pay-top sin-payment">
                                        <input id="payment-method-3" class="input-radio" type="radio" value="cheque" name="payment_method">
                                        <label for="payment-method-3">货到付现 </label>
                                        <div class="payment-box payment_method_bacs">
                                        <p>我们将立即为您发货，请耐心等待</p>
                                        </div>
                                    </div>                                    
                                </div>
                            </div>
                            <div class="Place-order mt-40">
                                <a href="javascript:void(0)" onclick="produceOrder()">订购</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- compare main wrapper end -->
    
    
    <!-- 引入底部 -->
    <%@include file="common/footer.jsp" %>
    
</div>


<!-- 引入底部链接 -->
<%@include file="common/footer_link.jsp" %>


</body>

</html>
