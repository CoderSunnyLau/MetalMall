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
	<div class="page_body" nav="index">
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
					<li class="scroll_item">企业易金所所属商品铜合金交易成功，成交价为20000.00元</li>
					<li class="scroll_item">企业易金所所属商品铜合金交易成功，成交价为20000.00元</li>
					<li class="scroll_item">企业易金所所属商品铜合金交易成功，成交价为20000.00元</li>
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
											<td class="type">电解铜</td>
											<td class="this_week">3800</td>
											<td class="this_month">3800</td>
											<td class="pre_month">6400</td>
										</tr>
										<tr>
											<td class="type">电解铜</td>
											<td class="this_week">3800</td>
											<td class="this_month">3800</td>
											<td class="pre_month">6400</td>
										</tr>
										<tr>
											<td class="type">电解铜</td>
											<td class="this_week">3800</td>
											<td class="this_month">3800</td>
											<td class="pre_month">6400</td>
										</tr>
										<tr>
											<td class="type">电解铜</td>
											<td class="this_week">3800</td>
											<td class="this_month">3800</td>
											<td class="pre_month">6400</td>
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
											<td class="type">电解铜</td>
											<td class="this_week">3800</td>
											<td class="this_month">3800</td>
											<td class="pre_month">6400</td>
										</tr>
										<tr>
											<td class="type">电解铜</td>
											<td class="this_week">3800</td>
											<td class="this_month">3800</td>
											<td class="pre_month">6400</td>
										</tr>
										<tr>
											<td class="type">电解铜</td>
											<td class="this_week">3800</td>
											<td class="this_month">3800</td>
											<td class="pre_month">6400</td>
										</tr>
										<tr>
											<td class="type">电解铜</td>
											<td class="this_week">3800</td>
											<td class="this_month">3800</td>
											<td class="pre_month">6400</td>
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
											<td class="type">北京</td>
											<td class="this_week">3800</td>
											<td class="this_month">3800</td>
											<td class="pre_month">6400</td>
										</tr>
										<tr>
											<td class="type">上海</td>
											<td class="this_week">3800</td>
											<td class="this_month">3800</td>
											<td class="pre_month">6400</td>
										</tr>
										<tr>
											<td class="type">广州</td>
											<td class="this_week">3800</td>
											<td class="this_month">3800</td>
											<td class="pre_month">6400</td>
										</tr>
										<tr>
											<td class="type">深圳</td>
											<td class="this_week">3800</td>
											<td class="this_month">3800</td>
											<td class="pre_month">6400</td>
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
											<td class="type">北京</td>
											<td class="this_week">3800</td>
											<td class="this_month">3800</td>
											<td class="pre_month">6400</td>
										</tr>
										<tr>
											<td class="type">上海</td>
											<td class="this_week">3800</td>
											<td class="this_month">3800</td>
											<td class="pre_month">6400</td>
										</tr>
										<tr>
											<td class="type">广州</td>
											<td class="this_week">3800</td>
											<td class="this_month">3800</td>
											<td class="pre_month">6400</td>
										</tr>
										<tr>
											<td class="type">深圳</td>
											<td class="this_week">3800</td>
											<td class="this_month">3800</td>
											<td class="pre_month">6400</td>
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
										<td class="type">易金所</td>
										<td class="this_week">3800</td>
										<td class="this_month">3800</td>
										<td class="pre_month">6400</td>
									</tr>
									<tr>
										<td class="type">易金所</td>
										<td class="this_week">3800</td>
										<td class="this_month">3800</td>
										<td class="pre_month">6400</td>
									</tr>
									<tr>
										<td class="type">易金所</td>
										<td class="this_week">3800</td>
										<td class="this_month">3800</td>
										<td class="pre_month">6400</td>
									</tr>
									<tr>
										<td class="type">易金所</td>
										<td class="this_week">3800</td>
										<td class="this_month">3800</td>
										<td class="pre_month">6400</td>
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
										<td class="type">易金所</td>
										<td class="this_week">3800</td>
										<td class="this_month">3800</td>
										<td class="pre_month">6400</td>
									</tr>
									<tr>
										<td class="type">易金所</td>
										<td class="this_week">3800</td>
										<td class="this_month">3800</td>
										<td class="pre_month">6400</td>
									</tr>
									<tr>
										<td class="type">易金所</td>
										<td class="this_week">3800</td>
										<td class="this_month">3800</td>
										<td class="pre_month">6400</td>
									</tr>
									<tr>
										<td class="type">易金所</td>
										<td class="this_week">3800</td>
										<td class="this_month">3800</td>
										<td class="pre_month">6400</td>
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
					<li class="trend_box">
							<p class="trend_title"><span>超级白条</span><i><a>白条分期</a> | <a>工商银行</a></i></p>
							<p class="trend_cnt">我司推出超级白条分期优惠金融产品，该产品kgfkgfhkgfkhgfhgfhgfkjhfkjfk。该产品可以30天内免息</p>
					</li>
					<li class="trend_box">
							<p class="trend_title"><span>超级白条</span><i><a>白条分期</a> | <a>工商银行</a></i></p>
							<p class="trend_cnt">我司推出超级白条分期优惠金融产品fkgfkjgfkhgfkghfkhgfkhgfkhgfkhgfkhgf，该产品。该产品可以30天内免息</p>
					</li>
					<li class="trend_box">
							<p class="trend_title"><span>超级白条</span><i><a>白条分期</a> | <a>工商银行</a></i></p>
							<p class="trend_cnt">我司推出超级白条分期优惠金融产品，该产品jhgfjhgfjghfjhgfjhgfjhgf。该产品可以30天内免息</p>
					</li>
					<li class="trend_box">
							<p class="trend_title"><span>超级白条</span><i><a>白条分期</a> | <a>工商银行</a></i></p>
							<p class="trend_cnt">我司推出超级白条分期优惠金融产品，该产品jhgfjhgfjghfjhgfjhgfjhgf。该产品可以30天内免息</p>
					</li>
				</ul>
			</div>
			<div>
				<p class="row_white"><span>需求动态</span></p>
				<ul class="demand_trend">
					<li class="demand_box">
						<div class="demand_cnt">
							<p class="demand_title">需购电解铜400吨</p>
							<ul class="demand_detail">
								<li>
									<span>发布时间：</span><i>2017-08-19</i>
								</li>
								<li>
									<span>需求地区：</span><i>广东广州</i>
								</li>
								<li>
									<span>商品类别：</span><i>电解铜</i>
								</li>
								<li>
									<span>材质要求：</span><i>10mm厚度</i>
								</li>
								<li>
									<span>需求数量：</span><i>400吨</i>
								</li>
							</ul>
						</div>
						<div class="demand_action">
							<p class="demand_company">广州市光辉太阳电缆集团有限公司</p>
							<p class="demand_budget">预算：<span>120万~150万</span></p>
							<button>我要供货</button>
						</div>
					</li>
					<li class="demand_box">
						<div class="demand_cnt">
							<p class="demand_title">需购电解铜400吨</p>
							<ul class="demand_detail">
								<li>
									<span>发布时间：</span><i>2017-08-19</i>
								</li>
								<li>
									<span>需求地区：</span><i>广东广州</i>
								</li>
								<li>
									<span>商品类别：</span><i>电解铜</i>
								</li>
								<li>
									<span>材质要求：</span><i>10mm厚度</i>
								</li>
								<li>
									<span>需求数量：</span><i>400吨</i>
								</li>
							</ul>
						</div>
						<div class="demand_action">
							<p class="demand_company">广州市光辉太阳电缆集团有限公司</p>
							<p class="demand_budget">预算：<span>120万~150万</span></p>
							<button>我要供货</button>
						</div>
					</li>
					<li class="demand_box">
						<div class="demand_cnt">
							<p class="demand_title">需购电解铜400吨</p>
							<ul class="demand_detail">
								<li>
									<span>发布时间：</span><i>2017-08-19</i>
								</li>
								<li>
									<span>需求地区：</span><i>广东广州</i>
								</li>
								<li>
									<span>商品类别：</span><i>电解铜</i>
								</li>
								<li>
									<span>材质要求：</span><i>10mm厚度</i>
								</li>
								<li>
									<span>需求数量：</span><i>400吨</i>
								</li>
							</ul>
						</div>
						<div class="demand_action">
							<p class="demand_company">广州市光辉太阳电缆集团有限公司</p>
							<p class="demand_budget">预算：<span>120万~150万</span></p>
							<button>我要供货</button>
						</div>
					</li>
					<li class="demand_box">
						<div class="demand_cnt">
							<p class="demand_title">需购电解铜400吨</p>
							<ul class="demand_detail">
								<li class="demand_row">
									<span>发布时间：</span><i>2017-08-19</i>
								</li>
								<li>
									<span>需求地区：</span><i>广东广州</i>
								</li>
								<li>
									<span>商品类别：</span><i>电解铜</i>
								</li>
								<li>
									<span>材质要求：</span><i>10mm厚度</i>
								</li>
								<li>
									<span>需求数量：</span><i>400吨</i>
								</li>
							</ul>
						</div>
						<div class="demand_action">
							<p class="demand_company">广州市光辉太阳电缆集团有限公司</p>
							<p class="demand_budget">预算：<span>120万~150万</span></p>
							<button>我要供货</button>
						</div>
					</li>
				</ul>
			</div>
			<div>
				<p class="row_white"><span>优秀企业</span></p>
				<ul class="good_company">
					<li><img src="#" /></li>
					<li><img src="#" /></li>
					<li><img src="#" /></li>
					<li><img src="#" /></li>
					<li><img src="#" /></li>
					<li><img src="#" /></li>
					<li><img src="#" /></li>
					<li><img src="#" /></li>
					<li><img src="#" /></li>
					<li><img src="#" /></li>
					<li><img src="#" /></li>
					<li><img src="#" /></li>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp"></jsp:include>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/3.6.2/echarts.min.js"></script>
	<script src="../js/index.js"></script>
</body>
</html>