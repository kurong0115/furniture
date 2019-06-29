<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>愿望清单</title>
    <%@ include file="common/header_link.jsp" %>
</head>

<body>
<div class="wrapper">
    <%@ include file="common/header.jsp" %>
    
    <div class="breadcrumb-area pt-35 pb-35 bg-gray">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <ul>
                    <li>
                        <a href="index">主页</a>
                    </li>
                    <li class="active">愿望清单 </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="cart-main-area pt-95 pb-100">
        <div class="container">
            <h3 class="cart-page-title">您的愿望清单</h3>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                    <form action="#">
                        <div class="table-content table-responsive cart-table-content">
                            <table>
                                <thead>
                                    <tr>
                                        <th>图片</th>
                                        <th>产品名</th>
                                        <th>价格(元)</th>                                       
                                        <th>添加到购物车</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${wishlist }" var="wishlist">
                                        <tr>
	                                        <td class="product-thumbnail">
	                                            <a href="product-details?pid=${wishlist.product.pid }"><img src="${wishlist.product.images[0].imgpath }" alt="" style="width:100px;height:100px;"></a>
	                                        </td>
	                                        <td class="product-name"><a href="product-details?pid=${wishlist.product.pid }">${wishlist.product.model }&nbsp;&nbsp;&nbsp;&nbsp;${wishlist.product.productname }</a></td>
	                                        <td class="product-price-cart"><span class="amount">${wishlist.product.price }</span></td>                                       
	                                        <td class="product-wishlist-cart">
	                                            <a href="#" onclick="addCart('${wishlist.product.pid}','${wishlist.product.price}','${wishlist.product.images[0].imgpath }')">添加到购物车</a>
	                                       </td>	                                       
	                                        <td class="product-remove">
	                                             <a href="javascript:void(0)"><i class="sli sli-close" onclick="removeWishlist(${wishlist.wid})"></i></a>                                                  
	                                        </td>                                      
                                        </tr>  
                                    </c:forEach>
                                                                     
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="common/footer.jsp" %>
</div>

<!-- All JS is here
============================================ -->

<!-- jQuery JS -->
<%@ include file="common/footer_link.jsp" %>

</body>

</html>
