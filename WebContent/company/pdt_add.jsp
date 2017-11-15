<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=96">
<div class="cnt_header">
	<span>首页 > 供货中心 > 商品管理 > 新增商品</span>
</div>
<div class="cnt_body cnt_pdt_add">
	<p class="user_title">新增商品详情信息</p>
	<div class="fill_block">
		<p><span>名称</span><input type="text" class="field" name="name" tip=""/></p>
		<p><span>材质</span><input type="text" class="field" name="material" tip="" /></p>
		<p><span>规格</span><input type="text" class="field" name="specification" tip="" /></p>
		<p><span>库存</span><input type="text" class="field" name="stockQuantity" tip="" /></p>
		<p><span>单价</span><input type="text" class="field" name="price" tip="" /></p>
		<p><span>单位</span><input type="text" class="field" name="unit" tip="" /></p>
		<p><span>件重</span><input type="text" class="field" name="weight" tip="" /></p>
		<p><span>起订量</span><input type="text" class="field" name="minOrderQuantity" tip="" /></p>
		<p><span>商品类型</span>
			<select class="field" name="type" tip="type" id="sel_type">
				<option value="">请选择商品类型</option>
			</select>
		</p>
		<!-- <p><span>所属企业</span>
			<select class="field" name="" tip="" id="sel_company">
				<option>1</option>
			</select>
		</p> -->
		<p><span>地区</span>
			<select class="field" name="area" tip="" id="sel_area">
				<option value="">请选择地区</option>
			</select>
		</p>
	</div>
	<div class="fill_block pdts_pics">
		<div class="pics_row">
			<span>商品图片</span>
			<div class="add_pics">
				<jsp:include page="../components/pics_upload.jsp"></jsp:include>
			</div>
		</div>
		<div class="pics_row">
			<span>商品介绍</span>
			<div><jsp:include page="../components/ueditor.jsp"></jsp:include></div>
		</div>
		<div class="pics_row"><span>售后保障</span><textarea class="field" name="soldService" tip=""></textarea></div>
	</div>
	<div class="button_block">
		<button class="submit">提　交</button>
		<button class="preview white_btn" onclick="return $EDITORUI['edui22']._onClick(event, this);">预　览</button>
	</div>
	<script src="../js/c_pdt.js"></script>
</div>