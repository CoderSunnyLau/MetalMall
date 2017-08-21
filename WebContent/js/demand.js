$('.all').click(function(){
	var show_el = $(this).prev('ul').find('.show');
	if(show_el.length > 0){
		show_el.removeClass('show');
	}else{
		console.log(show_el);
		$(this).prev('ul').find('li').addClass('show');
	}
});