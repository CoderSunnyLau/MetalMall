// 接口路徑前綴
var DOMAIN = "http://localhost:8090";
var YJS = "/yijinsuo_web";
var _href = window.location.href;
var TYPE = _href.indexOf('/web/') >= 0 ? 'web' : _href.indexOf('/company/') >= 0 ? 'company' :  _href.indexOf('/admin/') >= 0 ? 'admin' : 'bank';
var USERID;
// 頁面初始化
$(function(){
	var init = function(){
		if($.cookie('sb')){
			$.ajax({
				url: DOMAIN + '/getSessionUser',// + $.cookie('sb'),
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
						if(_href.indexOf('web/login') >= 0){
							window.location.href = YJS + '/web/index.jsp';
						}else if(_href.indexOf('/login') >= 0){
							window.location.href = YJS + '/' + res.userInfo.roleType + '/system.jsp';
						}else{
							$('.user_name').html(res.userInfo.userName);
							$('.logged').show();
						}
						USERID = res.userInfo.id;
						try{
							if(successCallback && typeof(successCallback) == "function"){
								successCallback();
							}
						}catch(e){}
					}else{
						$('.not_logged').show();
						$.cookie('sb', '', { expires: -1 });
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
	init();
	
	$('.logout').click(doLogout);
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

var doFill = function(data, arr, prefix){
	for(var i = 0; i < arr.length; i++){
		var obj = arr[i];
		if(typeof(obj) == 'string'){
			$('.' + prefix + obj).html(data[obj]);
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
	});
}

var optionConfigInit = function(id, item){
	console.log(item)
	var el = document.getElementById(id);
	for(var i = 0; i < item.length; i++){
		var option = new Option(item[i],item[i]);
		console.log(el)
		el.add(option);
	}
}

var sendVerify = function(btn){
	btn.click(function(){
		if(btn.parent().prev().find('.error').length > 0){
			btn.parent().prev().find('.error').html("请输入正确的手机号");
		}else if(!btn.hasClass('sent')){
			btn.html("已发送（59s）").addClass('sent');
			WaitValid();
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

var doLogin = function(type, user, pwd, el){
	el.addClass('sent').html('登录中...').attr('disabled', 'disabled');
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
			if(res.success){
				$.cookie('sb', res.sb,  { path: '/', expires: 1 });
				if(getUrlParameter('target')){
					var targetUrl = getUrlParameter('target');
				}else{
					_roleType = TYPE == 'web' ? '/web/index.jsp' : TYPE + '/system.jsp';
					var targetUrl = YJS + _roleType;
				}
				window.location.href = targetUrl;
			}else{
				el.html('登 录').removeAttr('disabled').removeClass('sent');
				alert('用户名或密码错误');
				return;
			}
		},
		error:function(res){
			el.html('登 录').removeAttr('disabled').removeClass('sent');
			alert('出错了，请尝试重新登录');
			return;
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
				window.location.href = YJS + '/' + TYPE + '/login.jsp';
			}
		});
	}else{
		window.location.href = YJS + '/' + TYPE + '/login.jsp';
	}
}