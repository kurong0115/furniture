<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    
    <div class="breadcrumb-area pt-35 pb-35 bg-gray">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <ul>
                    <li>
                        <a href="index">首页</a>
                    </li>
                    <li class="active">购物车 </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="cart-main-area pt-95 pb-100">
        <div class="container">
            <h3 class="cart-page-title">您的购物车清单</h3>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                    <form action="#">
                        <div class="table-content table-responsive cart-table-content">
                            <table>
                                <thead>
                                    <tr>
                                        <th>图片</th>
                                        <th>物品名</th>
                                        <th>原价</th>
                                        <th>数量</th>
                                        <th>小计</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${cartProductList}" var="cartProduct">
                                		<tr>
	                                        <td class="product-thumbnail">
	                                            <a href="#"><img src="${cartProduct.product.images[0].imgpath}" alt="" width="82px" height="82px"></a>
	                                        </td>
	                                        <td  class="product-name"><a href="#">${cartProduct.product.productname}</a></td>
	                                        <td  class="product-price-cart">￥<span class="amount">${cartProduct.product.price}</span></td>
	                                        <td  class="product-quantity">
	                                            <div class="cart-plus-minus">
	                                                <input class="cart-plus-minus-box" type="text" name="qtybutton" value="${cartProduct.count}">
	                                            </div>
	                                        </td>
	                                        <td class="product-subtotal" >￥<span>${cartProduct.sum}</span></td>
	                                        <td class="product-remove">
	                                            <a href="javascript:void(0)"><i class="sli sli-close"></i></a>
	                                       </td>
	                                    </tr>
                                	</c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="cart-shiping-update-wrapper">
                                    <div class="cart-shiping-update">
                                        <a href="index">继续购物</a>
                                    </div>
                                    <div class="cart-clear">
                                        <button>更新购物车</button>
                                        <a href="#">清空购物车</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="grand-totall">
                                <div class="title-wrap">
                                    <h4 class="cart-bottom-title section-bg-gary-cart">购物车总计</h4>
                                </div>
                                <br/>
                                <h4 class="grand-totall-title">总计  <span >￥<font id="allSum">${allSum }</font></span></h4>
                                <a href="#">结账</a>
                            </div>
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
