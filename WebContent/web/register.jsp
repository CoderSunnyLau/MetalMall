<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
	<title>注册-易金所</title>
	<link rel="stylesheet" type="text/css" href="../css/login.css?v=17">
	<jsp:include page="../components/head.jsp"></jsp:include>
</head>
<body>
	<div class="header_more">
		<span>欢迎注册</span>
		<a href="./login.jsp" class="hover_o">我已经注册，马上登录></a>
	</div>
	<jsp:include page="../components/header3.jsp"></jsp:include>
	<div class="page_body">
		<div class="page_cnt">
			<div class="register_body">
				<div class="user_info input_box">
					<div class="user_name input_field" id="user_name">
						<span>用戶名</span><input class="check_field" type="text" name="loginName" maxlength="14" placeholder="长度为4~14个字符" />
						<i class="error"></i>
					</div>
					<div class="user_psd input_field" id="set_psd">
						<span>设置密码</span><input class="check_field" type="password" name="password" maxlength="14" placeholder="长度为6~14位" />
						<i class="error"></i>
					</div>
					<div class="user_psd input_field" id="repeat_psd">
						<span>确认密码</span><input class="check_field" type="password" name="" placeholder="请再次输入设置的密码">
						<i class="error"></i>
					</div>
					<div class="user_phone input_field" id="phone_num">
						<span>手机号</span><input class="check_field" type="text" name="phone" maxlength="11" placeholder="可用于登录和找回密码" />
						<i class="error"></i>
					</div>
					<div class="user_valid input_field" id="register_valid">
						<span>验证码</span>
						<input class="check_field" type="text" name="code" placeholder="请输入4位数验证码">
						<i class="error"></i>
						<button class="valid_btn">获取验证码</button>
					</div>
					<div class="input_field company_type" id="company_type">
						<span>企业类别</span>
						<select class="check_field" name="companyType">
							<option value="unselected">请选择企业类别</option>
							<option value="供货商">供货商</option>
							<option value="需求商">需求商</option>
							<option value="供货商兼需求商">供货商兼需求商</option>
						</select>
						<i class="error"></i>
					</div>
					<div class="input_field company_area" id="company_area">
						<span>企业区域</span>
						<select id="select_area" class="check_field" name="area">
							<option value="unselected">请选择地区</option>
						</select>
						<i class="error"></i>
					</div>
				</div>
				<button class="register_submit">立即注册</button>
			</div>
		</div>
	</div>
	<script src="../libs/pca.js"></script>
	<jsp:include page="../components/footer.jsp">
		<jsp:param value="false" name="show"/>
	</jsp:include>
	<script src="../js/register.js"></script>
</body>
</html>