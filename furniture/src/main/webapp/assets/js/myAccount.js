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

function addAddress() {
	alert()
	$.post('addAddress',{
		name:$('#addressName').val(),
		phone:$('#addressPhone').val(),
		address:$('#loc_province').select2('data').text+$('#loc_city').select2('data').text+$('#loc_town').select2('data').text+$('#addressDetails').val()
	},function(data){
		if(data.code==1){
			
		}else{
			getFailMsg('添加失败，请稍后再试');
		}
	})
}
