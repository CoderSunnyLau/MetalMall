<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<div class="header2">
	<div class="top_bar">
		<div class="main_width">
			<div class="top_left">
				<span class="welcome">欢迎来到易金所！</span>
				<a href="#" class="tologin">请登录</a>
				<a href="#" class="toregister">免费注册</a>
			</div>
			<div class="top_right">
				<a href="#" class="tocompany">我的企业平台</a>|
				<a href="#" class="tohelp">帮助中心</a>|
				<a href="#" class="toask">在线客服</a>
			</div>
		</div>
	</div>
	<div class="logo_wrapper">
		<div class="main_width">
			<i class="login_icon"></i>
			<ul class="main_nav">
				<li class="nav_item" id="index">首页</li>
				<li class="nav_item" id="mall">商城</li>
				<li class="nav_item" id="need">需求单</li>
				<li class="nav_item">供应链金融</li>
				<li class="nav_item">行情速递</li>
			</ul>
		</div>
	</div>
</div>
<script src="../js/header2.js"></script>
<!-- IE8及以下版本瀏覽器 -->
<!--[if lte IE 8]>
<script>
	//初始化頁面主寬度
	var widthResize = function(){
		if($(window).width() > 1300){
			$('body').removeClass('min');
		}else{
			$('body').addClass('min');
		}
	}
	widthResize();
	$(window).resize(widthResize);
</script>
<![endif]-->



