<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
	<title>银行管理系统-易金所</title>
	<jsp:include page="../components/head.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="../css/system.css?v=18">
	<meta http-equiv="content-type" content="must-revalidate" />
</head>
<body>
	<jsp:include page="../components/header.jsp">
		<jsp:param name="systemTitle" value="银行"/> 
	</jsp:include>
	<div class="main_width cnt_box">
		<div class="nav">
			<ul class="menu" id="bank">
				<li class="menu_item item_home menu_link active" name="home">
					<span class="m_home">首　　页</span>
				</li>
				<li class="menu_item"><span class="m_credit">资信中心</span>
					<ul class="menu2">
						<li class="menu2_item menu_link" name="credit">企业授信</li>
						<li class="menu2_item menu_link" name="credit_apply">订单资信申请</li>
					</ul>
				</li>
				<li class="menu_item"><span class="m_finance">金融中心</span>
					<ul class="menu2">
						<li class="menu2_item menu_link" name="pay_type">分期管理</li>
						<li class="menu2_item menu_link" name="finance">金融管理</li>
					</ul>
				</li>
				<li class="menu_item system"><span class="m_setting">系统管理</span>
					<ul class="menu2">
						<li class="menu2_item menu_link" name="account_info">账户信息</li>
						<li class="menu2_item menu_link" name="account_security">账户安全</li>
						<li class="menu2_item menu_link" name="account_pwd">修改密码</li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="body_cnt">
			<div class="cnt" id="cnt">
				<jsp:include page="./home.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp">
		<jsp:param value="false" name="show"/>
	</jsp:include>
</body>
</html>