<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>博客</title>
    
	<!-- 引入首部链接 -->
    <%@include file="common/header_link.jsp" %>
</head>

<body>
<div class="wrapper">
    
    <!-- 引入首部 -->
    <%@include file="common/header.jsp" %>
    
    
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
                            <li class="menu-item-has-children"><a href="index.html">Home</a>
                                <ul class="dropdown">
                                    <li><a href="index.html">Home version 1 </a></li>
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
                        <a href="index.html">首页</a>
                    </li>
                    <li class="active">博客 </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="blog-area pt-100 pb-100">
        <div class="container">
            <div class="row flex-row-reverse">
                <div class="col-lg-9">
                    <div class="row">
                    	
                    	<!-- 循环展示图片 -->
                        <div class="col-lg-6 col-md-6">
                            <div class="blog-wrap mb-40 text-center scroll-zoom">
                                <div class="blog-img mb-25">
                                    <a href="#"><img src="assets/img/blog/blog-1.jpg" alt=""></a>
                                </div>
                                <div class="blog-content">
                                    <h3><a href="#">Distracted by the readable content</a></h3>
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
                    
                    <!-- 分页 -->
                    <div class="pro-pagination-style text-center mt-20 pagination-mrg-xs-none">
                        <ul>
                            <li><a class="prev" href="#"><i class="sli sli-arrow-left"></i></a></li>
                            <li><a class="active" href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a class="next" href="#"><i class="sli sli-arrow-right"></i></a></li>
                        </ul>
                    </div>
                </div>
                
                <!-- 侧边栏 -->
                <div class="col-lg-3">
                    <div class="sidebar-style">
                        <div class="sidebar-widget">
                            <h4 class="pro-sidebar-title">搜索 </h4>
                            <div class="pro-sidebar-search mb-50 mt-25">
                                <form class="pro-sidebar-search-form" action="#">
                                    <input type="text" placeholder="在此处搜索...">
                                    <button>
                                        <i class="sli sli-magnifier"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                        <div class="sidebar-widget">
                            <h4 class="pro-sidebar-title">类别  </h4>
                            <div class="sidebar-widget-list mt-20">
                                <ul>
                                    <li>
                                        <div class="sidebar-widget-list-left">
                                            <input type="checkbox" value=""> <a href="#">女性  <span>4</span> </a>
                                            <span class="checkmark"></span> 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="sidebar-widget-list-left">
                                            <input type="checkbox" value=""> <a href="#">男性  <span>4</span> </a>
                                            <span class="checkmark"></span> 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="sidebar-widget-list-left">
                                            <input type="checkbox" value=""> <a href="#">箱包  <span>4</span> </a>
                                            <span class="checkmark"></span> 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="sidebar-widget-list-left">
                                            <input type="checkbox" value=""> <a href="#">饰品  <span>4</span> </a>
                                            <span class="checkmark"></span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="sidebar-widget mt-40">
                            <h4 class="pro-sidebar-title">新讨论组 </h4>
                            <div class="sidebar-project-wrap mt-30">
                                <div class="single-sidebar-blog">
                                    <div class="sidebar-blog-img">
                                        <a href="#"><img src="assets/img/blog/sidebar-1.jpg" alt=""></a>
                                    </div>
                                    <div class="sidebar-blog-content">
                                        <span>摄影</span>
                                        <h4><a href="#">-------名字--------</a></h4>
                                    </div>
                                </div>
                                <div class="single-sidebar-blog">
                                    <div class="sidebar-blog-img">
                                        <a href="#"><img src="assets/img/blog/sidebar-2.jpg" alt=""></a>
                                    </div>
                                    <div class="sidebar-blog-content">
                                        <span>品牌</span>
                                        <h4><a href="#">-------名字--------</a></h4>
                                    </div>
                                </div>
                                <div class="single-sidebar-blog">
                                    <div class="sidebar-blog-img">
                                        <a href="#"><img src="assets/img/blog/sidebar-3.jpg" alt=""></a>
                                    </div>
                                    <div class="sidebar-blog-content">
                                        <span>设计</span>
                                        <h4><a href="#">-------名字--------</a></h4>
                                    </div>
                                </div>
                                <div class="single-sidebar-blog">
                                    <div class="sidebar-blog-img">
                                        <a href="#"><img src="assets/img/blog/sidebar-1.jpg" alt=""></a>
                                    </div>
                                    <div class="sidebar-blog-content">
                                        <span>摄影</span>
                                        <h4><a href="#">-------名字--------</a></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar-widget mt-30">
                            <h4 class="pro-sidebar-title">历史记录  </h4>
                            <div class="sidebar-widget-archive mt-20">
                                <ul>
                                    <li>
                                        <a href="#">June 2018</a>
                                    </li>
                                    <li>
                                        <a href="#">May 2018</a>
                                    </li>
                                    <li>
                                        <a href="#">April 2018</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="sidebar-widget mt-50">
                            <h4 class="pro-sidebar-title">标签 </h4>
                            <div class="sidebar-widget-tag mt-25">
                                <ul>
                                    <li><a href="#">服装</a></li>
                                    <li><a href="#">饰品</a></li>
                                    <li><a href="#">男性</a></li>
                                    <li><a href="#">女性</a></li>
                                    <li><a href="#">时尚</a></li>
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
    
</div>


<!-- 引入底部链接 -->
<%@include file="common/footer_link.jsp" %>


</body>

</html>
