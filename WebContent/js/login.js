document.write('<script src="' + YJS + '/libs/md5.js"></script>');
	var loginBox = $('.vip_box'),
		phoneBox = $('.phone_box'),
		forgetBox = $('.forget_box'),
		setpsdBox = $('.setpsd_box');
	
	/* 登錄、重置密碼模塊切換 */
	$('.change_box').unbind('click');
	$('.change_box').bind('click',function(){
		switch($('.box_wrap .change_box').index($(this))){
			case 0: var h = loginBox, s = forgetBox, r = '320px';break;
			case 1: var h = loginBox, s = phoneBox, r = '320px';break;
			case 2: if($('.forget_box .error').length){
						$('.forget_box .error').prev('input').each(function(){
							eachBindCheck($(this),checkFn);
						});
						return;
					}
					// 找回密碼下一步驗證
					if($(this).hasClass('next_step')){
						if(!1){
							forgetNextClick();
						}else{
							$('#forget_valid input').val("");
							alert("您输入的验证码有误。");
							return false;
						}
					}
					var h = forgetBox, s = setpsdBox, r = '320', rs = '-320px';
					break;
			case 3: var h = forgetBox, s = loginBox, r = '-320px';break;
			case 4: var h = setpsdBox, s = loginBox, r = '-320px';break;
			case 5: var h = phoneBox, s = loginBox, r = '-320px';break;
			default: var h = false;break;
		}
		if(!h || !s || !r)
			return;
		var changeAnimate = function(hide_el, show_el, right, reset){
			hide_el.animate({right: right, opacity: 0}, 300, function(){
				$(this).hide();
				if(reset)
					$(this).css({right: '-320px'});
			});
			show_el.css({display:'block'}).animate({right: 0, opacity: 1}, 300);
		}
		changeAnimate(h, s, r, rs);
		
	});
	
	/*表單驗證函數*/
	//驗證方法
	var checkFn = function(el,name,minLength){
		if(!el.val()){
			el.next('i').html("请输入" + name).addClass("error");
		}else if(minLength && el.val().length < minLength){
			el.next('i').html(name + "不少于" + minLength + "位").addClass("error");
		}else if(el.parent().attr('id') == 'phone_num'){
			if(isNaN(el.val()) || el.val().charAt(0) != 1){
				el.next('i').html("请输入正确的手机号").addClass("error");
			}else{
				el.next('i').empty().removeClass("error");
			}
		}else if(el.parent().attr('id') == 'login_valid'){
			return;
		}else{
			el.next('i').empty().removeClass("error");
		}
	}
	//綁定驗證方法
	var checkBindFn = function(el,name,minLength){
		el.unbind();
		el.bind('input propertychange', function(){
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
				case 'user_name': name = "账号"; break;
				case 'user_psd':
				case 'set_psd': name = "密码", minLength = 6; break;
				case 'login_valid':
				case 'forget_valid':
				case 'forget_valid2': name = "验证码"; break;
				case 'phone_num':
				case 'phone_num2': name = "手机号", minLength = 11; break;
			}
			fn($(this), name, minLength);
		});
	}
	eachBindCheck($('.check_input input'),checkBindFn);
	
	/*登錄驗證*/
	$('.dologin').bind('click' ,function(){
		console.log($('.vip_box .error').length)
		if(!$('.login_box .error').length){
			console.log(8)
			var _href =  window.location.href;
			doLogin('', $('[name="userName"]').val(), $('[name="pwd"]').val(), $(this));
		}else{
			$('.vip .error').prev('input').each(function(){
				eachBindCheck($(this),checkFn);
			});
		}
	});
	
	/*忘記密碼*/
	sendVerify($('.valid_btn'));
	
	var forgetNextClick = function(){
		$(this).parents('.forget_box').find('#forget_valid input').val('').next('i').addClass('error');
		$('.setpsd_box input').val("").next('i').empty().addClass('error');
	}
	
	/*设置密码*/
	$('#confirm_psd input').blur(function(){
		if($('#set_psd input').val() && !$(this).val()){
			$(this).next('i').html("请再次输入密码");
		}else if($(this).val() != $('#set_psd input').val()){
			$(this).next('i').html("两次输入的密码不一致");
		}else{
			$(this).next('i').empty().removeClass("error");
		}
	});
	
	// 記住密碼
	$('.remember').click(function(){
		if($(this).hasClass('checked')){
			$(this).removeClass('checked');
		}else{
			$(this).addClass('checked');
		}
	});



