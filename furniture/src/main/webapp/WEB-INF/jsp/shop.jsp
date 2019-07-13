<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Our House-商城</title>

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
						<li><a href="index">首页</a></li>
						<li class="active">商品</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="shop-area pt-95 pb-100">
			<div class="container">
				<div class="row flex-row-reverse">
					<div class="col-lg-9">

						<!-- 按条件展示商品 -->
						<div class="shop-top-bar">
							<div class="select-shoing-wrap">
								<div class="shop-select">
									<!-- <select>
										<option value="">按新品排序</option>
										<option value="">s</option>
										<option value="">Z to A</option>
										<option value="">有货</option>
									</select> -->
								</div>
								总记录数：<p>${result.totalSize }</p>
							</div>
							<div class="shop-tab nav">
								<a class="active" href="#shop-1" data-toggle="tab"> <i
									class="sli sli-grid"></i>
								</a> <a href="#shop-2" data-toggle="tab"> <i
									class="sli sli-menu"></i>
								</a>
							</div>
						</div>

						<!-- 商品展示（网格或列表） -->
						<div class="shop-bottom-area mt-35">
							<div class="tab-content jump">

								<!-- 网格视图展示货品 -->
								<div id="shop-1" class="tab-pane active">
									<div class="row ht-products" id="gridList">

										<!-- 货品循环显示 -->
										<!--Product Start-->
										<c:forEach items="${result.data }" var="product">
											<div class="col-xl-4 col-md-6 col-lg-6 col-sm-6">
												<div
													class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
													<div class="ht-product-inner">
														<div class="ht-product-image-wrap">
															<a href="product-details?pid=${product.pid }"
																class="ht-product-image"> <img
																src="${product.images[0].imgpath }"
																alt="Universal Product Style">
															</a>
															<div class="ht-product-action">
																<ul>
																	<li><a href="#" onclick="quickView(${product.pid})" data-toggle="modal"
                                                                            data-target="#exampleModal">
                                                                            <i class="sli sli-magnifier"></i><span
																			class="ht-product-action-tooltip">快速预览</span></a></li>
																	<li><a href="#" onclick="addWishlist(${product.pid})"><i class="sli sli-heart"></i><span
																			class="ht-product-action-tooltip">添加到愿望清单</span></a></li>										
																	<li><a href="javascript:void(0)" onclick="addCart('${product.pid}','${product.price}','${product.images[0].imgpath }')">
																	<i class="sli sli-bag"></i><span class="ht-product-action-tooltip">添加到购物车</span></a></li>
																	<li><a href="#" onclick="compare(${product.pid})"><i class="sli sli-refresh"></i><span
																			class="ht-product-action-tooltip">对比</span></a></li>
																</ul>
															</div>
														</div>
														<div class="ht-product-content">
															<div class="ht-product-content-inner">
																<div class="ht-product-categories">
																	<a href="#">${product.category.categoryname }</a>
																</div>
																<h4 class="ht-product-title">
																	<a href="product-details?pid=${product.pid }">${product.model } ${product.productname }</a>
																</h4>
																<div class="ht-product-price">
																	￥<span class="new">${product.price }</span>
																	<!-- ￥<span class="old">$80.00</span> -->
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
                                                                    <li><a href="#" onclick="quickView(${product.pid})" data-toggle="modal"
                                                                            data-target="#exampleModal">
                                                                            <i class="sli sli-magnifier"></i><span
                                                                            class="ht-product-action-tooltip">快速预览</span></a></li>
                                                                    <li><a href="#" onclick="addWishlist(${product.pid})"><i class="sli sli-heart"></i><span
                                                                            class="ht-product-action-tooltip">添加到愿望清单</span></a></li>
                                                                    
                                                                    <li><a href="javascript:void(0)" onclick="addCart('${product.pid}','${product.price}','${product.images[0].imgpath }')">
                                                                    <i class="sli sli-bag"></i><span class="ht-product-action-tooltip">添加到购物车</span></a></li>
                                                                    <li><a href="#" onclick="compare(${product.pid})"><i class="sli sli-refresh"></i><span
                                                                            class="ht-product-action-tooltip">对比</span></a></li>
                                                                    
                                                                </ul>
															</div>
															<div class="ht-product-countdown-wrap">
																<div class="ht-product-countdown"
																	data-countdown="2020/01/01"></div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										<!--Product End-->

									</div>
								</div>

								<input type="hidden" value="${result.data.get(0).category.cid }"
									id="categoryid">

								<!-- 列表展示货品 -->
								<div id="shop-2" class="tab-pane">

									<!-- 货品循环显示 -->
									<c:forEach items="${result.data }" var="product">
										<div
											class="shop-list-wrap shop-list-mrg2 shop-list-mrg-none mb-30">
											<div class="row">
												<div class="col-lg-4 col-md-4">
													<div class="product-list-img">
														<a href="product-details?pid=${product.pid }"> <img
															src="${product.images[0].imgpath }"
															alt="Universal Product Style">
														</a>
														<div class="product-quickview">
															<a href="#" title="Quick View" data-toggle="modal"
																data-target="#exampleModal" onclick="quickView(${product.pid})"><i
																class="sli sli-magnifier-add"></i></a>
														</div>
													</div>
												</div>
												<div class="col-lg-8 col-md-8 align-self-center">
													<div class="shop-list-content">
														<h3>
															<a href="product-details?pid=${product.pid }">${product.model } ${product.productname }</a>
														</h3>
														<p>It has roots in a piece of classical Latin
															literature from 45 BC, making it over 2000 years old.
															Richard The standard chunk.</p>
														<span>Chair</span>
														<div class="shop-list-price-action-wrap">
															<div class="shop-list-price-ratting">
																<div class="ht-product-list-price">
																	<span class="new">${product.price }</span>
																	<!-- <span class="old">$70.00</span> -->
																</div>
																
																	<span class="ht-product-list-ratting">
			                                                            <c:forEach begin="1" end="${product.score }">
	                                                                        <i class="sli sli-star"></i>
	                                                                    </c:forEach>    	                                                                     
			                                                        </span>
		                                                              <c:forEach begin="${product.score }" end="4">
                                                                            &nbsp;&nbsp;<i class="sli sli-star"></i>
                                                                      </c:forEach> 
		                                                        
															</div>
															<div class="ht-product-list-action">
																<a class="list-wishlist" title="添加到愿望清单" href="#" onclick="addWishlist(${product.pid})"><i
																	class="sli sli-heart"></i></a> <a class="list-cart"
																	title="添加到购物车" href="javascript:void(0)" onclick="addCart('${product.pid}','${product.price}','${product.images[0].imgpath }')"><i
																	class="sli sli-basket-loaded"></i> 添加到购物车</a> <a
																	class="list-refresh" title="对比" href="#" onclick="compare(${product.pid})"><i
																	class="sli sli-refresh"></i></a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>

							</div>

							<!-- 分页 -->
							<div class="pro-pagination-style text-center mt-30" >
							    <input type="hidden" value="1" id="pageNum">
							    <input type="hidden" value="1" id="totalPage">
								<ul id="page-field">
								    <li><a href="shop?cid=${result.data.get(0).category.cid }&page=1">首页</a></li>
									<li><a class="prev" href="shop?cid=${result.data.get(0).category.cid }&page=${result.page-1>0?result.page-1:1 }"><i
											class="sli sli-arrow-left"></i></a></li>
									<c:if test="${result.page-1>0 }">
									   <li><a href="shop?cid=${result.data.get(0).category.cid }&page=${result.page-1>0?result.page-1:1 }">${result.page-1>0?result.page-1:1 }</a></li>
									</c:if>								
									<li><a class="active" href="#">${result.page }</a></li>									
									<c:if test="${result.page<result.totalPage }">
									   <li><a href="shop?cid=${result.data.get(0).category.cid }&page=${result.page+1 }">${result.page+1 }</a></li>
									</c:if>
									<li><a class="next" href="shop?cid=${result.data.get(0).category.cid }&page=${result.page+1<result.totalPage?result.page+1:result.totalPage }"><i
											class="sli sli-arrow-right"></i></a></li>
									<li><a href="shop?cid=${result.data.get(0).category.cid }&page=${result.totalPage }">末页</a></li>
								</ul>
							</div>
						</div>
					</div>

					<!-- 侧栏 -->
					<div class="col-lg-3">
						<div class="sidebar-style mr-30">
							<div class="sidebar-widget">
								<h4 class="pro-sidebar-title">搜索</h4>
								<div class="pro-sidebar-search mb-50 mt-25">
									<form class="pro-sidebar-search-form" action="condition.do" onsubmit="return checkProductname()">
										<input type="text" placeholder="在此处根据产品名搜索..." name="condition" id="condition">
										<button>
											<i class="sli sli-magnifier"></i>
										</button>
									</form>
								</div>
							</div>
							<div class="sidebar-widget">
								<h4 class="pro-sidebar-title">提炼</h4>
								<div class="sidebar-widget-list mt-30">
									<ul>
										<li>
											<div class="sidebar-widget-list-left">
												<input type="checkbox" id="onSale" onchange="getAllSelect()">
												<a href="#">在售 <!-- <span>4</span> -->
												</a> <span class="checkmark"></span>
											</div>
										</li>
										<li>
											<div class="sidebar-widget-list-left">
												<input type="checkbox" id="newProduct" value=""
													onchange="getAllSelect()"> <a href="#">新品 <!-- <span>5</span> --></a>
												<span class="checkmark"></span>
											</div>
										</li>
										
									</ul>
								</div>
							</div>
							<div class="sidebar-widget mt-45">
								<h4 class="pro-sidebar-title">价格区间</h4>
								<div class="price-filter mt-10">
									<div class="price-slider-amount">
										<input type="text" id="amount" name="price"
											placeholder="Add Your Price" />
									</div>
									<div id="slider-range" onmouseup="getAllSelect()"></div>
								</div>
							</div>
							<div class="sidebar-widget mt-50">
								<h4 class="pro-sidebar-title">分类</h4>
								<div class="sidebar-widget-list mt-20">
									<ul>
										<c:forEach items="${categoryList }" var="category">
											<li>
												<div class="sidebar-widget-list-left">
													 <a
														href="shop?cid=${category.cid }">${category.categoryname }
													</a> <span class="checkmark"></span>
												</div>
											</li>
										</c:forEach>

									</ul>
								</div>
							</div>
							<div class="sidebar-widget mt-50">
								<h4 class="pro-sidebar-title">标签</h4>
								<div class="sidebar-widget-tag mt-25">
									<ul>
										<li><a href="#">配饰</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 引入底部 -->
		<%@include file="common/footer.jsp"%>

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
										
										<div class="pro-details-cart">
											<a href="javascript:void(0)" id="addCartByPid" onclick="addCart()">添加到购物车</a>
										</div>
										<div class="pro-details-wishlist">
											<a title="添加到愿望清单" href="#" id="addWishListByPid"><i
												class="sli sli-heart"></i></a>
										</div>
										<div class="pro-details-compare">
											<a title="对比" href="#" id="addCompareListByPid"><i
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

	<!-- 引入底部链接 -->
	<%@include file="common/footer_link.jsp" %>
	
</body>
</html>
