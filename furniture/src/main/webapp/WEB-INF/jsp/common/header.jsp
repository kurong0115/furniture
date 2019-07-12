<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style type="text/css">
	/* #prompt {
		background:white;
		margin-left: 15px;
		margin-right: -25px;
		position: relative;
	} */
	#picture {
	    width: 40px;
	    height: 40px;
	    margin-top: -10px;
	    cursor: pointer;
	    float: left;
	}
	#badge {
		float: right;
	    width: 16px;
	    height: 16px;
	    line-height: 20px;		/* 数值与height相同，使数字垂直居中 */
	    text-align: center;		/* 使数字水平居中 */
	    background-color: white;
	    color: red;
	    font-size: 12px;
	    font-weight: 800;
	    border-radius: 50%;		/* 使正方形变圆形，矩形变椭圆形 */
	    position: relative;
	    bottom: 12px;
	    right: 20px;
	    border: aliceblue;
	}
	/* #info {
		display:none;
		background:#ccc;
		color:red;
		width:160px;
		height:180px;
		border:1px solid #E8E8E8;
		padding-top: 20px;
		padding-left: 40px;
		position:absolute;
		top:68px;
		
		display: none;
		background: white;
	}
	#info a {
		font-size: 16px;
	    line-height: 2;
    	display: block;
	    -webkit-margin-after: 1.33em;
	} */
	.tip {
		display: inline-block;
		background: red;
		width:5px;
		height:5px;
		border-radius: 50%;
		position: relative;
	}
	
