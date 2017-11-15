$(function(){
	var _param = {
		'pageSize': 20,
		'pageIndex': getUrlParameter('pageIndex') || 0
	};
	var _method = '/getAllProductsByPage';
	if(window.location.href.indexOf('=') > 0){
		_method = '/getProductsByConditionsAndPage';
		$('.search_box').find('.s_param').each(function(){
			var _val = getUrlParameter($(this).attr('name'));
			$(this).val(_val);
			_param[$(this).attr('name')] = _val;
			console.log(_val)
		});
	}
	var sortField = getUrlParameter('sortField'),
		ascendingFlag = getUrlParameter('ascendingFlag');
	if(sortField && ascendingFlag && sortField != "" && ascendingFlag != ""){
		_param.sortField = sortField;
		_param.ascendingFlag = ascendingFlag;
		_method = '/getSortedProductsByConditionsAndPage';
		var _class = ascendingFlag == 'true' ? 'rank_up' : (ascendingFlag == 'false' ? 'rank_down' : '');
		$('.rank_item[sort="' + sortField + '"]').addClass(_class);
	}
	$.ajax({
		url: DOMAIN + _method,
		type: 'GET',
		data: _param,
		success: function(res){
			$('.loading_wrapper').hide();
			if(res.content.length > 0){
				for(var i = 0; i < res.content.length; i++){
					var pdt = res.content[i];
					$('.pdts').append(
							"<li class='pdt'>" +
								"<div class='pdt_l'><a href='product_detail.jsp?productId=" + pdt.id + "'><img src='" + pdt.image01 + "' /></a></div>" +
								"<div class='pdt_c'>" +
									"<p class='pdt_title'>" +
										"<a href='product_detail.jsp?productId=" + pdt.id + "'><b class='pdt_name'>" + pdt.name + "</b></a>" +
										"<span class='company_name'>【" + pdt.companyName + "】</span>" +
									"</p>" +
									"<div class='pdt_info'><div class='pdt_state'>" +
										"<p class='pdt_price'>￥<b>" + pdt.price + "</b>元/" + pdt.unit + "</p>" +
										"<p class='pdt_stock'><span>库存</span><i>" + pdt.stockQuantity + pdt.unit + "</i></p>" +
									"</div><div class='pdt_detail'>" +
										"<p class='pdt_dtl_cnt'><span>类型：" + pdt.type + "</span><span>地区：" + pdt.area + "</span></p>" +
										"<p class='pdt_dtl_cnt'><span>材质：" + pdt.material + "</span><span>规格：" + pdt.specification + "</span></p>" +
								"</div></div></div>" +
							"<div class='pdt_r'><p class='date'>" + pdt.addTime + "</p>" +
							"<a href='product_detail.jsp?productId=" + pdt.id + "' target='_blank'>下 单</a></div></li>"
					);
				}
				pageInit(res.totalPages);
			}else{
				$('.page_box').hide();
				$('.pdts').append("<p class='no_res'>抱歉，没有相应的商品。</p>")
			}
		}
	});
});