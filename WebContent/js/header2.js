$(function(){
	$('.nav_item').each(function(){
		if($(this).attr('id') == $('.page_body').attr('nav')){
			$('.crr').removeClass('crr');
			$(this).addClass('crr');
		}
	});
});