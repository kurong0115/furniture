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
                                        <th>数量</th>
                                        <th>总和</th>
                                        <th>添加到购物车</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="product-thumbnail">
                                            <a href="#"><img src="assets/img/cart/cart-3.jpg" alt=""></a>
                                        </td>
                                        <td class="product-name"><a href="#">Product Name</a></td>
                                        <td class="product-price-cart"><span class="amount">260.00</span></td>
                                        <td class="product-quantity">
                                            <div class="cart-plus-minus">
                                                <input class="cart-plus-minus-box" type="text" name="qtybutton" value="2">
                                            </div>
                                        </td>
                                        <td class="product-subtotal">110.00</td>
                                        <td class="product-wishlist-cart">
                                            <a href="#">添加到购物车</a>
                                       </td>
                                    </tr>
                                    
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
