<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>我的账户</title>  
    <!-- 引入首部链接 -->
    <%@include file="common/header_link.jsp" %>
    <script type="text/javascript" src="convinces/js/jquery.js"></script>
	<script type="text/javascript" src="convinces/js/area.js"></script>
	<script type="text/javascript" src="convinces/js/location.js"></script>
	<script type="text/javascript" src="convinces/js/select2.js"></script>
	<script type="text/javascript" src="convinces/js/select2_locale_zh-CN.js"></script>
	<link href="convinces/css/common.css" rel="stylesheet"/>
	<link href="convinces/css/select2.css" rel="stylesheet"/>
</head>
<body>
<div class="wrapper">
    <!-- 引入首部 -->
    <%@include file="common/header.jsp" %>
    <script src="assets/js/myAccount.js"></script>
    <div class="breadcrumb-area pt-35 pb-35 bg-gray">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <ul>
                    <li>
                        <a href="index.html">首页</a>
                    </li>
                    <li class="active">我的账户 </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- my account wrapper start -->
    <div class="my-account-wrapper pt-100 pb-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <!-- My Account Page Start -->
                    <div class="myaccount-page-wrapper">
                        <!-- My Account Tab Menu Start -->
                        <div class="row">
                            <div class="col-lg-3 col-md-4">
                                <div class="myaccount-tab-menu nav" role="tablist">
                                    <a href="#dashboad" class="active" data-toggle="tab">
                                    	<i class="fa fa-dashboard"></i>操作</a>   
                                    <a href="#orders" data-toggle="tab"><i class="fa fa-cart-arrow-down"></i> 订单</a> 
                                    <a href="#address-edit" data-toggle="tab"><i class="fa fa-map-marker"></i> 地址</a>    
                                    <a href="#account-info" data-toggle="tab"><i class="fa fa-user" onclick="myAddress()"></i> 帐户详细信息</a>    
                                    <a href="loginOut" onclick="return loginOut();"><i class="fa fa-sign-out"></i> 注销</a>
                                    
                                </div>
                            </div>
                            <!-- My Account Tab Menu End -->    
                            <!-- My Account Tab Content Start -->
                            <div class="col-lg-9 col-md-8">
                                <div class="tab-content" id="myaccountContent">
                                    <!-- Single Tab Content Start -->
                                    <div class="tab-pane fade show active" id="dashboad" role="tabpanel">
                                        <div class="myaccount-content">
                                            <h3>用户面板</h3>    
                                            <div class="welcome">
                                                <p>您好, <strong>${user.name}</strong></p>
                                            </div>
    											<p class="mb-0">从您的用户面板。您可以轻松地检查和查看您最近的订单，管理您的发货和账单地址，并编辑您的密码和帐户详细信息。</p>
                                        </div>
                                    </div>
                                    <!-- Single Tab Content End -->    
                                    <!-- Single Tab Content Start -->
                                    <div class="tab-pane fade" id="orders" role="tabpanel">
                                        <div class="myaccount-content">
                                            <h3>订单</h3>    
                                            <div class="myaccount-table table-responsive text-center">
                                                <table class="table table-bordered" id="ordersTable">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th>订单编号</th>
                                                            <th>下单日期</th>
                                                            <th>订单金额</th>
                                                            <th>订单详情</th>
                                                        </tr>
                                                    </thead>    
                                                    <tbody >                  
                                                    	<c:if test="${myOrder != null }">
		                                                    <c:forEach items="${myOrder }"  var="m">
		                                                       <tr>
		                                                           <td>${m.orderno}</td>
		                                                           <td>${m.createtime.toLocaleString()}</td>
		                                                           <td>${m.sum}</td>
		                                                           <td>
		                                                           		<a href="#" title="Quick View" data-toggle="modal"
																		data-target="#exampleModal" onclick="checkDetail(${m.id})">详情</a>
		                                                           </td>
		                                                       </tr>
			                                                  </c:forEach>
	                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h4>订单详情</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														
														<span aria-hidden="true">x</span>
													</button>
												</div>
												<c:if test="${ orderState!=null }">
													<c:if test="${ orderState.ispay == 1}">
														<script type="text/javascript">
															$(".ystep4").setStep(3);
															console.info(${ orderState});
														</script>
													</c:if>
												</c:if>
												
												<input type="text" value="${orderState.sum}">
												
												<div class="ystep4" style="text-align: center;"></div>
												<script type="text/javascript" src="assets/js/ystep.js"></script>
												<script type="text/javascript">
													//根据jQuery选择器找到需要加载ystep的容器
													//loadStep 方法可以初始化ystep
													$(".ystep4").loadStep({
													  size: "large",
													  color: "blue",
													  steps: [{
														title: "提交订单",
													  },{
														title: "等待付款",
													  },{
														title: "等待发货",
														
													  },{
														title: "等待收货",
														
													  },{
														title: "订单完成",
													  }]
													});
												</script>
												<div class="modal-body">
													<div class="row">
														<table class="table table-bordered" id="ordersTable">
		                                                    <thead class="thead-light">
		                                                        <tr>
		                                                            <th>图片</th>
		                                                            <th>商品名</th>
		                                                            <th>单价</th>
		                                                            <th>数量</th>
		                                                            <th>小计</th>
		                                                        </tr>
		                                                    </thead>    
		                                                    <tbody id="orderDetails">                  

		                                                    </tbody>
		                                                </table>
													</div>
												</div>
											</div>
										</div>
									</div>
							      
                                    <!-- Single Tab Content End -->    
                                    <!-- Single Tab Content Start -->
                                    <div class="tab-pane fade" id="address-edit" role="tabpanel">
                                        <div class="myaccount-content">
                                             <table class="table table-bordered" id="ordersTable">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th>收货人</th>
                                                            <th>手机号</th>
                                                            <th>详细地址</th> 
                                                            <th>操作</th> 
                                                        </tr>
                                                    </thead>    
                                                    <tbody >
                                                    <c:if test="${addressList.size() != null }">
                                                    	<c:forEach items="${addressList}" var="address">
                                                    		<tr>
	                                                           <td>${address.name }</td>
	                                                           <td>${address.phone }</td>
	                                                           <td>${address.address }</td>
	                                                           <td>
	                                                           		<a>修改地址</a>
	                                                           </td>
	                                                       </tr>
                                                    	</c:forEach>
                                                    </c:if>     
                                                    </tbody>
                                                </table>
                                                <a href="#" title="Quick View" data-toggle="modal"
																		data-target="#exampleModal2">还没有收货地址？新增一个！</a>
                                            
                                        </div>
                                    </div>
                                    
                                    <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h4>新增地址</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">x</span>
													</button>
												</div>
												<div class="modal-body">
													<div class="row">
			                                        <form action="" method="post">
			                                            <input id="addressName" placeholder="姓名" type="text">
			                                             <input id="addressPhone" placeholder="电话" type="text">
			                                              <input id="addressDetails" placeholder="详细地址" type="text">
			                                            <div class="button-box">
			                                                <button type="button" onclick="" style="margin-left: 410px">确认添加</button>
			                                            </div>
			                                        </form>
			                                        
							                      </div>
												</div>
											</div>
										</div>
									</div>
                                    <!-- Single Tab Content End -->    
                                    <!-- Single Tab Content Start -->
                                    <div class="tab-pane fade" id="account-info" role="tabpanel">
                                        <div class="myaccount-content">
                                            <h3>账户详细信息</h3>    
                                            <div class="account-details-form">
                                                <form action="#">
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="single-input-item">
                                                                <label for="first-name" class="required">名字</label>
                                                                <input type="text" id="first-name" value="${user.name }"/>
                                                            </div>
                                                        </div> 
                                                    </div>
                                                    <div class="single-input-item">
                                                        <label for="email" class="required">邮箱地址</label>
                                                        <input type="email" id="email" value="${user.email }"/>
                                                    </div>    
                                                    <fieldset>
                                                        <legend>更改密码</legend>
                                                        <div class="single-input-item">
                                                            <label for="current-pwd" class="required">当前密码</label>
                                                            <input type="password" id="current-pwd" value=""/>
                                                        </div>   
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <div class="single-input-item">
                                                                    <label for="new-pwd" class="required">新密码</label>
                                                                    <input type="password" id="new-pwd" />
                                                                </div>
                                                            </div>    
                                                            <div class="col-lg-6">
                                                                <div class="single-input-item">
                                                                    <label for="confirm-pwd" class="required">确认密码</label>
                                                                    <input type="password" id="confirm-pwd" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                    <div class="single-input-item">
                                                        <button class="check-btn sqr-btn ">保存更改</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div> <!-- Single Tab Content End -->
                                </div>
                            </div> <!-- My Account Tab Content End -->
                        </div>
                    </div> <!-- My Account Page End -->
                </div>
            </div>
        </div>
    </div>
    <!-- my account wrapper end -->
    
    <!-- 引入底部 -->
    <%@include file="common/footer.jsp" %>
    
    
</div>


<!-- 引入底部链接 -->
<%@include file="common/footer_link.jsp" %>


</body>

</html>
