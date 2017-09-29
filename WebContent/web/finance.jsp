<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>供应链金融</title>
	<jsp:include page="../components/head.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="../css/finance.css">
</head>
<body>
	<jsp:include page="../components/header2.jsp">
		<jsp:param value="finance" name="pageName"/>
	</jsp:include>
	<div class="page_body" nav="finance">
		<div class="banner">
			<img src="../images/finance_banner01.jpg" />
		</div>
		<div class="page_cnt main_width">
			<table class="select_box">
				<tr class="financial_type">
					<td class="select_title">类　型</td>
					<td class="options">
						<ul>
							<li class="a">白条分期</li>
							<li class="a">应收票据</li>
							<li class="a">反向保理</li>
							<li class="a">深圳</li>
							<li class="a b">杭州</li>
							<li class="a b">南京</li>
							<li>天津</li>
							<li>成都</li>
							<li>长沙</li>
							<li>无锡</li>
						</ul>
						<span class="all">全部</span>
					</td>
				</tr>
				<tr class="select_bank">
					<td class="select_title">银　行</td>
					<td class="options">
						<ul>
							<li class="a">工商银行</li>
							<li class="a">广发银行</li>
							<li class="a">广州银行</li>
							<li class="a">农业银行</li>
							<li class="a b">建设银行</li>
						</ul>
						<span class="all">全部</span>
					</td>
				</tr>
			</table>
			<ul class="rank">
				<li class="rank_item">时间</li>
			</ul>
			<ul class="results financial_list"></ul>
			<jsp:include page="../components/page.jsp"></jsp:include>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp"></jsp:include>
	<script src="../js/finance.js"></script>
</body>
</html>