<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="com.yijinsuo.common.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8");%>
<%!String _helpPrefix = ConstantUtil.YJS + "/web/help.jsp";%>
<%!String _prefix = ConstantUtil.YJS;%>

<div class="footer">
<c:if test="${param.show != 'false'}">
	<div class="footer_bg">
		<div class="main_width">
			<ul class="justify">
				<li class="circle">
					<div class="circle_item">
						<div class="circle_img"></div>
						<span>帮您快速找货</span>
					</div>
				</li>
				<li class="circle">
					<div class="circle_item">
						<div class="circle_img circle_1"></div>
						<span>供需厂商直供</span>
					</div>
				</li>
				<li class="circle">
					<div class="circle_item">
						<div class="circle_img circle_2"></div>
						<span>专业交易团队</span>
					</div>
				</li>
				<li class="circle">
					<div class="circle_item">
						<div class="circle_img circle_3"></div>
						<span>供应链分期支付</span>
					</div>
				</li>
				<li class="circle">
					<div class="circle_item">
						<div class="circle_img circle_4"></div>
						<span>一站式降本增效</span>
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
			<p><a href="<%=_prefix%>/web/about_us.jsp" target="_blank">关于我们</a>|<a href="<%=_prefix%>/web/legal_statement.jsp">法律声明</a>|<a href="<%=_prefix%>/web/partners.jsp" target="_blank">合作伙伴</a>|<a href="<%=_prefix%>/web/contact_us.jsp" target="_blank">联系我们</a>|<a href="<%=_helpPrefix%>" target="_blank">常见问题</a></p>
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
<div class="modal_wrap">
	<div class="modal_box">
		<div class="modal_title">提 示</div>
		<div class="modal_cnt"></div>
		<div class="modal_btns">
			<button class="modal_choose modal_cancel">取消</button>
			<button class="modal_choose modal_confirm">确定</button>
		</div>
	</div>
</div>
<script>
	var modal = {
		choose: function(msg, callback){
			$('.modal_wrap').show();
			$('.modal_choose').off();
			$('.modal_cnt').html(msg);
			$('.modal_choose').on('click', function(){
				var r;
				if($(this).hasClass('modal_confirm')){
					r = true;
				}else{
					r = false;
				}
				callback(r);
				$('.modal_wrap').hide();
			});
		}
	};
</script>
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