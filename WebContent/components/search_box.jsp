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
			<select name="province">
				<option>请选择地区</option>
				<option>广州</option>
			</select>
		</div>
		<div class="search_type">
			<span>类型</span>
			<select>
				<option value="">请选择商品类型</option>
				<option value="">未定义</option>
			</select>
		</div>
		<div class="search_price">
			<span>价格</span>
			<small>￥</small><input type="number" class="lowest_price" placeholder="0.00"/><i>—</i>
			<small>￥</small><input type="number" class="highest_price" placeholder="99999.99">
		</div>
		<button>搜 索</button>
	</div>
</div>