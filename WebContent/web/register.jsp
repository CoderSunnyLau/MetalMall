<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
	<title>注册</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body>
	<div class="header_more">
		<span>欢迎注册</span>
		<a href="./login.jsp">我已经注册，马上登录></a>
	</div>
	<jsp:include page="../components/header3.jsp"></jsp:include>
	<div class="page_body">
		<div class="page_cnt">
			<div class="register_body">
				<div class="user_info input_box">
					<div class="user_name input_field">
						<span>用戶名</span><input type="text" name="" />
					</div>
					<div class="user_psd input_field">
						<span>设置密码</span><input type="password" name="">
					</div>
					<div class="user_psd input_field">
						<span>确认密码</span><input type="password" name="">
					</div>
					<div class="user_phone input_field">
						<span>手机</span><input type="text" name="" />
					</div>
					<div class="user_valid input_field">
						<span>验证码</span><input type="text" name=""><button>获取验证码</button>
					</div>
					<div class="input_field company_type">
						<span>企业类别</span>
						<select>
							<option value="有限责任公司">有限责任公司</option>
							<option value="股份责任公司">股份责任公司</option>
						</select>
					</div>
					<div class="input_field company_area">
						<span>企业区域</span>
						<select name="province"></select><select name="city"></select>
					</div>
				</div>
				<button class="register_submit">立即注册</button>
			</div>
		</div>
	</div>
	<script src="../libs/pca.js"></script>
	<script>
	    new PCAS("province","city");
	</script>
	<jsp:include page="../components/footer.jsp">
		<jsp:param value="false" name="show"/>
	</jsp:include>
	<script src="../js/register.js"></script>
</body>
</html>