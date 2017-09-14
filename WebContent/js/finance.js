$.get('../data/finance.json', function(res){
	var items = res.content;
	for(var i = 0; i < items.length; i++){
		var item = items[i];
		$('.financial_list').append(
			'<li class="result_item"><div class="item_left"><i>' + item.bankName + 
			'</i></div><div class="item_right"><div class="border"><p class="item_title"><span>' + item.name + 
			'</span><i>' + item.paymentType + '</i>|<i>' + item.addTime + 
			'</i></p><p class="item_cnt">' + item.introduction + '</p></div></div></li>'
		);
	}
});