sysInit();
var getData = {};
var imgArr = [ 'businessCertImg', 'businessLicenceImg', 'corporateRepImg',
		'lastMonthFinancialStmtImg', 'lastYearFinancialStmtImg',
		'openingBankAccPermitsImg' ];
$.ajax({
	url : DOMAIN + '/getUserDetailByToken',
	type : 'GET',
	xhrFields : {
		withCredentials : true
	},
	dataType : 'jsonp',
	jsonp : "callback",
	jsonpCallback : "successjsonpcallback",
	data : {
		sb : $.cookie('sb')
	},
	success : function(res) {
		console.log(res)
		getData = res;
		$('.cnt_body').show();
		var resArr = [];
		for (item in res) {
			resArr.push(item);
		}
		console.log(res)
		doFill(res, resArr, 'ca_');
		imgsFill(res, imgArr);
	}
});

var successCallback = function() {
	$('.square_block [name="userId"]').val(USER.id);
}

function selImg(el) {
	var $el = $(el);
	console.log($el.find('.upload_fix'))
	if($el.hasClass('upload_fix') || ($el.hasClass('hover_box') && !$el.find('.upload_fix').length)){
		$el.parents('.square_block').find('[name="uploadFile"]').trigger("click");
	}else if($el.find('.upload_fix').length){
		return false;
	}
}

function imgSelected(el) {
	var $el = $(el);
	$el.parents('.square_block').find('[name="submit"]').trigger("click");
}
function imgSubmit(el) {
	var $el = $(el);
	console.log($el)
	$el.parents('.square_block').find('.hover_box').html('正在上传...');
	$el.ajaxSubmit({
		type : 'post',
		url : DOMAIN + '/uploadFileForUser',
		dataType : 'JSON',
		success : function(res) {
			console.log(res)
			if (res.saved) {
				alert('上传成功！');
				$el.parents('.square_block').find('.hover_box').html('<img src="' + res.fileURL + '"><div class="upload_fix" onclick="selImg(this)">修改</div><a class="upload_view" href="' + res.fileURL + '" target="_blank">查看</a>');
			}
		}
	});
}

$('.fix_btn').click(
		function() {
			if ($(this).hasClass('to_fix')) {
				$('.disabled').removeAttr('disabled').removeClass('disabled');
				$(this).html('保存').removeClass('to_fix');
			} else if ($(this).html() == '保存') {
				$('.fix_field').attr('disabled', 'disabled').addClass(
						'disabled');
				$(this).html('正在保存..').attr('disabled', 'disabled').addClass(
						'sent');
				var fixData = {
					"phone" : getVal('phone'),
					"corporateName" : getVal('corporateName'),
					"username" : getVal('username'),
					"miniName" : getVal('miniName'),
					"operatorRealName" : getVal('operatorRealName'),
					"uniformCreditCode" : getVal('uniformCreditCode'),
					"description" : getVal('description'),
					"address" : getVal('address'),
					"bankAccount" : getVal('bankAccount'),
					"bankName" : getVal('bankName')
				}
				var postData = getData;
				var _this = $(this);
				$.extend(postData, fixData);
				$.ajax({
					url : DOMAIN + '/editUserInfo',
					type : 'POST',
					dataType : 'json',
					data : JSON.stringify(postData),
					contentType : "application/json ; charset=utf-8",
					success : function(res) {
						if (res.saved) {
							alert('修改成功！');
							_this.html('修改企业信息').removeClass('sent')
									.removeAttr('disabled').addClass('to_fix');
							$('.ca_operatorRealName').eq(0).html(
									postData.operatorRealName);
							updateUserInfo();
						} else {
							alert('保存失败，请重试。');
						}
					}
				});
			}
		});

var updateUserInfo = function() {
	$.ajax({
		url : DOMAIN + '/updateSessionUser',
		data : {
			'sb' : $.cookie('sb') || '',
			'callback' : 'success_Callback'
		},
		type : 'GET',
		xhrFields : {
			withCredentials : true
		},
		dataType : 'jsonp',
		jsonp : "callback",
		jsonpCallback : "success_Callback",
		success : function(res) {
			if (res.success) {
				USER = res.userInfo;
				console.log(USER)
				USERNAME = res.userInfo.userName;
				$('.user_name').html(USERNAME);
				$('.ca_operatorRealName').html(USER.optsName);
			}
		}
	});
}

var imgsFill = function(res, arr) {
	for (var i = 0; i < arr.length; i++) {
		if (res[arr[i]]) {
			var cnt = '<img src="'
					+ res[arr[i]]
					+ '"><div class="upload_fix" onclick="selImg(this)">修改</div><a class="upload_view" href="'
					+ res[arr[i]] + '" target="_blank">查看</a>';
			$('.' + arr[i]).html(cnt);
		}
	}
}
