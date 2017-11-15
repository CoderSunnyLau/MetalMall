if(window.location.href.indexOf('#') < 0){
	var urlArr = window.location.href.split('.jsp');
	var _url = urlArr[0] + '.jsp#' + urlArr[1];
	window.location.href = _url;
}

var sysInit = function(){
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
				if(res.success){
					USER = res.userInfo;
					USERID = res.userInfo.id;
					USERNAME = res.userInfo.userName;
					TYPE = res.userInfo.roleType;
					if(_href.indexOf('/login') >= 0){
						var _url = getUrlParameter('target');
						if(!_url){
							_url = YJS + '/' + USER.roleType + '/system.jsp';
						}
						window.location.href = _url;
					}else{
						if(_href.indexOf(USER.roleType) == -1){
							window.location.href = YJS + '/' + USER.roleType + '/system.jsp';
						}
						$('.user_name').html(res.userInfo.userName);
						$('.logged').show();
					}
					try{
						if(successCallback && typeof(successCallback) == "function"){
							successCallback();
						}
					}catch(e){}
				}else{
					$.cookie('sb', '', { expires: -1 });
					$.cookie('userId', '', { expires: -1 });
					try{
						if(errorCallback && typeof(errorCallback) == "function"){
							errorCallback();
						}
					}catch(e){}
					if(_href.indexOf('/login') == -1){
						window.location.href = 'login.jsp';
					}
				}
			},
			error:function(res){
				console.log(res)
			}
		});
	}else if(_href.indexOf('/login') == -1){
		window.location.href = 'login.jsp';
	}
}
sysInit();


window.addEventListener('hashchange',function(e){
	var newUrl = e.newURL;
	var page = getSysUrlParam('page');
	if(page){
		$('.cnt').empty().load(page + '.jsp');
		crrClass($('[name="' + page + '"]'), 'active2');
	}
});

var reload = function(type){
	$('.cnt').load('../' + type + '/' + getSysUrlParam('page') + '.jsp');
}

$(function(){
	//初始化頁面
	var page = getSysUrlParam('page');
	if(page){
		$('.cnt').empty().load(page + '.jsp');
		crrClass($('[name="' + page + '"]'), 'active2');
	}

	//初始化菜單
//	$('.menu').css({height: $(window).height() - 91});
	$('.menu_item span').click(function(){
		var item = $(this).parent();
		var menu2 = item.find('.menu2');
		if(item.hasClass('active')){
			if(!item.hasClass('item_home')){
				menu2.animate({height: 0}, 150);
				item.removeClass('active');
			}
		}else{
			$('.active').removeClass('active').find('.menu2').css({height:0});
			if(item.hasClass('item_home')){
				$('.menu .active2').removeClass('active2');
			}else{
				menu2.animate({height: menu2.find('li').length * 45 + 6}, 150);
			}
			item.addClass('active');
		}
	})
//	.hover(function(){
//		$(this).parent().css({borderBottom: '1px solid #F90'});
//	}, function(){
//		$(this).parent().css({border: 'none'});
//	});
	$('.menu2_item').click(function(){
		if($('.menu2 .active2')){
			$('.menu2 .active2').removeClass('active2');
			$(this).addClass('active2');
		}else{
			$(this).addClass('active2');
		}
		$('.item_home').removeClass('active');
	});
	$('.menu_link').click(function(){
		var name = $(this).attr('name');
		$('#cnt').empty().load('./' + name + '.jsp');
		jump('', name);
		//setUrlParameter('page', name);
//		window.location.search = 'page=' + name;
	});
});

var jump = function(type, setParams, delParams){
	var _url = window.location.href.split('#')[0] + '#',
		_page;
	if(typeof(setParams) == 'object'){
		for(var item in setParams){
			_url = setUrlParameter(item, setParams[item], _url);
		}
		_page = setParams.page;
	}else if(setParams){
		_url = setUrlParameter('page', setParams, _url);
		_page = setParams;
	}
	if(typeof(delParams) == 'object'){
		for(var i = 0; i < delParams.length; i++){
			_url = delUrlParam(delParams[i], _url);
		}
	}else if(delParams){
		_url = delUrlParam(delParams, _url);
	}
	//$('.cnt').load('../' + type + '/' + _page + '.jsp');
	window.location.href = _url;
}

var noRes = function(el){
	el.append('<tr><td><div class="no_info">暂无信息</div></td></tr>');
	$('.page_box').hide();
}