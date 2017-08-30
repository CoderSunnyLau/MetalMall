<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>商品详情</title>
    <meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/product_detail.css">
</head>
<body>
	<jsp:include page="../components/header2.jsp">
		<jsp:param value="mall" name="pageName"/>
	</jsp:include>
	<div class="page_body" nav="mall">
		<div class="page_cnt main_width">
			<div class="cnt_header">
				<span class="position">商城 > 商品详情</span>
			</div>
			<div class="info_box">
				<div class="main_info">
					<div class="img_box">
						<img src="#" class="main_img" />
						<ul class="imgs"></ul>
					</div>
					<div class="summary">
						<div class="pdt_title">
							<p class="pdt_name">--</p>
							<i class="favorite">收藏</i>
						</div>
						<div class="info_row">
							<p><span>企业</span><span id="company">--</span></p>
							<p><span>类型</span><span id="pdt_type">--</span></p>
							<p><span>日期</span><span id="add_date">0000-00-00</span></p>
						</div>
						<div class="info_row">
							<p><span>地区</span><span id="area">--</span></p>
							<p><span>材质</span><span id="material">--</span></p>
							<p><span>规格</span><span id="specification">--</span></p>
						</div>
						<div class="info_row">
							<p><span>件重</span><span id="weight">--kg</span></p>
							<p><span>起订</span><span id="min_order">0件</span></p>
							<p><span>库存</span><span id="stock">0</span></p>
						</div>
						<div class="pdt_action">
							<span class="price"><b>￥--</b>/--</span>
							<button>我要下单</button>
						</div>
					</div>
				</div>
				<div class="detail_box">
					<p class="detail_header"><span>商品详情</span></p>
					<div class="detail">
						<p class="detail_title">基本参数</p>
						<table class="param" border="1">
							<tr>
								<td class="detail_key">品牌：</td>
								<td class="detail_val">绿志鸟</td>
							</tr>
							<tr>
								<td class="detail_key">型号：</td>
								<td class="detail_val">无铅高温纯锡条</td>
							</tr>
						</table>
						<div id="detail_cnt"></div>
					</div>
					<p class="detail_header"><span>售后服务</span></p>
					<div class="sold_service"></div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp"></jsp:include>
	<script src="../js/product_detail.js"></script>
</body>
</html>