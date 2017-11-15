sysInit();
var successCallback = function(){
	if($('.cnt_body').hasClass('cnt_pdts')){
		cntLoad($('.add_btn [jump="pdt_add"]'), 'company');
		$.ajax({
			url: DOMAIN + '/getProductsByCompanyIdOnBackend',
			type: 'GET',
			data: {
				companyId: USER.id,
				pageIndex: getSysUrlParam('pageIndex') || 0,
				pageSize: 20
			},
			success: function(res){
				$('.pdts').empty();
				$('.cnt_body').show();
				if(res.content.length){
					for(var i = 0; i < res.content.length; i++){
						var pdt = res.content[i];
						var _class = i % 2 == 0 ? '' : 'odd';
						var _operation = res.content[i].status == "已审核" ? '' : '<a class="op to_fix" jump="pdt_fix">修改</a>|';
						$('.pdts').append(
							'<tr class="' + _class + 
							'"><td>' + pdt.name +
							'</td><td>' + pdt.type +
							'</td><td>' + pdt.specification +
							'</td><td>' + pdt.material +
							'</td><td>' + pdt.stockQuantity +
							'</td><td>' + pdt.status +
							'</td><td>' + pdt.addTime +
							'</td><td>' + pdt.salesCount +
							'</td><td pdtId="' + pdt.id + '">' + _operation + '<a class="op to_del">删除</a>|<a class="op view" jump="pdt_detail">查看</a></td></tr>'
						);
					}
				}else{
					noRes($('.pdts'));
				}
				$('.pdts').on('click', '.op', function(){
					var pdtId = $(this).parent().attr('pdtId');
					if($(this).hasClass('view')){
						jump('company', {
							page: 'pdt_detail',
							pdtId: pdtId,
							prepage: 'pdts'
						});
					}else if($(this).hasClass('to_del')){
						$.ajax({
							url: DOMAIN + '/softDeleteProduct',
							type: 'POST',
							data: {
								productId: pdtId
							},
							dataType: 'json',
							success: function(res){
								if(res.deleted){
									alert('操作成功！');
									reload('company');
								}else{
									alert('操作失败，请重试。');
								}
							}
						});
					}else if($(this).hasClass('to_fix')){
						jump('company', {
							page: 'pdt_fix',
							pdtId: pdtId,
						});
					}
				});
				pageInit(res.totalPages);
			}
		});
	}
}

if($('.cnt_body').hasClass('cnt_pdt_add')){
	$('.cnt_body').show();
	var postData={};
	var imgs = {};
	var uploadFun = function(data){
		imgs = JSON.parse(data);
	}
	cntLoad($('.add_btn [jump="pdts_add"]'), 'company');
	
	$.get('../data/config.json', function(res){
		optionConfigInit('sel_area', res.area);
		optionConfigInit('sel_type', res.productType);
	});
	$('.submit').off();
	$('.submit').on('click', function(){
		$(this).addClass('sent').html('正在提交...');
		
		postData = {
			"id": null,
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
			"image01": imgs.image_01,
			"image02": imgs.image_02,
			"image03": imgs.image_03,
			"image04": imgs.image_04,
			"image05": imgs.image_05,
			"valid": "Y"
		}
		doAddProduct();
	});
	
	//doAddProduct
	var doAddProduct = function(){
		$.ajax({
			url: DOMAIN + "/addProduct",
			//url: "http://127.0.0.1:8090" + "/addProduct",
			type: "POST",
			data: JSON.stringify(postData),
			dataType: 'JSON',
			contentType : "application/json ; charset=utf-8", 
			success: function(res){
				if(res.saved){
					alert('提交成功！');
					jump('company', 'pdts');
				}else{
					alert('提交失败。');
					$('.submit').removeAttr('disabled').removeClass('sent').html('提 交');
				}
			},
			error: function(res){
				alert('提交失败，请重新提交。');
				$('.submit').removeAttr('disabled').removeClass('sent').html('提 交');
			}
		});
	}
}