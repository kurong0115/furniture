function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);//search,查询？后面的参数，并匹配正则
     if(r!=null)return  unescape(r[2]); return null;
}


/**
 * 查看订单详情
 * @returns
 */
function checkDetail(orderid) {
	$.ajax({
			url:"orderDetails",
			type:'GET',
			data:{
				orderid:orderid
			},
			dataType:"json",
			success:function(data){
				var address=data.data[0].address.address+'--'+data.data[0].address.name+'--'+data.data[0].address.phone;
				var orderno=data.data[0].orderno;
				if(data.code==1){
					$('#orderDetails').html('');
					$(".ystep4").html('');
					$('#orderNo').text("订单编号："+orderno);
					$('#orderAddr').text("收货地址："+address);
					var tr=$('#ordersTable thead tr').children("th");
					for(var i=0;i<tr.length;i++){
						if(tr.eq(i).text()=='操作'){
							tr.eq(i).remove();
						}
					}
					if(data.data[0].isfinish==1){
						
						$('#ordersTable thead tr').append("<th>操作</th>");
						for(var i=0;i<data.data[1].length;i++){
							$('#orderDetails').append(
									'<tr style="line-height:82px">'+
			                        '<td><img width="82px" height="82px" alt="" src="'+(data.data[1])[i].productList[0].images[0].imgpath+'"></td>'+
			                        '<td>'+(data.data[1])[i].productList[0].productname+'</td>'+
			                        '<td>'+(data.data[1])[i].price+'</td>'+
			                        '<td>'+(data.data[1])[i].count+'</td>'+
			                        '<td>'+(data.data[1])[i].sum+'</td>'+
			                        '<td><button type="button" onclick="goComment('+(data.data[1])[i].productList[0].pid+')" class="comment"  style="width:100%;">去评论</button> </td>'+
			                        '</tr>'
									);
							
						}
					}else{
						for(var i=0;i<data.data[1].length;i++){
							$('#orderDetails').append(
									'<tr style="line-height:82px">'+
			                        '<td><img width="82px" height="82px" alt="" src="'+(data.data[1])[i].productList[0].images[0].imgpath+'"></td>'+
			                        '<td>'+(data.data[1])[i].productList[0].productname+'</td>'+
			                        '<td>'+(data.data[1])[i].price+'</td>'+
			                        '<td>'+(data.data[1])[i].count+'</td>'+
			                        '<td >'+(data.data[1])[i].sum+'</td>'+
			                        '</tr>'
									);
							
						}
					}
					
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
						
					if(data.data[0].ispay==1){
						$(".ystep4").setStep(3)
						$('#finishBnt').empty();
						$('#finishBnt').append('<button type="button" class="comment" disabled=ture>订单已付款，等待商家处理</button>')	
					}else{
						$(".ystep4").setStep(2)
						$('#finishBnt').empty();
						$('#finishBnt').append('<button type="button" class="comment" disabled=ture>订单尚未付款</button>')	
					}
					if(data.data[0].isdeal==1){
						$(".ystep4").setStep(4)
						$('#finishBnt').empty();
						$('#finishBnt').append('<button type="button" onclick="orderDetailFinish('+data.data[0].id+',\''+orderno+'\')" class="comment">确认收货</button>')	
					}
					if(data.data[0].isfinish==1){
						$(".ystep4").setStep(5);
						$('#finishBnt').empty();
						$('#finishBnt').append('<button type="button" class="comment" disabled=ture>订单已完成，去评价一下吧</button>')	
					}									
				}
			},error:function(){
				getFailMsg('出现异常了，刷新试试！');
			}
	  	});
}

function goComment(pid){
	location.href='product-details?pid='+pid+'&flag=comment&#ddddd';
}

function checkPhone(phone){ 
    if(!(/^1[3456789]\d{9}$/.test(phone))){ 
        return false; 
    } 
}

function addAddress() {
	var phone = $('#addressPhone').val();
	if( $('#addressName').val() == ''){
		getFailMsg('请输入您的姓名！');
		return;
	}
	if( $('#addressPhone').val()==''){
		getFailMsg('请输入您的电话！');
		return;
	}
	if( $('#loc_province').val()=='' || $('#loc_city').val()==''
		|| $('#loc_town').val()=='' || $('#addressDetails').val()==''){
		getFailMsg('请输入完整的地址信息！');
		return;
	}
	if(checkPhone(phone) == false){
		getFailMsg('手机号码格式错误！');
		return;
	}
	$.post('addAddress',{
		name:$('#addressName').val(),
		phone:$('#addressPhone').val(),
		address:$('#loc_province').select2('data').text+"-"+$('#loc_city').select2('data').text+"-"+$('#loc_town').select2('data').text+"-"+$('#addressDetails').val()
	},function(data){
		if(data.code==1){
			getSuccessMsg(data.message);
					
			$("#closeModel").click();
			window.location.href='my-account?flag=address';	 
		}else{
			getFailMsg(data.message);
		}
	})
}

