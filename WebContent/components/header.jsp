<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>

<script src="../libs/global.js"></script>
<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="header">
	<div class="top_bar">
		<div class="main_width">
			<div class="top_left">
				<a href="../web/index.jsp">易金所商城首页</a>
			</div>
			<div class="top_right">
				<a href="#" class="tocompany">我的企业平台</a>|
				<a href="#" class="toorders">我的订单</a>|
				<a href="#" class="tohelp">帮助中心</a>|
				<a href="#" class="toask">在线客服</a>
			</div>
		</div>
	</div>
	<div class="logo_wrapper">
		<div class="main_width">
			<div class="logo"><i></i><span><%=request.getParameter("systemTitle")%>后台管理系统</span></div>
			<div class="user">
			    <div><span class="user_name">王大宝</span></div>
			    <div class="logout"><span>退出</span></div>
			</div>
		</div>
	</div>
</div>
<script src="../libs/jquery.min.js"></script>