$.get('../data/config.json', function(res){
	for(var j = 0; j < 2; j++){
		var item = j == 0 ? res.area : res.productType;
		for(var i = 0; i < item.length; i++){
			var _options = $('.options').eq(j);
			var _class = i < 5 ? 'a' : ((i >= 5 && i < 7) ? 'a b': '');
			_options.find('ul').append(
				'<li class="' + _class + '">' + item[i] + '</li>'
			);
			var row_length = $('.main_width').width() == 1200 ? 7 : 5;
			if(item.length > row_length){
				_options.find('.all').show();
			}else{
				_options.find('.all').hide();
			}
		}
	}
});
$('.select_box').find('tr').each(function(){
	var row_length = $('.main_width').width() == 1200 ? 7 : 5;
	if($(this).find('.options ul li').length > row_length){
		$(this).find('.all').show();
	}else{
		$(this).find('.all').hide();
	}
});

$('.all').click(function(){
	var show_el = $(this).prev('ul').find('.show');
	if(show_el.length > 0){
		show_el.removeClass('show');
		$(this).removeClass('unfolded').html('全部');
	}else{
		$(this).addClass('unfolded').html('收起').prev('ul').find('li').addClass('show');
	}
});

$.get('../data/demand.json',function(res){
	pageInit(res.totalPages);
	var dmds = res.content;
	for(var i = 0; i < dmds.length; i++){
		var dmd = dmds[i];
		$('.demand_trend').append('<li class="demand_box"><div class="demand_cnt">' + 
			'<p class="demand_title">' + dmd.name +
			'</p><ul class="demand_detail"><li><span>发布时间：</span><i>' + dmd.addTime + 
			'</i></li><li><span>需求地区：</span><i>' + dmd.area + 
			'</i></li><li><span>商品类别：</span><i>' + dmd.productType + 
			'</i></li><li><span>材质要求：</span><i>' + dmd.specification + 
			'</i></li><li><span>需求数量：</span><i>' + dmd.quantityReqrm + dmd.unit +
			'</i></li></ul></div><div class="demand_action"><p class="demand_company">' + dmd.companyName +
			'</p><p class="demand_budget">预算：<span>' + dmd.minBudget + '元~' + dmd.maxBudget +
			'元</span></p><button>我要供货</button></div></li>'
		);
	}
});