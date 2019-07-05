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
					for(var i=0;i<data.data.length;i++){
						$('#orderDetails').append(
								'<tr>'+
		                        '<td><img width="82px" height="82px" alt="" src="'+data.data[i].productList[0].images[0].imgpath+'"></td>'+
		                        '<td>'+data.data[i].productList[0].productname+'</td>'+
		                        '<td>'+data.data[i].price+'</td>'+
		                        '<td>'+data.data[i].count+'</td>'+
		                        '<td>'+data.data[i].sum+'</td>'+
		                        '</tr>'
								);
					}
				}
				
			},error:function(){
				getFailMsg('出现异常了，刷新试试！');
			}
	  	});
}
