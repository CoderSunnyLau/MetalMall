<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
	<title>易金所管理系统</title>
	<jsp:include page="../components/head.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="../css/system.css?v=18">
</head>
<body>
	<jsp:include page="../components/header.jsp">
		<jsp:param name="systemTitle" value="易金所"/> 
	</jsp:include>
	<div class="main_width cnt_box">
	<div class="nav">
		<ul class="menu" id="admin">
			<li class="menu_item item_home menu_link active" name="home">
				<span class="m_home">首　　页</span>
			</li>
			<li class="menu_item">
				<span class="m_apply">供货中心</span>
				<ul class="menu2">
					<li class="menu2_item menu_link" name="pdts_all">全部商品</li>
					<li class="menu2_item menu_link" name="pdts_check">商品审核</li>
				</ul>
			</li>
			<li class="menu_item"><span class="m_order">订单中心</span>
				<ul class="menu2">
					<li class="menu2_item menu_link" name="orders">全部订单</li>
				</ul>
			</li>
			<li class="menu_item"><span class="m_demand">需求中心</span>
				<ul class="menu2">
					<li class="menu2_item menu_link" name="demand">全部需求单</li>
					<li class="menu2_item menu_link" name="demand_check">需求单审核</li>
				</ul></li>
			<li class="menu_item"><span class="m_company">企业中心</span>
				<ul class="menu2">
					<li class="menu2_item menu_link" name="companies">企业管理</li>
				</ul>
			</li>
			<li class="menu_item"><span class="m_finance">金融中心</span>
				<ul class="menu2">
					<li class="menu2_item menu_link" name="banks">银行管理</li>
					<li class="menu2_item menu_link" name="pay_type">支付方式</li>
					<li class="menu2_item menu_link" name="finance">金融管理</li>
				</ul>
			</li>
			<li class="menu_item"><span class="m_credit">资信中心</span>
				<ul class="menu2">
					<li class="menu2_item menu_link" name="credit">企业授信</li>
				</ul>
			</li>
			<li class="menu_item system"><span class="m_setting">系统管理</span>
				<ul class="menu2">
					<li class="menu2_item menu_link" name="live">直播管理</li>
					<li class="menu2_item menu_link" name="parameters">参数管理</li>
					<!-- <li class="menu2_item menu_link" name="roles">角色管理</li> -->
					<li class="menu2_item menu_link" name="users">用户管理</li>
					<li class="menu2_item menu_link" name="account_security">账户安全</li>
					<li class="menu2_item menu_link" name="account_pwd">修改密码</li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="body_cnt">
		<div class="cnt a" id="cnt">
			<jsp:include page="./home.jsp"></jsp:include>
		</div>
	</div>
	</div>
	<jsp:include page="../components/footer.jsp">
		<jsp:param value="false" name="show"/>
	</jsp:include>
</body>
</html>