function loadOrderList(data){
	if(data.code==1){
		$('#orderList').html("");
		for(var i=0;i<data.data.length;i++){
			var createTime=new Date(data.data[i].createtime);
			if(data.data[i].ispay==0 && data.data[i].isdeal==0 && data.data[i].isfinish==0){
				$('#orderList').append(
						'<tr>'+
		                    '<td>'+data.data[i].orderno+'</td>'+
		                    '<td>'+createTime.toLocaleString()+'</td>'+
		                    '<td>'+data.data[i].sum+'</td>'+
		                    '<td>订单未付款</td>'+
		                    '<td style="width: 180px;">'+
							'		<button  data-toggle="modal" data-target="#exampleModal" '+
							'		onclick="checkDetail('+data.data[i].id+',this)" class="comment" style="width:50%">详情</button>'+
		                    '</td>'+
		                '</tr>'
				);
			}
			if(data.data[i].ispay==1 && data.data[i].isdeal==0 && data.data[i].isfinish==0){
				$('#orderList').append(
						'<tr>'+
		                    '<td>'+data.data[i].orderno+'</td>'+
		                    '<td>'+createTime.toLocaleString()+'</td>'+
		                    '<td>'+data.data[i].sum+'</td>'+
		                    '<td>订单已付款</td>'+
		                    '<td style="width: 180px;">'+
							'		<button  data-toggle="modal" data-target="#exampleModal" '+
							'		onclick="checkDetail('+data.data[i].id+',this)" class="comment" style="width:50%">详情</button>'+
		                    '</td>'+
		                '</tr>'
				);
			}
			if(data.data[i].ispay==1 && data.data[i].isdeal==1 && data.data[i].isfinish==0){
				$('#orderList').append(
						'<tr>'+
		                    '<td>'+data.data[i].orderno+'</td>'+
		                    '<td>'+createTime.toLocaleString()+'</td>'+
		                    '<td>'+data.data[i].sum+'</td>'+
		                    '		<td>订单已发货</td>'+
		                    '<td style="width: 180px;">'+
							'		<button  data-toggle="modal" data-target="#exampleModal" '+
							'		onclick="checkDetail('+data.data[i].id+')" class="comment" style="width:50%">详情</button>'+
		                    '		<button  onclick="orderFinish('+data.data[i].id+',this)" class="comment" style="width:50%">确认收货</button>'+
		                    '</td>'+
		                '</tr>'
				);
			}
			if(data.data[i].ispay==1 && data.data[i].isdeal==1 && data.data[i].isfinish==1){
				$('#orderList').append(
						'<tr>'+
		                    '<td>'+data.data[i].orderno+'</td>'+
		                    '<td>'+createTime.toLocaleString()+'</td>'+
		                    '<td>'+data.data[i].sum+'</td>'+
		                    '		<td>订单已完成</td>'+
		                    '<td style="width: 180px;">'+
							'		<button  data-toggle="modal" data-target="#exampleModal" '+
							'		onclick="checkDetail('+data.data[i].id+',this)" class="comment" style="width:50%">详情</button>'+
		                    '</td>'+
		                '</tr>'
				);
			}
			
		}
	}
}

function orderFinalPage(){
	var totalPage=$('#orderTotalPage').text();
	var page=$('#orderPage').text();
	if(page==totalPage){
		getInfoMsg("已经是最后一页了");
		return ;
	}
	$.get('orderFinalPage',{
		page:totalPage
	},function(data){
		loadOrderList(data);
		$('#orderPage').text(totalPage);
	});
}
function orderLastPage(){
	var totalPage=$('#orderTotalPage').text();
	var page=$('#orderPage').text();
	if(page==1){
		getInfoMsg("已经是第一页了");
		return ;
	}
	$.get('orderLastPage',{
		page:--page
	},function(data){
		loadOrderList(data);
		$('#orderPage').text(page);
	});
}
function orderNextPage(){
	var totalPage=$('#orderTotalPage').text();
	var page=$('#orderPage').text();
	if(page==totalPage){
		getInfoMsg("已经是最后一页了");
		return ;
	}
	$.get('orderNextPage',{
		page:++page
	},function(data){
		loadOrderList(data);
		$('#orderPage').text(page);
	});
}

function orderFirstPage() {
	if($('#orderPage').text()==1){
		getInfoMsg("已经是第一页了");
		return ;
	}
	$.get('orderFirstPage',{
		page:1
	},function(data){
		loadOrderList(data);
		$('#orderPage').text(1);
	});
}

