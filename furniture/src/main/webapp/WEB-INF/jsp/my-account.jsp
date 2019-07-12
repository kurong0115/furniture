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
<style type="text/css">
	#caozuo1:hover {
		color: red;
	}
	#caozuo2:hover {
		color: red;
	}
</style>
</head>
<body onload="getFlag();">
<div class="wrapper">
    <!-- 引入首部 -->
    <%@include file="common/header.jsp" %>
    
    <div class="breadcrumb-area pt-35 pb-35 bg-gray">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <ul>
                    <li>
                        <a href="index">首页</a>
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
                                    <a href="#orders" data-toggle="tab" id="cccc"><i class="fa fa-cart-arrow-down"></i> <span>订单</span></a> 
                                    <a href="#address-edit" data-toggle="tab"  id="aaaa"><i class="fa fa-map-marker"></i><span>地址</span></a>    
                                    <a href="#account-info" data-toggle="tab" id="hehao"><i class="fa fa-user" onclick="myAddress()" ></i><span> 帐户详细信息</span></a>    
                                    <a href="#" onclick="loginOut();"><i class="fa fa-sign-out"></i> 注销</a>
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
                                                <table class="table table-bordered">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th>订单编号</th>
                                                            <th>下单日期</th>
                                                            <th>订单金额</th>
                                                            <th>订单状态</th>
                                                            <th>操作</th>
                                                        </tr>
                                                    </thead>    
                                                    <tbody id="orderList">                  
                                                    	<c:if test="${myOrder != null }">
		                                                    <c:forEach items="${myOrder }"  var="m">
		                                                       <tr>
		                                                           <td>${m.orderno}</td>
		                                                           <td>${m.createtime.toLocaleString()}</td>
		                                                           <td>${m.sum}</td>
		                                                           <c:if test="${m.ispay==1 && m.isdeal==0 && m.isfinish==0}">
		                                                           		<td>订单已付款</td>
		                                                           </c:if>
		                                                           <c:if test="${m.ispay==1 && m.isdeal==1 && m.isfinish==0}">
		                                                           		<td>订单已发货</td>
		                                                           </c:if>
		                                                           <c:if test="${m.ispay==1 && m.isdeal==1 && m.isfinish==1}">
		                                                           		<td>订单已完成</td>
		                                                           </c:if>
		                                                           <td style="width: 180px;">
		                                                         		<button  data-toggle="modal" data-target="#exampleModal" 
																		onclick="checkDetail(${m.id},this)" class="comment" style="width:50%">详情</button>
																		<input type="hidden" value="${m.id}">
																		<c:if test="${m.isdeal==1 && m.isfinish==0}">
																			<button  onclick="orderFinish(${m.id},this)" class="comment" style="width:50%">确认收货</button>
																		</c:if>
		                                                           </td>
		                                                       </tr>
			                                                  </c:forEach>
			                                                 
	                                                    </c:if>
	                                                    
                                                    </tbody>
                                                   	<tfoot id="orderTfoot">
                                                    	<tr>
                                                    		<td colspan="5">
                                                    			<button onclick="orderFirstPage()" class="comment" style="width:10%">首页</button>
                                                    			<button onclick="orderLastPage()" class="comment" style="width:10%">上一页</button>
                                                    			<button class="comment" style="width:10%" disabled="disabled"><font id="orderPage">1</font>/<font id="orderTotalPage">${totalPage }</font></button>
                                                    			<button onclick="orderNextPage()" class="comment" style="width:10%">下一页</button>
                                                    			<button onclick="orderFinalPage()" class="comment" style="width:10%">末页</button>
                                                    		</td>
                                                    	</tr>
                                                    </tfoot>
                                                    
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h4>订单详情</h4>
													<button type="button" class="close" data-dismiss="modal" id="closeBnt"
														aria-label="Close">
														
														<span aria-hidden="true">x</span>
													</button>
												</div>
												
												<font id="orderNo" style="width: 100%;background: #eceff8;line-height: 50px;text-align: center;font-weight: 900"></font>
												<font id="orderAddr" style="width: 100%;background: #eceff8;line-height: 50px;text-align: center;font-weight: 900"></font>
												
												<div class="ystep4" style="text-align: center;"></div>
												<div style="text-align: center;" id="finishBnt"></div>
												<div class="modal-body">
													<div class="row">
														<table class="table table-bordered" id="ordersTable">
		                                                    <thead class="thead-light" style="text-align: center;">
		                                                        <tr>
		                                                            <th>图片</th>
		                                                            <th>商品名</th>
		                                                            <th>单价</th>
		                                                            <th>数量</th>
		                                                            <th>小计</th>
		                                                        </tr>
		                                                    </thead>    
		                                                    <tbody id="orderDetails" style="text-align: center;">                  

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
                                             <table class="table table-bordered">
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
	                                                           		<a onclick="QueryAddress(${address.id})" data-toggle="modal" data-target="#exampleModal3" id="caozuo1">修改</a>/
	                                                           		<a onclick="deleteAddress(${address.id})" id="caozuo2">删除</a>
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
													<button id="closeModel" type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">x</span>
													</button>
												</div>
												<div class="modal-body">
													<div class="row">
			                                        <form action="" method="post" style="width: 100%;text-align: center;">
			                                            <input id="addressName" placeholder="姓名" type="text" style="width: 50%;background: white;border-radius: 25px;">
			                                            <input id="addressPhone" placeholder="电话" type="text" style="width: 50%;background: white;margin-top: 20px;margin-bottom:20px;border-radius: 25px;">
			                                            <br/>
			                                            <select id="loc_province" style="width:120px;">
													    </select>
													    <select id="loc_city" style="width:120px; margin-left: 10px">
													    </select>
													    <select id="loc_town" style="width:120px;margin-left: 10px">
													    </select>
													    <br/>
			                                            <input id="addressDetails" placeholder="详细地址" type="text" style="width: 50%;background: white;margin-top: 20px;border-radius: 25px;">
			                                            <br/>
			                                            <button type="button" onclick="addAddress()" id="addAddr">确认新增</button>
			                                        </form>

							                      </div>
												</div>
											</div>
										</div>
									</div>
									
									<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h4>修改地址</h4>
													<button id="closeModel2" type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">x</span>
													</button>
												</div>
												<div class="modal-body">
													<div class="row">
			                                        <form action="" method="post" style="width: 100%;text-align: center;">
			                                            <input id="addressName2" placeholder="姓名" type="text" style="width: 50%;background: white;border-radius: 25px;">
			                                            <input id="addressPhone2" placeholder="电话" type="text" style="width: 50%;background: white;margin-top: 20px;margin-bottom:20px;border-radius: 25px;">
			                                            <br/>
			                                            <select id="loc_province2" style="width:120px;">
													    </select>
													    <select id="loc_city2" style="width:120px; margin-left: 10px">
													    </select>
													    <select id="loc_town2" style="width:120px;margin-left: 10px">
													    </select>
													    <br/>
			                                            <input id="addressDetails2" placeholder="详细地址" type="text" style="width: 50%;background: white;margin-top: 20px;border-radius: 25px;">
			                                            <br/>
			                                            <button type="button" onclick="ModefyAddress()" id="modefyAddr" 
			                                            	style="width:70px;height:35px;background:#eee;
			                                            		border-radius: 25px;
			                                            		margin-top: 20px;">确认修改</button>
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
                                                <form id="ff" method="post">
                                                    <div class="row">
                                                    	
                                                        <div class="col-lg-7">
                                                            <div class="single-input-item">
                                                                <label for="first-name" class="required">用户名</label>
                                                                <font id="first-name" style="color: red;">${user.name }</font>
                                                            </div>
                                                        </div> 
                                                        <div>
                                                        	<img src="${user.head }" onclick="uploadHead.click()" id="headPic"style="display:inline-block;width: 100px;height: 100px;float: right;border-radius: 50%;" >
                                                        	<input type="file" name="file" style="display: none;" id="uploadHead" onchange="getFileName()"/>
                                                        	<input type="hidden" name="head" style="display: none;" id="filename"/>
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="single-input-item">
                                                        <label for="email" class="required">邮箱地址</label>
                                                        <font  id="email" style="color: red;">${user.email }</font>
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
                                                        <button type="button" onclick="modefyPassword()">保存更改</button>
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
