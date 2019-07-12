		function addCart(pid,price,imgpath) {
			$.get("addCart",{
				pid:pid,
				count:1
			},function(data){
				if(data.code==1){
					getSuccessMsg(data.message);
					var CartCount=$('.headerCartCount').text();
					var allSum=$('#sum').val();									
					var newAllSum=Number(price)+Number(allSum);
					$('.allSum').text(newAllSum);
					$('#sum').val(newAllSum);
					var size=$('#cartUl li').length;
					for(var i=0;i<size;i++){
						var allCartPid=$('#cartUl li:eq('+i+')').find("div:eq(1)").find("input").val();
						if(allCartPid==pid){
							var CartPidCount=$('#cartUl li:eq('+i+')').find("div:eq(1)").find("span").find("font").text();
							$('#cartUl li:eq('+i+')').find("div:eq(1)").find("span").find("font").text(++CartPidCount)
							return;
						}
					}
					if($('#cartUl li:first').text()=="暂无商品"){
						$('#cartUl li:first').remove();
					}
					$('#cartUl').append(
						'<li class="single-shopping-cart">'+
                           '<div class="shopping-cart-img">'+
                               '<a href="#"><img alt="" src="'+imgpath+'"></a>'+       
                           '</div>'+
                           '<div class="shopping-cart-title" style="width: 100px;overflow: hidden;">'+
                               '<h4><a href="#">'+data.data.product.productname+'</a></h4>'+
                               '<input type="hidden" value="'+pid+'">'+
                               '<span><font>'+data.data.count+'</font> x '+data.data.product.price+'</span>'+
                           '</div>'+
                           '<div class="item-close" style="margin-left: 20px">'+
                               '<a href="#"><i class="sli sli-close" onclick="headerDelCart(this)"></i></a>'+
                               '<input type="hidden" value="'+data.data.id+'">'+
                           '</div>'+
                       '</li>'
					);
					$('.headerCartCount').text(++CartCount);
				}else{
					getFailMsg("您尚未登录，请先登录");
					location.href="login-register";
					getFailMsg("当前访问人数较多，请稍后再试");
				}
			})
		}
		function checkOut() {
			if($('#tbb').children("tr").children("td").find("span").text()=="暂无商品被加入购物车" 
					|| $('#cartUl').children("li").text()=="暂无商品"){
				getInfoMsg("购物车啥也没有");
			}else{
				location.href="checkout";
			}
		}
		
		function headerDelCart(del) { 			
			$.post("cart/delCart",{
				id:$(del).parent().next().val()
			},function(data){
				if(data.code==1){
					var str=$(del).parent().parent().prev().find("span").text().split("x");
					var count=str[0];
					var price=str[1];
					var sum=count*price;
					var allSum=$('#sum').val();
					var rows=$(del).parent().parent().parent().prevAll().length-1;
					var CartCount=$('.headerCartCount').text();
					getSuccessMsg(data.message);				
					
					$(del).parent().parent().parent().remove();
					if($('#cartUl li').length==0){
						$('#cartUl').append(
							'<input type="hidden" value="0" id="sum">'+
							'<li>暂无商品</li>'
						);
					}
					$('#tbb tr:eq('+rows+')').remove();
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
		
		/* 用户注销 */
		function loginOut(){
			Notiflix.Confirm.Init();
			Notiflix.Confirm.Show( '提醒', '您确认注销当前账号？', '确认', '取消',function(){
				location.href="loginOut";
			} );
			/*var flag = confirm("您确认注销当前账号？");
			alert(flag);
			return flag;*/
		}
		
		function getSuccessMsg(msg) {
	  		$.message({
	  	        message:msg,
	  	        type:'success',
	  	        duration:'3000'
	  	    });
	  	}
	  	function getInfoMsg(msg) {
	  		$.message({
	  	        message:msg,
	  	        type:'info',
	  	        duration:'3000'
	  	    });
	  	}
	  	function getFailMsg(msg) {
	  		$.message({
	  	        message:msg,
	  	        type:'error',
	  	        duration:'3000'
	  	    });
	  	}