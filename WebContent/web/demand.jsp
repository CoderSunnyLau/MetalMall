<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>需求单-易金所</title>
	<jsp:include page="../components/head.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="../css/mall.css">
</head>
<body>
	<jsp:include page="../components/header2.jsp">
		<jsp:param value="demand" name="pageName"/>
	</jsp:include>
	<div class="page_body" nav="demand">
		<div class="page_cnt main_width">
			<table class="select_box">
				<tr class="area">
					<td class="select_title">地　区：</td>
					<td class="options">
						<ul></ul>
						<span class="all">全部</span>
					</td>
				</tr>
				<tr class="type">
					<td class="select_title">类　型：</td>
					<td class="options">
						<ul></ul>
						<span class="all">全部</span>
					</td>
				</tr>
			</table>
			<div class="rank">
				<ul class="fl_left">
					<li class="piece_sel piece_area" s_type="area"></li>
					<li class="piece_sel piece_type" s_type="type"></li>
				</ul>
				<ul class="fl_right">
					<li class="rank_item" sort="addTime">时间</li>
					<li class="rank_item" sort="minBudget">预算</li>
				</ul>
			</div>
			<ul class="demand_trend results">
				<p class="loading_wrapper"><i class="loading"></i>正在加载，请稍候...</p>
			</ul>
			<jsp:include page="../components/page.jsp"></jsp:include>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp"></jsp:include>
	<script src="../js/demand.js"></script>
</body>
</html>