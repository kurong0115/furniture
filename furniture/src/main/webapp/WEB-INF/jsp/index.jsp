<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    <!-- 第一排滑动大图 -->
    <div class="slider-area section-padding-1">
        <div class="slider-active owl-carousel nav-style-1">
            
            <!-- 循环展示 -->
           	<c:forEach items="${HotProducts }" var="t">
           		<div class="single-slider slider-height-1 bg-paleturquoise">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-12 col-sm-6">
                            <div class="slider-content slider-animated-1">
                                <h1 class="animated">${t.product.model }</h1>
                                <p class="animated">${t.product.content }.</p>
                                <div class="slider-btn btn-hover">
                                    <a class="animated" href="product-details">Shop Now <i class="sli sli-basket-loaded"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-12 col-sm-6">
                            <div class="slider-single-img slider-animated-1">
                                <img class="animated" src="${t.imgPath }" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           	</c:forEach>
            
        </div>
    </div>
    <br/>
    <br/>
    <br/>
    <br/>
    
    <!-- 新品上市 -->
    <div class="product-area pb-70">
        <div class="container">
            <div class="section-title text-center pb-40">
                <h2>新品 上市</h2>
                <p> 我们在这里提供了最新的商品，全新设计，独一无二！</p>
            </div>
            <div class="product-tab-list nav pb-60 text-center">
                <a class="active" onclick="getProducts('${categorys[0] }')" data-toggle="tab">
                    <h4>${categorys[0] } </h4>
                </a>
                <a href="#product-2" data-toggle="tab">
                    <h4>${categorys[1] } </h4>
                </a>
                <a href="#product-3" data-toggle="tab">
                    <h4>${categorys[2] }</h4>
                </a>
            </div>
            
            <div class="tab-content jump-2">
                <div id="product-1" class="tab-pane active">
                    <div id="prduct-img" class="ht-products product-slider-active owl-carousel">
                        
                       	<!-- 循环滑动图片 -->
                        <!--Product Start-->
						<div class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
                            <div class="ht-product-inner">
                                <div class="ht-product-image-wrap">
                                    <a href="product-details.html" class="ht-product-image"> <img src="assets/img/product/product-1.jpg" alt="Universal Product Style"> </a>
                                    <div class="ht-product-action">
                                        <ul>
                                            <li><a href="#" data-toggle="modal" data-target="#exampleModal"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">快速预览</span></a></li>
                                            <li><a href="#"><i class="sli sli-heart"></i><span class="ht-product-action-tooltip">添加到购物车</span></a></li>
                                            <li><a href="#"><i class="sli sli-refresh"></i><span class="ht-product-action-tooltip">Add to Compare</span></a></li>
                                            <li><a href="#"><i class="sli sli-bag"></i><span class="ht-product-action-tooltip">Add to Cart</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="ht-product-content">
                                    <div class="ht-product-content-inner">
                                   		<div class="ht-product-categories"><a href="#">4444444</a></div>
                                        <h4 class="ht-product-title"><a href="product-details.html">---产品名称---</a></h4>
                                        <div class="ht-product-price">
                                            <span class="new">￥60.00</span>
                                            <span class="old">￥80.00</span>
                                        </div>
                                        <div class="ht-product-ratting-wrap">
                                            <span class="ht-product-ratting">
                                                <span class="ht-product-user-ratting" style="width: 100%;">
                                                    <i class="sli sli-star"></i>
                                                    <i class="sli sli-star"></i>
                                                    <i class="sli sli-star"></i>
                                                    <i class="sli sli-star"></i>
                                                    <i class="sli sli-star"></i>
                                                </span>
                                            <i class="sli sli-star"></i>
                                            <i class="sli sli-star"></i>
                                            <i class="sli sli-star"></i>
                                            <i class="sli sli-star"></i>
                                            <i class="sli sli-star"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
						<!--Product End-->
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 人物介绍 -->
    <div class="testimonial-area pt-80 pb-95 section-margin-1" style="background-image: url(assets/img/bg/bg-1.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 ml-auto mr-auto">
                    <div class="testimonial-active owl-carousel nav-style-1">
                    
                    	<c:forEach items="${adminInfo }" var="a">
	                        <div class="single-testimonial text-center">
	                            <img src="${a.head }" alt="" style="width:90px;height:90px;">
	                            <p>${a.content }</p>
	                            <div class="client-info">
	                                <img src="assets/img/icon-img/testi.png" alt="">
	                                <h5>${a.name }</h5>
	                            </div>
	                        </div>
                    	</c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="product-area pt-95 pb-70">
        <div class="container">
            <div class="section-title text-center pb-60">
                <h2>新品推荐</h2>
                <p> 这里有最新最火热的商品，供君选择！</p>
            </div>
            <div class="arrivals-wrap scroll-zoom">
                <div class="ht-products product-slider-active owl-carousel">
                
                    <!--Product Start-->
                    <c:forEach items="${recomm }" var="r">
                    	<div class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
	                        <div class="ht-product-inner">
	                            <div class="ht-product-image-wrap">
	                                <a href="product-details.html" class="ht-product-image"> <img src="${r.imgPath }" alt="Universal Product Style"> </a>
	                                <div class="ht-product-action">
	                                    <ul>
	                                        <li><a href="#" data-toggle="modal" data-target="#exampleModal"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">快速预览</span></a></li>
	                                        <li><a href="#"><i class="sli sli-heart"></i><span class="ht-product-action-tooltip">添加到购物车</span></a></li>
	                                        <li><a href="#"><i class="sli sli-refresh"></i><span class="ht-product-action-tooltip">Add to Compare</span></a></li>
	                                        <li><a href="#"><i class="sli sli-bag"></i><span class="ht-product-action-tooltip">Add to Cart</span></a></li>
	                                    </ul>
	                                </div>
	                            </div>
	                            <div class="ht-product-content">
	                                <div class="ht-product-content-inner">
	                                    <div class="ht-product-categories"><a href="#">${r.categoryName }</a></div>
	                                    <h4 class="ht-product-title"><a href="#">${r.product.productname }</a></h4>
	                                    <div class="ht-product-price">
	                                        <span class="new">￥${r.product.price }</span>
	                                    </div>
	                                    <div class="ht-product-ratting-wrap">
	                                        <span class="ht-product-ratting">
	                                            <span class="ht-product-user-ratting" style="width: 100%;">
	                                                <i class="sli sli-star"></i>
	                                                <i class="sli sli-star"></i>
	                                                <i class="sli sli-star"></i>
	                                                <i class="sli sli-star"></i>
	                                                <i class="sli sli-star"></i>
	                                            </span>
	                                        <i class="sli sli-star"></i>
	                                        <i class="sli sli-star"></i>
	                                        <i class="sli sli-star"></i>
	                                        <i class="sli sli-star"></i>
	                                        <i class="sli sli-star"></i>
	                                        </span>
	                                    </div>
	                                </div>
	                               <!-- <div class="ht-product-action">
	                                    <ul>
	                                        <li><a href="#"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">Quick View</span></a></li>
	                                        <li><a href="#"><i class="sli sli-heart"></i><span class="ht-product-action-tooltip">Add to Wishlist</span></a></li>
	                                        <li><a href="#"><i class="sli sli-refresh"></i><span class="ht-product-action-tooltip">Add to Compare</span></a></li>
	                                        <li><a href="#"><i class="sli sli-bag"></i><span class="ht-product-action-tooltip">Add to Cart</span></a></li>
	                                    </ul>
	                                </div>
	                                <div class="ht-product-countdown-wrap">
	                                    <div class="ht-product-countdown" data-countdown="2020/01/01"></div>
	                                </div> -->
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                    <!--Product End-->
                </div>
            </div>
        </div>
    </div>
    
    
    
    <div class="feature-area">
        <div class="container">
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-4">
                    <div class="single-feature mb-40">
                        <div class="feature-icon">
                            <img src="assets/img/icon-img/free-shipping.png" alt="">
                        </div>
                        <div class="feature-content">
                            <h4>免费航运</h4>
                            <p>多数产品支持免费 <br>航运.</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-5 col-lg-4 col-md-4">
                    <div class="single-feature mb-40 pl-50">
                        <div class="feature-icon">
                            <img src="assets/img/icon-img/support.png" alt="">
                        </div>
                        <div class="feature-content">
                            <h4>客户服务</h4>
                            <p>全天候在线客服.</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-4">
                    <div class="single-feature mb-40">
                        <div class="feature-icon">
                            <img src="assets/img/icon-img/security.png" alt="">
                        </div>
                        <div class="feature-content">
                            <h4>安全付款</h4>
                            <p>最安全的客户 <br>支付.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="blog-area pt-50 pb-65">
        <div class="container">
            <div class="section-title text-center pb-60">
                <h2>最新博客</h2>
                <p> ----------介绍---------</p>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="blog-wrap mb-30 mr-20 text-center scroll-zoom">
                        <div class="blog-img mb-25">
                            <a href="blog-details.html"><img src="assets/img/blog/blog-1.jpg" alt=""></a>
                        </div>
                        <div class="blog-content">
                            <h3><a href="blog-details.html">Distracted by the readable content</a></h3>
                            <div class="blog-meta blog-mrg-border">
                                <ul>
                                    <li><a href="#">23 December 2019 </a></li>
                                    <li><a href="#"> 24 View </a></li>
                                    <li><a href="#">4 likes</a></li>
                                </ul>
                            </div>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="blog-wrap mb-30 ml-20 text-center scroll-zoom">
                        <div class="blog-img mb-25">
                            <a href="blog-details.html"><img src="assets/img/blog/blog-2.jpg" alt=""></a>
                        </div>
                        <div class="blog-content">
                            <h3><a href="blog-details.html">There are many variations of passages of Lorem</a></h3>
                            <div class="blog-meta blog-mrg-border">
                                <ul>
                                    <li><a href="#">23 December 2019 </a></li>
                                    <li><a href="#"> 24 View </a></li>
                                    <li><a href="#">4 likes</a></li>
                                </ul>
                            </div>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- 引入底部 -->
    <%@include file="common/footer.jsp" %>
    
    
    <!-- 快速预览 -->
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-5 col-sm-12 col-xs-12">
                            <div class="tab-content quickview-big-img">
                                <div id="pro-1" class="tab-pane fade show active">
                                    <img src="assets/img/product/quickview-l1.jpg" alt="">
                                </div>
                                <div id="pro-2" class="tab-pane fade">
                                    <img src="assets/img/product/quickview-l2.jpg" alt="">
                                </div>
                                <div id="pro-3" class="tab-pane fade">
                                    <img src="assets/img/product/quickview-l3.jpg" alt="">
                                </div>
                                <div id="pro-4" class="tab-pane fade">
                                    <img src="assets/img/product/quickview-l2.jpg" alt="">
                                </div>
                            </div>
                            Thumbnail Large Image End
                            Thumbnail Image End
                            <div class="quickview-wrap mt-15">
                                <div class="quickview-slide-active owl-carousel nav nav-style-2" role="tablist">
                                    <a class="active" data-toggle="tab" href="#pro-1"><img src="assets/img/product/quickview-s1.jpg" alt=""></a>
                                    <a data-toggle="tab" href="#pro-2"><img src="assets/img/product/quickview-s2.jpg" alt=""></a>
                                    <a data-toggle="tab" href="#pro-3"><img src="assets/img/product/quickview-s3.jpg" alt=""></a>
                                    <a data-toggle="tab" href="#pro-4"><img src="assets/img/product/quickview-s2.jpg" alt=""></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7 col-sm-12 col-xs-12">
                            <div class="product-details-content quickview-content">
                                <h2>Products Name Here</h2>
                                <div class="product-details-price">
                                    <span>$18.00 </span>
                                    <span class="old">$20.00 </span>
                                </div>
                                <div class="pro-details-rating-wrap">
                                    <div class="pro-details-rating">
                                        <i class="sli sli-star yellow"></i>
                                        <i class="sli sli-star yellow"></i>
                                        <i class="sli sli-star yellow"></i>
                                        <i class="sli sli-star"></i>
                                        <i class="sli sli-star"></i>
                                    </div>
                                    <span>3 Reviews</span>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisic elit eiusm tempor incidid ut labore et dolore magna aliqua. Ut enim ad minim venialo quis nostrud exercitation ullamco</p>
                                <div class="pro-details-list">
                                    <ul>
                                        <li>- 0.5 mm Dail</li>
                                        <li>- Inspired vector icons</li>
                                        <li>- Very modern style  </li>
                                    </ul>
                                </div>
                                <div class="pro-details-size-color">
                                    <div class="pro-details-color-wrap">
                                        <span>Color</span>
                                        <div class="pro-details-color-content">
                                            <ul>
                                                <li class="blue"></li>
                                                <li class="maroon active"></li>
                                                <li class="gray"></li>
                                                <li class="green"></li>
                                                <li class="yellow"></li>
                                                <li class="white"></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="pro-details-size">
                                        <span>Size</span>
                                        <div class="pro-details-size-content">
                                            <ul>
                                                <li><a href="#">s</a></li>
                                                <li><a href="#">m</a></li>
                                                <li><a href="#">l</a></li>
                                                <li><a href="#">xl</a></li>
                                                <li><a href="#">xxl</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="pro-details-quality">
                                    <div class="cart-plus-minus">
                                        <input class="cart-plus-minus-box" type="text" name="qtybutton" value="2">
                                    </div>
                                    <div class="pro-details-cart">
                                        <a href="#">Add To Cart</a>
                                    </div>
                                    <div class="pro-details-wishlist">
                                        <a title="Add To Wishlist" href="#"><i class="sli sli-heart"></i></a>
                                    </div>
                                    <div class="pro-details-compare">
                                        <a title="Add To Compare" href="#"><i class="sli sli-refresh"></i></a>
                                    </div>
                                </div>
                                <div class="pro-details-meta">
                                    <span>Categories :</span>
                                    <ul>
                                        <li><a href="#">Minimal,</a></li>
                                        <li><a href="#">Furniture,</a></li>
                                        <li><a href="#">Fashion</a></li>
                                    </ul>
                                </div>
                                <div class="pro-details-meta">
                                    <span>Tag :</span>
                                    <ul>
                                        <li><a href="#">Fashion, </a></li>
                                        <li><a href="#">Furniture,</a></li>
                                        <li><a href="#">Electronic</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal end -->
