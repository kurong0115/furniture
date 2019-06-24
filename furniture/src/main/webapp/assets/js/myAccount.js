/**
 * 查看订单详情
 * @returns
 */
function checkDetail(orderid) {
	alert(orderid);
	$.ajax({
			url:"orderDetails",
			type:'GET',
			data:{
				orderid:orderid
			},
			dataType:"json",
			success:function(data){
				
			},error:function(){
				getFailMsg('出现异常了，刷新试试！');
			}
	  	});
}