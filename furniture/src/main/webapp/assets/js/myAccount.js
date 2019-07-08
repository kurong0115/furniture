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
				if(data.code==1){
					
					$('#orderDetails').html('');
					$(".ystep4").html('');
					$('#orderNo').text("订单编号："+data.data[0].orderno);
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
			                        '<td><button type="button" onclick="login()" class="comment"  style="width:100%;">去评论</button> </td>'+
			                        '</tr>'
									);
							
						}
					}else{
						var tr=$('#ordersTable thead tr').children("th");
						for(var i=0;i<tr.length;i++){
							if(tr.eq(i).text()=='操作'){
								tr.eq(i).remove();
							}
						}
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
						$('#finishBnt').append('<button type="button" onclick="login()" class="comment">确认收货</button>')	
					}
					if(data.data[0].isdeal==1){
						$(".ystep4").setStep(4)
						$('#finishBnt').empty();
						$('#finishBnt').append('<button type="button" onclick="login()" class="comment">确认收货</button>')	
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

function seeOrderMore(){
	$.post('seeOrderMore',function(data){
		if(data.code==1){
			$('#orderList tr').remove();
			for(var i=0;i<data.data.length;i++){
				var createTime=new Date(data.data[i].createtime);
				if(data.data[i].ispay==1 && data.data[i].isdeal==0 && data.data[i].isfinish==0){
					$('#orderList').append(
							'<tr>'+
			                    '<td>'+data.data[i].orderno+'</td>'+
			                    '<td>'+createTime.toLocaleString()+'</td>'+
			                    '<td>'+data.data[i].sum+'</td>'+
			                    '<td>订单已付款</td>'+
			                    '<td style="width: 180px;">'+
								'		<button  data-toggle="modal" data-target="#exampleModal" '+
								'		onclick="checkDetail('+data.data[i].id+')" class="comment" style="width:50%">详情</button>'+
			                    '		<button  onclick="login()" class="comment" style="width:50%">确认收货</button>'+
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
			                    '		<button  onclick="login()" class="comment" style="width:50%">确认收货</button>'+
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
								'		onclick="checkDetail('+data.data[i].id+')" class="comment" style="width:50%">详情</button>'+
			                    '		<button  onclick="login()" class="comment" style="width:50%">确认收货</button>'+
			                    '</td>'+
			                '</tr>'
					);
				}
				
			}
			$('#orderTfoot').remove();
			
		}
	})
}
