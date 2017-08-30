<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
    <title>企业端-后台管理系统</title>
    <meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/system.css">
</head>
<body>
	<jsp:include page="../components/header.jsp">
		<jsp:param name="systemTitle" value="企业端"/> 
	</jsp:include>
    <div class="nav">
    	<ul class="menu" id="company">
    		<li class="menu_item item_home menu_link active" name="company_home">
    			<span>首　　页</span>
    		</li>
    		<li class="menu_item">
                <span>供货中心</span>
                <ul class="menu2">
                    <li class="menu2_item menu_link" name="pdts_all">全部商品</li>
                </ul>
            </li>
    		<li class="menu_item"><span>订单中心</span>
                <ul class="menu2">
                    <li class="menu2_item menu_link" name="orders_supply">供货订单</li>
                    <li class="menu2_item menu_link" name="orders_purchase">采购订单</li>
                </ul>
            </li>
    		<li class="menu_item"><span>需求中心</span>
                <ul class="menu2">
                    <li class="menu2_item menu_link" name="demand_management">需求单管理</li>
                </ul>
            </li>
    		<li class="menu_item"><span>资信中心</span>
                <ul class="menu2">
                    <li class="menu2_item">我的授信</li>
                </ul>
            </li>
    		<li class="menu_item system"><span>系统管理</span>
                <ul class="menu2">
                    <li class="menu2_item">账户信息</li>
                    <li class="menu2_item">账户安全</li>
                    <li class="menu2_item">我的收藏</li>
                    <li class="menu2_item">修改密码</li>
                </ul>
            </li>
    	</ul>
    </div>
    <div class="body_cnt">
        <div class="cnt" id="cnt">
        	<jsp:include page="./company_home.jsp"></jsp:include>
        </div>
    </div>
    <script src="../libs/jquery.min.js"></script>
    <script src="../js/system.js"></script>
</body>
</html>