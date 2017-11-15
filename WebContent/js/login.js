document.write('<script src="' + YJS + '/libs/md5.js"></script>');
	var loginBox = $('.vip_box'),
		phoneBox = $('.phone_box'),
		forgetBox = $('.forget_box'),
		setpsdBox = $('.setpsd_box');
	var userId;
	
	/* 登錄、重置密碼模塊切換 */
	$('.change_box').unbind('click');
	var _finished;
	$('.change_box').bind('click',function(){
		_finished = true;
		var changeAnimate = function(hide_el, show_el, right, reset){
			hide_el.animate({right: right, opacity: 0}, 300, function(){
				$(this).hide();
				if(reset)
					$(this).css({right: '-320px'});
			});
			show_el.css({display:'block'}).animate({right: 0, opacity: 1}, 300);
		}
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
						var _finished = false;
						var h = forgetBox, s = setpsdBox, r = '320', rs = '-320px';
						if(!h || !s || !r)
							return;
						forgetNextClick($(this), function(){changeAnimate(h, s, r, rs)});
					}
					break;
			case 3: var h = forgetBox, s = loginBox, r = '-320px';break;
			case 4: var h = setpsdBox, s = loginBox, r = '-320px';break;
			case 5: var h = phoneBox, s = loginBox, r = '-320px';break;
			default: var h = false;break;
		}
		if(!h || !s || !r)
			return;
		if(_finished){
			changeAnimate(h, s, r, rs);
		}
		
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
	
	var doPhoneLogin = function(phone, code){
		console.log(code)
		var el = $('.phone_box .login_btn');
		$.ajax({
			url: DOMAIN + '/userLoginWithPhoneNum',
			type: 'GET',
			xhrFields:{withCredentials:true},
			data: {
				phoneNum: phone,
				code: code
			},
			success: function(res){
				if(res.success){
					el.addClass('sent').html('登录中...').attr('disabled', 'disabled');
					$.cookie('sb', res.sb,  { path: '/', expires: 1 });
					$.cookie('userId', res.userInfo.id,  { path: '/', expires: 1 });
					if(getUrlParameter('target')){
						var targetUrl = getUrlParameter('target');
						window.location.href = targetUrl
					}else if(_href.indexOf('/web/') > 0){
						window.location.href = 'index.jsp';
					}else{
						$.ajax({
							url: DOMAIN + '/getSessionUser',
							data: {
								'sb': $.cookie('sb') || '',
								'callback':'success_jsonpCallback'
							},
							type: 'GET',
							xhrFields:{withCredentials:true},
							dataType:'jsonp',
							jsonp:"callback",
							jsonpCallback:"success_jsonpCallback",
							success: function(res){
								if(res.success){
									USER = res.userInfo;
									window.location.href = YJS + '/' + USER.roleType + '/system.jsp';
								}
							},
							error:function(res){
								console.log(res);
							}
						});
					}
				}else{
					el.html('登 录').removeAttr('disabled').removeClass('sent');
					alert('用户名或密码错误');
					return;
				}
			}
		});
	}
	
	/*登錄驗證*/
	$('.dologin').bind('click' ,function(){
		if($(this).hasClass('pwd_login')){
			if(!$('.vip_box .error').length){
				var _href =  window.location.href;
				if($('.remember').hasClass('checked')){
					$.cookie('un', $('[name="userName"]').val(), { path: '/', expires: 7 });
					$.cookie('pw', $('[name="pwd"]').val(), { path: '/', expires: 7 });
				}else{
					$.cookie('un', '', { path: '/', expires: -1 });
					$.cookie('pw', '', { path: '/', expires: -1 });
				}
				doLogin($('[name="userName"]').val(), $('[name="pwd"]').val(), $(this), false);
			}else{
				$('.vip_box .error').prev('input').each(function(){
					eachBindCheck($(this),checkFn);
				});
			}
		}else{
			if(!$('.phone_box .error').length){
				var _href =  window.location.href;
				doPhoneLogin($('.phone_box #phone_num2 input').val(), $('.phone_box .check_code').val())
				console.log($('.phone_box .check_code'))
			}else{
				$('.phone_box .error').prev('input').each(function(){
					eachBindCheck($(this),checkFn);
				});
			}
		}
	});
	
	/*忘記密碼*/
	sendVerify($('.forget_box .valid_btn'), $('.forget_box #phone_num input'));
	var forgetNextClick = function(nextBtn, callback){
		console.log(callback)
		nextBtn.addClass('sent').html('验证中，请稍候...').attr('disabled');
		$.ajax({
			url: DOMAIN + '/userLoginWithPhoneNum',
			type: 'GET',
			data: {
				phoneNum: $('.forget_box #phone_num input').val(),
				code: $('.forget_box #forget_valid .check_code').val()
			},
			success: function(res){
				nextBtn.removeClass('sent').html('下一步').removeAttr('disabled');
				if(res.success){
					callback();
					userId = res.userInfo.id;
				}else{
					alert('验证码错误或此手机号未绑定。');
				}
			}
		});
		$(this).parents('.forget_box').find('#forget_valid input').val('').next('i').addClass('error');
		$('.setpsd_box input').val("").next('i').empty().addClass('error');
	}
	
	sendVerify($('.phone_box .valid_btn'), $('.phone_box #phone_num2 input'));
	//
	
	
	/*设置密码*/
	$('.setpsd_box button').click(function(){
		if(!$(this).hasClass('sent')){
			var _f = false;
			$('.setpsd_box input').each(function(){
				if(!$('#set_psd input').val()){
					_f = false;
					$(this).next('i').html("请输入密码");
					return false;
				}else if($('#set_psd input').val() != $('#confirm_psd input').val()){
					_f = false;
					$('#confirm_psd').find('i').html('两次输入的密码不一致');
					return false;
				}else{
					_f = true;
				}
			});
			if(_f){
				$(this).addClass('sent').html('请稍候...');
				$.ajax({
					url: DOMAIN + '/changeOneUserPwdAfterCheck',
					type: 'POST',
					data: {
						userId: userId,
						password: md5($('.setpsd_box #set_psd input').val())
					},
					dataType: 'JSON',
					success: function(res){
						if(res.saved){
							alert('密码修改成功！');
							window.location.reload();
						}else{
							alert('操作失败，请重试。');
							$('.setpsd_box button').removeClass('sent').html('完成');
						}
					}
				});
			}
			
		}
	});
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
	if($.cookie('un') && $.cookie('pw')){
		$('.remember').addClass('checked');
		$('[name="userName"]').val($.cookie('un'));
		$('[name="pwd"]').val($.cookie('pw'));
	}else{
		$('[name="userName"]').val('');
		$('[name="pwd"]').val('');
	}



