<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>行情速递-易金所</title>
	<jsp:include page="../components/head.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="../css/finance.css">
</head>
<body>
	<jsp:include page="../components/header2.jsp">
		<jsp:param value="market" name="pageName"/>
	</jsp:include>
	<div class="page_body" nav="market">
		<div class="page_cnt main_width">
			<div class="market_top">
				<div class="float">
					<table class="market_table">
						<thead>
							<tr>
								<td>铜类型</td>
								<td>区间价</td>
								<td>均价</td>
								<td>涨跌</td>
								<td>单位</td>
							</tr>
						</thead>
						<tbody style="border:1px solid #DDD;">
							<tr>
								<td>电解铜</td>
								<td>2200</td>
								<td>2000</td>
								<td class="market_float">2100</td>
								<td>吨</td>
							</tr>
							<tr>
								<td>电解铜</td>
								<td>2200</td>
								<td>2000</td>
								<td class="market_float fall">2100</td>
								<td>吨</td>
							</tr>
							<tr>
								<td>电解铜</td>
								<td>2200</td>
								<td>2000</td>
								<td class="market_float">2100</td>
								<td>吨</td>
							</tr>
							<tr>
								<td>电解铜</td>
								<td>2200</td>
								<td>2000</td>
								<td class="market_float">2100</td>
								<td>吨</td>
							</tr>
							<tr>
								<td>电解铜</td>
								<td>2200</td>
								<td>2000</td>
								<td class="market_float">2100</td>
								<td>吨</td>
							</tr>
							<tr>
								<td>电解铜</td>
								<td>2200</td>
								<td>2000</td>
								<td class="market_float">2100</td>
								<td>吨</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="float">
					<div class="border">
						<p class="right_top"><span>易金所指数</span><!-- <i>【49910.00（49750-50070）】</i> --></p>
						<table class="tab_row">
							<tr>
								<td>本月最低：<span>4168</span></td>
								<td>本月最高：<span class="red">4217</span></td>
								<td>本月均值：<span>4195</span></td>
								<td>本月环比：<span class="red">1.01%</span></td>
							</tr>
						</table>
						<p class="price_crr"><span>现货价格</span></p>
						<div class="chart_box">
							<div id="market_chart"></div>
						</div>
					</div>
				</div>
			</div>
			<p class="row_white"><span>行情直播</span></p>
			<ol class="live_box"></ol>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp"></jsp:include>
	<script src="../libs/echarts.min.js"></script>
	<script src="../js/market.js"></script>
</body>
</html>