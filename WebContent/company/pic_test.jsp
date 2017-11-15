<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=96">
<div class="cnt_header">
	<span>首页 > 供货中心 > 商品管理 > 新增商品</span>
</div>
<div class="cnt_body cnt_pdt_add">
	<p class="user_title">新增商品详情信息</p>
	<div class="fill_block pdts_pics">
		<div class="pics_row">
			<span>商品图片</span>
			<div class="add_pics">
				<jsp:include page="../components/pic.jsp"></jsp:include>
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
</div>