</div>

<!-- 引入底部链接 -->
<%@include file="common/footer_link.jsp" %>

<script type="text/javascript">
 
	function getProducts(name) {
		$.post("newProducts", {
			categoryName : name
		}, function(data) {
			if (data != null) {
				setProduct(data);
			}
		});
	}
	
	function setProduct(data) {
		for(var i = 0; i < data.length; i++){
			$('#prduct-img').append(
			'<div class="owl-item cloned active" style="width: 270px; margin-right: 30px;">'
				+'<div class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">'
	            +'<div class="ht-product-inner">'
	            +'<div class="ht-product-image-wrap">'
	            +'<a href="product-details.html" class="ht-product-image"> <img src="assets/img/product/product-1.jpg" alt="Universal Product Style"> </a>'
	            +'<div class="ht-product-action">'
	            +'<ul>'
	            +'<li><a href="#" data-toggle="modal" data-target="#exampleModal"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">快速预览</span></a></li>'
	            +'<li><a href="#"><i class="sli sli-heart"></i><span class="ht-product-action-tooltip">添加到购物车</span></a></li>'
	            +'<li><a href="#"><i class="sli sli-refresh"></i><span class="ht-product-action-tooltip">Add to Compare</span></a></li>'
	            +'<li><a href="#"><i class="sli sli-bag"></i><span class="ht-product-action-tooltip">Add to Cart</span></a></li>'
	            +'</ul>'
	            +'</div>'
	            +'</div>'
	            +'<div class="ht-product-content">'
	            +'<div class="ht-product-content-inner">'
	            +'<div class="ht-product-categories"><a href="#">4444444</a></div>'
	            +'<h4 class="ht-product-title"><a href="product-details.html">---产品名称---</a></h4>'
	            +'<div class="ht-product-price">'
	            +'<span class="new">￥60.00</span>'
	            +'<span class="old">￥80.00</span>'
	            +'</div>'
	            +'<div class="ht-product-ratting-wrap">'
	            +'<span class="ht-product-ratting">'
	            +'<span class="ht-product-user-ratting" style="width: 100%;">'
	            +'<i class="sli sli-star"></i>'
	            +'<i class="sli sli-star"></i>'
	            +'<i class="sli sli-star"></i>'
	            +'<i class="sli sli-star"></i>'
	            +'<i class="sli sli-star"></i>'
	            +'</span>'
	            +'<i class="sli sli-star"></i>'
	            +'<i class="sli sli-star"></i>'
	            +'<i class="sli sli-star"></i>'
	            +'<i class="sli sli-star"></i>'
	            +'<i class="sli sli-star"></i>'
	            +'</span>'
	            +'</div>'
	            +'</div>'
	            +'</div>'
	            +'</div>'
				+'</div>'
			+'</div>');
		}
	}
</script>
</body>

</html>
    