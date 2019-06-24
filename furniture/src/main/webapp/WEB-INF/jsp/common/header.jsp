<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<header class="header-area sticky-bar">

		<script type="text/javascript">
		function addCart(pid,price,imgpath) {
			$.get("addCart",{
				pid:pid,
				count:1
			},function(data){
				if(data.code==1){
					console.info(data);
					getSuccessMsg(data.message);
					var CartCount=$('.headerCartCount').text();
					var allSum=$('#sum').val();									
					var newAllSum=Number(price)+Number(allSum);
					$('.allSum').text(newAllSum);
					$('#sum').val(newAllSum);
					var size=$('#cartUl li').length;
					for(var i=0;i<size;i++){
						var allCartPid=$('#cartUl li:eq('+i+')').find("div:eq(1)").find("input").val();
						if(allCartPid==pid){
							var CartPidCount=$('#cartUl li:eq('+i+')').find("div:eq(1)").find("span").find("font").text();
							$('#cartUl li:eq('+i+')').find("div:eq(1)").find("span").find("font").text(++CartPidCount)
							return;
						}
					}
					$('#cartUl').append(
						'<li class="single-shopping-cart">'+
                           '<div class="shopping-cart-img">'+
                               '<a href="#"><img alt="" src="'+imgpath+'"></a>'+       
                           '</div>'+
                           '<div class="shopping-cart-title" style="width: 100px;overflow: hidden;">'+
                               '<h4><a href="#">'+data.data.product.productname+'</a></h4>'+
                               '<input type="hidden" value="'+pid+'">'+
                               '<span><font>'+data.data.count+'</font> x '+data.data.product.price+'</span>'+
                           '</div>'+
                           '<div class="item-close" style="margin-left: 20px">'+
                               '<a href="#"><i class="sli sli-close" onclick="headerDelCart(this)"></i></a>'+
                               '<input type="hidden" value="'+data.data.id+'">'+
                           '</div>'+
                       '</li>'
					);
					$('.headerCartCount').text(++CartCount);
				}else{
					getFialMsg("当前访问人数较多，请稍后再试");
				}
			})
		}
		function checkOut() {
			if($('#tbb').children("tr").children("td").find("span").text()=="暂无商品被加入购物车" 
					|| $('#cartUl').children("li").text()=="暂无商品"){
				getInfoMsg("购物车啥也没有");
			}else{
				location.href="checkout";
			}
		}
		
		function headerDelCart(del) { 			
			$.post("cart/delCart",{
				id:$(del).parent().next().val()
			},function(data){
				if(data.code==1){
					var str=$(del).parent().parent().prev().find("span").text().split("x");
					var count=str[0];
					var price=str[1];
					var sum=count*price;
					var allSum=$('#sum').val();
					var rows=$(del).parent().parent().parent().prevAll().length-1;
					var CartCount=$('.headerCartCount').text();
					getSuccessMsg(data.message);				
					
					$(del).parent().parent().parent().remove();
					if($('#cartUl li').length==0){
						$('#cartUl').append(
							'<input type="hidden" value="0" id="sum">'+
							'<li>暂无商品</li>'
						);
					}
					$('#tbb tr:eq('+rows+')').remove();
					$('.allSum').text(allSum-sum);
					$('.headerCartCount').text(--CartCount);
					$('#sum').val(allSum-sum);
				}else{
					getFailMsg(data.msg);
				}
			});
		}
		
		/* 用户注销 */
		function loginOut(){
			var flag = confirm("您确认注销当前账号吗？");
			return flag;
		}
		
		function getSuccessMsg(msg) {
	  		$.message({
	  	        message:msg,
	  	        type:'success',
	  	        duration:'3000'
	  	    });
	  	}
	  	function getInfoMsg(msg) {
	  		$.message({
	  	        message:msg,
	  	        type:'info',
	  	        duration:'3000'
	  	    });
	  	}
	  	function getFailMsg(msg) {
	  		$.message({
	  	        message:msg,
	  	        type:'error',
	  	        duration:'3000'
	  	    });
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
                                   <li class="angle-shape"><a href="index">首页 </a>
                                   
                                   </li>
                                   <li class="angle-shape"><a href="shop"> 商城 <span>new</span> </a>
                                   
                                   </li>
                                   <li><a href="shop">配饰  <span>hot</span> </a></li>
                                   <li><a href="contact-us"> 联系我们 </a></li>
                                   <li class="angle-shape"><a href="#">更多 </a>
                                       <ul class="submenu">
                                           <li><a href="about-us.html">关于我们 </a></li>
                                           <li><a href="cart-page.html">购物车 </a></li>
                                           <li><a href="checkout">结算 </a></li>
                                           <li><a href="compare-page">对比 </a></li>
                                           <li><a href="wishlist.html">愿望清单 </a></li>
                                           <li><a href="contact-us">联系我们</a></li>    
                                           <c:if test="${user  == null}">
                                           		<li><a href="login-register">登录/注册 </a></li>
                                           </c:if>
                                           <c:if test="${user  != null}">
                                           		<li><a href="my-account">我的账户 </a></li>
                                           </c:if>                                          
                                       </ul>
                                   </li>
                                   <li class="angle-shape"><a href="blog"> 博客 </a>
                                   		<ul class="submenu">
                                            <li><a href="blog.html">standard style </a></li>
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
                                    <h6>您尚未登录&nbsp;&nbsp;&nbsp;<a  href="login-register">去登录</a></h6>
                                </div>
                           </c:if>
                           <c:if test="${!empty user}">
	                           <div class="cart-wrap">
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
	                                       <a class="cart-close" href="#"><i class="sli sli-close"></i></a>
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
			                                               <a href="#"><img alt="" src="${cartProduct.product.images[0].imgpath }"></a>       
			                                           </div>
			                                           <div class="shopping-cart-title" style="width: 100px;overflow: hidden;">
			                                               <h4><a href="#">${cartProduct.product.productname}</a></h4>
			                                               <input type="hidden" value="${cartProduct.product.pid}">
			                                               <span><font>${cartProduct.count}</font> x ${cartProduct.product.price}</span>
			                                           </div>
			                                           <div class="item-close" style="margin-left: 20px">
		                                                   <a href="#"><i class="sli sli-close" onclick="headerDelCart(this)"></i></a>
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
	                           <div class="setting-wrap">
                               <button class="setting-active">
                                   <i class="sli sli-settings"></i>
                               </button>
                               <div class="setting-content">
                                   <ul>
                                       <li>
                                           <h4>账户</h4>
	                                       <ul>
                                                <li><a href="my-account">我的账户</a></li>
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
                <form>
                    <div class="form-search">
                        <input id="search" class="input-text" value="" placeholder="搜索" type="search">
                        <button>
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
