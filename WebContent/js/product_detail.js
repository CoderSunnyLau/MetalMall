$(function(){
	$.get('product_detail.json', function(res){
		for(i in res.images){
			if(i == 0){$('.img_box .main_img').attr('src',res.images[0]);}
			$('.img_box .imgs').append("<li class='img'><img src='" + res.images[i] + "' /></li>");
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
		$('.sold_service').html(res.soldService)
	});
});