<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>供应链金融-易金所</title>
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
							<li class="a" val="白条分期">白条分期</li>
							<li class="a" val="应收票据">应收票据</li>
							<li class="a" val="反向保理">反向保理</li>
						</ul>
						<span class="all">全部</span>
					</td>
				</tr>
				<tr class="select_bank">
					<td class="select_title">银　行</td>
					<td class="options">
						<ul>
							<li class="a" val="工商银行">工商银行</li>
							<li class="a" val="招商银行">招商银行</li>
							<li class="a" val="建设银行">建设银行</li>
							<li class="a" val="农业银行">农业银行</li>
							<li class="a b" val="中国银行">中国银行</li>
							<li class="a b" val="交通银行">平安银行</li>
						</ul>
						<span class="all">全部</span>
					</td>
				</tr>
			</table>
			<ul class="rank">
				<ul class="fl_left">
					<li class="piece_sel piece_area" s_type="type"></li>
					<li class="piece_sel piece_type" s_type="bank"></li>
				</ul>
				<ul class="fl_right">
					<li class="rank_item" sort="addTime">时间</li>
				</ul>
			</ul>
			<ul class="results financial_list">
				<p class="loading_wrapper"><i class="loading"></i>正在加载，请稍候...</p>
			</ul>
			<jsp:include page="../components/page.jsp"></jsp:include>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp"></jsp:include>
	<script src="../js/finance.js?v=13"></script>
</body>
</html>