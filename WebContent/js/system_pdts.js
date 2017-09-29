//	$.get('/yijinsuo/web/mall.json', function(res){
//		for(var i = 0; i < res.content.length; i++){
//			var pdt = res.content[i];
//			$('.pdts').append(
//				"<tr><td class='pdt_name'>" + pdt.name +
//				"</td><td>" + pdt.type +
//				"</td><td>" + pdt.specification +
//				"</td><td>" + pdt.material +
//				"</td><td>" + pdt.stockQuantity +
//				"</td><td>" + pdt
//			);
//		}
//	});
cntLoad($('.add_btn [jump="pdts_add"]'), 'company');