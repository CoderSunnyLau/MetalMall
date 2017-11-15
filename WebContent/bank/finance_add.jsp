<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=66">
<div class="cnt_header">
	<span>首页 > 金融中心 > 金融管理 > 新增金融</span>
</div>
<div class="cnt_body cnt_finance_add">
	<p class="user_title">添加金融详情信息</p>
	<div class="fill_block">
		<p><span>名称</span><input class="field" name="name" type="text" placeholder="请输入金融产品名称"/></p>
		<p><span>类型</span>
			<select class="field" name="paymentType" id="payment_type">
				<option value="">请选择类型</option>
			</select>
		</p>
		<p><span>银行</span><i class="" name="bank"></i></p>
		<p><span>产品简介</span><textarea class="field" name="brief" placeholder="请输入金融产品的简介，300字内。" type="text" maxlength="300"></textarea></p>
	</div>
	<div class="fill_block pdts_pics">
		<div class="pics_row">
			<span>金融介绍</span>
			<div class="field"><jsp:include page="../components/ueditor.jsp"></jsp:include></div>
		</div>
	</div>
	<div class="button_block">
		<button class="submit">提　交</button>
	</div>
</div>
<script src="../js/b_finance_add.js"></script>