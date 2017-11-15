<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>商城-易金所</title>
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
					<li class="rank_item" sort="addTime">日期</li>
					<li class="rank_item" sort="salesCount">销量</li>
					<li class="rank_item" sort="price">价格</li>
				</ul>
				<ul class="pdts">
					<p class="loading_wrapper"><i class="loading"></i>正在加载，请稍候...</p>
				</ul>
				<jsp:include page="../components/page.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp"></jsp:include>
	<script src="../js/mall.js"></script>
</body>
</html>