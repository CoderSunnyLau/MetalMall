<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>帮助中心</title>
	<jsp:include page="../components/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../css/help.css">
</head>
<body>
	<jsp:include page="/components/header2.jsp"></jsp:include>
	<div class="main_width help">
		<div class="help_box">
			<div class="row_white"><span>1. 我要买</span></div>
			<div class="help_block">
				<i class="anchor" id="howtobuy"></i>
				<div class="row_grey">1.1 如何下单采购？</div>
				<p>已登录的用户可以通过易金所系统首页的“商城”或者“需求单”这两个功能菜单，进行自己所需商品的采购。</p>
				<div class="main_cnt">
					<p>1.1.1  商城是一个铜商品的大卖场，有许多厂商在此发布自己的商品，用户可以通过顺序浏览页面中的商品列表以及点击商品查看某商品的详细信息。又或者可以通过一定的条件，进行查询自己想要的商品。【这里可以放置相关的一些流程操作图片】</p>
					<p>1.1.2  需求单是易金所平台提供给用户的另一种方便采购的功能。用户对于自己想要采购的商品，以需求的形式整理成合理的表述，然后通过发布需求单，向互联网上面的供应商发出采购申请，让大家向您供货。【放一些需求单的流程操作图片】</p>
				</div>
			</div>
			<div class="help_block">
				<i class="anchor" id="howtopay"></i>
				<div class="row_grey">1.2 支付流程</div>
				<div class="main_cnt">
					<p>1.2.1  注册的企业用户，通过了授信审核后才有资格进行最后的对商品下单和支付操作。一般的，用户在易金所前台页面浏览好需要够买的商品，在下单页面中，通过下面的支付选项，选择支付方式（包含白条分期，应收票据，反向保理），接着选择银行，最后选择期限（分期）【这里放一页下单的页面图】。</p>
					<p>其中白条分期是XXXXX</p>
					<p>应收票据是XXXX</p>
					<p>反向保理是XXXXXX</p>
				</div>
			</div>
			<div class="help_block">
				<i class="anchor" id="releasedemands"></i>
				<div class="row_grey">1.3 如何发布需求单</div>
				<div class="main_cnt">
					<p>1.3.1  需求单是易金所平台提供给用户的另一种方便采购的功能。用户对于自己想要采购的商品，以需求的形式整理成合理的表述，然后通过发布需求单，向互联网上面的供应商发出采购申请，让大家向您供货。【放一些需求单的流程操作图片】</p>
				</div>
			</div>
		</div>
		<div class="help_box">
			<div class="row_white"><span>2. 我要卖</span></div>
			<div class="help_block">
				<i class="anchor" id="releasepdts"></i>
				<div class="row_grey">2.1 如何发布商品？</div>
				<div class="main_cnt">
					<p>企业用户登录后台系统，通过点击“供货中心”-->“商品管理”菜单，点击发布功能，然后填写相关的商品重要信息。建议上传商品的展示图片通过自己的修饰整理，大概为正方形时候相关最佳。【放一张商品发布的填写好重要内容的页面图片</p>
				</div>
			</div>
			<div class="help_block">
				<i class="anchor" id="releasestock"></i>
				<div class="row_grey">2.2 如何发布库存现货？</div>
				<div class="main_cnt">
					<p>
企业用户登录后台系统，通过点击“供货中心”-->“商品管理”菜单，点击发布功能，然后填写相关的商品重要信息。在库存数量一栏中，真实填写好该商品的库存数量一栏。
每当有客户企业下单确认后，系统会自动扣减该库存量。
【放一张商品发布的填写该商品库存数量的页面图片】
					</p>
				</div>
			</div>
			<div class="help_block">
				<i class="anchor" id="viewstatistics"></i>
				<div class="row_grey">2.3 如何查看销售统计</div>
				<div class="main_cnt">
					<p>
					企业用户登录后台系统，通过点击“订单中心”-->“供货记录”菜单，查看自己的销售记录。
【放一张后台系统中某企业用户的订单中心的供货记录页面图片】
					</p>
				</div>
			</div>
		</div>
		<div class="help_box">
			<div class="row_white"><span>3. 账户服务</span></div>
			<div class="help_block">
				<i class="anchor" id="userregister"></i>
				<div class="row_grey">3.1 用户注册</div>
				<div class="main_cnt">
					<p>3.1.1  企业用户通过前台的注册页面，进行注册，填写好相关的企业信息，通过手机验证，就可以使用用户名进行前台系统以及后台系统的登录操作了。【放几张企业用户注册和登录的页面】</p>
					<p>3.1.2  如果是银行用户的话，通过访问银行后台注册页面，进行银行用户注册操作。然后银行用户就可以通过自己的账号，进行银行后台的登录操作。【放几张银行后台注册页面，银行后台登录页面】</p>
				</div>
			</div>
			<div class="help_block">
				<i class="anchor" id="forgetpwd"></i>
				<div class="row_grey">3.2 找回密码</div>
				<div class="main_cnt">
					<p>当用户忘记自己的账号密码的时候，可以通过找回密码的功能，通过手机短信的验证后，进行新密码的设置。【放置一张重置密码的图片】</p>
				</div>
			</div>
			<div class="help_block">
				<i class="anchor" id="creditquery"></i>
				<div class="row_grey">3.3 授信查询</div>
				<div class="main_cnt">
					<p>
						企业用户可以通过登录企业后台，在后台的首页中的“我的授信”一栏下，看到自己企业目前的授信总额。
		点击进入后，能在我的授信页面查看到具体的银行授信信息。【放置一张企业后台首页中我的授信的页面】
		【放置一张企业后台中，我的授信页面的授信列表信息页面】
					</p>
				</div>
			</div>
		</div>
		<div class="help_box">
			<div class="row_white"><span>4. 常见问题</span></div>
			<div class="help_block">
				<i class="anchor" id="cantregister"></i>
				<div class="row_grey">4.1 无法注册</div>
				<div class="main_cnt">
					<p>请查看网络是否连接畅顺，或者查看注册表单中具体的信息是否填写完整。</p>
				</div>
			</div>
			<div class="help_block">
				<i class="anchor" id="cantlogin"></i>
				<div class="row_grey">4.2 无法登录</div>
				<div class="main_cnt">
					<p>请查看网络是否连接畅顺，或者检查用户名密码是否正确。当忘记用户密码的时候，可以参考“找回密码”中提及的方式重设密码</p>
				</div>
			</div>
			<div class="help_block">
				<i class="anchor" id="contactclients"></i>
				<div class="row_grey">4.3 联系客服</div>
				<div class="main_cnt">
					<p>请联系我们的客服：13XXXXXXXXX 。 我们的办公时间是：周一至周五：09:00~18:00，周六日：09:30~17:00</p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/components/footer.jsp"></jsp:include>
</body>
</html>