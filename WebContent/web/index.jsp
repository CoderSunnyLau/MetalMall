<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>首页</title>
    <meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/index.css">
	<script src="../js/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../components/header2.jsp"></jsp:include>
	<div class="page_body" nav="index">
		<div class="banner">
			<img src="" />
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
				<ul class="scroll">
					<li class="scroll_item">企业易金所所属商品铜合金交易成功，成交价为20000.00元</li>
					<li class="scroll_item">企业易金所所属商品铜合金交易成功，成交价为20000.00元</li>
					<li class="scroll_item">企业易金所所属商品铜合金交易成功，成交价为20000.00元</li>
				</ul>
			</div>
			<p class="row_white">
				<span>易金所指数</span>
				<i>每天9:30-10:30更新价格，12:00、16:30更新景气指数，请及时刷新查看</i>
			</p>
			<div class="pdt_index_box">
				<p class="row_grey">商品指数</p>
				<div class="pdt_index">
					<div class="index_table">
						<div class="tables">
							<table class="table table_l">
								<thead>
									<tr>
										<th>类型</th>
										<th>本周</th>
										<th>本月</th>
										<th>上月</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>电解铜</td>
										<td>3800</td>
										<td>3800</td>
										<td>6400</td>
									</tr>
									<tr>
										<td>电解铜</td>
										<td>3800</td>
										<td>3800</td>
										<td>6400</td>
									</tr>
									<tr>
										<td>电解铜</td>
										<td>3800</td>
										<td>3800</td>
										<td>6400</td>
									</tr>
								</tbody>
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
								<tbody>
									<tr>
										<td>电解铜</td>
										<td>3800</td>
										<td>3800</td>
										<td>6400</td>
									</tr>
									<tr>
										<td>电解铜</td>
										<td>3800</td>
										<td>3800</td>
										<td>6400</td>
									</tr>
									<tr>
										<td>电解铜</td>
										<td>3800</td>
										<td>3800</td>
										<td>6400</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="chart"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>