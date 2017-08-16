<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>商品详情</title>
    <meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/product_detail.css">
	<script src="../js/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../components/header2.jsp"></jsp:include>
	<div class="page_body">
		<div class="page_cnt main_width">
			<div class="cnt_header">
				<span class="position">商城 > 商品详情</span>
			</div>
			<div class="info_box">
				<div class="main_info">
					<div class="img_box">
						<img src="#" class="main_img" />
						<ul class="imgs">
							<li class="img"><img src="#" /></li>
							<li class="img"><img src="#" /></li>
							<li class="img"><img src="#" /></li>
							<li class="img"><img src="#" /></li>
						</ul>
					</div>
					<div class="summary">
						<div class="pdt_title">
							<p class="pdt_name">999感冒灵颗粒</p>
							<i class="favorite">收藏</i>
						</div>
						<div class="info_row">
							<p><span></span><span></span></p>
							<p><span></span><span></span></p>
							<p><span></span><span></span></p>
						</div>
						<div class="info_row">
							<p><span></span><span></span></p>
							<p><span></span><span></span></p>
							<p><span></span><span></span></p>
						</div>
						<div class="info_row">
							<p><span></span><span></span></p>
							<p><span></span><span></span></p>
							<p><span></span><span></span></p>
						</div>
						<div class="pdt_action">
							<span class="price">￥<b>26.00</b>/盒</span>
							<button>我要下单</button>
						</div>
					</div>
				</div>
				<div class="detail_box">
					<p class="detail_header">商品详情</p>
					<div class="detail">
						<p class="detail_title">基本参数</p>
						<table class="param">
							<tr>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
							</tr>
						</table>
						<div id="detail_cnt"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>