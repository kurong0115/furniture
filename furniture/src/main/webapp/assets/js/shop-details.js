		
		
		function getSuccessMsg(msg) {
			$.message({
				message : msg,
				type : 'success',
				duration : '3000'
			});
		}
		function getInfoMsg(msg) {
			$.message({
				message : msg,
				type : 'info',
				duration : '3000'
			});
		}
		function getFailMsg(msg) {
			$.message({
				message : msg,
				type : 'error',
				duration : '3000'
			});
		}
		
		function checkProductname(){
			if ($.trim($("#condition").val()) == ''){
				getFailMsg("产品名不能为空");
				return false;
			}
			return true;
		}
		
		function removeWishlist(wid){
        	$.ajax({
        		url:"removeWishlist?wid=" + wid,
        		async:true,
        		method:"get",
        		success:function(data){
        			if (data.code == 1){
        				getSuccessMsg(data.message);
        			}else{
        				getInfoMsg(data.message);
        			}
        			location.reload();
        		},
        		error:function(data){
        			getFailMsg("服务器繁忙");
        		}
        	})
        }
		
		
		
		function quickView(pid){
			$.ajax({
				url:'quickView.do?pid=' + pid,
				method:"get",
				aysnc:true,
				success:function(data){
					if (data.data == null){
						getInfoMsg("没有数据");
					} else{
						$("#quickView-pname").text(data.data.model + data.data.productname);
						$("#quickView-price").text(data.data.price);
						$("#bigImage").text('');
						$("#smallImage").text('');
						$("#quickView-size").empty();
						$("#quickView-score").empty();
						for (var i = 0; i < data.data.images.length;i++){
							if (i == 0){
								$("#bigImage").append('<div id="pro-'+(i+1)+'" class="tab-pane fade show active">'+
	                                '<img src="' +data.data.images[i].imgpath+'" alt="">'+
	                                '</div>');
								$("#smallImage").append('<a class="active" data-toggle="tab" href="#pro-'+(i+1)+'">'+
                                    '<img src="' +data.data.images[i].imgpath+'" alt="" style="width:80px;height:80px"></a>');
							}else{
								$("#bigImage").append('<div id="pro-'+(i+1)+'" class="tab-pane fade">'+
								    '<img src="' +data.data.images[i].imgpath+'" alt="">'+
		                            '</div>');
								$("#smallImage").append('<a data-toggle="tab" href="#pro-'+(i+1)+'">'+
									'<img src="' +data.data.images[i].imgpath+'" alt="" style="width:80px;height:80px"></a>');								
							}
							
						}
						$('#addCartByPid').attr("onclick","addCart('"+data.data.pid+"','"+data.data.price+"','"+data.data.images[0].imgpath+"')");
						$("#addWishListByPid").attr("onclick","addWishlist("+data.data.pid+")");
						$("#addCompareListByPid").attr("onclick", "compare("+data.data.pid+")");
						$("#stock").text(data.data.stock); 
						var size=data.data.description;
						if (size != ""){
							size=size.split(",");
	                        for (var i = 0; i < size.length;i++){
	                        	$("#quickView-size").append('<li>- '+size[i]+' </li>');
	                        }
						} else{
							$("#quickView-size").empty();							
						}
						
						
						
						for (var i = 0; i < data.data.score; i++){
							$("#quickView-score").append('<i class="sli sli-star yellow"></i>');
						}
						for (var i = data.data.score; i < 5; i++){
                            $("#quickView-score").append('<i class="sli sli-star"></i>');
                        }
					}
				},
				error:function(data){
					getFailMsg(data.message);
				}
			})
		}
		
		var onSale = $("#onSale");
		var newProduct = $("#newProduct");

		var min;
		var max;

		function getRange() {
			var range = $("#amount").val();
			var reg = /\d+/g;
			range = range.match(reg);
			min = range[0];
			max = range[1];
		}

		function getAllSelect() {
			getRange();
			var item = "";
			if ($("#onSale").get(0).checked) {
				item = item + "onSale=check&";
			}
			if ($("#newProduct").get(0).checked) {
				item = item + "newProduct=check&";
			}

			item = item + "min=" + min + "&";

			item = item + "max=" + max + "&";

			item = item + "cid=" + $("#categoryid").val();
			item = item + "&" + "page=" + $("#pageNum").val();
			$.ajax({
				url : 'item.do?' + item,
				method : "get",
				async : true,
				success : function(data) {					
					if (data.data == null) {
						getInfoMsg("没有数据");
						$("#gridList").empty();
	                    $("#shop-2").empty();					
	                    $(".select-shoing-wrap p").text(0);
	                    $("#totalPage").val(1);
					} else {
						$("#gridList").empty();
	                    $("#shop-2").empty();
						for (var i = 0; i < data.data.length; i++) {
							setShop1(data.data[i]);
							setShop2(data.data[i]);
						}											
						$("#totalPage").val(data.totalPage);
						$(".select-shoing-wrap p").text(data.totalSize);
					}
					setPage(data);	
					$("#pageNum").val(data.page);
				},
				error : function(data) {
					getFailMsg(data.message);
				}
			})

		}
		//这里给所有ajax请求添加一个complete函数
		$.ajaxSetup({
            complete : function(xhr, status) {
                //拦截器实现超时跳转到登录页面
                // 通过xhr取得响应头
                var REDIRECT = xhr.getResponseHeader("REDIRECT");
                //如果响应头中包含 REDIRECT 则说明是拦截器返回的
                if (REDIRECT == "REDIRECT")
                {
                    var win = window;
                    while (win != win.top)
                    {
                        win = win.top;
                    }
                    window.location.href = xhr.getResponseHeader("CONTEXTPATH");
                }
            }
        });
		
		function addWishlist(pid){
			$.ajax({
				url:"addWishlist?pid=" + pid,
				method:"get",
				async:true,
				success:function(data){
					if (data != null){
						if (data.code == 1){
							getSuccessMsg(data.message);
						} else{
							getInfoMsg(data.message);
						}
					}
				},
				error:function(data){
//					getFailMsg("服务器繁忙");
				}
			})
		}
		
		function compare(pid){
			$.ajax({
				url:"addCompareInfo.do?pid=" + pid,
				method:"get",
				async:true,
				success:function(data){
					if (data.code != 1){
						getInfoMsg(data.message);
					}else{
						getSuccessMsg(data.message);
					}					
				},
				error:function(data){
					getFailMsg("服务器繁忙");
				}
			})
		}
		
		function prevPage(){
			var currentPage = parseInt($("#pageNum").val());
			if (currentPage > 1){
				$("#pageNum").val(parseInt(currentPage - 1));
			} else{
				$("#pageNum").val(1);
			}
			getAllSelect();
		}
		
		function nextPage(){
			var currentPage = parseInt($("#pageNum").val());
			var totalPage = parseInt($("#totalPage").val());
			if (currentPage < totalPage){
				$("#pageNum").val(parseInt(currentPage) + 1);
			} else{
				$("#pageNum").val(totalPage);
			}
			getAllSelect();
		}
		
		function firstPage(){
			$("#pageNum").val(1);
			getAllSelect();
		}
		
		function lastPage(){
			$("#pageNum").val($("#totalPage").val());
			getAllSelect();
		}
		
		function gotoPage(pageNum){
			$("#pageNum").val(pageNum);
			getAllSelect();
		}
		
		function setPage(data){
			$("#page-field").empty();
			$("#page-field").append('<li><a href="javascript:firstPage()">首页</a></li>');
			$("#page-field").append('<li><a class="prev" href="javascript:prevPage()"><i class="sli sli-arrow-left"></i></a></li>');
			if (data.page>1){
				$("#page-field").append('<li><a href="javascript:gotoPage('+ parseInt(data.page - 1) + ')">' + parseInt(data.page - 1) + '</a></li>');
			}
			$("#page-field").append('<li><a class="active" href="#">'+data.page+'</a></li>');
			if (data.page < data.totalPage){
				$("#page-field").append('<li><a href="javascript:gotoPage(' + parseInt(data.page + 1) + ')">' + parseInt(data.page + 1) + '</a></li>');
			}
			$("#page-field").append('<li><a class="next"  href="javascript:nextPage()"><i class="sli sli-arrow-right"></i></a></li>');
			$("#page-field").append('<li><a href="javascript:lastPage()">末页</a></li>');
		}
		
		function setShop1(data) {
			var grid = '';
			grid=grid+'<span class="ht-product-user-ratting" style="width: 100%;">';
			
			for(var i = 0; i < data.score; i++){
				grid = grid+'<i class="sli sli-star"></i>';
			}
			grid = grid+'</span>';
			for(var i = 0; i < data.score; i++){
				grid = grid+'<i class="sli sli-star"></i>';
			}
			for(var i = data.score; i < 5; i++){
				grid = grid+'<i class="sli sli-star"></i>';
			}
			$("#gridList")
					.append(
							'<div class="col-xl-4 col-md-6 col-lg-6 col-sm-6">'
									+ '<div class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">'
									+ '<div class="ht-product-inner">'
									+ '<div class="ht-product-image-wrap">'
									+ '<a href="product-details?pid='
									+ data.pid
									+ '" class="ht-product-image"> <img src="' + data.images[0].imgpath +'" alt="Universal Product Style"> </a>'
									+ ' <div class="ht-product-action">'
									+ '<ul>'
									+ '<li><a href="#" onclick="quickView('+data.pid+')" data-toggle="modal" data-target="#exampleModal"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">快速预览</span></a></li>'
									+ '<li><a href="#" onclick="addWishlist('+data.pid+')"><i class="sli sli-heart"></i><span class="ht-product-action-tooltip">添加到愿望清单</span></a></li>'
									+ '<li><a href="#" onclick="compare('+data.pid+')"><i class="sli sli-refresh"></i><span class="ht-product-action-tooltip">对比</span></a></li>'
									+ '<li><a href="#"><i class="sli sli-bag"></i><span class="ht-product-action-tooltip">添加到购物车</span></a></li>'
									+ '</ul>'
									+ '</div>'
									+ '</div>'
									+ '<div class="ht-product-content">'
									+ '<div class="ht-product-content-inner">'
									+ '<div class="ht-product-categories"><a href="#">'
									+ data.category.categoryname
									+ '</a></div>'
									+ '<h4 class="ht-product-title"><a href="product-details?pid='
									+ data.pid
									+ '">'
									+ data.model+data.productname
									+ '</a></h4>'
									+ '<div class="ht-product-price">'
									+ '￥<span class="new">'
									+ data.price
									+ '</span>'
									+ '</div>'
									+ '<div class="ht-product-ratting-wrap">'
									+ '<span class="ht-product-ratting">'
									+ grid
									+ '</div>'
									+ '</div>'
									+ '<div class="ht-product-action">'
									+ '<ul>'
									+ '<li><a href="#"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">快速预览</span></a></li>'
									+ '<li><a href="#" onclick="addWishlist('+data.pid+')"><i class="sli sli-heart"></i><span class="ht-product-action-tooltip">添加到愿望清单</span></a></li>'
									+ '<li><a href="#" onclick="compare('+data.pid+')"><i class="sli sli-refresh"></i><span class="ht-product-action-tooltip">对比</span></a></li>'
									+ '<li><a href="#"><i class="sli sli-bag"></i><span class="ht-product-action-tooltip">添加到购物车</span></a></li>'
									+ '</ul>'
									+ '</div>'
									+ '<div class="ht-product-countdown-wrap">'
									+ '<div class="ht-product-countdown" data-countdown="2020/01/01"></div>'
									+ '</div>'
									+ '</div>'
									+ '</div>'
									+ '</div>'
									+ '</div>');
		}

		function setShop2(data) {
			var grid = '';
			grid = grid + '<span class="ht-product-list-ratting">';
			for(var i = 0; i < data.score; i++){
				grid = grid+'<i class="sli sli-star"></i>';
			}              	                                                                     
			grid = grid + '</span>';
			for(var i = data.score; i < 5; i++){
				grid = grid + '&nbsp;&nbsp;<i class="sli sli-star"></i>';
			}
                
           
			$("#shop-2")
					.append(
							'<div class="shop-list-wrap shop-list-mrg2 shop-list-mrg-none mb-30">'
									+ '<div class="row">'
									+ '<div class="col-lg-4 col-md-4">'
									+ '<div class="product-list-img">'
									+ '<a href="product-details?pid='
									+ data.pid
									+ '">'
									+ '<img src="' + data.images[0].imgpath +'" alt="Universal Product Style">'
									+ '</a>'
									+ '<div class="product-quickview">'
									+ '<a href="#" title="Quick View" data-toggle="modal" data-target="#exampleModal" onclick="quickView('+data.pid+')"><i class="sli sli-magnifier-add"></i></a>'
									+ '</div>'
									+ '</div>'
									+ '</div>'
									+ '<div class="col-lg-8 col-md-8 align-self-center">'
									+ '<div class="shop-list-content">'
									+ '<h3><a href="product-details?pid='
									+ data.pid
									+ '">'
									+ data.model +data.productname
									+ '</a></h3>'
									+ '<p>It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard The standard chunk.</p>'
									+ '<span>Chair</span>'
									+ '<div class="shop-list-price-action-wrap">'
									+ '<div class="shop-list-price-ratting">'
									+ '<div class="ht-product-list-price">'
									+ '￥<span class="new">'
									+ data.price
									+ '</span>'
									+ '</div>'
									+ grid
									+ '</div>'
									+ '<div class="ht-product-list-action">'
									+ '<a class="list-wishlist" title="添加到愿望清单" href="#" onclick="addWishlist('+data.pid+')"><i class="sli sli-heart"></i></a>'
									+ '<a class="list-cart" title="添加到购物车" href="#"><i class="sli sli-basket-loaded"></i> 添加到购物车</a>'
									+ '<a class="list-refresh" title="对比" href="#" onclick="compare('+data.pid+')"><i class="sli sli-refresh"></i></a>'
									+ '</div>'
									+ '</div>'
									+ '</div>'
									+ '</div>'
									+ '</div>' + '</div>');
		}