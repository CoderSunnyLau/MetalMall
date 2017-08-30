<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
	<title>首页</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/index.css">
</head>
<body>
	<jsp:include page="../components/header2.jsp">
		<jsp:param value="index" name="pageName"/>
	</jsp:include>
	<div class="page_body" nav="index" id="index_el">
		<div class="banner">
			<img src="../images/banner_01.jpg" />
		</div>
		<div class="page_cnt main_width">
			<div class="tab_box">
				<ul class="tabs">
					<li class="tab tab_crr">商品</li>
					<li class="tab">需求单</li>
				</ul>
				<ul class="tab_blocks">
					<li class="tab_block">
						<jsp:include page="../components/search_box.jsp"></jsp:include>
					</li>
					<li class="tab_block"></li>
				</ul>
			</div>
			<div class="scroll_box">
				<i></i>
				<marquee><ul class="scroll"></ul></marquee>
			</div>
			<div>
				<p class="row_white">
					<span>易金所指数</span>
					<i>每天9:30-10:30更新价格，12:00、16:30更新景气指数，请及时刷新查看</i>
				</p>
				<div class="pdt_index_box">
					<p class="row_grey">商品指数</p>
					<div class="pdt_index">
						<div class="index_table">
							<div class="tables">
								<table class="table">
									<thead>
										<tr>
											<th>类型</th>
											<th>本周</th>
											<th>本月</th>
											<th>上月</th>
										</tr>
									</thead>
									<tbody class="product_l"></tbody>
								</table>
							</div>
							<div class="tables">
								<table class="table table_r">
									<thead>
										<tr>
											<th>类型</th>
											<th>本周</th>
											<th>本月</th>
											<th>上月</th>
										</tr>
									</thead>
									<tbody class="product_r"></tbody>
								</table>
							</div>
						</div>
						<div class="chart"><div id="pdt_chart"></div></div>
					</div>
				</div>
				<div class="pdt_index_box">
					<p class="row_grey">地区指数</p>
					<div class="pdt_index">
						<div class="index_table">
							<div class="tables">
								<table class="table">
									<thead>
										<tr>
											<th>类型</th>
											<th>本周</th>
											<th>本月</th>
											<th>上月</th>
										</tr>
									</thead>
									<tbody class="area_l"></tbody>
								</table>
							</div>
							<div class="tables">
								<table class="table table_r">
									<thead>
										<tr>
											<th>类型</th>
											<th>本周</th>
											<th>本月</th>
											<th>上月</th>
										</tr>
									</thead>
									<tbody class="area_r"></tbody>
								</table>
							</div>
						</div>
						<div class="chart"><div id="area_chart"></div></div>
					</div>
				</div>
				<div class="pdt_index_box">
				<p class="row_grey">企业指数</p>
				<div class="pdt_index">
					<div class="index_table">
							<div class="tables">
								<table class="table">
									<thead>
										<tr>
											<th>类型</th>
											<th>本周</th>
											<th>本月</th>
											<th>上月</th>
										</tr>
									</thead>
									<tbody class="company_l"></tbody>
								</table>
							</div>
							<div class="tables">
								<table class="table table_r">
									<thead>
										<tr>
											<th>类型</th>
											<th>本周</th>
											<th>本月</th>
											<th>上月</th>
										</tr>
									</thead>
									<tbody class="company_r"></tbody>
								</table>
							</div>
						</div>
					<div class="chart"><div id="company_chart"></div></div>
				</div>
			</div>
			</div>
			<div>
				<p class="row_white"><span>金融动态</span></p>
				<ul class="trend_dynamics"></ul>
			</div>
			<div>
				<p class="row_white"><span>需求动态</span></p>
				<ul class="demand_trend"></ul>
			</div>
			<div>
				<p class="row_white"><span>优秀企业</span></p>
				<ul class="good_company"></ul>
			</div>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp"></jsp:include>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/3.6.2/echarts.min.js"></script>
	<script src="../js/index.js"></script>
</body>
</html>