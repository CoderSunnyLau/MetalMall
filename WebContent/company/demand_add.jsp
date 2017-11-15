<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=66">
<div class="cnt_header">
	<span>首页 > 需求中心 > 需求单管理 > 新增需求单</span>
</div>
<div class="cnt_body demand_add">
	<p class="user_title">添加需求单详情信息</p>
	<div class="fill_block">
		<p><span>名称</span><input type="text" class="field" name="name" tip="需求单名称"/></p>
		<p><span>材质</span><input type="text" class="field" name="material" tip="材质"/></p>
		<p><span>规格</span><input type="text" class="field" name="specification" tip="规格"/></p>
		<p><span>所需数量</span><input type="text" class="field" name="quantityReqrm" tip="所需数量" /></p>
		<p><span>单位</span><input type="text" class="field" name="unit" tip="单位" /></p>
		<p><span>商品类型</span>
			<select class="field" id="da_type" name="productType" tip="商品类型" value="">
				<option>请选择商品类型</option>
			</select>
		</p>
		<!-- 
		<p><span>所属企业</span>
			<select class="???field" name="" tip="所属企业">
				<option></option>
			</select>
		</p>
		 -->
		<p><span>地区</span>
			<select class="field" id="da_area" name="area" tip="地区" value="">
				<option>请选择地区</option>
			</select>
		</p>
		<p><span>联系电话</span><input type="text" class="field" name="phone"  tip="联系电话"/></p>
		<p><span>预算</span><input type="text" class="field" name="minBudget" tip="预算" />~<input type="text" class="field" name="maxBudget" tip="预算" /></p>
	</div>
	<div class="fill_block pdts_pics">
		<div class="pics_row">
			<span>需求单介绍</span>
			<div class="field" name="description" tip="需求单介绍"><jsp:include page="../components/ueditor.jsp"></jsp:include></div>
		</div>
	</div>
	<div class="button_block">
		<button class="submit demand_add_btn">提　交</button>
		<button class="preview white_btn" onclick="return $EDITORUI['edui22']._onClick(event, this);">预　览</button>
	</div>
</div>
<script src="../js/c_demand.js"></script>