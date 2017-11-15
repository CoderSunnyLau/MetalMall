document.write('<script src="' + YJS + '/libs/md5.js"></script>');
// 加載地區選項
$.get('../data/config.json', function(res){
	optionConfigInit('select_area', res.area)
});
sendVerify($('.valid_btn'), $('.check_field[name="phone"]'));

/*表單驗證函數*/
//驗證方法
var checkFn = function(el,name,minLength){
	if(!el.is('input')){
		if(el.val() == "unselected"){
			el.next('i').html("请选择" + name).addClass("error");
		}else{
			el.next('i').empty().removeClass("error");
		}
	}else if(!el.val()){
		el.next('i').html("请输入" + name).addClass("error");
	}else if(el.parent().attr('id') == "repeat_psd"){
		if(el.val() != $('#set_psd').find('.check_field').val()){
			el.next('i').html("两次输入的密码不一致").addClass("error");
		}else{
			el.next('i').empty().removeClass("error");
		}
	}else if(minLength && el.val().length < minLength){
		el.next('i').html(name + "不少于" + minLength + "位").addClass("error");
	}else if(el.parent().attr('id') == 'phone_num'){
		if(isNaN(el.val()) || el.val().charAt(0) != 1){
			el.next('i').html("请输入正确的手机号").addClass("error");
		}else{
			el.next('i').empty().removeClass("error");
		}
	}else{
		el.next('i').empty().removeClass("error");
	}
}
//綁定驗證方法
var checkBindFn = function(el,name,minLength){
	var bindEvent = el.is('input') ? 'input propertychange' : 'change';
	el.unbind();
	el.bind(bindEvent, function(){
		checkFn(el,name)
	});
	el.blur(function(){
		checkFn(el,name,minLength)
	});
}
//遍歷綁定驗證方法
var eachBindCheck = function(input_el, fn){
	input_el.each(function(){
		var name, minLength;
		switch($(this).parent().attr('id')){
			case 'user_name': name = "用户名", minLength = 4; break;
			case 'set_psd':
			case 'repeat_psd': name = "密码", minLength = 6; break;
			case 'phone_num': name = "手机号", minLength = 11; break;
			case 'register_valid': name = "验证码"; break;
			case 'company_type': name = "企业类别"; break;
			case 'company_area': name = "企业地区"; break;
		}
		fn($(this), name, minLength);
	});
}
eachBindCheck($('.check_field'),checkBindFn);

// 提交註冊
$('.register_submit').click(function(){
	if(!$('.input_box .error').length){
		$(this).attr('disabled', 'disabled').addClass('sent').html('正在注册...');
		doRegister($(this));
	}else{
		$('.input_box .error').prev('.check_field').each(function(){
			eachBindCheck($(this),checkFn);
		});
	}
});

// 註冊
var doRegister = function(el){	
	var callbackReg = function(){
		var postData = {
			"id":null,
			"loginName": $('[name="loginName"]').val(),
			"password": md5($('[name="password"]').val()),//要求前端Javascript调用接口的时候，已经进行MD5加密
			"phone": $('[name="phone"]').val(),
			"roleId":1,//角色，1为企业用户，2为银行用户，3为系统用户
			"companyType": $('[name="companyType"]').val(),
			"area": $('[name="area"]').val()
		}
		
		$.ajax({
			url: DOMAIN + '/simpleRegUser',
			type: 'POST',
			data: JSON.stringify(postData),
			dataType: 'json',
			contentType : "application/json ; charset=utf-8",
			success: function(res){
				if(res.saved){
					el.html('注册成功，正在自动登录...');
					doLogin($('[name="loginName"]').val(), $('[name="password"]').val(), el, true);
					//window.location.href = "./login.jsp";
				}
			}
		});
	}

	$.ajax({
		url: DOMAIN + '/checkThePhoneNumAndCodeMatch',
		type: 'GET',
		data: {
			phoneNum: $('[name="phone"]').val(),
			code: $('[name="code"]').val()
		},
		dataType: 'json',
		success: function(res){
			if(res.access){
				callbackReg();
			}else{
				alert('手机验证码有误。');
			}
		}
	});
	
	
}
