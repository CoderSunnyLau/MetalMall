<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="search_box">
	<div class="search_row">
		<div><span>品名</span><input type="text" placeholder="请输入品名"/></div>
		<div><span>规格</span><input type="text" placeholder="请输入规格"/></div>
		<div><span>材质</span><input type="text" placeholder="请输入材质"/></div>
		<div><span>企业</span><input type="text" placeholder="请输入企业名称"/></div>
	</div>
	<div class="search_row">
		<div class="search_area">
			<span>地区</span>
			<select name="province" id="search_area">
				<option>请选择地区</option>
			</select>
		</div>
		<div class="search_type">
			<span>类型</span>
			<select id="search_type">
				<option value="">请选择商品类型</option>
			</select>
		</div>
		<div class="search_price">
			<span>价格</span>
			<small>￥</small><input type="number" class="lowest_price" placeholder="0.00"/><i>—</i>
			<small>￥</small><input type="number" class="highest_price" placeholder="99999.99">
		</div>
		<button class="search_btn">搜 索</button>
	</div>
</div>
<script>
	var searchConfigInit = function(id, item){
		var el = document.getElementById(id);
		for(var i = 0; i < item.length; i++){
			var option = new Option(item[i],item[i]);
			el.add(option);
		}
	}
	$.get('../data/config.json', function(res){
		searchConfigInit('search_area', res.area);
		searchConfigInit('search_type', res.productType);
	});
</script>