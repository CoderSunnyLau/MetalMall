<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<form class="search_box">
	<div class="search_row">
		<div><span>品名</span><input class="s_param" name="name" type="text" placeholder="请输入品名"/></div>
		<div><span>规格</span><input class="s_param" name="specification" type="text" placeholder="请输入规格"/></div>
		<div><span>材质</span><input class="s_param" name="material" type="text" placeholder="请输入材质"/></div>
		<div><span>企业</span><input class="s_param" name="companyName" type="text" placeholder="请输入企业名称"/></div>
	</div>
	<div class="search_row">
		<div class="search_area">
			<span>地区</span>
			<select class="s_param" name="area" id="search_area">
				<option value="">全部地区</option>
			</select>
		</div>
		<div class="search_type">
			<span>类型</span>
			<select class="s_param" name="type" id="search_type">
				<option value="">全部商品类型</option>
			</select>
		</div>
		<div class="search_price">
			<span>价格</span>
			<small>￥</small><input class="s_param" name="minLimitPrice" type="number" class="lowest_price" placeholder="0.00"/><i>—</i>
			<small>￥</small><input class="s_param" name="maxLimitPrice" type="number" class="highest_price" placeholder="99999.99">
		</div>
		<input type="button" class="search_btn btn" value="搜索"/>
	</div>
</form>
<script>
	$.get('../data/config.json', function(res){
		optionConfigInit('search_area', res.area);
		optionConfigInit('search_type', res.productType);
	});
	var _url;
	$('.search_btn').click(function(){
		var searchType = $('.tab_crr').attr('type');
		if(!searchType){
			if(window.location.href.indexOf('web/mall') >= 0){
				searchType = 'mall';
			}else{
				searchType = 'demand';
			}
		}
		_url = YJS + '/web/' + searchType + '.jsp';
		$('.search_box').find('.s_param').each(function(){
			if($(this).val()){
				_url = setUrlParameter($(this).attr('name'), $(this).val(), _url)
			}
		});
		console.log(_url)
		if($('.tab_crr').length == 1){
			window.open(_url);
		}else{
			window.location.href = _url;
		}
		/*$.ajax({
			url: DOMAIN + '/getProductsByConditionsAndPage',
			type: 'GET',
			data: _param,
			success: function(res){
				console.log(res)
			}
		});
		*/
	});
</script>