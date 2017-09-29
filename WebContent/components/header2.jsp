<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="com.yijinsuo.common.*" %>
<%request.setCharacterEncoding("utf-8");%>
<%! String _prefix = ConstantUtil.YJS; %>

<div class="header2">
	<div class="top_bar">
		<div class="main_width">
			<div class="top_left">
				<span class="welcome">欢迎来到易金所！</span>
				<span class="not_logged">
					<a href="<%=_prefix%>/web/login.jsp" class="tologin">请登录</a>
					<a href="<%=_prefix%>/web/register.jsp" class="toregister">免费注册</a>
				</span>
				<span class="logged">
					<i class="user_name"></i>
					<a class="logout">退出</a>
				</span>
			</div>
			<div class="top_right">
				<a class="tocompany">我的企业平台</a>|
				<a class="toorders">我的订单</a>|
				<a href="<%=_prefix%>/web/help.jsp" class="tohelp">帮助中心</a>|
				<a class="toask">在线客服</a>
			</div>
		</div>
	</div>
	<div class="logo_wrapper">
		<div class="main_width">
			<a href="<%=_prefix%>/web/index.jsp" title="回首页"><i class="login_icon"><img src="<%=_prefix%>/images/logo.png"></i></a>
			<ul class='main_nav <%=request.getParameter("pageName")%>'>
				<li class="nav_item" id="index"><a href="<%=_prefix%>/web/index.jsp">首页</a></li>
				<li class="nav_item" id="mall"><a href="<%=_prefix%>/web/mall.jsp">商城</a></li>
				<li class="nav_item" id="demand"><a href="<%=_prefix%>/web/demand.jsp">需求单</a></li>
				<li class="nav_item" id="finance"><a href="<%=_prefix%>/web/finance.jsp">供应链金融</a></li>
				<li class="nav_item" id="market"><a href="<%=_prefix%>/web/market.jsp">行情速递</a></li>
			</ul>
		</div>
	</div>
</div>