function clearCart() {
		if($('#tbb').children("tr").children("td").find("span").text()=="暂无商品被加入购物车"){
			getInfoMsg("购物车啥也没有");
		}else{
			$.post("cart/clearCart",function(data){
				if(data.code==1){
					getSuccessMsg(data.message);
					var allSum=0;
					$('#tbb').find("tr").remove();
					$('#cartUl li').remove();
					$('#tbb').append(
						'<tr style="text-align: center;">'+			
                        '<td colspan="6"><span>暂无商品被加入购物车</span></td>'+
                        '</tr>'	
					);
					$('#cartUl').append(
							'<li>暂无商品</li>'
					);
					$('.allSum').text(allSum);
					$('.headerCartCount').text(0);	
					$('#sum').val(allSum);
				}else{
					getFailMsg("您尚未登录，请先登录");
					location.href="login-register";
				}
			});
		}
	}
    
  	function cartDelCart(del) { 
		$.post("cart/delCart",{
			id:$(del).parent().next().val()
		},function(data){
			if(data.code==1){
				var sum=$(del).parent().parent().prev().find("span").text();
				var allSum=$('#sum').val();
				var CartCount=$('.headerCartCount').text();
				var rows=$(del).parent().parent().parent().prevAll().length;
				getSuccessMsg(data.message);				
				
				$(del).parent().parent().parent().remove();
				if($('#tbb').children("tr").length==0){
					$('#tbb').append(
						'<tr style="text-align: center;">'+			
                        '<td colspan="6"><span>暂无商品被加入购物车</span></td>'+
                        '</tr>'	
					);
				}
				$('#cartUl li:eq('+rows+')').remove();
				if($('#cartUl li').length==0){
					$('#cartUl').append(
						'<li>暂无商品</li>'
					);
				}
				
				$('.allSum').text(allSum-sum);
				$('.headerCartCount').text(--CartCount);
				$('#sum').val(allSum-sum);
			}else if(data.code==0){
				getFailMsg(data.msg);
			}else{
				getFailMsg("您尚未登录，请先登录");
				location.href="login-register";
			}
		});
	}