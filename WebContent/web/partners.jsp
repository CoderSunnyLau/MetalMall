<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>合作伙伴-易金所</title>
	<jsp:include page="../components/head.jsp"></jsp:include>
	<style>
		.partners{
			min-height:400px;
		}
		.bank{
			float:left;
			margin:15px;
			text-align:center;
		}
		.bank img{
			display:block;
			width:200px;
			height:auto;
			border:1px solid #DDD;
			margin-bottom:5px;
		}
		.main_title{
			font-size:18px;
			text-align:center;
			margin-top:35px;
		}
		.title2{
			font-size:14px;
			margin:10px 0;
			padding-left:5px;
			border-left:5px solid #F90;
		}
	</style>
</head>
<body>
	<jsp:include page="/components/header2.jsp"></jsp:include>
	<div class="main_width partners">
		<p class="main_title">合作伙伴</p>
		<div>
		<p class="title2"><span>银行合作伙伴</span></p>
			<ul>
				<li class="bank">
					<img src="../images/pinganbank.png"/>
					<span>平安银行</span>
				</li>
				<li class="bank">
					<img src="../images/bankofzhengzhou.png"/>
					<span>郑州银行</span>
				</li>
				<li class="bank">
					<img src="../images/zhongyuanbank.png"/>
					<span>中原银行</span>
				</li>
			</ul>
		</div>
	</div>
	<jsp:include page="/components/footer.jsp"></jsp:include>
</body>
</html>