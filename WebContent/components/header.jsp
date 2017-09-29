<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="com.yijinsuo.common.*" %>
<%request.setCharacterEncoding("utf-8");%>
<%! String prefix = ConstantUtil.YJS; %>

<div class="header">
	<div class="top_bar">
		<div class="main_width">
			<div class="top_left">
				<a href="<%=prefix%>/web/index.jsp" class="gohome">易金所商城首页</a>
			</div>
			<div class="top_right">
				<a href="javascript:void(0);" class="toorders hover_o">我的订单</a>|
				<a href="javascript:void(0);" class="tohelp hover_o">帮助中心</a>|
				<a href="javascript:void(0);" class="toask hover_o">在线客服</a>
			</div>
		</div>
	</div>
	<div class="logo_wrapper">
		<div class="main_width">
			<div class="logo"><a href="<%=prefix%>/web/index.jsp" title="回首页"><i></i></a><span><%=request.getParameter("systemTitle")%>管理系统</span></div>
			<div class="user logged">
			    <div><span class="user_name">王大宝</span></div>
			    <div class="logout"><span>退出</span></div>
			</div>
		</div>
	</div>
</div>