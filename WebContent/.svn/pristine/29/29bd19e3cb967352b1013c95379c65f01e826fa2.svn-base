$(function(){
	//初始化菜單
	$('.menu').css({height: $(window).height() - 91});
	$('.menu_item span').click(function(){
		var item = $(this).parent();
		var menu2 = item.find('.menu2');
		if(item.hasClass('active')){
			if(!item.hasClass('item_home')){
				menu2.animate({height: 0}, 150);
				item.removeClass('active');
			}
		}else{
			if(item.hasClass('item_home')){
				$('.menu .active2').removeClass('active2');
			}else{
				menu2.animate({height: menu2.find('li').length * 37 + 5}, 150);
			}
			item.addClass('active');
		}
	})
	.hover(function(){
		$(this).parent().css({backgroundColor: '#111'});
	}, function(){
		$(this).parent().css({backgroundColor: '#333'});
	});
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
		$('#cnt').load('./' + name + '.jsp');
	});
});



