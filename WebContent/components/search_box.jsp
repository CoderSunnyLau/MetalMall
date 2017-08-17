<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="search_box">
	<div class="search_row">
		<div><span>品名</span><input type="text"/></div>
		<div><span>规格</span><input type="text"/></div>
		<div><span>材质</span><input type="text"/></div>
		<div><span>企业</span><input type="text"/></div>
	</div>
	<div class="search_row">
		<div>
			<span>地区</span>
			<select>
				<option value="guangzhou">广州</option>
			</select>
		</div>
		<div>
			<span>商品类型</span>
			<select>
				<option value="">未定义</option>
			</select>
		</div>
		<div class="search_price">
			<span>价格</span><input type="number"/><i>—</i><input type="number">
		</div>
		<button>搜索</button>
	</div>
</div>