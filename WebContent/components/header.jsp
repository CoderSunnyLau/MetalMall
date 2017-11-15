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
				<a href="<%=prefix%>/web/help.jsp" class="tohelp hover_o" target="_blank">帮助中心</a>|
				<a class="hover_o toask" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=330467112&site=qq&menu=yes">在线客服</a>
			</div>
		</div>
	</div>
	<div class="logo_wrapper">
		<div class="main_width">
			<div class="logo"><a href="<%=prefix%>/web/index.jsp" title="回首页"><i></i></a><span><%=request.getParameter("systemTitle")%>管理系统</span></div>
			<div class="user logged">
			    <div><span class="user_name">--</span></div>
			    <div class="logout"><span>退出</span></div>
			</div>
		</div>
	</div>
</div>
<script src="../js/system.js?v=15"></script>
<script>
	$('.toorders').click(function(){
		var _crrUrl = window.location.href;
		var _page;
		var _role;
		if(_crrUrl.indexOf('/admin/') > -1){
			_role = 'admin';
			_page = 'orders';
		}else if(_crrUrl.indexOf('/bank/') > -1){
			_role = 'bank';
			_page = 'credit_apply';
		}else if(_crrUrl.indexOf('/company/') > -1){
			_role = 'company';
			_page = 'orders_purchase'
		}
		jump(_role, _page);
	});
</script>