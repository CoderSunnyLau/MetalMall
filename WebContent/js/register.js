// 加載地區選項
$.get('../data/config.json', function(res){
	optionConfigInit('select_area', res.area)
});
sendVerify($('.valid_btn'));

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
		doRegister();
	}else{
		$('.input_box .error').prev('.check_field').each(function(){
			eachBindCheck($(this),checkFn);
		});
	}
});

// 註冊
var doRegister = function(){
	alert("注册成功，将跳转到登录页。");
	window.location.href = "./login.jsp";
}
