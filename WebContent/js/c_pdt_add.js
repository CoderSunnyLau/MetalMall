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
sysInit();
var postData={};
var imgs = {};
var uploadFun = function(data){
	imgs = JSON.parse(data);
}
cntLoad($('.add_btn [jump="pdts_add"]'), 'company');

$('.submit').click(function(){
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
			"companyId": 1,
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
	console.log(postData);
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
		contentType: "application/json ; charset=utf-8",
		success: function(res){
			if(res.saved){
				console.log(res);
				alert('提交成功！');
				reload('company');
			}else{
//				alert(res.message);
//				$('.submit').removeAttr('disabled').removeClass('sent');
			}
		},
		error: function(res){
			alert('提交失败，请重新提交。');
			$('.submit').removeAttr('disabled').removeClass('sent');
		}
	});
}