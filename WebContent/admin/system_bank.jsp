<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
    <title>银行端-后台管理系统</title>
    <meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/system.css">
</head>
<body>
	<jsp:include page="../components/header.jsp">
		<jsp:param name="systemTitle" value="银行端"/> 
	</jsp:include>
    <div class="nav">
    	<ul class="menu" id="bank">
    		<li class="menu_item item_home menu_link active" name="bank_home">
    			<span>首　　页</span>
    		</li>
    		<li class="menu_item"><span>银行中心</span>
                <ul class="menu2">
                    <li class="menu2_item">支付方式</li>
                </ul>
            </li>
    		<li class="menu_item"><span>资信中心</span>
                <ul class="menu2">
                    <li class="menu2_item">企业授信</li>
                    <li class="menu2_item">订单资信申请</li>
                </ul>
            </li>
    		<li class="menu_item"><span>金融中心</span>
                <ul class="menu2">
                    <li class="menu2_item">金融管理</li>
                </ul>
            </li>
    		<li class="menu_item system"><span>系统管理</span>
                <ul class="menu2">
                    <li class="menu2_item">账户信息</li>
                    <li class="menu2_item">账户安全</li>
                    <li class="menu2_item">修改密码</li>
                </ul>
            </li>
    	</ul>
    </div>
    <div class="body_cnt">
        <div class="cnt" id="cnt">
        	<jsp:include page="./bank_home.jsp"></jsp:include>
        </div>
    </div>
    <script src="../libs/jquery.min.js"></script>
    <script src="../js/system.js"></script>
</body>
</html>