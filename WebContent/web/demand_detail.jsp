<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>需求单详情-易金所</title>
	<jsp:include page="../components/head.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="../css/demand.css">
</head>
<body>
	<jsp:include page="../components/header2.jsp">
		<jsp:param value="demand" name="pageName"/>
	</jsp:include>
	<div class="page_body" nav="demand">
		<div class="page_cnt main_width">
			<div class="cnt_header">
				<span class="position">需求单 > 需求单详情</span>
			</div>
			<p class="loading_wrapper"><i class="loading"></i>正在加载，请稍候...</p>
			<div class="demand_detail">
				<p class="row_grey"><span class="d_name"></span><i>发布时间：<span class="d_addTime"></span></i></p>
				<div class="info_box">
					<div class="float">
						<div class="demand_info">
							<div class="info_block">
								<p class="text_row"><span>企业：</span><i class="d_companyName"></i></p>
								<p class="text_row"><span>类型：</span><i class="d_productType"></i></p>
								<p class="text_row"><span>数量：</span><i class="d_quantityReqrm"></i></p>
							</div>
							<div class="info_block">
								<p class="text_row"><span>地区：</span><i class="d_area"></i></p>
								<p class="text_row"><span>材质：</span><i class="d_material"></i></p>
								<p class="text_row"><span>规格：</span><i class="d_specification"></i></p>
							</div>
							<p class="budget">预算：<span>￥<big class="d_minBudget"></big>~￥<big class="d_maxBudget"></big></span></p>
						</div>
					</div>
					<div class="float">
						<div class="offer_info">
							<p class="text_row"><span>申请企业：</span><i class="da_company"></i></p>
							<p class="text_row"><span class="text3_4">申请人：</span><input type="text" class="field" name="contactWho" tip="申请人" /></p>
							<p class="text_row"><span>手机号码：</span><input type="number" class="field" name="phone" tip="手机号码" placeholder="请输入11位手机号"/></p>
							<p class="text_row float2"><span>申请描述：</span><textarea class="field" name="description" tip="申请描述"></textarea></p>
							<button class="offer">我要供货</button>
						</div>
					</div>
				</div>
				<div class="detail_box">
					<p class="row_white"><span>需求单详情</span></p>
					<div class="detail_cnt">
						<p  class="d_description"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp"></jsp:include>
	<script src="../js/demand_detail.js?v=14"></script>
</body>
</html>