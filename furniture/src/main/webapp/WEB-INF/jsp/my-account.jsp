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
                                    <a href="#account-info" data-toggle="tab"><i class="fa fa-user"></i> 帐户详细信息</a>    
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
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">x</span>
													</button>
												</div>
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
		                                                    <tbody >                  
		                                                    	<c:if test="${myOrder != null }">
				                                                    <c:forEach items="${myOrder }"  var="m">
				                                                       <tr>
				                                                           <td>${m.orderno}</td>
				                                                           <td>${m.createtime.toLocaleString()}</td>
				                                                           <td>${m.sum}</td>
				                                                           <td></td>
				                                                           <td></td>
				                                                       </tr>
					                                                  </c:forEach>
			                                                    </c:if>
		                                                    </tbody>
		                                                </table>
														
													</div>
												</div>
											</div>
										</div>
									</div>
							                                    
                                    <div class="tab-pane fade" id="ordersDetails" role="tabpanel">
                                        <div class="myaccount-content">
                                            <h3>订单详情</h3>    
                                            <div class="myaccount-table table-responsive text-center">
                                                <table class="table table-bordered">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th>单号</th>
                                                            <th>用户</th>
                                                            <th>产品</th>
                                                            <th>数量</th>
                                                            <th>总价</th>
                                                        </tr>
                                                    </thead>    
                                                    <tbody>     
	                                                     <tr>
                                                           <td>01</td>
                                                           <td>何浩</td>
                                                           <td>书桌</td>
                                                           <td>1</td>
                                                           <td>399</td>
			                                             </tr>             
                                                    	<c:if test="${myOrder != null }">
		                                                    <c:forEach items="${myOrder }"  var="m">
		                                                       <tr>
		                                                           <td>${m.orderno}</td>
		                                                           <td>${m.createtime.toLocaleString()}</td>
		                                                           <td>${m.sum}</td>
		                                                           <td><a href="#" class="check-btn sqr-btn "><i class="fa fa-cloud-download"></i> 详情</a></td>
		                                                       </tr>
			                                                  </c:forEach>
	                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                   
                                    
                                    <!-- Single Tab Content End -->    
                                    <!-- Single Tab Content Start -->
                                    <div class="tab-pane fade" id="address-edit" role="tabpanel">
                                        <div class="myaccount-content">
                                            <h3>帐单地址</h3>    
                                            <address>
                                                <p><strong>Alex Tuntuni</strong></p>
                                                <p>  市场街1355号，900室<br>
                                                <p>   旧金山，CA 94103</p>
                                                <p>手机:(123)456 - 7890</p>
                                              






                                            </address>    
                                            <a href="#" class="check-btn sqr-btn "><i class="fa fa-edit"></i> Edit Address</a>
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
