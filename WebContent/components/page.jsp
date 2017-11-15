<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<div class="page_box">
	<button class="near_page page_btn pre_page page_none">上一页</button>
	<div class="pre_more page_more">...</div>
	<ul class="pages">
	</ul>
	<div class="next_more page_more">...</div>
	<button class="near_page page_btn next_page page_none">下一页</button>
	<span class="total_pages">共 <i class="pg_totalPages">1</i> 页</span>
	<div class="change_page">
		<span>到</span><input type="number" name="page_index" /><span>页</span>
		<button class="page_btn page_jump">确 定</button>
	</div>
</div>
<script>
	var pageInit = function(total){
		var _crrPage = (parseInt(getSysUrlParam('pageIndex')) || 0);
		var crrPage = _crrPage < 0 ? 0 : (_crrPage > total ? total : _crrPage);
		var group = Math.ceil(total/5),
			crrGroup = Math.ceil((crrPage + 1)/5) == 0 ? 1 : Math.ceil((crrPage + 1)/5);
		var count = total < 5 ? total : (crrGroup == group ? (total%5 == 0 ? 5 : total%5) : 5);
		
		$('.pg_totalPages').html(total);
		$('.page_box .pages').empty();
		for(var i = 0; i < count; i++){
			$('.page_box .pages').append("<li class='page'>" + ((crrGroup - 1) * 5 + i + 1) + "</li>");
			if(crrPage == (crrGroup - 1) * 5 + i){
				$('.pages').find('.page').eq(i).addClass('crr_page');
			}
		}
		if(crrPage >= 0){
			if(crrGroup == 1 && group > 1){
				$('.next_more').show();
			}else if(crrGroup == group && group > 1){
				$('.pre_more').show();
			}else if(crrGroup > 1 && crrGroup < group){
				$('.next_more').show();
				$('.pre_more').show();
			}
			
			if(total > 1){
				if(crrPage == 0){
					crrClass($('.pre_page'), 'page_none');
				}else if(crrPage == total - 1){
					crrClass($('.next_page'), 'page_none');
				}else{
					$('.page_none').removeClass('page_none');
				}
			}
		}
		$('.page_box').on('click', '.page_more', function(){
			$('.crr_page').removeClass('crr_page');
			var _pageEl = $('.pages').find('.page');
			if($(this).hasClass('pre_more')){
				$('.next_more').show();
				if(crrGroup <= 2){
					$(this).hide();
				}else{
					$(this).show();
				}
				var len = _pageEl.length;
				for(var i = 0; i < 5; i ++){
					var _num = parseInt(_pageEl.eq(i).html()) || total + i;
					if(_pageEl.eq(i).length > 0){
						_pageEl.eq(i).html(_num - 5);
					}else{
						$('.pages').find('.page:last').after("<li class='page'>" + (total + (i + 1 - len) - 5) + "</li>");
					}
					if(parseInt($('.pages').find('.page').eq(i).html()) - 1 == crrPage){
						$('.pages').find('.page').eq(i).addClass('crr_page');
					}
				}
				crrGroup--;
			}else if($(this).hasClass('next_more')){
				$('.pre_more').show();
				if(crrGroup >= group - 1){
					$(this).hide();
					$('.pre_more').show();
					for(var i = 0; i < 5; i++){
						var _num = parseInt(_pageEl.eq(i).html());
						if(_num + 5 - 1 == crrPage){
							_pageEl.eq(i).addClass('crr_page');
						}
						if(total >= _num + 5){
							_pageEl.eq(i).html(_num + 5);
						}else{
							_pageEl.eq(i).remove();
						}
					}
				}else{
					for(var i = 0; i < 5; i++){
						var _num = parseInt(_pageEl.eq(i).html());
						if(_num + 5 - 1 == crrPage){
							_pageEl.eq(i).addClass('crr_page');
						}
						_pageEl.eq(i).html(_num + 5);
					}
					$(this).show();
				}
				crrGroup++;
			}
		});
		$('.page_jump').click(function(){
			var _index = $('.change_page').find('input[name="page_index"]').val();
			if(_index && isNaN(_index)){
				alert('请输入正确的页码。');
			}else{
				_index--;
				_index = parseInt(_index <= 0 ? 0 : (_index >= total ? (total - 1) : _index));
				setUrlParameter('pageIndex', _index);
			}
		});
	}
	$('.pages').on('click','.page', function(){
		var _page = parseInt($(this).html()) - 1;
		if(_page != parseInt($('.crr_page').html()) -1){
			crrClass($(this), 'crr_page');
			setUrlParameter('pageIndex', _page);
		}
	});
	$('.near_page').on('click', function(){
		var _crrPage = getSysUrlParam('pageIndex') || 0;
		_crrPage = isNaN(_crrPage) ? 0 : _crrPage;
		if(!$(this).hasClass('page_none')){
			if($(this).hasClass('pre_page') && _crrPage > 0){
				setUrlParameter('pageIndex', parseInt(_crrPage) - 1);
			}else if($(this).hasClass('next_page')){
				setUrlParameter('pageIndex', parseInt(_crrPage) + 1);
			}
		}else{
			return;
		}
	});
</script>