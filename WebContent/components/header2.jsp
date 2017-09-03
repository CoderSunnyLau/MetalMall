<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>

<link rel="stylesheet" type="text/css" href="../css/common.css">
<div class="header2">
	<div class="top_bar">
		<div class="main_width">
			<div class="top_left">
				<span class="welcome">欢迎来到易金所！</span>
				<a href="./login.jsp" class="tologin">请登录</a>
				<a href="./register.jsp" class="toregister">免费注册</a>
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
			<i class="login_icon"><img src="../images/logo.png"></i>
			<ul class="main_nav <%=request.getParameter("pageName")%>">
				<li class="nav_item" id="index"><a href="../web/index.jsp">首页</a></li>
				<li class="nav_item" id="mall"><a href="../web/mall.jsp">商城</a></li>
				<li class="nav_item" id="demand"><a href="../web/demand.jsp">需求单</a></li>
				<li class="nav_item" id="finance"><a href="../web/finance.jsp">供应链金融</a></li>
				<li class="nav_item" id="market"><a href="../web/market.jsp">行情速递</a></li>
			</ul>
		</div>
	</div>
</div>