<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="com.yijinsuo.common.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8");%>
<%!String _helpPrefix = ConstantUtil.YJS + "/web/help.jsp";%>

<div class="footer">
<c:if test="${param.show != 'false'}">
	<div class="footer_bg">
		<div class="main_width">
			<ul class="justify">
				<li class="circle">
					<div class="circle_item">
						<div class="circle_img"></div>
						<span>免费找货找车</span>
					</div>
				</li>
				<li class="circle">
					<div class="circle_item">
						<div class="circle_img circle_1"></div>
						<span>商城钢厂直供</span>
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
						<span>仓储加工一体</span>
					</div>
				</li>
				<li class="circle">
					<div class="circle_item">
						<div class="circle_img circle_4"></div>
						<span>缺钱可打白条</span>
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
							<li><a href="<%=_helpPrefix%>#howtobuy">如何下单采购</a></li>
							<li><a href="<%=_helpPrefix%>#howtopay">支付流程</a></li>
							<li><a href="<%=_helpPrefix%>#releasedemands">如何发布需求单</a></li>
						</ul>
					</div>
				</li>
				<li class="list">
					<div class="list_item">
						<p class="list_title">我要卖</p>
						<ul class="list_block">
							<li><a href="<%=_helpPrefix%>#releasepdts">如何发布商品</a></li>
							<li><a href="<%=_helpPrefix%>#releasestock">如何发布现货库存</a></li>
							<li><a href="<%=_helpPrefix%>#viewstatistics">如何查看销售统计</a></li>
						</ul>
					</div>
				</li>
				<li class="list">
					<div class="list_item">
						<p class="list_title">账户服务</p>
						<ul class="list_block">
							<li><a href="<%=_helpPrefix%>#userregister">用户注册</a></li>
							<li><a href="<%=_helpPrefix%>#forgetpwd">找回密码</a></li>
							<li><a href="<%=_helpPrefix%>#creditquery">授信查询</a></li>
						</ul>
					</div>
				</li>
				<li class="list">
					<div class="list_item">
						<p class="list_title">常见问题</p>
						<ul class="list_block">
							<li><a href="<%=_helpPrefix%>#cantregister">无法注册</a></li>
							<li><a href="<%=_helpPrefix%>#cantlogin">无法登录</a></li>
							<li><a href="<%=_helpPrefix%>#contactclients">联系客服</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
</c:if>
	<div class="main_width">
		<div class="descriptions">
			<p><a>关于我们</a>|<a>法律声明</a>|<a>投资洽谈</a>|<a>联系我们</a>|<a>常见问题</a></p>
			<p>Copyright©易金所 www.yijinsuo.com 粤ICP备 xxxxxxxxx号-x</p>
		</div>
		<ul class="footer_icons">
			<a href="http://www.zx110.org/" target="_blank"><li></li></a>
			<a href="http://report.12377.cn:13225/toreportinputNormal_anis.do" target="_blank"><li class="footer_1"></li></a>
			<a href="http://www.cyberpolice.cn/wfjb/frame/impeach/chooseImpeachAnonymous.jsp" target="_blank"><li class="footer_2"></li></a>
			<a href="http://www.creditchina.gov.cn/" target="_blank"><li class="footer_3"></li></a>
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