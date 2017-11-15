

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
	var _type = el.parents('.select_bank').length == 1 ? 'bank' : 'type';
	setUrlParameter(_type, el.html());
});

$('.fl_left .piece_sel').click(function(){
	setUrlParameter($(this).attr('s_type'), '');
});


var _method = '/getBankProductsByPage';

var bank = getUrlParameter('bank'),
	type = getUrlParameter('type'),
	sortField = getUrlParameter('sortField'),
	ascendingFlag = getUrlParameter('ascendingFlag');

var _param = {
	'pageSize': 20,
	'pageIndex': getUrlParameter('pageIndex') || 0,
	'bankName':getUrlParameter('bank'),
	'type':getUrlParameter('type')
};
if(bank || type){
	_method = '/getBankProductsByConditions';
	_param.bankName = bank || null;
	_param.type = type || null;
}
if(sortField && ascendingFlag && sortField != "" && ascendingFlag != ""){
	_param.sortField = sortField;
	_param.ascendingFlag = ascendingFlag;
	_method = '/getSortedBankProductsByConditions';
	var _class = ascendingFlag == 'true' ? 'rank_up' : (ascendingFlag == 'false' ? 'rank_down' : '');
	$('.rank_item[sort="' + sortField + '"]').addClass(_class);
}

$.ajax({
	url: DOMAIN + _method,
	type: 'GET',
	data: _param,
	success: function(res){
		$('.loading_wrapper').hide();
		if(res.totalElements == 0){
			$('.financial_list').append('<p class="no_res">抱歉，没有找到相关的信息。</p>');
		}else{
			var items = res.content;
			for(var i = 0; i < items.length; i++){
				var item = items[i];
				$('.financial_list').append(
					'<li class="result_item"><div class="item_left"><i>' + item.bankName + 
					'</i></div><div class="item_right"><a href="financial_detail.jsp?id=' + item.id + '" target="_blank"><div class="border"><p class="item_title"><span>' + item.name + 
					'</span><i>' + item.paymentType + '</i>|<i>' + item.addTime + 
					'</i></p><p class="item_cnt">' + item.brief + '</p></div></a></div></li>'
				);
			}
		}
		pageInit(res.totalPages);
	}
});