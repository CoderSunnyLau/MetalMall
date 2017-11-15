// 接口路徑前綴
//var DOMAIN = "http://127.0.0.1:8090";
var DOMAIN = "http://47.95.240.195:8090";
var UPLOAD_IMG_SERVER = "http://47.95.240.195:8080";

var YJS = "/yijinsuo_web";
//var YJS = "/Test";
var _href = window.location.href;
var TYPE, USERID, USERNAME;
// 頁面初始化
$(function(){
	var init = function(){
		if($.cookie('sb')){
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
					console.log('sb',res)
					if(res.success){
						USER = res.userInfo;
						USERID = res.userInfo.id;
						USERNAME = res.userInfo.userName;
						TYPE = res.userInfo.roleType;
						if(_href.indexOf('web/login') >= 0 || _href.indexOf('/register') >= 0){
							window.location.href = YJS + '/web/index.jsp';
						}else if(_href.indexOf('/login') >= 0){
							window.location.href = YJS + '/' + USER.roleType + '/system.jsp';
						}else{
							$('.user_name').html(res.userInfo.userName);
							$('.tosystem').attr('href', YJS + '/' + USER.roleType + '/system.jsp');
							$('.logged').show();
						}
						try{
							if(successCallback && typeof(successCallback) == "function"){
								successCallback();
							}
						}catch(e){}
					}else{
						$('.not_logged').show();
						$.cookie('sb', '', { expires: -1, path: '/' });
						$.cookie('userId', '', { expires: -1, path: '/' });
						try{
							if(errorCallback && typeof(errorCallback) == "function"){
								errorCallback();
							}
						}catch(e){}
					}
				},
				error:function(res){
					console.log(res)
				}
			});
		}else{
			$('.not_logged').show();
		}
	}
	if(_href.indexOf('/web/') > 0){
		init();
	}
	
	$('.logout').click(doLogout);
	
	$('.rank_item').click(function(){
		var sortField = getUrlParameter('sortField'),
			ascendingFlag = getUrlParameter('ascendingFlag'),
			_sort,
			_url;
		if(sortField != "" && ascendingFlag != ""){
			if($(this).attr('sort') == sortField){
				if($(this).attr('sort') == 'price'){
					_sort =  ascendingFlag == 'true' ? 'false' : '';
				}else{
					_sort = ascendingFlag == 'false' ? 'true' : '';
				}
			}else{
				_sort = $(this).attr('sort') == 'price' ? 'true' : 'false';
			}
			if(_sort != ""){
				_url = setUrlParameter('sortField', $(this).attr('sort'), window.location.href);
			}else{
				_url = setUrlParameter('sortField', '', window.location.href);
			}
			console.log(_url)
		}else{
			_sort = $(this).attr('sort') == 'price' ? 'true' : 'false';
			_url = setUrlParameter('sortField', $(this).attr('sort'), window.location.href);
			console.log(_url)
		}
		_url = setUrlParameter('ascendingFlag', _sort, _url);
		console.log(_url)
		window.location.href = _url;
	});
	
	if(isNaN(getSysUrlParam('pageIndex'))){
		setUrlParameter('pageIndex', 0)
	}
});

var getUrlParameter = function(param){
     var reg = new RegExp("(^|&)"+ param +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r != null)
    	 return  decodeURI(r[2]);
     return null;
}

var setUrlParameter = function(arg, arg_val, _url){
	var url = _url || window.location.href;
    var pattern = arg + '=([^&]*)';
    var replaceText = arg + '=' + arg_val;
    if(url.match(pattern)){
        var tmp = '/('+ arg+'=)([^&]*)/gi';
        tmp = url.replace(eval(tmp), replaceText);
        var targetUrl = tmp;
    }else{
        if(url.match('[\?]')){
            var targetUrl =  url + '&' + replaceText;
        }else{
            var targetUrl = url + '?' + replaceText; 
        } 
    }
    if(_url){
    	return targetUrl;
    }else{
        window.location.href = targetUrl;
    }
}
var delUrlParam = function(ref, _url) {
	url = _url ? _url : window.location.href;
    var str = "";
    if (url.indexOf('?') != -1) {
        str = url.substr(url.indexOf('?') + 1);
    }else{
        return url;
    }
    var arr = "";
    var returnurl = "";
    var setparam = "";
    if (str.indexOf('&') != -1) {
        arr = str.split('&');
        for (i in arr) {
            if (arr[i].split('=')[0] != ref) {
                returnurl = returnurl + arr[i].split('=')[0] + "=" +arr[i].split('=')[1] + "&";
            }
        }
        url = url.substr(0, url.indexOf('?')) + "?" + returnurl.substr(0,returnurl.length - 1);
    }else{
        arr = str.split('=');
        if (arr[0] == ref) {
            url = url.substr(0, url.indexOf('?'));
        }
    }
    if(_url){
    	return url;
    }else{
    	window.location.href = url;
    }
}
var doFill = function(data, arr, prefix){
	for(var i = 0; i < arr.length; i++){
		var obj = arr[i];
		if(typeof(obj) == 'string'){
			$('.' + prefix + obj).each(function(){
				if($(this).is('input')){
					$(this).val(data[obj]);
				}else{
					$(this).html(data[obj]);
				}
			});
		}else if(typeof(obj) == 'object'){
			if(obj.length == 4){
				var fill_cnt = data[obj[1]] + data[obj[2]];
			}else{
				var fill_cnt = data[obj[1]][obj[2]];
			}
			$('.' + obj[0]).html(fill_cnt);
		}
	}
}

