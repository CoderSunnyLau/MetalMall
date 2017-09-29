<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>商城</title>
	<jsp:include page="../components/head.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="../css/mall.css">
</head>
<body>
	<jsp:include page="../components/header2.jsp">
		<jsp:param value="mall" name="pageName"/>
	</jsp:include>
	<div class="page_body" nav="mall">
		<div class="page_cnt main_width">
			<jsp:include page="../components/search_box.jsp"></jsp:include>
			<div class="pdts_box">
				<ul class="rank">
					<li class="rank_item">日期</li>
					<li class="rank_item">销量</li>
					<li class="rank_item">价格</li>
				</ul>
				<ul class="pdts">
				<p class="loading_wrapper"><i class="loading"></i>正在加载，请稍候...</p>
				<!--
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
				-->
				</ul>
				<jsp:include page="../components/page.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp"></jsp:include>
	<script src="../js/mall.js"></script>
</body>
</html>