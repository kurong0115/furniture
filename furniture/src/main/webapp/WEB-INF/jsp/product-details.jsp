<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>商品信息</title>

<!-- 引入首部链接 -->
<%@include file="common/header_link.jsp"%>
</head>

<body>
	<div class="wrapper">

		<!-- 引入首部 -->
		<%@include file="common/header.jsp"%>


		<div class="breadcrumb-area pt-35 pb-35 bg-gray">
			<div class="container">
				<div class="breadcrumb-content text-center">
					<ul>
						<li><a href="index">主页</a></li>
						<li class="active">详细信息</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="product-details-area pt-100 pb-95">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="product-details-img">
							<div class="zoompro-border zoompro-span">
								<img class="zoompro" src="${product.images[0].imgpath }"
									data-zoom-image="${product.images[0].imgpath }" alt="" /> <span>-29%</span>
								<div class="product-video"></div>
							</div>
							<div id="gallery" class="mt-20 product-dec-slider">
								<c:forEach items="${product.images }" var="image">
									<a data-image="${image.imgpath }"
										data-zoom-image="${image.imgpath }"
										style="width: 100px; height: 100px"> <img
										src="${image.imgpath }" alt=""
										style="width: 100px; height: 100px">
									</a>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="product-details-content ml-30">
							<h2>${product.productname }</h2>
							<div class="product-details-price">
								￥<span>${product.price }</span>
								<!-- <span class="old">$20.00 </span> -->
							</div>
							<div class="pro-details-rating-wrap">
								<div class="pro-details-rating">
									<c:forEach begin="1" end="${product.score }">
										<i class="sli sli-star yellow"></i>
									</c:forEach>
									<c:forEach begin="${product.score }" end="4">
                                        <i class="sli sli-star"></i>
                                    </c:forEach>
									
									<!--  
                                <i class="sli sli-star yellow"></i>
                                <i class="sli sli-star yellow"></i>
                                <i class="sli sli-star yellow"></i>
                                <i class="sli sli-star yellow"></i>-->
								</div>
								<span>库存：<a href="#">${product.stock }</a></span>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipisic elit
								eiusm tempor incidid ut labore et dolore magna aliqua. Ut enim
								ad minim venialo quis nostrud exercitation ullamco</p>
							<div class="pro-details-list">
								<ul>
									<li>- ${product.description == ''?'':fn:split(product.description,",")[0] }</li>
									<li>- ${product.description == ''?'':fn:split(product.description,",")[1] }</li>
									<li>- ${product.description == ''?'':fn:split(product.description,",")[2] }</li>
								</ul>
							</div>

							<div class="pro-details-quality">
								<div class="cart-plus-minus">
									<input class="cart-plus-minus-box" type="text" name="qtybutton"
										value="1">
								</div>
								<div class="pro-details-cart btn-hover">
									<a href="#">添加到购物车</a>
								</div>
								<div class="pro-details-wishlist">
									<a title="Add To Wishlist" href="#"><i
										class="sli sli-heart"></i></a>
								</div>
								<div class="pro-details-compare">
									<a title="Add To Compare" href="#"><i
										class="sli sli-refresh"></i></a>
								</div>
							</div>
							<div class="pro-details-meta">
								<span>分类:<a href="shop?cid=${product.category.cid }">${product.category.categoryname }</a></span>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="description-review-area pb-95">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-8">
						<div class="description-review-wrapper">
							<div class="description-review-topbar nav">
								<a class="active" data-toggle="tab" href="#des-details1">描述</a>
								<a data-toggle="tab" href="#des-details3">附加信息</a> <a
									data-toggle="tab" href="#des-details2">评论</a>
							</div>
							<div class="tab-content description-review-bottom">
								<div id="des-details1" class="tab-pane active">
									<div class="product-description-wrapper">
										<p>${product.content }</p>
									</div>
								</div>
								<div id="des-details3" class="tab-pane">
									<div class="product-anotherinfo-wrapper">
										<div class="pro-details-list">
											<ul>
												<li>- ${product.description == ''?'':fn:split(product.description,",")[0] }</li>
												<li>- ${product.description == ''?'':fn:split(product.description,",")[1] }</li>
												<li>- ${product.description == ''?'':fn:split(product.description,",")[2] }</li>
											</ul>
										</div>
									</div>
								</div>
								<div id="des-details2" class="tab-pane">
									<div class="review-wrapper">
										<div class="single-review">
											<div class="review-img">
												<img src="assets/img/product-details/client-1.jpg" alt="">
											</div>
											<div class="review-content">
												<p>“In convallis nulla et magna congue convallis. Donec
													eu nunc vel justo maximus posuere. Sed viverra nunc erat, a
													efficitur nibh”</p>
												<div class="review-top-wrap">
													<div class="review-name">
														<h4>Stella McGee</h4>
													</div>
													<div class="review-rating">
														<i class="sli sli-star"></i> <i class="sli sli-star"></i>
														<i class="sli sli-star"></i> <i class="sli sli-star"></i>
														<i class="sli sli-star"></i>
													</div>
												</div>
											</div>
										</div>
										<div class="single-review">
											<div class="review-img">
												<img src="assets/img/product-details/client-2.jpg" alt="">
											</div>
											<div class="review-content">
												<p>“In convallis nulla et magna congue convallis. Donec
													eu nunc vel justo maximus posuere. Sed viverra nunc erat, a
													efficitur nibh”</p>
												<div class="review-top-wrap">
													<div class="review-name">
														<h4>Stella McGee</h4>
													</div>
													<div class="review-rating">
														<i class="sli sli-star"></i> <i class="sli sli-star"></i>
														<i class="sli sli-star"></i> <i class="sli sli-star"></i>
														<i class="sli sli-star"></i>
													</div>
												</div>
											</div>
										</div>
										<div class="single-review">
											<div class="review-img">
												<img src="assets/img/product-details/client-3.jpg" alt="">
											</div>
											<div class="review-content">
												<p>“In convallis nulla et magna congue convallis. Donec
													eu nunc vel justo maximus posuere. Sed viverra nunc erat, a
													efficitur nibh”</p>
												<div class="review-top-wrap">
													<div class="review-name">
														<h4>Stella McGee</h4>
													</div>
													<div class="review-rating">
														<i class="sli sli-star"></i> <i class="sli sli-star"></i>
														<i class="sli sli-star"></i> <i class="sli sli-star"></i>
														<i class="sli sli-star"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="ratting-form-wrapper">
										<span>Add a Review</span>
										<p>
											Your email address will not be published. Required fields are
											marked <span>*</span>
										</p>
										<div class="star-box-wrap">
											<div class="single-ratting-star">
												<i class="sli sli-star"></i>
											</div>
											<div class="single-ratting-star">
												<i class="sli sli-star"></i> <i class="sli sli-star"></i>
											</div>
											<div class="single-ratting-star">
												<i class="sli sli-star"></i> <i class="sli sli-star"></i> <i
													class="sli sli-star"></i>
											</div>
											<div class="single-ratting-star">
												<i class="sli sli-star"></i> <i class="sli sli-star"></i> <i
													class="sli sli-star"></i> <i class="sli sli-star"></i>
											</div>
											<div class="single-ratting-star">
												<i class="sli sli-star"></i> <i class="sli sli-star"></i> <i
													class="sli sli-star"></i> <i class="sli sli-star"></i> <i
													class="sli sli-star"></i>
											</div>
										</div>
										<div class="ratting-form">
											<form action="#">
												<div class="row">
													<div class="col-md-12">
														<div class="rating-form-style mb-20">
															<label>Your review <span>*</span></label>
															<textarea name="Your Review"></textarea>
														</div>
													</div>
													<div class="col-md-12">
														<div class="rating-form-style mb-20">
															<label>Name <span>*</span></label> <input type="text">
														</div>
													</div>
													<div class="col-md-12">
														<div class="rating-form-style mb-20">
															<label>Email <span>*</span></label> <input type="email">
														</div>
													</div>
													<div class="col-lg-12">
														<div class="form-submit">
															<input type="submit" value="Submit">
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4">
						<div class="pro-dec-banner">
							<a href="#"><img src="assets/img/banner/banner-15.png" alt=""></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="product-area pb-70">
			<div class="container">
				<div class="section-title text-center pb-60">
					<h2>Related products</h2>
					<p>Contrary to popular belief, Lorem Ipsum is not simply random
						text. It has roots in a piece of classical</p>
				</div>
				<div class="arrivals-wrap scroll-zoom">
					<div class="ht-products product-slider-active owl-carousel">
						<!--Product Start-->
						<div
							class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
							<div class="ht-product-inner">
								<div class="ht-product-image-wrap">
									<a href="product-details.html" class="ht-product-image"> <img
										src="assets/img/product/product-5.jpg"
										alt="Universal Product Style">
									</a>
									<div class="ht-product-action">
										<ul>
											<li><a href="#" data-toggle="modal"
												data-target="#exampleModal"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
											<li><a href="#"><i class="sli sli-heart"></i><span
													class="ht-product-action-tooltip">Add to Wishlist</span></a></li>
											<li><a href="#"><i class="sli sli-refresh"></i><span
													class="ht-product-action-tooltip">Add to Compare</span></a></li>
											<li><a href="#"><i class="sli sli-bag"></i><span
													class="ht-product-action-tooltip">Add to Cart</span></a></li>
										</ul>
									</div>
								</div>
								<div class="ht-product-content">
									<div class="ht-product-content-inner">
										<div class="ht-product-categories">
											<a href="#">Clock</a>
										</div>
										<h4 class="ht-product-title">
											<a href="#">Demo Product Name</a>
										</h4>
										<div class="ht-product-price">
											<span class="new">$60.00</span>
										</div>
										<div class="ht-product-ratting-wrap">
											<span class="ht-product-ratting"> <span
												class="ht-product-user-ratting" style="width: 100%;">
													<i class="sli sli-star"></i> <i class="sli sli-star"></i> <i
													class="sli sli-star"></i> <i class="sli sli-star"></i> <i
													class="sli sli-star"></i>
											</span> <i class="sli sli-star"></i> <i class="sli sli-star"></i> <i
												class="sli sli-star"></i> <i class="sli sli-star"></i> <i
												class="sli sli-star"></i>
											</span>
										</div>
									</div>
									<div class="ht-product-action">
										<ul>
											<li><a href="#"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
											<li><a href="#"><i class="sli sli-heart"></i><span
													class="ht-product-action-tooltip">Add to Wishlist</span></a></li>
											<li><a href="#"><i class="sli sli-refresh"></i><span
													class="ht-product-action-tooltip">Add to Compare</span></a></li>
											<li><a href="#"><i class="sli sli-bag"></i><span
													class="ht-product-action-tooltip">Add to Cart</span></a></li>
										</ul>
									</div>
									<div class="ht-product-countdown-wrap">
										<div class="ht-product-countdown" data-countdown="2020/01/01"></div>
									</div>
								</div>
							</div>
						</div>
						<!--Product End-->
						<!--Product Start-->
						<div
							class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
							<div class="ht-product-inner">
								<div class="ht-product-image-wrap">
									<a href="product-details.html" class="ht-product-image"> <img
										src="assets/img/product/product-6.jpg"
										alt="Universal Product Style">
									</a>
									<div class="ht-product-action">
										<ul>
											<li><a href="#" data-toggle="modal"
												data-target="#exampleModal"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
											<li><a href="#"><i class="sli sli-heart"></i><span
													class="ht-product-action-tooltip">Add to Wishlist</span></a></li>
											<li><a href="#"><i class="sli sli-refresh"></i><span
													class="ht-product-action-tooltip">Add to Compare</span></a></li>
											<li><a href="#"><i class="sli sli-bag"></i><span
													class="ht-product-action-tooltip">Add to Cart</span></a></li>
										</ul>
									</div>
								</div>
								<div class="ht-product-content">
									<div class="ht-product-content-inner">
										<div class="ht-product-categories">
											<a href="#">Lamp </a>
										</div>
										<h4 class="ht-product-title">
											<a href="#">Demo Product Name</a>
										</h4>
										<div class="ht-product-price">
											<span class="new">$50.00</span> <span class="old">$80.00</span>
										</div>
										<div class="ht-product-ratting-wrap">
											<span class="ht-product-ratting"> <span
												class="ht-product-user-ratting" style="width: 90%;">
													<i class="sli sli-star"></i> <i class="sli sli-star"></i> <i
													class="sli sli-star"></i> <i class="sli sli-star"></i> <i
													class="sli sli-star"></i>
											</span> <i class="sli sli-star"></i> <i class="sli sli-star"></i> <i
												class="sli sli-star"></i> <i class="sli sli-star"></i> <i
												class="sli sli-star"></i>
											</span>
										</div>
									</div>
									<div class="ht-product-action">
										<ul>
											<li><a href="#"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
											<li><a href="#"><i class="sli sli-heart"></i><span
													class="ht-product-action-tooltip">Add to Wishlist</span></a></li>
											<li><a href="#"><i class="sli sli-refresh"></i><span
													class="ht-product-action-tooltip">Add to Compare</span></a></li>
											<li><a href="#"><i class="sli sli-bag"></i><span
													class="ht-product-action-tooltip">Add to Cart</span></a></li>
										</ul>
									</div>
									<div class="ht-product-countdown-wrap">
										<div class="ht-product-countdown" data-countdown="2020/01/01"></div>
									</div>
								</div>
							</div>
						</div>
						<!--Product End-->
						<!--Product Start-->
						<div
							class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
							<div class="ht-product-inner">
								<div class="ht-product-image-wrap">
									<a href="product-details.html" class="ht-product-image"> <img
										src="assets/img/product/product-7.jpg"
										alt="Universal Product Style">
									</a>
									<div class="ht-product-action">
										<ul>
											<li><a href="#" data-toggle="modal"
												data-target="#exampleModal"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
											<li><a href="#"><i class="sli sli-heart"></i><span
													class="ht-product-action-tooltip">Add to Wishlist</span></a></li>
											<li><a href="#"><i class="sli sli-refresh"></i><span
													class="ht-product-action-tooltip">Add to Compare</span></a></li>
											<li><a href="#"><i class="sli sli-bag"></i><span
													class="ht-product-action-tooltip">Add to Cart</span></a></li>
										</ul>
									</div>
								</div>
								<div class="ht-product-content">
									<div class="ht-product-content-inner">
										<div class="ht-product-categories">
											<a href="#">Chair</a>
										</div>
										<h4 class="ht-product-title">
											<a href="#">Demo Product Name</a>
										</h4>
										<div class="ht-product-price">
											<span class="new">$30.00</span>
										</div>
										<div class="ht-product-ratting-wrap">
											<span class="ht-product-ratting"> <span
												class="ht-product-user-ratting" style="width: 100%;">
													<i class="sli sli-star"></i> <i class="sli sli-star"></i> <i
													class="sli sli-star"></i> <i class="sli sli-star"></i> <i
													class="sli sli-star"></i>
											</span> <i class="sli sli-star"></i> <i class="sli sli-star"></i> <i
												class="sli sli-star"></i> <i class="sli sli-star"></i> <i
												class="sli sli-star"></i>
											</span>
										</div>
									</div>
									<div class="ht-product-action">
										<ul>
											<li><a href="#"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
											<li><a href="#"><i class="sli sli-heart"></i><span
													class="ht-product-action-tooltip">Add to Wishlist</span></a></li>
											<li><a href="#"><i class="sli sli-refresh"></i><span
													class="ht-product-action-tooltip">Add to Compare</span></a></li>
											<li><a href="#"><i class="sli sli-bag"></i><span
													class="ht-product-action-tooltip">Add to Cart</span></a></li>
										</ul>
									</div>
									<div class="ht-product-countdown-wrap">
										<div class="ht-product-countdown" data-countdown="2020/01/01"></div>
									</div>
								</div>
							</div>
						</div>
						<!--Product End-->
						<!--Product Start-->
						<div
							class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
							<div class="ht-product-inner">
								<div class="ht-product-image-wrap">
									<a href="product-details.html" class="ht-product-image"> <img
										src="assets/img/product/product-8.jpg"
										alt="Universal Product Style">
									</a>
									<div class="ht-product-action">
										<ul>
											<li><a href="#" data-toggle="modal"
												data-target="#exampleModal"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
											<li><a href="#"><i class="sli sli-heart"></i><span
													class="ht-product-action-tooltip">Add to Wishlist</span></a></li>
											<li><a href="#"><i class="sli sli-refresh"></i><span
													class="ht-product-action-tooltip">Add to Compare</span></a></li>
											<li><a href="#"><i class="sli sli-bag"></i><span
													class="ht-product-action-tooltip">Add to Cart</span></a></li>
										</ul>
									</div>
								</div>
								<div class="ht-product-content">
									<div class="ht-product-content-inner">
										<div class="ht-product-categories">
											<a href="#">Chair</a>
										</div>
										<h4 class="ht-product-title">
											<a href="#">Demo Product Name</a>
										</h4>
										<div class="ht-product-price">
											<span class="new">$60.00</span> <span class="old">$90.00</span>
										</div>
										<div class="ht-product-ratting-wrap">
											<span class="ht-product-ratting"> <span
												class="ht-product-user-ratting" style="width: 100%;">
													<i class="sli sli-star"></i> <i class="sli sli-star"></i> <i
													class="sli sli-star"></i> <i class="sli sli-star"></i> <i
													class="sli sli-star"></i>
											</span> <i class="sli sli-star"></i> <i class="sli sli-star"></i> <i
												class="sli sli-star"></i> <i class="sli sli-star"></i> <i
												class="sli sli-star"></i>
											</span>
										</div>
									</div>
									<div class="ht-product-action">
										<ul>
											<li><a href="#"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
											<li><a href="#"><i class="sli sli-heart"></i><span
													class="ht-product-action-tooltip">Add to Wishlist</span></a></li>
											<li><a href="#"><i class="sli sli-refresh"></i><span
													class="ht-product-action-tooltip">Add to Compare</span></a></li>
											<li><a href="#"><i class="sli sli-bag"></i><span
													class="ht-product-action-tooltip">Add to Cart</span></a></li>
										</ul>
									</div>
									<div class="ht-product-countdown-wrap">
										<div class="ht-product-countdown" data-countdown="2020/01/01"></div>
									</div>
								</div>
							</div>
						</div>
						<!--Product End-->
						<!--Product Start-->
						<div
							class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
							<div class="ht-product-inner">
								<div class="ht-product-image-wrap">
									<a href="product-details.html" class="ht-product-image"> <img
										src="assets/img/product/product-6.jpg"
										alt="Universal Product Style">
									</a>
									<div class="ht-product-action">
										<ul>
											<li><a href="#" data-toggle="modal"
												data-target="#exampleModal"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
											<li><a href="#"><i class="sli sli-heart"></i><span
													class="ht-product-action-tooltip">Add to Wishlist</span></a></li>
											<li><a href="#"><i class="sli sli-refresh"></i><span
													class="ht-product-action-tooltip">Add to Compare</span></a></li>
											<li><a href="#"><i class="sli sli-bag"></i><span
													class="ht-product-action-tooltip">Add to Cart</span></a></li>
										</ul>
									</div>
								</div>
								<div class="ht-product-content">
									<div class="ht-product-content-inner">
										<div class="ht-product-categories">
											<a href="#">Lamp </a>
										</div>
										<h4 class="ht-product-title">
											<a href="#">Demo Product Name</a>
										</h4>
										<div class="ht-product-price">
											<span class="new">$50.00</span> <span class="old">$80.00</span>
										</div>
										<div class="ht-product-ratting-wrap">
											<span class="ht-product-ratting"> <span
												class="ht-product-user-ratting" style="width: 90%;">
													<i class="sli sli-star"></i> <i class="sli sli-star"></i> <i
													class="sli sli-star"></i> <i class="sli sli-star"></i> <i
													class="sli sli-star"></i>
											</span> <i class="sli sli-star"></i> <i class="sli sli-star"></i> <i
												class="sli sli-star"></i> <i class="sli sli-star"></i> <i
												class="sli sli-star"></i>
											</span>
										</div>
									</div>
									<div class="ht-product-action">
										<ul>
											<li><a href="#"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
											<li><a href="#"><i class="sli sli-heart"></i><span
													class="ht-product-action-tooltip">Add to Wishlist</span></a></li>
											<li><a href="#"><i class="sli sli-refresh"></i><span
													class="ht-product-action-tooltip">Add to Compare</span></a></li>
											<li><a href="#"><i class="sli sli-bag"></i><span
													class="ht-product-action-tooltip">Add to Cart</span></a></li>
										</ul>
									</div>
									<div class="ht-product-countdown-wrap">
										<div class="ht-product-countdown" data-countdown="2020/01/01"></div>
									</div>
								</div>
							</div>
						</div>
						<!--Product End-->
					</div>
				</div>
			</div>
		</div>
		<footer class="footer-area bg-paleturquoise">
			<div class="container">
				<div class="footer-top text-center pt-45 pb-45">
					<nav>
						<ul>
							<li><a href="#">Home </a></li>
							<li><a href="#">Shop </a></li>
							<li><a href="#">Accessories </a></li>
							<li><a href="#">Contact </a></li>
							<li><a href="#">About </a></li>
							<li><a href="#">Blog </a></li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="footer-bottom border-top-1 pt-20">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-4 col-md-5 col-12">
							<div class="footer-social pb-20">
								<a href="#">Facebok</a> <a href="#">Twitter</a> <a href="#">Linkedin</a>
								<a href="#">Instagram</a>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-12">
							<div class="copyright text-center pb-20">
								<p>
									Copyright © All Right <a href="http://www.17sucai.com/"
										title="17sucai">Reserved</a>
								</p>
							</div>
						</div>
						<div class="col-lg-4 col-md-3 col-12">
							<div class="payment-mathod pb-20">
								<a href="#"><img src="assets/img/icon-img/payment.png"
									alt=""></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
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
								<!-- Thumbnail Large Image End -->
								<!-- Thumbnail Image End -->
								<div class="quickview-wrap mt-15">
									<div
										class="quickview-slide-active owl-carousel nav nav-style-2"
										role="tablist">
										<a class="active" data-toggle="tab" href="#pro-1"><img
											src="assets/img/product/quickview-s1.jpg" alt=""></a> <a
											data-toggle="tab" href="#pro-2"><img
											src="assets/img/product/quickview-s2.jpg" alt=""></a> <a
											data-toggle="tab" href="#pro-3"><img
											src="assets/img/product/quickview-s3.jpg" alt=""></a> <a
											data-toggle="tab" href="#pro-4"><img
											src="assets/img/product/quickview-s2.jpg" alt=""></a>
									</div>
								</div>
							</div>
							<div class="col-md-7 col-sm-12 col-xs-12">
								<div class="product-details-content quickview-content">
									<h2>Products Name Here</h2>
									<div class="product-details-price">
										<span>$18.00 </span> <span class="old">$20.00 </span>
									</div>
									<div class="pro-details-rating-wrap">
										<div class="pro-details-rating">
											<i class="sli sli-star yellow"></i> <i
												class="sli sli-star yellow"></i> <i
												class="sli sli-star yellow"></i> <i class="sli sli-star"></i>
											<i class="sli sli-star"></i>
										</div>
										<span>3 Reviews</span>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisic elit
										eiusm tempor incidid ut labore et dolore magna aliqua. Ut enim
										ad minim venialo quis nostrud exercitation ullamco</p>
									<div class="pro-details-list">
										<ul>
											<li>- 0.5 mm Dail</li>
											<li>- Inspired vector icons</li>
											<li>- Very modern style</li>
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
											<input class="cart-plus-minus-box" type="text"
												name="qtybutton" value="2">
										</div>
										<div class="pro-details-cart">
											<a href="#">Add To Cart</a>
										</div>
										<div class="pro-details-wishlist">
											<a title="Add To Wishlist" href="#"><i
												class="sli sli-heart"></i></a>
										</div>
										<div class="pro-details-compare">
											<a title="Add To Compare" href="#"><i
												class="sli sli-refresh"></i></a>
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

	<!-- All JS is here
============================================ -->

	<!-- 引入底部链接 -->
	<%@include file="common/footer_link.jsp"%>

</body>

</html>
