<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>OURHOUSE-商品</title>
   
	<!-- 引入首部链接 -->
    <%@include file="common/header_link.jsp" %>
</head>

<body>
<div class="wrapper">
    
    <!-- 引入首部 -->
    <%@include file="common/header.jsp" %>
    
    
    <!-- ????????????????????? -->
    <!-- <div class="mobile-off-canvas-active">
        <a class="mobile-aside-close"><i class="sli sli-close"></i></a>
        <div class="header-mobile-aside-wrap">
            <div class="mobile-search">
                <form class="search-form" action="#">
                    <input type="text" placeholder="Search entire store…">
                    <button class="button-search"><i class="sli sli-magnifier"></i></button>
                </form>
            </div>
            <div class="mobile-menu-wrap">
                mobile menu start
                <div class="mobile-navigation">
                    mobile menu navigation start
                    <nav>
                        <ul class="mobile-menu">
                            <li class="menu-item-has-children"><a href="index">Home</a>
                                <ul class="dropdown">
                                    <li><a href="index">Home version 1 </a></li>
                                    <li><a href="index-2.html">Home version 2 </a></li>
                                    <li><a href="index-3.html">Home version 3 </a></li>
                                </ul>
                            </li>
                            <li class="menu-item-has-children "><a href="shop.html">shop</a>
                                <ul class="dropdown">
                                    <li class="menu-item-has-children"><a href="#">Shop Layout</a>
                                        <ul class="dropdown">
                                            <li><a href="shop.html">standard style</a></li>
                                            <li><a href="shop-grid-2-column.html">grid 2 column</a></li>
                                            <li><a href="shop-grid-4-column.html">grid 4 column</a></li>
                                            <li><a href="shop-grid-fullwide.html">grid full wide</a></li>
                                            <li><a href="shop-right-sidebar.html">grid right sidebar </a></li>
                                            <li><a href="shop-list-style1.html">list style 1</a></li>
                                            <li><a href="shop-list-style2.html">list style 2</a></li>
                                            <li><a href="shop-list-style3.html">list style 3</a></li>
                                            <li><a href="shop-list-fullwide.html">list full wide</a></li>
                                            <li><a href="shop-list-sidebar.html">list with sidebar </a></li>
                                        </ul>
                                    </li>
                                    <li class="menu-item-has-children"><a href="#">products details</a>
                                        <ul class="dropdown">
                                            <li><a href="product-details.html">tab style 1</a></li>
                                            <li><a href="product-details-tab-2.html">tab style 2</a></li>
                                            <li><a href="product-details-tab-3.html">tab style 3</a></li>
                                            <li><a href="product-details-gallery.html">gallery style  </a></li>
                                            <li><a href="product-details-gallery-right.html">gallery right</a></li>
                                            <li><a href="product-details-sticky.html">sticky style</a></li>
                                            <li><a href="product-details-sticky-right.html">sticky right</a></li>
                                            <li><a href="product-details-slider-box.html">slider style</a></li>
                                            <li><a href="product-details-affiliate.html">Affiliate style</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="shop.html">Accessories </a></li>
                            <li class="menu-item-has-children"><a href="#">pages</a>
                                <ul class="dropdown">
                                    <li><a href="about-us.html">about us </a></li>
                                    <li><a href="cart-page.html">cart page </a></li>
                                    <li><a href="checkout.html">checkout </a></li>
                                    <li><a href="compare-page.html">compare </a></li>
                                    <li><a href="wishlist.html">wishlist </a></li>
                                    <li><a href="my-account.html">my account </a></li>
                                    <li><a href="contact-us.html">contact us </a></li>
                                    <li><a href="login-register.html">login/register </a></li>
                                </ul>
                            </li>
                            <li class="menu-item-has-children "><a href="blog.html">Blog</a>
                                <ul class="dropdown">
                                    <li><a href="blog.html">standard style </a></li>
                                    <li><a href="blog-2-col.html">blog 2 column </a></li>
                                    <li><a href="blog-3-col.html">blog 3 column </a></li>
                                    <li><a href="blog-right-sidebar.html">blog right sidebar </a></li>
                                    <li><a href="blog-details.html">blog details </a></li>
                                    <li><a href="blog-details-right-sidebar.html">blog details right sidebar </a></li>
                                </ul>
                            </li>
                            <li><a href="contact-us.html">Contact us</a></li>
                        </ul>
                    </nav>
                    mobile menu navigation end
                </div>
                mobile menu end
            </div>
            <div class="mobile-curr-lang-wrap">
                <div class="single-mobile-curr-lang">
                    <a class="mobile-language-active" href="#">Language <i class="sli sli-arrow-down"></i></a>
                    <div class="lang-curr-dropdown lang-dropdown-active">
                        <ul>
                            <li><a href="#">English (US)</a></li>
                            <li><a href="#">English (UK)</a></li>
                            <li><a href="#">Spanish</a></li>
                        </ul>
                    </div>
                </div>
                <div class="single-mobile-curr-lang">
                    <a class="mobile-currency-active" href="#">Currency <i class="sli sli-arrow-down"></i></a>
                    <div class="lang-curr-dropdown curr-dropdown-active">
                        <ul>
                            <li><a href="#">USD</a></li>
                            <li><a href="#">EUR</a></li>
                            <li><a href="#">Real</a></li>
                            <li><a href="#">BDT</a></li>
                        </ul>
                    </div>
                </div>
                <div class="single-mobile-curr-lang">
                    <a class="mobile-account-active" href="#">My Account <i class="sli sli-arrow-down"></i></a>
                    <div class="lang-curr-dropdown account-dropdown-active">
                        <ul>
                            <li><a href="login-register.html">Login</a></li>
                            <li><a href="login-register.html">Creat Account</a></li>
                            <li><a href="my-account.html">My Account</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="mobile-social-wrap">
                <a class="facebook" href="#"><i class="sli sli-social-facebook"></i></a>
                <a class="twitter" href="#"><i class="sli sli-social-twitter"></i></a>
                <a class="pinterest" href="#"><i class="sli sli-social-pinterest"></i></a>
                <a class="instagram" href="#"><i class="sli sli-social-instagram"></i></a>
                <a class="google" href="#"><i class="sli sli-social-google"></i></a>
            </div>
        </div>
    </div> -->
    
    
    <div class="breadcrumb-area pt-35 pb-35 bg-gray">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <ul>
                    <li>
                        <a href="index">首页</a>
                    </li>
                    <li class="active">商品 </li>
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
                                <select>
                                    <option value="">按新品排序</option>
                                    <option value="">s</option>
                                    <option value=""> Z to A</option>
                                    <option value="">有货</option>
                                </select>
                            </div>
                            <p>Showing 1–12 of 20 result</p>
                        </div>
                        <div class="shop-tab nav">
                            <a class="active" href="#shop-1" data-toggle="tab">
                                <i class="sli sli-grid"></i>
                            </a>
                            <a href="#shop-2" data-toggle="tab">
                                <i class="sli sli-menu"></i>
                            </a>
                        </div>
                    </div>
                    
                    <!-- 商品展示（网格或列表） -->
                    <div class="shop-bottom-area mt-35">
                        <div class="tab-content jump">
                            
                            <!-- 网格视图展示货品 -->
                            <div id="shop-1" class="tab-pane active">
                                <div class="row ht-products">
                                
                                	<!-- 货品循环显示 -->
                                	<!--Product Start-->
                                	<c:forEach items="${productList }" var="product">
	                                    <div class="col-xl-4 col-md-6 col-lg-6 col-sm-6">
	                                        <div class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
	                                            <div class="ht-product-inner">
	                                                <div class="ht-product-image-wrap">
	                                                    <a href="product-details?pid=${product.pid }" class="ht-product-image"> <img src="${product.images[0].imgpath }" alt="Universal Product Style"> </a>
	                                                    <div class="ht-product-action">
	                                                        <ul>
	                                                            <li><a href="#" data-toggle="modal" data-target="#exampleModal"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">快速预览</span></a></li>
	                                                            <li><a href="#"><i class="sli sli-heart"></i><span class="ht-product-action-tooltip">添加到愿望清单</span></a></li>
	                                                            <li><a href="#"><i class="sli sli-refresh"></i><span class="ht-product-action-tooltip">刷新</span></a></li>
	                                                            <li><a href="#"><i class="sli sli-bag"></i><span class="ht-product-action-tooltip">添加到购物车</span></a></li>
	                                                        </ul>
	                                                    </div>
	                                                </div>
	                                                <div class="ht-product-content">
	                                                    <div class="ht-product-content-inner">
	                                                        <div class="ht-product-categories"><a href="#">${product.category.categoryname }</a></div>
	                                                        <h4 class="ht-product-title"><a href="product-details?pid=${product.pid }">${product.productname }</a></h4>
	                                                        <div class="ht-product-price">
									                                                            ￥<span class="new">${product.price }</span>
									                              <!-- ￥<span class="old">$80.00</span> -->
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
	                                                    <div class="ht-product-action">
	                                                        <ul>
	                                                            <li><a href="#"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">快速预览</span></a></li>
	                                                            <li><a href="#"><i class="sli sli-heart"></i><span class="ht-product-action-tooltip">添加到愿望清单</span></a></li>
	                                                            <li><a href="#"><i class="sli sli-refresh"></i><span class="ht-product-action-tooltip">刷新</span></a></li>
	                                                            <li><a href="#"><i class="sli sli-bag"></i><span class="ht-product-action-tooltip">添加到购物车</span></a></li>
	                                                        </ul>
	                                                    </div>
	                                                    <div class="ht-product-countdown-wrap">
	                                                        <div class="ht-product-countdown" data-countdown="2020/01/01"></div>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
                                    </c:forEach>
                                    <!--Product End-->
                                    
                                </div>
                            </div>
                            
                            <!-- 列表展示货品 -->
                            <div id="shop-2" class="tab-pane">
                            
                                <!-- 货品循环显示 -->
                                <c:forEach items="${productList }" var="product">
                                <div class="shop-list-wrap shop-list-mrg2 shop-list-mrg-none mb-30">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4">
                                            <div class="product-list-img">
                                                <a href="product-details?pid=${product.pid }">
                                                    <img src="${product.images[0].imgpath }" alt="Universal Product Style">
                                                </a>
                                                <div class="product-quickview">
                                                    <a href="#" title="Quick View" data-toggle="modal" data-target="#exampleModal"><i class="sli sli-magnifier-add"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8 col-md-8 align-self-center">
                                            <div class="shop-list-content">
                                                <h3><a href="product-details?pid=${product.pid }">${product.productname }</a></h3>
                                                <p>It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard The standard chunk.</p>
                                                <span>Chair</span>
                                                <div class="shop-list-price-action-wrap">
                                                    <div class="shop-list-price-ratting">
                                                        <div class="ht-product-list-price">
                                                            <span class="new">${product.price }</span>
                                                            <!-- <span class="old">$70.00</span> -->
                                                        </div>
                                                        <div class="ht-product-list-ratting">
                                                            <i class="sli sli-star"></i>
                                                            <i class="sli sli-star"></i>
                                                            <i class="sli sli-star"></i>
                                                            <i class="sli sli-star"></i>
                                                            <i class="sli sli-star"></i>
                                                        </div>
                                                    </div>
                                                    <div class="ht-product-list-action">
                                                        <a class="list-wishlist" title="添加到愿望清单" href="#"><i class="sli sli-heart"></i></a>
                                                        <a class="list-cart" title="添加到购物车" href="#"><i class="sli sli-basket-loaded"></i> 添加到购物车</a>
                                                        <a class="list-refresh" title="对比" href="#"><i class="sli sli-refresh"></i></a>
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
                        <div class="pro-pagination-style text-center mt-30">
                            <ul>
                                <li><a class="prev" href="#"><i class="sli sli-arrow-left"></i></a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a class="next" href="#"><i class="sli sli-arrow-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- 侧栏 -->
                <div class="col-lg-3">
                    <div class="sidebar-style mr-30">
                        <div class="sidebar-widget">
                            <h4 class="pro-sidebar-title">搜索 </h4>
                            <div class="pro-sidebar-search mb-50 mt-25">
                                <form class="pro-sidebar-search-form" action="condition">
                                    <input type="text" placeholder="在此处搜索..." name="condition">
                                    <button>
                                        <i class="sli sli-magnifier"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                        <div class="sidebar-widget">
                            <h4 class="pro-sidebar-title">提炼 </h4>
                            <div class="sidebar-widget-list mt-30">
                                <ul>
                                    <li>
                                        <div class="sidebar-widget-list-left">
                                            <input type="checkbox" id="onSale"> <a href="#">在售 <!-- <span>4</span> --> </a> 
                                            <span class="checkmark"></span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="sidebar-widget-list-left">
                                            <input type="checkbox" id="newProduct" value=""> <a href="#">新品 <!-- <span>5</span> --></a> 
                                            <span class="checkmark"></span>
                                        </div>
                                    </li>
                                    <!-- <li>
                                        <div class="sidebar-widget-list-left">
                                            <input type="checkbox" value=""> <a href="#">现货 <span>6</span> </a>
                                            <span class="checkmark"></span>
                                        </div>
                                    </li> -->
                                </ul>
                            </div>
                        </div>
                        <div class="sidebar-widget mt-45">
                            <h4 class="pro-sidebar-title">价格区间 </h4>
                            <div class="price-filter mt-10">
                                <div class="price-slider-amount">
                                    <input type="text" id="amount" name="price"  placeholder="Add Your Price" />
                                </div>
                                <div id="slider-range"></div>
                            </div>
                        </div>
                        <div class="sidebar-widget mt-50">
                            <h4 class="pro-sidebar-title">分类</h4>
                            <div class="sidebar-widget-list mt-20">
                                <ul>
                                    <c:forEach items="${categoryList }" var="category">
                                        <li>
	                                        <div class="sidebar-widget-list-left">
	                                           <a href="shop?cid=${category.cid }">${category.categoryname } <!-- <span>7</span> --> </a>
	                                            <span class="checkmark"></span> 
	                                        </div>
                                        </li>
                                    </c:forEach>
                                    
                                </ul>
                            </div>
                        </div>
                        <div class="sidebar-widget mt-50">
                            <h4 class="pro-sidebar-title">标签 </h4>
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
    <%@include file="common/footer.jsp" %>
    
    
    <!-- ??????????????????????? -->
    <!-- Modal -->
<<<<<<< HEAD
    
=======
>>>>>>> branch 'master' of https://github.com/kurong0115/furniture.git
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
    
</script>
</body>
</html>
    