var addressid = null;
function QueryAddress(id){
	addressid = id;
	$.post("queryAddress",{
			id:id
		},function(data){
			if( data.code==1 ){
				console.info(data);
				if( data.data.status == 1 ){
					$('#addressName2').val(data.data.name);
					$('#addressPhone2').val(data.data.phone);
					var str = data.data.address.split('-');
					$('#addressDetails2').val(str[3]);	
				}
			}
		}	
	)
}

function orderDetailFinish(id,orderno){
	Notiflix.Confirm.Init();
	Notiflix.Confirm.Show( '提醒', '确认收货吗？', '确认', '取消',function(){
		$.post('orderFinish',{
			orderid:id
		},function(data){
			if(data.code==1){
				$('#closeBnt').click();
				getSuccessMsg(data.message);
				for(var i=0;i<$('#orderList tr').length;i++){
					var number=$('#orderList tr:eq('+i+') td:eq(0)').text();
					if(orderno==number){
						$('#orderList tr:eq('+i+') td:eq(3)').text("订单已完成");
						$('#orderList tr:eq('+i+') td:eq(4) button:eq(1)').remove();						
						return;
					}
					
				}
				
			}
		});
	} );
}

function orderFinish(id,bnt) {
	Notiflix.Confirm.Init();
	Notiflix.Confirm.Show( '提醒', '确认收货吗？', '确认', '取消',function(){
		$.post('orderFinish',{
			orderid:id
		},function(data){
			if(data.code==1){
				getSuccessMsg(data.message);
				$(bnt).parent().prev().text("订单已完成");
				$(bnt).remove();
			}
		});
	} );
}

function ModefyAddress(){
	var phone = $('#addressPhone2').val();
	if( $('#addressName2').val() == ''){
		getFailMsg('请输入您的姓名！');
		return;
	}
	if( $('#addressPhone2').val()==''){
		getFailMsg('请输入您的电话！');
		return;
	}
	if( $('#loc_province2').val()=='' || $('#loc_city2').val()==''
		|| $('#loc_town2').val()=='' || $('#addressDetails2').val()==''){
		getFailMsg('请输入完整的地址信息！');
		return;
	}
	if(checkPhone(phone) == false){
		getFailMsg('手机号码格式错误！');
		return;
	}
	$.post('modefyAddress',{
		id:addressid,
		name:$('#addressName2').val(),
		phone:$('#addressPhone2').val(),
		address:$('#loc_province2').select2('data').text+"-"+$('#loc_city2').select2('data').text+"-"+$('#loc_town2').select2('data').text+"-"+$('#addressDetails2').val()
	},function(data){
		if(data.code==1){
			getSuccessMsg(data.message);
			setTimeout(
					function(){
						$("#closeModel2").click();
						window.location.href='my-account?flag=address';
					}
			,1000);  
			
		}else{
			getFailMsg(data.message);
		}

	})
}
function deleteAddress(id){
	Notiflix.Confirm.Init();
	Notiflix.Confirm.Show( '提醒', '确认删除？', '确认', '取消',function(){
		$.post("deleteAddress",{
			id:id
		},function (data){
			if(data.code == 1){
				window.location.href='my-account?flag=address';
			}
			else{
				getFailMsg(data.message);
			}
		});
	} );
}

// 修改密码
function modefyPassword(){
	if( $("#current-pwd").val() == '' ){
		getFailMsg('请输入当前密码！');
		return;
	}
	if($("#new-pwd").val()==''){
		getFailMsg('请输入新密码！');
		return;
	}
	if($("#confirm-pwd").val()==''){
		getFailMsg('请重复输入新密码！');
		return;
	}
	if( $("#new-pwd").val() != $("#confirm-pwd").val()){
		getFailMsg('两次密码输入不一致，请重新输入！');
		return;
	}
	$.post("modefyPassword",{
		oldPassword:$("#current-pwd").val(),
		newPassword1:$("#new-pwd").val(),
		newPassword2:$("#confirm-pwd").val()
	},function (data){
		if( data.code == 1 ){
			getSuccessMsg(data.message);
			setTimeout(
				function(){
					window.location.href='loginOut';
				}
			,1000);  
		}else{
			getFailMsg(data.message);
		}
	});
}

function getFileName(){
	$("#headPic").attr("src");
	upload();
}


//文件上传
function upload(){
	$.ajax({
        url: "uploadHead.do",
        type: 'POST',
        cache: false,
        data: new FormData($('#ff')[0]),
        processData: false,
        contentType: false,
        dataType:"json",
        success : function(data) {
            if (data.code == 1) {
                $("#ti").attr("src", data.data);
                $("#head").val(data.data);
                getSuccessMsg(data.message);
                setTimeout(
                		function(){
                			window.location.href="my-account?flag=userinfo";
                		}
    			,1000);  
            } else {
            	getFailMsg(data.message);
            }
        },error :function(data){
        	getFailMsg(data.message);
        }
    });
}


