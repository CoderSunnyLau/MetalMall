sysInit();
var _method, _operation;
if($('.cnt_body').hasClass('pdts_all')){
	_method = '/getAllProductsByPageOnBackend';
	_operation = '<a class="view op">查看</a>';
}else{
	_method = '/getAllPendingProductsByPageOnBackend';
	_operation = '<a class="pass op">通过</a>|<a class="refuse op">打回</a>';
}

$('.pdts').on('click', '.op', function(){
	var pdtId = $(this).parent().attr('pdtId');
	if($(this).hasClass('pass') || $(this).hasClass('refuse')){
		if($(this).hasClass('pass')){
			var _status = '已审核';
		}else{
			var _status = '审核打回';
		}
		$.ajax({
			url: DOMAIN + '/changeProductStatus',
			type: 'POST',
			dataType: 'json',
			data: {
				productId: pdtId,
				status: _status
			},
			success: function(res){
				console.log(res)
				console.log(res.success)
				if(res.success){
					alert('操作成功！');
					reload('admin');
				}
			}
		});
	}else if($(this).hasClass('view')){
		jump('admin', {
			page: 'pdt_detail',
			pdtId: pdtId
		});
	}
});

$.ajax({
	url: DOMAIN + _method,
	type: 'GET',
	data: {
		'pageIndex': getSysUrlParam('pageIndex') || 0,
		'pageSize': 20
	},
	success: function(res){
		$('.cnt_body').show();
		$('.pdts').empty();
		for(var i = 0; i < res.content.length; i++){
			var pdt = res.content[i];
			var _class = i % 2 == 0 ? '' : 'odd';
			var _operation2 = pdt.status == '已审核' ? '|<a class="refuse op">打回</a>' : '';
			$('.pdts').append(
				'<tr class="' + _class + 
				'"><td class="pdt_name">' + pdt.name + 
				'</td><td>' + pdt.type +
				'</td><td>' + pdt.specification +
				'</td><td>' + pdt.material +
				'</td><td>' + pdt.stockQuantity +
				'</td><td>' + pdt.status +
				'</td><td>' + pdt.addTime +
				'</td><td>' + pdt.salesCount +
				'</td><td pdtId="' + pdt.id + '">' + _operation + _operation2 + '</td></tr>'
			);
		}
		pageInit(res.totalPages);
	}
});
