<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>对比</title>

<!-- 引入首部链接 -->
<%@include file="common/header_link.jsp"%>
</head>

<body>
	<div class="wrapper">
		<%@include file="common/header.jsp"%>
		
		<div class="breadcrumb-area pt-35 pb-35 bg-gray">
			<div class="container">
				<div class="breadcrumb-content text-center">
					<ul>
						<li><a href="index">主页</a></li>
						<li class="active">对比</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- compare main wrapper start -->
		<div class="compare-page-wrapper pt-100 pb-100">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!-- Compare Page Content Start -->
						<div class="compare-page-content-wrap">
							<div class="compare-table table-responsive">
								<table class="table table-bordered mb-0">
									<tbody>
										<tr>
											<td class="first-column">产品</td>
											<c:forEach items="${compareList }" var="product">
											     <td class="product-image-title"><a
	                                                href="product-details?pid=${product.pid }"
	                                                class="image"> <img class="img-fluid"
	                                                    src="${product.images[0].imgpath }"
	                                                    alt="Compare Product">
	                                                </a> <a href="#" class="category">${product.productname }</a> <a
	                                                href="https://demo.hasthemes.com/parlo/parlo/single-product-sale.html"
	                                                class="title">${product.model }</a>
                                                </td>
											</c:forEach>
																						
										</tr>
										<tr>
											<td class="first-column">描述</td>
											<c:forEach items="${compareList }" var="product">
												<td class="pro-desc">
													<p>${product.content }</p>
												</td>
											</c:forEach>
										</tr>
										<tr>
											<td class="first-column">价格</td>
											<c:forEach items="${compareList }" var="product">
                                                <td class="pro-price">${product.price }</td>
                                            </c:forEach>
											
										</tr>
										
										<tr>
											<td class="first-column">库存</td>
											<c:forEach items="${compareList }" var="product">
                                                <td class="pro-stock">${product.stock }</td>
                                            </c:forEach>											
										</tr>
										<tr>
											<td class="first-column">添加到购物车</td>
											<c:forEach items="${compareList }" var="product">
                                                <td>
                                                <a href="addcart?pid=${product.pid }"
                                                    class="check-btn">添加到购物车</a></td>
                                            </c:forEach>																					
										</tr>
										<tr>
											<td class="first-column">评分</td>
											<c:forEach items="${compareList }" var="product">
                                                <td class="pro-ratting">
	                                                <c:forEach begin="1" end="${product.score }">
	                                                   <i class="sli sli-star"></i>
	                                                </c:forEach>	                                                	                                                
                                                </td>
                                            </c:forEach>	                                        																													
										</tr>
										<tr>
											<td class="first-column">移除</td>
											<c:forEach items="${compareList }" var="product">
                                                <td class="pro-remove">
	                                                <button>
	                                                    <i class="sli sli-trash" onclick="removeInfo(${product.pid})"></i>
	                                                </button>
                                                </td>
                                            </c:forEach>    																																
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- Compare Page Content End -->
					</div>
				</div>
			</div>
		</div>
		<!-- compare main wrapper end -->
		<%@include file="common/footer.jsp"%>
	</div>

	<!-- jQuery JS -->
	<!-- 引入底部链接 -->
	<%@include file="common/footer_link.jsp"%>
    
    <script type="text/javascript">
	    function getSuccessMsg(msg) {
	        $.message({
	            message : msg,
	            type : 'success',
	            duration : '3000'
	        });
	    }
	    function getInfoMsg(msg) {
	        $.message({
	            message : msg,
	            type : 'info',
	            duration : '3000'
	        });
	    }
	    function getFailMsg(msg) {
	        $.message({
	            message : msg,
	            type : 'error',
	            duration : '3000'
	        });
	    }
    
        function removeInfo(pid){
        	$.ajax({
        		url:"removeInfo.do?pid=" + pid,
        		method:"get",
        		async:true,
        		success:function(data){
        			if (data.code == 1){
        				getSuccessMsg(data.message);
        			}else{
        				getInfoMsg(data.message);
        			}
        		},
        		error:function(data){
        			getFailMsg("服务器繁忙");
        		}
        	})
        	window.location.reload();
        }
    </script>
</body>

</html>
