sysInit();

var postData={};
var imgs = {};
var uploadFun = function(data){
	imgs = JSON.parse(data);
}

var pdtFixCallback = function(){
	$.ajax({
		url: DOMAIN + '/getProductDetailInfo',
		type: 'GET',
		data: {
			id: getSysUrlParam('pdtId')
		},
		success: function(res){
			postData = res;
			$('.field').each(function(){
				if($(this).is('i')){
					$(this).html(res[$(this).attr('name')]);
				}else{
					$(this).val(res[$(this).attr('name')]);
				}
			});
			$('.cnt_body').show();
			if(res.images.length){
				for(var i = 0; i < res.images.length; i++){
					$('.pics_ul').append('<img src="' + res.images[i] + '"/>');
				}
			}
			UE.getEditor('editor').setContent(res.description, false);
		}
	});
}

$('.fix_btn').click(function(){
	$('.former_pics').hide();
	$('.fix_pics').show();
});

	cntLoad($('.add_btn [jump="pdts_add"]'), 'company');
	
	$.get('../data/config.json', function(res){
		optionConfigInit('sel_area', res.area);
		optionConfigInit('sel_type', res.productType);
		pdtFixCallback();
	});
	$('.submit').click(function(){
		$(this).addClass('sent').html('正在提交...');
		
		postData = {
			"id": postData.id,
			"name": getVal('name'),
			"price": getVal('price'),
			"salesCount": 0,
			"material": getVal('material'),
			"specification": getVal('specification'),
			"stockQuantity": getVal('stockQuantity'),
			"unit": getVal('unit'),
			"weight": getVal('weight'),
			"type": getVal('type'),
			"companyId": USER.id,
			"area": getVal('area'),
			"minOrderQuantity": getVal('minOrderQuantity'),
			"description": UE.getEditor('editor').getContent(),
			"soldService": getVal('soldService'),
			"status": "待审核",
			"reviewTime": "",
			"whoAdd": "",
			"addTime": "",
			"whoEdit": "",
			"editTime": null,
			"image01": imgs.image_01 || postData.image01,
			"image02": imgs.image_02 || postData.image02,
			"image03": imgs.image_03 || postData.image03,
			"image04": imgs.image_04 || postData.image04,
			"image05": imgs.image_05 || postData.image05,
			"valid": "Y"
		}
		doAddProduct();
	});
	
	//doAddProduct
	var doAddProduct = function(){
		$.ajax({
			url: DOMAIN + "/editProduct",
			//url: "http://127.0.0.1:8090" + "/addProduct",
			type: "POST",
			data: JSON.stringify(postData),
			dataType: 'JSON',
			contentType : "application/json ; charset=utf-8", 
			success: function(res){
				if(res.saved){
					alert('提交成功！');
					setUrlParameter('page', 'pdts');
					delUrlParam('pdtId');
					$('.cnt').load('../company/pdts.jsp');
				}else{
					alert('提交失败。');
					$('.submit').removeAttr('disabled').removeClass('sent');
				}
			},
			error: function(res){
				alert('提交失败，请重新提交。');
				$('.submit').removeAttr('disabled').removeClass('sent');
			}
		});
	}