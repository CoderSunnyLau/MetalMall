$.get('../data/config.json', function(res){
	for(var j = 0; j < 2; j++){
		var item = j == 0 ? res.area : res.productType;
		for(var i = 0; i < item.length; i++){
			var _options = $('.options').eq(j);
			var _class = i < 5 ? 'a' : ((i >= 5 && i < 7) ? 'a b': '');
			_options.find('ul').append(
				'<li class="' + _class + '" val="' + item[i] + '">' + item[i] + '</li>'
			);
			var row_length = $('.main_width').width() == 1200 ? 7 : 5;
			if(item.length > row_length){
				_options.find('.all').show();
			}else{
				_options.find('.all').hide();
			}
		}
	}
	$('.fl_left .piece_sel').each(function(){
		var _param = getUrlParameter($(this).attr('s_type'));
		var _type = $(this).attr('s_type');
		console.log(_param)
		console.log($('.' + _type).find('[val=' + _param + ']'))
		if(_param){
			$('.' + _type).find('[val=' + _param + ']').addClass('crr_sel');
			$('[s_type=' + _type + ']').html('<div><span>' + _param + '</span><i>×</i></div>');
		}
	});
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

$('.options').on('click', 'li', function(){
	var el = $(this);
	var _type = el.parents('.area').length == 1 ? 'area' : 'type';
	setUrlParameter(_type, el.html());
});

$('.fl_left .piece_sel').click(function(){
	setUrlParameter($(this).attr('s_type'), '');
});


var _method = '/getReqFormsByConditions';

var sortField = getUrlParameter('sortField'),
	ascendingFlag = getUrlParameter('ascendingFlag');

var _param = {
	'pageSize': 20,
	'pageIndex': getUrlParameter('pageIndex') || 0,
	'area':getUrlParameter('area'),
	'type':getUrlParameter('type')
};
if(sortField && ascendingFlag && sortField != "" && ascendingFlag != ""){
	_param.sortField = sortField;
	_param.ascendingFlag = ascendingFlag;
	_method = '/getSortedReqFormsByConditions';
	var _class = ascendingFlag == 'true' ? 'rank_up' : (ascendingFlag == 'false' ? 'rank_down' : '');
	$('.rank_item[sort="' + sortField + '"]').addClass(_class);
}
$.ajax({
	url: DOMAIN + _method,
	type: 'GET',
	data: _param,
	success:function(res){
		$('.loading_wrapper').hide();
		if(res.totalElements == 0){
			$('.demand_trend').append('<p class="no_res">抱歉，没有找到相关的需求单。</p>');
		}else{
			pageInit(res.totalPages);
			var dmds = res.content;
			for(var i = 0; i < dmds.length; i++){
				var dmd = dmds[i];
				$('.demand_trend').append('<li class="demand_box"><div class="demand_cnt">' + 
					'<a href="demand_detail.jsp?id=' + dmd.id + '" target="_blank"><p class="demand_title">' + dmd.name +
					'</p></a><ul class="demand_detail"><li><span>发布时间：</span><i>' + dmd.addTime + 
					'</i></li><li><span>需求地区：</span><i>' + dmd.area + 
					'</i></li><li><span>商品类别：</span><i>' + dmd.productType + 
					'</i></li><li><span>材质要求：</span><i>' + dmd.specification + 
					'</i></li><li><span>需求数量：</span><i>' + dmd.quantityReqrm + dmd.unit +
					'</i></li></ul></div><div class="demand_action"><p class="demand_company">' + dmd.companyName +
					'</p><p class="demand_budget">预算：<span>' + dmd.minBudget + '元~' + dmd.maxBudget +
					'元</span></p><a class="btn" href="demand_detail.jsp?id=' + dmd.id + '" target="_blank">我要供货</a></div></li>'
				);
			}
		}
	}
});