<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>商城</title>
    <meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/mall.css">
	<script src="../js/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../components/header2.jsp"></jsp:include>
	<div class="page_body" nav="mall">
		<div class="page_cnt main_width">
			<div class="search_box">
				<div class="search_row">
					<div><span>品名</span><input type="text"/></div>
					<div><span>规格</span><input type="text"/></div>
					<div><span>材质</span><input type="text"/></div>
					<div><span>企业</span><input type="text"/></div>
				</div>
				<div class="search_row">
					<div>
						<span>地区</span>
						<select>
							<option value="guangzhou">广州</option>
						</select>
					</div>
					<div>
						<span>商品类型</span>
						<select>
							<option value="">未定义</option>
						</select>
					</div>
					<div class="search_price">
						<span>价格</span><input type="number"/><i>—</i><input type="number">
					</div>
					<button>搜索</button>
				</div>
			</div>
			<div class="pdts_box">
				<ul class="rank">
					<li class="rank_item">日期</li>
					<li class="rank_item">销量</li>
					<li class="rank_item">价格</li>
				</ul>
				<ul class="pdts">
					<li class="pdt">
						<div class="pdt_l">
							<img src="#" />
                        </div>
						<div class="pdt_c">
							<p class="pdt_title">
								<b class="pdt_name">无铅高温铜条</b>
								<span class="company_name">【成品厂名称】</span>
							</p>
							<div class="pdt_info">
								<div class="pdt_state">
									<p class="pdt_price">
										￥<b>10.00</b>元/条
									</p>
									<p class="pdt_stock">
										<span>库存</span><i>1000条</i>
									</p>
								</div>
								<div class="pdt_detail">
									<p class="pdt_dtl_cnt">
										<span>类型：电解铜1</span>
										<span>地区：无锡</span>
									</p>
									<p class="pdt_dtl_cnt">
										<span>材质：xxxxxx</span>
										<span>规格：xxxxxxxxx</span>
									</p>
								</div>
							</div>
						</div>
						<div class="pdt_r">
							<p class="date">2017-08-14</p>
							<button>下单</button>
						</div>
					</li>
					<li class="pdt">
						<div class="pdt_l">
							<img src="#" />
                        </div>
						<div class="pdt_c">
							<p class="pdt_title">
								<b class="pdt_name">无铅高温铜条</b>
								<span class="company_name">【成品厂名称】</span>
							</p>
							<div class="pdt_info">
								<div class="pdt_state">
									<p class="pdt_price">
										￥<b>10.00</b>元/条
									</p>
									<p class="pdt_stock">
										<span>库存</span><i>1000条</i>
									</p>
								</div>
								<div class="pdt_detail">
									<p class="pdt_dtl_cnt">
										<span>类型：电解铜1</span>
										<span>地区：无锡</span>
									</p>
									<p class="pdt_dtl_cnt">
										<span>材质：xxxxxx</span>
										<span>规格：xxxxxxxxx</span>
									</p>
								</div>
							</div>
						</div>
						<div class="pdt_r">
							<p class="date">2017-08-14</p>
							<button>下单</button>
						</div>
					</li>
					<li class="pdt">
						<div class="pdt_l">
							<img src="#" />
                        </div>
						<div class="pdt_c">
							<p class="pdt_title">
								<b class="pdt_name">无铅高温铜条</b>
								<span class="company_name">【成品厂名称】</span>
							</p>
							<div class="pdt_info">
								<div class="pdt_state">
									<p class="pdt_price">
										￥<b>10.00</b>元/条
									</p>
									<p class="pdt_stock">
										<span>库存</span><i>1000条</i>
									</p>
								</div>
								<div class="pdt_detail">
									<p class="pdt_dtl_cnt">
										<span>类型：电解铜1</span>
										<span>地区：无锡</span>
									</p>
									<p class="pdt_dtl_cnt">
										<span>材质：xxxxxx</span>
										<span>规格：xxxxxxxxx</span>
									</p>
								</div>
							</div>
						</div>
						<div class="pdt_r">
							<p class="date">2017-08-14</p>
							<button>下单</button>
						</div>
					</li>
					<li class="pdt">
						<div class="pdt_l">
							<img src="#" />
                        </div>
						<div class="pdt_c">
							<p class="pdt_title">
								<b class="pdt_name">无铅高温铜条</b>
								<span class="company_name">【成品厂名称】</span>
							</p>
							<div class="pdt_info">
								<div class="pdt_state">
									<p class="pdt_price">
										￥<b>10.00</b>元/条
									</p>
									<p class="pdt_stock">
										<span>库存</span><i>1000条</i>
									</p>
								</div>
								<div class="pdt_detail">
									<p class="pdt_dtl_cnt">
										<span>类型：电解铜1</span>
										<span>地区：无锡</span>
									</p>
									<p class="pdt_dtl_cnt">
										<span>材质：xxxxxx</span>
										<span>规格：xxxxxxxxx</span>
									</p>
								</div>
							</div>
						</div>
						<div class="pdt_r">
							<p class="date">2017-08-14</p>
							<button>下单</button>
						</div>
					</li>
					<li class="pdt">
						<div class="pdt_l">
							<img src="#" />
                        </div>
						<div class="pdt_c">
							<p class="pdt_title">
								<b class="pdt_name">无铅高温铜条</b>
								<span class="company_name">【成品厂名称】</span>
							</p>
							<div class="pdt_info">
								<div class="pdt_state">
									<p class="pdt_price">
										￥<b>10.00</b>元/条
									</p>
									<p class="pdt_stock">
										<span>库存</span><i>1000条</i>
									</p>
								</div>
								<div class="pdt_detail">
									<p class="pdt_dtl_cnt">
										<span>类型：电解铜1</span>
										<span>地区：无锡</span>
									</p>
									<p class="pdt_dtl_cnt">
										<span>材质：xxxxxx</span>
										<span>规格：xxxxxxxxx</span>
									</p>
								</div>
							</div>
						</div>
						<div class="pdt_r">
							<p class="date">2017-08-14</p>
							<button>下单</button>
						</div>
					</li>
					<li class="pdt">
						<div class="pdt_l">
							<img src="#" />
                        </div>
						<div class="pdt_c">
							<p class="pdt_title">
								<b class="pdt_name">无铅高温铜条</b>
								<span class="company_name">【成品厂名称】</span>
							</p>
							<div class="pdt_info">
								<div class="pdt_state">
									<p class="pdt_price">
										￥<b>10.00</b>元/条
									</p>
									<p class="pdt_stock">
										<span>库存</span><i>1000条</i>
									</p>
								</div>
								<div class="pdt_detail">
									<p class="pdt_dtl_cnt">
										<span>类型：电解铜1</span>
										<span>地区：无锡</span>
									</p>
									<p class="pdt_dtl_cnt">
										<span>材质：xxxxxx</span>
										<span>规格：xxxxxxxxx</span>
									</p>
								</div>
							</div>
						</div>
						<div class="pdt_r">
							<p class="date">2017-08-14</p>
							<button>下单</button>
						</div>
					</li>
				</ul>
				<div class="page_box">
					<button class="near_page page_btn">上一页</button>
					<ul class="pages">
						<li class="page">1</li>
						<li class="page crr_page">2</li>
						<li class="page">3</li>
						<li class="page">4</li>
						<li class="page">5</li>
					</ul>
					<button class="near_page page_btn">下一页</button>
					<div class="change_page">
						<span>到</span><input type="number" /><span>页</span>
						<button class="page_btn">确定</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>