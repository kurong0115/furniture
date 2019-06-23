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
    
    
    <!-- ??????????????????? -->
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
                            <li class="menu-item-has-children"><a href="index.html">首页</a>
                                <ul class="dropdown">
                                    <li><a href="index.html">Home version 1 </a></li>
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
    
    <!-- 第一排滑动大图 -->
    <div class="slider-area section-padding-1">
        <div class="slider-active owl-carousel nav-style-1">
            
            <!-- 循环展示 -->
            <div class="single-slider slider-height-1 bg-paleturquoise">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-12 col-sm-6">
                            <div class="slider-content slider-animated-1">
                                <h1 class="animated">Wooden Craft</h1>
                                <p class="animated">Lorem Ipsum is simply dummy text of the printing and typesetting industry. It is a long established fact that a reader.</p>
                                <div class="slider-btn btn-hover">
                                    <a class="animated" href="shop.html">Shop Now <i class="sli sli-basket-loaded"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-12 col-sm-6">
                            <div class="slider-single-img slider-animated-1">
                                <img class="animated" src="assets/img/slider/slider-hm1-1.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    
    <!-- 第二排网格状图片 -->
    <div class="banner-area pt-100 pb-65">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="single-banner mb-30 scroll-zoom">
                        <a href="product-details.html"><img class="animated" src="assets/img/banner/banner-1.png" alt=""></a>
                        <div class="banner-content banner-position-1">
                            <h3>35% off <br>Black Monday</h3>
                            <h2>Lighting For <br> Home.</h2>
                            <a href="product-details.html">Shop Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="single-banner mb-30 scroll-zoom">
                        <a href="product-details.html"><img class="animated" src="assets/img/banner/banner-2.png" alt=""></a>
                        <div class="banner-content banner-position-2">
                            <h3>15% off</h3>
                            <h2>Table Shiner <br>Moving.</h2>
                            <a href="product-details.html">Shop Now</a>
                        </div>
                    </div>
                    <div class="single-banner mb-30 scroll-zoom">
                        <a href="product-details.html"><img class="animated" src="assets/img/banner/banner-3.png" alt=""></a>
                        <div class="banner-content banner-position-2">
                            <h3>Black Friday</h3>
                            <h2>Wall Lighting <br>Black.</h2>
                            <a href="product-details.html">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="product-area pb-70">
        <div class="container">
            <div class="section-title text-center pb-40">
                <h2>所有 产品</h2>
                <p> Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical</p>
            </div>
            <div class="product-tab-list nav pb-60 text-center">
                <a class="active" href="#product-1" data-toggle="tab">
                    <h4>家用电器 </h4>
                </a>
                <a href="#product-2" data-toggle="tab">
                    <h4>厨房用具 </h4>
                </a>
                <a href="#product-3" data-toggle="tab">
                    <h4>灯具</h4>
                </a>
            </div>
            <div class="tab-content jump-2">
                <div id="product-1" class="tab-pane active">
                    <div class="ht-products product-slider-active owl-carousel">
                        
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
                                        <div class="ht-product-categories"><a href="#">--具体类别--</a></div>
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
                                    <!-- <div class="ht-product-action">
                                        <ul>
                                            <li><a href="#"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">快速预览</span></a></li>
                                            <li><a href="#"><i class="sli sli-heart"></i><span class="ht-product-action-tooltip">添加到清单</span></a></li>
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
                        <div class="single-testimonial text-center">
                            <img src="assets/img/testimonial/testi-1.png" alt="">
                            <p>-----------------人物介绍（创始人？？）------------------</p>
                            <div class="client-info">
                                <img src="assets/img/icon-img/testi.png" alt="">
                                <h5>-----------姓名-------------</h5>
                            </div>
                        </div>
                        <div class="single-testimonial text-center">
                            <img src="assets/img/testimonial/testi-2.png" alt="">
                            <p>-----------------人物介绍------------------</p>
                            <div class="client-info">
                                <img src="assets/img/icon-img/testi.png" alt="">
                                <h5>-----------姓名-------------</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="product-area pt-95 pb-70">
        <div class="container">
            <div class="section-title text-center pb-60">
                <h2>新品推荐</h2>
                <p> ----------介绍段落------------</p>
            </div>
            <div class="arrivals-wrap scroll-zoom">
                <div class="ht-products product-slider-active owl-carousel">
                
                    <!--Product Start-->
                    <div class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
                        <div class="ht-product-inner">
                            <div class="ht-product-image-wrap">
                                <a href="product-details.html" class="ht-product-image"> <img src="assets/img/product/product-5.jpg" alt="Universal Product Style"> </a>
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
                                    <div class="ht-product-categories"><a href="#">--具体类别--</a></div>
                                    <h4 class="ht-product-title"><a href="#">---产品名称---</a></h4>
                                    <div class="ht-product-price">
                                        <span class="new">￥60.00</span>
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
                    <!--Product End-->
                </div>
            </div>
        </div>
    </div>
    
    <div class="banner-area pb-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="single-banner mb-30 scroll-zoom">
                        <a href="product-details.html"><img src="assets/img/banner/banner-4.png" alt=""></a>
                        <div class="banner-content banner-position-3">
                            <h3>Black Monday</h3>
                            <h2>Wooden Lamp <br>Save 30%</h2>
                            <a href="product-details.html">Shop Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="single-banner mb-30 scroll-zoom">
                        <a href="product-details.html"><img src="assets/img/banner/banner-5.png" alt=""></a>
                        <div class="banner-content banner-position-4">
                            <h3>Black Monday</h3>
                            <h2>Wooden Lamp <br>Save 30%</h2>
                            <a href="product-details.html">Shop Now</a>
                        </div>
                    </div>
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
    
    
    <!-- ??????????????? -->
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


</body>

</html>
    