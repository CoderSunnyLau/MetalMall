<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>需求单详情</title>
	<jsp:include page="../components/head.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="../css/demand.css">
</head>
<body>
	<jsp:include page="../components/header2.jsp">
		<jsp:param value="demand" name="pageName"/>
	</jsp:include>
	<div class="page_body" nav="demand">
		<div class="page_cnt main_width">
			<div class="cnt_header">
				<span class="position">需求单 > 需求单详情</span>
			</div>
			<div>
				<p class="row_grey"><span>需购电解铜100吨</span><i>发布时间：2017-08-20</i></p>
				<div class="info_box">
					<div class="float">
						<div class="demand_info">
							<div class="info_block">
								<p class="text_row"><span>企业：</span><i>成品厂名称1</i></p>
								<p class="text_row"><span>类型：</span><i>电解铜</i></p>
								<p class="text_row"><span>数量：</span><i>50吨</i></p>
							</div>
							<div class="info_block">
								<p class="text_row"><span>地区：</span><i>无锡</i></p>
								<p class="text_row"><span>材质：</span><i>xxx铜</i></p>
								<p class="text_row"><span>规格：</span><i>50吨</i></p>
							</div>
							<p class="budget">预算：<span>￥100000.00</span></p>
						</div>
					</div>
					<div class="float">
						<div class="offer_info">
							<p class="text_row"><span>申请企业：</span><i>xxxxxxxxx</i></p>
							<p class="text_row"><span class="text3_4">申请人：</span><input type="text" /></p>
							<p class="text_row"><span>手机号码：</span><input type="text" /></p>
							<p class="text_row float2"><span>申请描述：</span><textarea></textarea></p>
							<button class="offer">我要供货</button>
						</div>
					</div>
				</div>
				<div class="detail_box">
					<p class="row_white"><span>需求单详情</span></p>
					<div class="detail_cnt">
						<p>sdfhaskj;flkjd;lkjs;faksjd;lfhashf;aksj;dflkaj</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp"></jsp:include>
</body>
</html>