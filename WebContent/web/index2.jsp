<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
	<title>首页</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/index.css">
	<style type="text/css">
		[v-cloak]{
			display:none;
		}
	</style>
	<script src="../libs/vue.min.js"></script>
	<script src="../libs/vue-resource.min.js"></script>
	<!-- <script src="https://cdn.bootcss.com/vue/2.4.2/vue.js"></script>
	<script src="https://cdn.bootcss.com/vue-resource/1.3.4/vue-resource.js"></script> -->
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
				<marquee>
				<ul class="scroll">
					<li v-for="(board, index) in boards" v-bind:class="{scroll_last: (boards.length == index + 1)}" cloak>{{board}}</li>
				</ul>
				</marquee>
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
									<tbody>
										<tr v-for="(pdt,index) in productSort" v-if="index<4" cloak>
											<td class="type">{{pdt.name}}</td>
											<td class="this_week">{{pdt.weekPrice}}</td>
											<td class="this_month">{{pdt.monthPrice}}</td>
											<td class="pre_month">{{pdt.lastMonthPrice}}</td>
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
										<tr v-for="(pdt,index) in productSort" v-if="index>=4&&index<=7" cloak>
											<td class="type">{{pdt.name}}</td>
											<td class="this_week">{{pdt.weekPrice}}</td>
											<td class="this_month">{{pdt.monthPrice}}</td>
											<td class="pre_month">{{pdt.lastMonthPrice}}</td>
										</tr>
									</tbody>
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
									<tbody>
										<tr v-for="(area,index) in areaSort" v-if="index<4" cloak>
											<td class="type">{{area.name}}</td>
											<td class="this_week">{{area.weekPrice}}</td>
											<td class="this_month">{{area.monthPrice}}</td>
											<td class="pre_month">{{area.lastMonthPrice}}</td>
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
										<tr v-for="(area,index) in areaSort" v-if="index>=4&&index<=7" cloak>
											<td class="type">{{area.name}}</td>
											<td class="this_week">{{area.weekPrice}}</td>
											<td class="this_month">{{area.monthPrice}}</td>
											<td class="pre_month">{{area.lastMonthPrice}}</td>
										</tr>
									</tbody>
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
									<tbody>
										<tr v-for="(company,index) in companySort" v-if="index<4" cloak>
											<td class="type">{{company.name}}</td>
											<td class="this_week">{{company.weekPrice}}</td>
											<td class="this_month">{{company.monthPrice}}</td>
											<td class="pre_month">{{company.lastMonthPrice}}</td>
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
										<tr v-for="(pdt,index) in productSort" v-if="index>=4&&index<=7" cloak>
											<td class="type">{{pdt.name}}</td>
											<td class="this_week">{{pdt.weekPrice}}</td>
											<td class="this_month">{{pdt.monthPrice}}</td>
											<td class="pre_month">{{pdt.lastMonthPrice}}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					<div class="chart"><div id="company_chart"></div></div>
				</div>
			</div>
			</div>
			<div>
				<p class="row_white"><span>金融动态</span></p>
				<ul class="trend_dynamics">
					<li class="trend_box" v-for="bank in banks" v-cloak>
							<p class="trend_title"><span>{{bank.name}}</span><i>{{bank.paymentType}} | 工商银行</i></p>
							<p class="trend_cnt">{{bank.introduction}}</p>
					</li>
				</ul>
			</div>
			<div>
				<p class="row_white"><span>需求动态</span></p>
				<ul class="demand_trend">
					<li class="demand_box" v-for="demand in demands" v-cloak>
						<div class="demand_cnt">
							<p class="demand_title">{{demand.name}}</p>
							<ul class="demand_detail">
								<li><span>发布时间：</span><i>{{demand.addTime}}</i></li>
								<li><span>需求地区：</span><i>{{demand.area}}</i></li>
								<li><span>商品类别：</span><i>{{demand.productType}}</i></li>
								<li><span>材质要求：</span><i>{{demand.specification}}</i></li>
								<li><span>需求数量：</span><i>{{demand.quantityReqrm}}{{demand.unit}}</i></li>
							</ul>
						</div>
						<div class="demand_action">
							<p class="demand_company">{{demand.companyName}}</p>
							<p class="demand_budget">预算：<span>{{demand.minBudget}}万~{{demand.minBudget}}万</span></p>
							<button>我要供货</button>
						</div>
					</li>
				</ul>
			</div>
			<div>
				<p class="row_white"><span>优秀企业</span></p>
				<ul class="good_company">
					<li v-for="company in goodCompanies" cloak><img v-bind:src="company.logo" /></li>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp"></jsp:include>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/3.6.2/echarts.min.js"></script>
	<script src="../js/index2.js"></script>
	<script src="../libs/pca.js"></script>
	<script>
		new PCAS("province","city");
	</script>
</body>
</html>