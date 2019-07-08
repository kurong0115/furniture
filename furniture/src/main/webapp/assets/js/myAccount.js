function getFlag(){
	var flag = GetQueryString("flag");
	if( flag == 'address' ){
		$("#aaaa").click();
		return;
	}
}

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
				console.info(data.data[0])
				if(data.code==1){
					$('#orderDetails').html('');
					$(".ystep4").html('');
					$('#orderNo').text("订单编号："+data.data[0].orderno);
					for(var i=0;i<data.data[1].length;i++){
						$('#orderDetails').append(
								'<tr>'+
		                        '<td><img width="82px" height="82px" alt="" src="'+(data.data[1])[i].productList[0].images[0].imgpath+'"></td>'+
		                        '<td>'+(data.data[1])[i].productList[0].productname+'</td>'+
		                        '<td>'+(data.data[1])[i].price+'</td>'+
		                        '<td>'+(data.data[1])[i].count+'</td>'+
		                        '<td>'+(data.data[1])[i].sum+'</td>'+
		                        '</tr>'
								);
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
					}
					if(data.data[0].isdeal==1){
						$(".ystep4").setStep(4)
					}
					if(data.data[0].isfinish==1){
						$(".ystep4").setStep(5)
					}
				}
			},error:function(){
				getFailMsg('出现异常了，刷新试试！');
			}
	  	});
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
	if( $('#loc_province').val()=='' ){
		getFailMsg('请输入您的详细地址！');
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
var addressid = null;
function QueryAddress(id){
	addressid = id;
	$.post("queryAddress",{
			id:id
		},function(data){
			if( data.code==1 ){
				$('#addressName2').val(data.data.name);
				$('#addressPhone2').val(data.data.phone);
				var str = data.data.address.split('-');
				$('#addressDetails2').val(str[3]);
			}
		}	
	)
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
	if( $('#loc_province2').val()=='' ){
		getFailMsg('请输入您的详细地址！');
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
	if(confirm("删除？")){
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
	}
}

//xiu改密码
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
