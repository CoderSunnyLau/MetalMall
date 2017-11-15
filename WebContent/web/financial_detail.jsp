<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>金融详情-易金所</title>
	<jsp:include page="../components/head.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="../css/finance.css">
</head>
<body>
	<jsp:include page="../components/header2.jsp">
		<jsp:param value="finance" name="pageName"/>
	</jsp:include>
	<div class="page_body" nav="finance">
		<div class="page_cnt main_width">
			<div class="cnt_header">
				<span class="position">白条分期 > 分期详情</span>
				<p class="tip f_name"></p>
			</div>
			<p class="loading_wrapper"><i class="loading"></i>正在加载，请稍候...</p>
			<div class="loading_success" style="display:none;">
				<p class="financial_tip">
					<span>银行：</span><i class="f_bankName"></i>
					<span>申请人数：</span><i class="f_applicantCount"></i>
					<span class="date f_addTime"></span>
				</p>
				<div class="f_introduction" style="padding:25px 15px;"></div>
				<!-- <div class="financial_img"><img src="../images/financial_detail01.jpg"/></div>
				<div class="guide_box">
					<p class="guide_title">新手引导</p>
					<p class="guide_summary">提供多方位的专业咨询和服务。</p>
					<div class="line"></div>
					<ol class="steps">
						<li class="step">
							<div class="step_icon"></div>
							<span>Step1 网上申请</span>
						</li>
						<li class="step">
							<div class="step_icon step_1"></div>
							<span>Step2 上传资料</span>
						</li>
						<li class="step">
							<div class="step_icon step_2"></div>
							<span>Step1 资料审核</span>
						</li>
						<li class="step">
							<div class="step_icon step_3"></div>
							<span>Step1 签署合同放款</span>
						</li>
					</ol>
				</div> -->
				<div class="apply_box">
					<p class="row_grey">我要申请</p>
					<div class="apply">
						<p class="row_input"><span>申请企业</span><i class="user_name"></i></p>
						<p class="row_input"><span>申  请  人</span><input class="field" name="applyer" type="text"/></p>
						<p class="row_input"><span>企业电话</span><input class="field" name="phone" type="text"/></p>
						<p class="row_input"><span>企业描述</span><textarea class="field" name="description"></textarea></p>
						<button class="toApply">立即申请</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp"></jsp:include>
	<script src="../js/finance_detail.js"></script>
</body>
</html>