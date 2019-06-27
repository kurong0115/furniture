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
							<h2>${product.model } ${product.productname }</h2>
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
								<div class="pro-details-cart btn-hover">
									<a href="javascript:void(0)" onclick="addCart('${product.pid}','${product.price}','${product.images[0].imgpath }')">添加到购物车</a>
								</div>
								<div class="pro-details-wishlist">
									<a title="添加到愿望清单" href="#"><i
										class="sli sli-heart"></i></a>
								</div>
								<div class="pro-details-compare">
									<a title="对比" href="#" onclick="compare(${product.pid})"><i
										class="sli sli-refresh"></i></a>
								</div>
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
									   <c:forEach items="${remarks }" var="remark">
									       <div class="single-review">
                                            <div class="review-img">
                                                <img src="assets/img/product-details/client-1.jpg" alt="">
                                            </div>
                                            <div class="review-content">
                                                <p>${remark.content }</p>
                                                <div class="review-top-wrap">
                                                    <div class="review-name">
                                                        <h4>${remark.user.name }</h4>
                                                    </div>
                                                    <div class="review-rating">
                                                        <i class="sli sli-star"></i> <i class="sli sli-star"></i>
                                                        <i class="sli sli-star"></i> <i class="sli sli-star"></i>
                                                        <i class="sli sli-star"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
									   </c:forEach>																													
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
					<h2>相关商品</h2>
					<p>Contrary to popular belief, Lorem Ipsum is not simply random
						text. It has roots in a piece of classical</p>
				</div>
				<div class="arrivals-wrap scroll-zoom">
					<div class="ht-products product-slider-active owl-carousel">	
					    <c:forEach items="${relatedProducts }" var="product">
					       <!--Product Start-->
                        <div
                            class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
                            <div class="ht-product-inner">
                                <div class="ht-product-image-wrap">
                                    <a href="product-details?pid=${product.pid }" class="ht-product-image"> <img
                                        src="${product.images[0].imgpath }"
                                        alt="Universal Product Style">
                                    </a>
                                    <div class="ht-product-action">
                                        <ul>
                                            <li><a href="#" data-toggle="modal"
                                                data-target="#exampleModal" onclick="quickView(${product.pid})"><i class="sli sli-magnifier"></i><span
                                                    class="ht-product-action-tooltip">快速预览</span></a></li>
                                            <li><a href="#"><i class="sli sli-heart"></i><span
                                                    class="ht-product-action-tooltip">添加到愿望清单</span></a></li>
                                            <li><a href="#" onclick="compare(${product.pid})"><i class="sli sli-refresh"></i><span
                                                    class="ht-product-action-tooltip">对比</span></a></li>
                                            <li><a href="javascript:void(0)" onclick="addCart('${product.pid}','${product.price}','${product.images[0].imgpath }')"><i class="sli sli-bag"></i><span
                                                    class="ht-product-action-tooltip">添加到购物车</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="ht-product-content">
                                    <div class="ht-product-content-inner">
                                        <div class="ht-product-categories">
                                            <a href="#">${product.category.categoryname }</a>
                                        </div>
                                        <h4 class="ht-product-title">
                                            <a href="#">${product.productname }</a>
                                        </h4>
                                        <div class="ht-product-price">
                                            <span class="new">￥${product.price }</span> <span class="old">$80.00</span>
                                        </div>
                                        <div class="ht-product-ratting-wrap">
                                            <span class="ht-product-ratting">
                                                 <span class="ht-product-user-ratting" style="width: 100%;">
                                                     <c:forEach begin="1" end="${product.score }">
                                                         <i class="sli sli-star"></i>
                                                     </c:forEach>                                                                            
                                                 </span>
                                                 <c:forEach begin="1" end="${product.score }">
                                                       <i class="sli sli-star"></i>
                                                 </c:forEach>
                                                 <c:forEach begin="${product.score }" end="4">
                                                       <i class="sli sli-star"></i>
                                                 </c:forEach>
                                             </span>
                                        </div>
                                    </div>
                                    <div class="ht-product-action">
                                        <ul>
                                            <li><a href="#" onclick="quickView(${product.pid})"><i class="sli sli-magnifier"></i><span
                                                    class="ht-product-action-tooltip">Quick View</span></a></li>
                                            <li><a href="#"><i class="sli sli-heart"></i><span
                                                    class="ht-product-action-tooltip">Add to Wishlist</span></a></li>
                                            <li><a href="#" onclick="compare(${product.pid})"><i class="sli sli-refresh"></i><span
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
					    </c:forEach>   					
						
						
					</div>
				</div>
			</div>
		</div>
		
        <%@ include file="common/footer.jsp" %>
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
                            <div class="col-md-5 col-sm-12 col-xs-12" >
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
                                        ￥<span id="quickView-price">18.00 </span> <!-- ￥<span class="old">20.00 </span> -->
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
                                        <div class="cart-plus-minus">
                                            <input class="cart-plus-minus-box" type="text"
                                                name="qtybutton" value="1">
                                        </div>
                                        <div class="pro-details-cart">
                                            <a href="javascript:void(0)" onclick="addCart('${product.pid}','${product.price}','${product.images[0].imgpath }')">添加到购物车</a>
                                        </div>
                                        <div class="pro-details-wishlist">
                                            <a title="添加到愿望清单" href="#"><i
                                                class="sli sli-heart"></i></a>
                                        </div>
                                        <div class="pro-details-compare">
                                            <a title="对比" href="#" onclick="compare(${product.pid})"><i
                                                class="sli sli-refresh"></i></a>
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

	<!-- All JS is here
============================================ -->

	<!-- 引入底部链接 -->
	<%@include file="common/footer_link.jsp"%>
    
</body>

</html>