</style>
<header class="header-area sticky-bar">
	<script type="text/javascript">
	window.onload = function(){
		$(".tip").hide();
		var uid = ${user.id};
		if(uid != null){
			// 加载页面自动执行，获取未读消息数及类型
			$.get("prompt.do",{
				uid: uid
			},function(data){
				if(data.code != null){
					// 显示消息数
					$("#badge").text(data.code);
					// 显示消息类型下的提醒小圆点
					if(data.message.match("type1")){
						$("#type1").show();
					}else if(data.message.match("type2")){
						$("#type2").show();
					}else if(data.message.match("type3")){
						$("#type3").show();
					}
				}
			});
			
			// 点击未读消息图标，显示和隐藏消息div
			/* $("#prompt").click(function(){
				if($("#info").is(":hidden")){
					$(this).children("div").show();
				}else {
					$(this).children("div").hide();
				}
			}); */
			// 点击图标外的区域，隐藏消息div
			/* $(document).click(function (e) {
		        var con = $("#prompt");   // 设置目标区域
		        if (!con.is(e.target) && con.has(e.target).length === 0) {
		            $("#info").hide();
		        }
		    }); */
		}
    }
	
	// 点击清楚提示圆点，改变状态为已读
	function clearTip(input){
		var type = $(input).find("i").attr("id");
		var uid = ${user.id};
		if(type == "type1"){
			$.get("updateStatus.do",{
				uid: uid
			},function(data){
				if(data == "success"){
					/* $("#type1").hide(); */
				}
			});
		}
	}
		</script>
       <div class="main-header-wrap">
           <div class="container">
               <div class="row">
                   <div class="col-xl-2 col-lg-2">
                       <div class="logo pt-40">
                           <a href="index">
                               <img src="assets/img/logo/logo.png" alt="" style="margin-top:-25px;">
                           </a>
                       </div>
                   </div>
                   <div class="col-xl-7 col-lg-7 ">
                       <div class="main-menu">
                           <nav>
                               <ul>
                               		<li></li>
                               		<li></li>
                                   <li class="angle-shape"><a href="index">首页 </a>
                                   
                                   </li>
                                   <li class="angle-shape"><a href="shop"> 商城 <span>hot</span> </a>
                                   
                                   </li>
                                   <li><a href="contact-us.do"> 联系我们 </a></li>
                                   <li class="angle-shape"><a href="javascript:void(0)">更多 </a>
                                       <ul class="submenu">
                                           <li><a href="about-us.do">关于我们 </a></li>
                                           <li><a href="seeCart">购物车 </a></li>
                                           <li><a href="compare-page">对比 </a></li>
                                           <li><a href="wishlist">愿望清单 </a></li>
                                           <c:if test="${user  == null}">
                                           		<li><a href="login-register">登录/注册 </a></li>
                                           </c:if>
                                           <c:if test="${user  != null}">
                                           		<li><a href="my-account">我的账户 </a></li>
                                           </c:if>                                          
                                       </ul>
                                   </li>
                                   <li class="angle-shape"><a href="blog.do"> 博客 </a>
                                   		<ul class="submenu">
                                            <li><a href="blog.do">standard style </a></li>
                                            <li><a href="blog-2-col.html">blog 2 column </a></li>
                                            <li><a href="blog-3-col.html">blog 3 column </a></li>
                                            <li><a href="blog-right-sidebar.html">blog right sidebar </a></li>
                                            <li><a href="blog-details.html">blog details </a></li>
                                            <li><a href="blog-details-right-sidebar.html">blog details right sidebar </a></li>
                                        </ul>
                                   </li>
                               </ul>
                           </nav>
                       </div>
                   </div>
                   <div class="col-xl-3 col-lg-3">
                       <div class="header-right-wrap pt-40">
                           <div class="header-search">
                               <a class="search-active" href="javascript:void(0)"><i class="sli sli-magnifier"></i></a>
                           </div>
                           
                           <c:if test="${empty user}">
                            	<div>
                                    <h6>您尚未登录&nbsp;&nbsp;&nbsp;<a href="login-register">去登录</a></h6>
                                </div>
                           </c:if>
                           <c:if test="${!empty user}">
	                           <div class="cart-wrap">
	                           		<!-- 购物车图标 -->
	                               <button class="icon-cart-active">
	                                   <span class="icon-cart">
	                                       <i class="sli sli-bag"></i>
	                                       <span class="count-style headerCartCount">${fn:length(cartProductList)}</span>
	                                   </span>
	                                   <span>￥<font class="cart-price allSum">${allSum}</font></span>
	                               </button>
	                               <div class="shopping-cart-content">
	                                   <div class="shopping-cart-top">
	                                       <h4>购物车</h4>
	                                       <a class="cart-close" href="javascript:void(0)"><i class="sli sli-close"></i></a>
	                                   </div>
	                                   <ul style="height: 250px;" id="cartUl">
	                                   
	                                   		<c:if test="${empty cartProductList}">
	                                   			<input type="hidden" value="0" id="sum">
	                                   			<li>暂无商品</li>
	                                   		</c:if>
	                                   		<c:if test="${!empty cartProductList}">
	                                   			<input type="hidden" value="${allSum}" id="sum">
		                                   		<c:forEach items="${cartProductList}" var="cartProduct">
													<li class="single-shopping-cart">
			                                           <div class="shopping-cart-img">
			                                               <a href="javascript:void(0)"><img alt="" src="${cartProduct.product.images[0].imgpath }"></a>       
			                                           </div>
			                                           <div class="shopping-cart-title" style="width: 100px;overflow: hidden;">
			                                               <h4><a href="javascript:void(0)">${cartProduct.product.productname}</a></h4>
			                                               <input type="hidden" value="${cartProduct.product.pid}">
			                                               <span><font>${cartProduct.count}</font> x ${cartProduct.product.price}</span>
			                                           </div>
			                                           <div class="item-close" style="margin-left: 20px">
		                                                   <a href="javascript:void(0)"><i class="sli sli-close" onclick="headerDelCart(this)"></i></a>
		                                                   <input type="hidden" value="${cartProduct.id}">
		                                               </div>
			                                       </li>
		                                   		</c:forEach>
		                                   	</c:if>
	                                   </ul>
	                                   <div class="shopping-cart-bottom">
	                                       <div class="shopping-cart-total">
	                                           <h4>总价 : <span>￥<span class="shop-total allSum">${allSum}</span></span></h4>
	                                       </div>
	                                       <div class="shopping-cart-btn btn-hover text-center">
	                                           <a class="default-btn" href="javascript:void(0)" onclick="checkOut()">结算</a>
	                                           <a class="default-btn" href="seeCart">查看购物车</a>
	                                       </div>
	                                   </div>
	                               </div>
	                           </div>
	                           
	                           <!-- 消息按钮 -->
	                           <div class="message-wrap">
	                               <button class="message-active">
	                                   	<img id="picture" src="images/s1.png">
	                                   	<span id="badge"></span>
	                               </button>
	                               <div class="message-content">
		                               <ul>
		                               		<li>
		                               			<h4>消息</h4>
			                                   <ul>
			                                       <li>
			                                           <a href="communication.do?id=${user.id }" onclick="clearTip(this)">回复我的
			                                           	<i class="tip" id="type1"></i></a>         
			                                       </li>
			                                       <li>
			                                       		<a href="javascript:void(0)" onclick="clearTip(this)">系统通知
			                                           	<i class="tip" id="type2"></i></a></li>
			                                       <li>
			                                       		<a href="javascript:void(0)" onclick="clearTip(this)">我的消息
			                                           	<i class="tip" id="type3"></i></a>
			                                       </li>
			                                   </ul>
		                                   </li>
		                               </ul>
	                               </div>
	                           </div>
	                           <!-- 操作按钮 -->
	                           <div class="setting-wrap">
                               <button class="setting-active">
                                   <!-- <i class="sli sli-settings"></i> -->
                                   <img id="picture" src="${user.head }" style="border-radius: 50%;">
                               </button>
                               
                               <div class="setting-content">
                                   <ul>
                                       <li>
                                           <h4>账户</h4>
	                                       <ul>
                                                <li><a href="my-account">个人中心</a></li>
                                                <li><a href="loginOut" onclick="return loginOut();">注销</a>
                                           </ul>
                                       </li>
                                   </ul>
                               </div>
                           </div> 
                           
                          </c:if>
                           
                       </div>
                   </div>
               </div>
           </div>
           <!-- main-search start -->
        <div class="main-search-active">
            <div class="sidebar-search-icon">
                <button class="search-close"><span class="sli sli-close"></span></button>
            </div>
            <div class="sidebar-search-input">
                <form method="get" action="search.do">
                    <div class="form-search">
                        <input id="search" class="input-text" placeholder="搜索" type="search" name="search">
                        <button type="submit">
                            <i class="sli sli-magnifier"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- ?????????????????? -->
    <!-- <div class="header-small-mobile">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-6">
                    <div class="mobile-logo">
                        <a href="index">
                            <img alt="" src="assets/img/logo/logo.png">
                        </a>
                    </div>
                </div>
                <div class="col-6">
                    <div class="header-right-wrap">
                        <div class="cart-wrap">
                            <button class="icon-cart-active">
                                <span class="icon-cart">
                                    <i class="sli sli-bag"></i>
                                    <span class="count-style">02</span>
                                </span>
                                <span class="cart-price">
                                    $320.00
                                </span>
                            </button>
                            <div class="shopping-cart-content">
                                <div class="shopping-cart-top">
                                    <h4>Shoping Cart</h4>
                                    <a class="cart-close" href="#"><i class="sli sli-close"></i></a>
                                </div>
                                <ul>
                                    <li class="single-shopping-cart">
                                        <div class="shopping-cart-img">
                                            <a href="#"><img alt="" src="assets/img/cart/cart-1.jpg"></a>
                                        </div>
                                        <div class="shopping-cart-title">
                                            <h4><a href="#">Product Name </a></h4>
                                            <span>1 x 90.00</span>
                                        </div>
                                    </li>
                                    <li class="single-shopping-cart">
                                        <div class="shopping-cart-img">
                                            <a href="#"><img alt="" src="assets/img/cart/cart-2.jpg"></a>
                                        </div>
                                        <div class="shopping-cart-title">
                                            <h4><a href="#">Product Name</a></h4>
                                            <span>1 x 90.00</span>
                                        </div>
                                    </li>
                                </ul>
                                <div class="shopping-cart-bottom">
                                    <div class="shopping-cart-total">
                                        <h4>Total : <span class="shop-total">$260.00</span></h4>
                                    </div>
                                    <div class="shopping-cart-btn btn-hover text-center">
                                        <a class="default-btn" href="checkout">checkout</a>
                                        <a class="default-btn" href="cart-page.html">view cart</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mobile-off-canvas">
                            <a class="mobile-aside-button" href="#"><i class="sli sli-menu"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    
    
</header>
