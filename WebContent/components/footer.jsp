<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8");%>
<div class="footer">
<c:if test="${param.show != 'false'}">
	<div class="footer_bg">
		<div class="main_width">
			<ul class="justify">
				<li class="circle">
					<div class="circle_item">
						<div class="circle_img"></div>
						<span>交易无手续费</span>
					</div>
				</li>
				<li class="circle">
					<div class="circle_item">
						<div class="circle_img circle_1"></div>
						<span>商城原料供销</span>
					</div>
				</li>
				<li class="circle">
					<div class="circle_item">
						<div class="circle_img circle_2"></div>
						<span>品种规格齐全</span>
					</div>
				</li>
				<li class="circle">
					<div class="circle_item">
						<div class="circle_img circle_3"></div>
						<span>上下游企业链</span>
					</div>
				</li>
				<li class="circle">
					<div class="circle_item">
						<div class="circle_img circle_4"></div>
						<span>缺钱申请分期</span>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="footer_bg2">
		<div class="main_width">
			<ul class="justify2">
				<li class="list">
					<div class="list_item">
						<p class="list_title">我要买</p>
						<ul class="list_block">
							<li><a href="">如何采购？</a></li>
							<li><a href="">定制商城采购流程</a></li>
							<li><a href="">现货商城采购流程</a></li>
							<li><a href="">如何支付</a></li>
							<li><a href="">物流帮助</a></li>
						</ul>
					</div>
				</li>
				<li class="list">
					<div class="list_item">
						<p class="list_title">我要卖</p>
						<ul class="list_block">
							<li><a href="">如何销售？</a></li>
							<li><a href="">定制商城销售指南</a></li>
							<li><a href="">现货商城销售指南</a></li>
							<li><a href="">如何发布现货库存</a></li>
						</ul>
					</div>
				</li>
				<li class="list">
					<div class="list_item">
						<p class="list_title">账户服务</p>
						<ul class="list_block">
							<li><a href="">用户注册</a></li>
							<li><a href="">找回密码</a></li>
							<li><a href="">如何认证</a></li>
							<li><a href="">信用查询</a></li>
						</ul>
					</div>
				</li>
				<li class="list">
					<div class="list_item">
						<p class="list_title">常见问题</p>
						<ul class="list_block">
							<li><a href="">无法注册</a></li>
							<li><a href="">无法登录</a></li>
							<li><a href="">联系客户</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
</c:if>
	<div class="main_width">
		<div class="descriptions">
			<p><a>关于我们</a>|<a>法律声明</a>|<a>诚聘英才</a>|<a>投资洽谈</a>|<a>联系我们</a>|<a>常见问题</a></p>
			<p>Copyright©易金所 www.yijinsuo.com 粤ICP备 13000000号-3 ICP证：粤B2-20140000</p>
			<p>商务部2015-2016年度电子商务示范企业 2016年度国家级服务标准化试点项目 中国互联网诚信示范企业 2015年中国大宗商品你现代流通诚信市场</p>
		</div>
		<ul class="footer_icons">
			<li></li>
			<li class="footer_1"></li>
			<li class="footer_2"></li>
			<li class="footer_3"></li>
			<li class="footer_4"></li>
		</ul>
	</div>
</div>
<!-- IE8及以下版本瀏覽器 -->
<!--[if lte IE 8]>
<script>
	//初始化頁面主寬度
	var widthResize = function(){
		if($(window).width() > 1400){
			$('body').removeClass('min');
		}else{
			$('body').addClass('min');
		}
	}
	widthResize();
	$(window).resize(widthResize);
</script>
<![endif]-->