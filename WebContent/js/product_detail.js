
	var _session;
	var pdtId = getUrlParameter('productId');
	
	$.get( DOMAIN + '/getProductDetailInfo?id=' + pdtId, function(res){
		$('.loading_wrapper').hide();
		for(i in res.images){
			var _crrBig, _crrSmall;
			_crrBig = i == 0 ? 'crr_big' : '';
			_crrSmall = i == 0 ? 'crr_small' : '';
			$('.main_imgs').append("<li class='" + _crrBig + "'><img src='" + res.images[i] + "' /></li>");
			$('.img_box .imgs').append("<li class='img " + _crrSmall + "'><img src='" + res.images[i] + "' /></li>");
		}
		$('.pdt_name').html(res.name);
		$('#company').html(res.companyName);
		$('#pdt_type').html(res.type);
		$('#add_date').html(res.formatAddTime);
		$('#area').html(res.area);
		$('#material').html(res.material);
		$('#specification').html(res.specification);
		$('#weight').html(res.weight);
		$('#min_order').html(res.minOrderQuantity + res.unit);
		$('#stock').html(res.stockQuantity + res.unit);
		$('.price').html("<b>￥" + res.price + "</b>/" + res.unit);
		$('#detail_cnt').html(res.description);
		$('.sold_service').html(res.soldService);
		
		$.ajax({
			url: DOMAIN + '/getSessionUser',
			data: {
				'sb': $.cookie('sb') || '',
				'callback':'success_jsonpCallback'
			},
			type: 'GET',
			xhrFields:{withCredentials:true},
			dataType:'jsonp',
			jsonp:"callback",
			jsonpCallback:"success_jsonpCallback",
			success: function(r){
				if(r.success){
					$('.buy').attr('href', YJS + '/web/order_checkout.jsp?productId=' + pdtId);
					_session = true;
				}else{
					_session = false;
				}
				
				isToBuy(_session);
			}
		});
	});
	
	var successCallback = function(){
		$.ajax({
			url: DOMAIN + '/getOneProductStoredFlagByCompanyId',
			type: 'GET',
			data: {
				companyId: USER.id,
				productId: pdtId
			},
			success: function(res){
				if(res.stored){
					$('.favorite').addClass('stored').html('取消收藏');
				}
			}
		});
	}
	 
	var isToBuy = function(s){
		$('.buy').click(function(){
			if(!s){
				modal.choose('此操作需登录后才可进行，请问是否跳转到登录页？', function(r){
					if(r){
						window.location.href = 'login.jsp?target=' + YJS + '/web/order_checkout.jsp?productId=' + pdtId;
					}else{
						return;
					}
				});
				//alert('您当前尚未登录，请登录后再下单。');
			}
		});
		$('.favorite').click(function(){
			if(!s){
				modal.choose('此操作需登录后才可进行，请问是否跳转到登录页？', function(r){
					if(r){
						window.location.href = 'login.jsp?target=' + _href;
					}else{
						return;
					}
				});
			}else if($(this).hasClass('stored')){$.ajax({
				url: DOMAIN + '/removeFavoriteProductForCompany',
				type: 'POST',
				dataType: 'JSON',
				data: {
					companyId: USER.id,
					productId: pdtId
				},
				success: function(res){
					if(res.deleted){
						$('.favorite').removeClass('stored').html('收藏');
						alert('已取消收藏。');
					}else{
						alert('操作失败。');
					}
				}
			});
			}else{
				$.ajax({
					url: DOMAIN + '/storedFavoriteProductForCompany',
					type: 'POST',
					dataType: 'JSON',
					data: {
						companyId: USER.id,
						productId: pdtId
					},
					success: function(res){
						if(res.saved){
							$('.favorite').addClass('stored').html('取消收藏');
							alert('收藏成功！');
						}else{
							alert('收藏失败。');
						}
					}
				});
			}
		});
	}
	
	var isAnimate = false;
	$('.imgs').on('click', '.img', function(){
		if(!isAnimate){
			isAnimate = true;
			var _index = $(this).index();
			crrClass($(this), 'crr_small');
			$('.main_imgs .crr_big').animate({
				opacity: 0
			}, 200, function(){
				$('.crr_big').removeClass('crr_big');
				$('.main_imgs li').eq(_index).animate({
					opacity: 1
				}, 300, function(){
					$(this).addClass('crr_big');
					isAnimate = false;
				});
			});
		}else{
			return false;
		}
	});
	