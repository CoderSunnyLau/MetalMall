<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>供应链金融</title>
    <meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
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
						<p class="right_top"><span>AMM1#电解铜</span><i>【49910.00（49750-50070）】</i></p>
						<table class="tab_row">
							<tr>
								<td>本月最低：<span>50150</span></td>
								<td>本月最高：<span class="red">50150</span></td>
								<td>本月均值：<span>50150</span></td>
								<td>本月环比：<span class="red">3.7%</span></td>
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
			<ol>
				<li class="live_date">
					<i class="live_tag">08-03</i>
					<ul>
						<li class="live_time">
							<div class="item_left"><span>10:58</span></div>
							<div class="item_right">
								<p class="live_title">全新库存铜大批订购</p>
								<p class="live_cnt">铜库存】7月31日LME铜库存减3600吨至296975吨。【铝库存】7月31日LME铝库存减275至153825吨。【铅库存】7月31日LME铝库存减275至153825吨。【铜库存】7月31日LME铜库存减3600吨至296975吨。【铝库存】7月31日LME铝库存减275至153825吨。【铅库存】7月31日LME铝库存减275至153825吨。</p>
							</div>
						</li>
						<li class="live_time crr_live">
							<div class="item_left"><span>10:58</span></div>
							<div class="item_right">
								<p class="live_title">全新库存铜大批订购</p>
								<p class="live_cnt">铜库存】7月31日LME铜库存减3600吨至296975吨。【铝库存】7月31日LME铝库存减275至153825吨。【铅库存】7月31日LME铝库存减275至153825吨。【铜库存】7月31日LME铜库存减3600吨至296975吨。【铝库存】7月31日LME铝库存减275至153825吨。【铅库存】7月31日LME铝库存减275至153825吨。</p>
							</div>
						</li>
						<li class="live_time">
							<div class="item_left"><span>10:58</span></div>
							<div class="item_right">
								<p class="live_title">全新库存铜大批订购</p>
								<p class="live_cnt">铜库存】7月31日LME铜库存减3600吨至296975吨。【铝库存】7月31日LME铝库存减275至153825吨。【铅库存】7月31日LME铝库存减275至153825吨。【铜库存】7月31日LME铜库存减3600吨至296975吨。【铝库存】7月31日LME铝库存减275至153825吨。【铅库存】7月31日LME铝库存减275至153825吨。</p>
							</div>
						</li>
					</ul>
					<hr>
				</li>
				<li class="live_date">
					<i class="live_tag">08-02</i>
					<ul>
						<li class="live_time">
							<div class="item_left"><span>10:58</span></div>
							<div class="item_right">
								<p class="live_title">全新库存铜大批订购</p>
								<p class="live_cnt">铜库存】7月31日LME铜库存减3600吨至296975吨。【铝库存】7月31日LME铝库存减275至153825吨。【铅库存】7月31日LME铝库存减275至153825吨。【铜库存】7月31日LME铜库存减3600吨至296975吨。【铝库存】7月31日LME铝库存减275至153825吨。【铅库存】7月31日LME铝库存减275至153825吨。</p>
							</div>
						</li>
						<li class="live_time">
							<div class="item_left"><span>10:58</span></div>
							<div class="item_right">
								<p class="live_title">全新库存铜大批订购</p>
								<p class="live_cnt">铜库存】7月31日LME铜库存减3600吨至296975吨。【铝库存】7月31日LME铝库存减275至153825吨。【铅库存】7月31日LME铝库存减275至153825吨。【铜库存】7月31日LME铜库存减3600吨至296975吨。【铝库存】7月31日LME铝库存减275至153825吨。【铅库存】7月31日LME铝库存减275至153825吨。</p>
							</div>
						</li>
						<li class="live_time">
							<div class="item_left"><span>10:58</span></div>
							<div class="item_right">
								<p class="live_title">全新库存铜大批订购</p>
								<p class="live_cnt">铜库存】7月31日LME铜库存减3600吨至296975吨。【铝库存】7月31日LME铝库存减275至153825吨。【铅库存】7月31日LME铝库存减275至153825吨。【铜库存】7月31日LME铜库存减3600吨至296975吨。【铝库存】7月31日LME铝库存减275至153825吨。【铅库存】7月31日LME铝库存减275至153825吨。</p>
							</div>
						</li>
					</ul>
					<hr>
				</li>
			</ol>
		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/3.6.2/echarts.min.js"></script>
	<script src="../js/market.js"></script>
</body>
</html>