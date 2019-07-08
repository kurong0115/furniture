<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Our House-首页</title>
    
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
            	<!-- 循环展示分类 -->
            	<c:forEach items="${categorys }" var="c" varStatus="status">
            		<c:if test="${status.first }">
            			<a href="#product-1" class="active"  data-toggle="tab">
		                    <h4>${c } </h4>
		                </a>
            		</c:if>
            		<c:if test="${!status.first }">
            			<a href="#product-${status.count }" data-toggle="tab">
		                    <h4>${c } </h4>
		                </a>
            		</c:if>
            	</c:forEach>
            </div>
            <!-- 点击不同分类，展示该类下相应产品的图片及信息 -->
            <div class="tab-content jump-2">
            
                <!-- 循环展示 -->
                <c:forEach items="${products }" var="listPro" varStatus="status">
                	<!-- 默认显示第一个类下的产品 -->
                	<c:if test="${status.first }">
                		<div id="product-${status.count }" class="tab-pane active">
                	</c:if>
                	<c:if test="${!status.first }">
                		<div id="product-${status.count }" class="tab-pane">
                	</c:if>
	                    <div class="ht-products product-slider-active owl-carousel">
	                        
	                       	<!-- 循环滑动图片 -->
	                        <c:forEach items="${listPro }" var="pro">
	                        	<!--Product Start-->
								<div class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
		                            <div class="ht-product-inner">
		                                <div class="ht-product-image-wrap">
		                                    <a href="product-details.html" class="ht-product-image"> <img src="${pro.imgPath }" alt="Universal Product Style"> </a>
		                                    <div class="ht-product-action">
		                                        <ul>
		                                            <li><a href="#" onclick="quickView(${pro.pid})" data-toggle="modal" 
		                                            	data-target="#exampleModal">
		                                            	<i class="sli sli-magnifier"></i>
		                                            	<span class="ht-product-action-tooltip">快速预览</span>
		                                            </a></li>
		                                            <li><a href="#" onclick="addWishlist(${pro.pid})">
		                                            	<i class="sli sli-heart"></i>
		                                            	<span class="ht-product-action-tooltip">添加到愿望清单</span>
		                                            </a></li>
		                                            <li><a href="#" onclick="addCart('${pro.pid}','${pro.price}','${pro.imgPath }')">
		                                            	<i class="sli sli-bag"></i>
		                                            	<span class="ht-product-action-tooltip">添加到购物车</span>
		                                            </a></li>
		                                            <li><a href="#" onclick="compare(${pro.pid})">
		                                            	<i class="sli sli-refresh"></i>
		                                            	<span class="ht-product-action-tooltip">对比</span>
		                                            </a></li>
		                                        </ul>
		                                    </div>
		                                </div>
		                                <div class="ht-product-content">
		                                    <div class="ht-product-content-inner">
		                                   		<div class="ht-product-categories"><a href="#">${pro.category.categoryname }</a></div>
		                                        <h4 class="ht-product-title"><a href="product-details.html">${pro.productname }</a></h4>
		                                        <div class="ht-product-price">
		                                            <span class="new">￥${String.format("%.1f", pro.price*0.75)}</span>
		                                            <span class="old">￥${pro.price }</span>
		                                        </div>
		                                        <div class="ht-product-ratting-wrap">
		                                            <span class="ht-product-ratting">
		                                                <span class="ht-product-user-ratting" style="width: 100%;">
		                                                	<!-- 展示代表评分的星星数量 -->
		                                                	<c:forEach begin="1" end="${pro.score }">
						                                        <i class="sli sli-star"></i>
						                                    </c:forEach>
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
	                        </c:forEach>
	                        
	                    </div>
	                </div>
                </c:forEach>
                
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
	                                        <li><a href="#" onclick="quickView(${r.product.pid})" data-toggle="modal" data-target="#exampleModal">
	                                        	<i class="sli sli-magnifier"></i>
	                                        	<span class="ht-product-action-tooltip">快速预览</span>
	                                        </a></li>
	                                        <li><a href="#" onclick="addWishlist(${r.product.pid})">
	                                        	<i class="sli sli-heart"></i>
	                                        	<span class="ht-product-action-tooltip">添加到愿望清单</span>
	                                        </a></li>
	                                        <li><a href="javascript:void(0)" onclick="addCart('${r.product.pid}','${r.product.price}','${r.product.imgPath }')">
	                                        	<i class="sli sli-bag"></i>
	                                        	<span class="ht-product-action-tooltip">添加到购物车</span>
	                                        </a></li>
	                                        <li><a href="#" onclick="compare(${r.product.pid})">
	                                        	<i class="sli sli-refresh"></i>
	                                        	<span class="ht-product-action-tooltip">对比</span>
	                                        </a></li>
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
	                                                <!-- 展示代表评分的星星数量 -->
                                                	<c:forEach begin="1" end="${r.product.score }">
				                                        <i class="sli sli-star"></i>
				                                    </c:forEach>
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
                            <div class="tab-content quickview-big-img" id="bigImage">
                                
                            </div>
                            
                            <div class="quickview-wrap mt-15">
                                <div class="quickview-slide-active owl-carousel nav nav-style-2" role="tablist" id="smallImage">
                                
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7 col-sm-12 col-xs-12">
                            <div class="product-details-content quickview-content">
                                <h2 id="quickView-pname">Products Name Here</h2>
                                <div class="product-details-price">
									￥<span id="quickView-price">18.00 </span>
                                </div>
                                <div class="pro-details-rating-wrap">
                                    <div class="pro-details-rating" id="quickView-score">
                                        
                                    </div>
									 库存：<span id="stock"></span>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisic elit 
                                	eiusm tempor incidid ut labore et dolore magna aliqua. Ut enim 
                                	ad minim venialo quis nostrud exercitation ullamco</p>
                                <div class="pro-details-list">
                                    <ul id="quickView-size">
                                    
                                    </ul>
                                </div>
                                <div class="pro-details-size-color"></div>
                                <div class="pro-details-quality">
                                    
                                    <div class="pro-details-cart">
                                        <a href="javascript:void(0)" id="addCartByPid" onclick="addCart()">添加到购物车</a>
                                    </div>
                                    <div class="pro-details-wishlist">
                                        <a title="添加到愿望清单" href="#">
                                        <i class="sli sli-heart"></i></a>
                                    </div>
                                    <div class="pro-details-compare">
                                        <a title="对比" href="#">
                                        <i class="sli sli-refresh"></i></a>
                                    </div>
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
	function compare(pid){
		$.ajax({
			url:"addCompareInfo.do?pid=" + pid,
			method:"get",
			async:true,
			success:function(data){
				if (data.code != 1){
					getInfoMsg(data.message);
				}else{
					getSuccessMsg(data.message);
				}					
			},
			error:function(data){
				getFailMsg("服务器繁忙");
			}
		})
	}
</script>

</body>

</html>
    