var crrClass = function(el, className){
	$('.' + className).removeClass(className);
	el.addClass(className);
}

var cntLoad = function(el, type){
	type = type || 'admin';
	el.click(function(){
		$('.cnt').load('../' + type + '/' + el.attr('jump') + '.jsp');
		setUrlParameter('page', el.attr('jump'));
	});
}

var optionConfigInit = function(id, item){
	var el = document.getElementById(id);
	for(var i = 0; i < item.length; i++){
		var option = new Option(item[i],item[i]);
		el.add(option);
	}
}

var sendVerify = function(btn, phone_el){
	btn.click(function(){
		if(btn.parent().prev().find('.error').length > 0){
			btn.parent().prev().find('.error').html("请输入正确的手机号");
		}else if(!btn.hasClass('sent')){
			btn.addClass('sent').html('发送中...');
			$.ajax({
				url: DOMAIN + '/sendIdentifyingCode',
				type: 'GET',
				dataType: 'json',
				data: {
					phoneNum: phone_el.val()
				},
				success: function(res){
					if(res.code == 0){
						btn.html("已发送（59s）");
						WaitValid();
					}else if(res.code == 22){
						alert('您发送的次数过于频繁，请稍候再试。');
						btn.removeClass('sent').html('获取验证码');
					}else{
						alert('发送失败，请重试。');
						btn.removeClass('sent').html('获取验证码');
						return;
					}
				},
				error: function(res){
					alert('请求失败，请重试。');
					btn.removeClass('sent').html('获取验证码');
				}
			});
		}
	});
	var WaitValid = function(){
		var clock = 59;
		var waiteValidInterval = setInterval(function(){
			if(clock > 0){
				btn.html("已发送（" + (--clock) + "s）");
			}else{
				clearInterval(waiteValidInterval);
				btn.html("获取验证码").removeClass('sent');
			}
		},1000);
	}
}

var doLogin = function(user, pwd, el, reg){
	if(!reg){
		el.addClass('sent').html('登录中...').attr('disabled', 'disabled');
	}
	pwd = md5(pwd);
	$.ajax({
		url: DOMAIN + '/userLogin',
		data: {
			'loginName': user,
			'password': pwd
		},
		type:"GET",
		xhrFields:{withCredentials:true},
		success: function(res,textStatus, jqXHR){
			if(res.success || res.saved){
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
				if(reg){
					alert('自动登录失败，即将跳转到登录页。');
					//window.location.href = 'login.jsp';
				}else{
					el.html('登 录').removeAttr('disabled').removeClass('sent');
					alert('用户名或密码错误');
					return;
				}
			}
		},
		error:function(res){
			if(reg){
				alert('自动登录失败2，即将跳转到登录页。');
				//window.location.href = 'login.jsp';
			}else{
				el.html('登 录').removeAttr('disabled').removeClass('sent');
				alert('出错了，请尝试重新登录');
				return;
			}
		}
	});
}

var doLogout = function(){
	if($.cookie('sb')){
		$.ajax({
			url: DOMAIN + '/logout',
			data: {
				'sb': $.cookie('sb')
			},
			success: function(res){
				$.cookie('sb', '', { expires: -1, path: '/' });
				$.cookie('userId', '', { expires: -1, path: '/' });
				window.location.href = 'login.jsp?target=' + window.location.href;
			}
		});
	}else{
		window.location.href = 'login.jsp?target=' + window.location.href;
	}
}

var getVal = function(name){
	//return $('.field[name="' + name + '"]').val();
	return $('[name="' + name + '"]').val();
}


var getSysUrlParam = function(param, _url){
	var _href = _url ? _url : window.location.href;
	//var _href = window.location.href;
	var _href0 = _href.split(param)[0],
		_href1 =  _href.split(param)[1];
	if(_href.indexOf(param) > 0 && (_href0.substr(-1) == '?' || _href0.substr(-1) == "&") && _href1.substr(0,1) == "="){
		var val = _href.split(param)[1].split('=')[1];
		if(val.indexOf('&') >= 0){
			val = val.split('&')[0];
		}
	}else{
		var val = null;
	}
	return val;
}

var http = {
	get: function(mtd, params, success, error){
		$.ajax({
			url: DOMAIN + '/' + mtd,
			type: 'GET',
			data: params,
			success: function(res){
				success(res);
			},
			error: function(res){
				if(typeof(error) == 'function'){
					error(res);
				}
			}
		});
	},
	post: function(mtd, params, success, error){
		$.ajax({
			url: DOMAIN + '/' + mtd,
			type: 'POST',
			data: params,
			dataType: 'JSON',
			contentType: "application/json; charset=utf-8",
			success: function(res){
				success(res);
			},
			error: function(res){
				if(typeof(error) == 'function'){
					error(res);
				}
			}
		});
	}
}
 var getAllVal = function(){
	var obj = {};
	var finished = false;
	$('.field').each(function(){
		if(!$(this).val()){
			alert('请填写' + $(this).prev('span').html());
			finished = false;
			return false;
		}else{
			obj[$(this).attr('name')] = $(this).val();
			finished = true;
		}
	});
	if(finished){
		return obj;
	}else{
		return false;
	}
}
