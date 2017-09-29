<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>需求单</title>
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
				<tr class="pdt_type">
					<td class="select_title">类　型：</td>
					<td class="options">
						<ul></ul>
						<span class="all">全部</span>
					</td>
				</tr>
			</table>
			<ul class="rank">
				<li class="rank_item">时间</li>
				<li class="rank_item">预算</li>
			</ul>
			<ul class="demand_trend results"></ul>
			<jsp:include page="../components/page.jsp"></jsp:include>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp"></jsp:include>
	<script src="../js/demand.js"></script>
</body>
</html>