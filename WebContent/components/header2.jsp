<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="com.yijinsuo.common.*" %>
<%request.setCharacterEncoding("utf-8");%>
<%! String _prefix = ConstantUtil.YJS; %>

<div class="header2">
	<div class="top_bar">
		<div class="main_width">
			<div class="top_left">
				<span class="welcome">欢迎来到易金所！</span>
				<span class="not_logged">
					<a href="javascript:void(0)" class="tologin">请登录</a>
					<a href="<%=_prefix%>/web/register.jsp" class="toregister">免费注册</a>
				</span>
				<span class="logged">
					<i class="user_name"></i>
					<a class="logout">退出</a>
				</span>
			</div>
			<div class="top_right">
				<a class="tosystem" target="_blank" href="<%=_prefix%>/company/login.jsp">我的企业平台</a>|
				<a class="toorders" target="_blank">我的订单</a>|
				<a href="<%=_prefix%>/web/help.jsp" class="tohelp" target="_blank">帮助中心</a>|
				<a class="toask" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=330467112&site=qq&menu=yes">在线客服</a>
			</div>
		</div>
	</div>
	<div class="logo_wrapper">
		<div class="main_width">
			<a href="<%=_prefix%>/web/index.jsp" title="回首页"><i class="login_icon"><img src="<%=_prefix%>/images/logo.png?v=17"></i></a>
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
<script>
	$('.not_logged .tologin').click(function(){
		window.location.href = '<%=_prefix%>/web/login.jsp?target=' + window.location.href;
	});
	$('.top_right .toorders').click(function(){
		var _url;
		if(typeof(USER) != 'undefined'){
			console.log(USER)
			var role = USER.roleType;
			if(role == 'company'){
				_url = YJS + '/company/system.jsp?page=orders_purchase';
			}else if(role == 'bank'){
				_url = YJS + '/bank/system.jsp?page=credit_apply';
			}else if(role == 'admin'){
				_url = YJS + '/admin/system.jsp?page=orders';
			}
		}else{
			_url = YJS + '/web/login.jsp?target=' + _href;
		}
		window.location.href = _url;
	});
</script>