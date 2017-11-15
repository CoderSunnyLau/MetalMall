<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE>
<html>
<head>
    <title>帮助中心-易金所</title>
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
				<p><img src="../images/helpImg/help_01_01.jpg" witdh="800" height="360" /></p>
				<div class="main_cnt">
					<p>1.1.1  商城是一个铜商品的大卖场，有许多厂商在此发布自己的商品，用户可以通过顺序浏览页面中的商品列表以及点击商品查看某商品的详细信息。又或者可以通过一定的条件，进行查询自己想要的商品。</p>
					<p><img src="../images/helpImg/help_01_02.jpg" witdh="800" height="430" /></p>
					<p>以下是点击列表商品时，显示出来的该商品的详细信息：</p>
					<p><img src="../images/helpImg/help_01_03.jpg" witdh="800" height="380" /></p>
					<p>1.1.2  需求单是易金所平台提供给用户的另一种方便采购的功能。用户对于自己想要采购的商品，以需求的形式整理成合理的表述，然后通过发布需求单，向互联网上面的供应商发出采购申请，让大家向您供货。</p>
					<p><img src="../images/helpImg/help_01_04.jpg" witdh="900" height="480" /></p>
				</div>
			</div>
			<div class="help_block">
				<i class="anchor" id="howtopay"></i>
				<div class="row_grey">1.2 支付流程</div>
				<div class="main_cnt">
					<p>1.2.1  注册的企业用户，通过了授信审核后才有资格进行最后的对商品下单和支付操作。一般的，用户在易金所前台页面浏览好需要够买的商品，在下单页面中，通过下面的支付选项，选择支付方式（包含白条分期，应收票据，反向保理），接着选择银行，最后选择期限（分期）。</p>
					<p><img src="../images/helpImg/help_01_05.jpg" witdh="800" height="430" /></p>
					<p>其中：白条分期--是易金所金融推出的“先埋单,后付款”的全新支付方式,在易金所商城购物时打白条即可延后或分期付款购买相关的商品;除了在易金所商城,可以打白条租房、装修、学车、培训...而且与众多银行合作，多多在线优惠，申请即享，快来参与吧。</p>
					<p>应收票据--是指企业持有的未到期或未兑现的商业票据。是一种载有一定付款日期、付款地点、付款金额和付款人的无条件支付的流通证券，也是一种可以由持票人自由转让给他人的债权凭证。根据我国现行法律的规定，商业汇票的付款期限不得超过6个月，符合条件的商业汇票的持票人，可以持未到期的商业汇票和贴现凭证向银行申请贴现。</p>
					<p>反向保理--是指保理商所买断的应收账款的对家是一些资信水平很高的买家。这样，银行只需要评估买家的信用风险就可以开展保理，而授信的回收资金流也直接来自于买家。
其目的旨在构筑大买家和小供应商之间的低交易成本和高流动性的交易链。使融资困难的小供应商得以凭借它们对大买家的应收账款进行流动资金融资，并且通过让大买家的低信用风险替代小供应商的高信用风险，从而降低小供应商的融资成本。X</p>
				</div>
			</div>
			<div class="help_block">
				<i class="anchor" id="releasedemands"></i>
				<div class="row_grey">1.3 如何发布需求单</div>
				<div class="main_cnt">
					<p>1.3.1  需求单是易金所平台提供给用户的另一种方便采购的功能。用户对于自己想要采购的商品，以需求的形式整理成合理的表述，然后通过发布需求单，向互联网上面的供应商发出采购申请，让大家向您供货。</p>
					<p><img src="../images/helpImg/help_01_06.jpg" witdh="800" height="400" /></p>
					<p>已注册的需求方企业通过企业后台，对自己的需求进行描述，并按规格填写相关的需求单，易金所后台通过资料的审核后，前台系统就能显示出相应的需求单，能够让互联网上的供应商们看到，如果规定的价格范围合理，供应商企业就会乐意了解，并积极地参与到供货当中。</p>
				</div>
			</div>
		</div>
		<div class="help_box">
			<div class="row_white"><span>2. 我要卖</span></div>
			<div class="help_block">
				<i class="anchor" id="releasepdts"></i>
				<div class="row_grey">2.1 如何发布商品？</div>
				<div class="main_cnt">
					<p>企业用户登录后台系统，通过点击“供货中心”-->“商品管理”菜单，点击发布功能，然后填写相关的商品重要信息。建议上传商品的展示图片通过自己的修饰整理，大概为正方形时候相关最佳，图片建议控制在2~4张，这样的效果在切换的时候会比较合理和容易显示，同时，还可以设计成多图片重叠或结合的类似于旅游海报这样的产品图片，这样就可以一张图片表达出多种信息而且美观的效果。</p>
					<p><img src="../images/helpImg/help_02_01.jpg" witdh="500" height="350" /></p>
				</div>
			</div>
			<div class="help_block">
				<i class="anchor" id="releasestock"></i>
				<div class="row_grey">2.2 如何发布库存现货？</div>
				<div class="main_cnt">
					<p>
企业用户登录后台系统，通过点击“供货中心”-->“商品管理”菜单，点击发布功能，然后填写相关的商品重要信息。在库存数量一栏中，真实填写好该商品的库存数量一栏。
每当有客户企业下单确认后，系统会自动扣减该库存量。同时，用户应该通过自己的实际操作或者经验设置好库存和起订量，这样系统能通过其他用户下单，然后再您的确定订单下，进行库存的真实扣减。
					</p>
					<p><img src="../images/helpImg/help_02_02.jpg" witdh="900" height="480" /></p>
				</div>
			</div>
			<div class="help_block">
				<i class="anchor" id="viewstatistics"></i>
				<div class="row_grey">2.3 如何查看销售统计</div>
				<div class="main_cnt">
					<p>
					企业用户登录后台系统，通过点击“订单中心”-->“供货记录”菜单，查看自己的销售记录。
					</p>
					<p><img src="../images/helpImg/help_02_03.jpg" witdh="900" height="400" /></p>
				</div>
			</div>
		</div>
		<div class="help_box">
			<div class="row_white"><span>3. 账户服务</span></div>
			<div class="help_block">
				<i class="anchor" id="userregister"></i>
				<div class="row_grey">3.1 用户注册</div>
				<div class="main_cnt">
					<p>3.1.1  企业用户通过前台的注册页面，进行注册，填写好相关的企业信息，通过手机验证，就可以使用用户名进行前台系统以及后台系统的登录操作了。登录的过程中，您可以使用登录名或者已经绑定的手机号进行密码验证登录。</p>
					<p><img src="../images/helpImg/help_03_02.jpg" witdh="800" height="380" /></p>
					<p><img src="../images/helpImg/help_03_01.jpg" witdh="800" height="380" /></p>
					<p>3.1.2  如果是银行用户的话，通过访问银行后台注册页面，进行银行用户注册操作。然后银行用户就可以通过自己的账号，进行银行后台的登录操作。但这里只限有银行账号的用户登录。</p>
					<p><img src="../images/helpImg/help_03_03.jpg" witdh="800" height="400" /></p>
				</div>
			</div>
			<div class="help_block">
				<i class="anchor" id="forgetpwd"></i>
				<div class="row_grey">3.2 找回密码</div>
				<div class="main_cnt">
					<p>当用户忘记自己的账号密码的时候，我们还提供了忘记密码的功能：用户可以通过首页的登录一栏，进入后点击忘记密码，然后就能进入到找回密码页面。通过手机短信的验证后，进行新密码的设置。</p>
					<p><img src="../images/helpImg/help_03_04.jpg" witdh="300" height="320" /></p>
				</div>
			</div>
			<div class="help_block">
				<i class="anchor" id="creditquery"></i>
				<div class="row_grey">3.3 授信查询</div>
				<div class="main_cnt">
					<p>
						企业用户可以通过登录企业后台，在后台的首页中的“我的授信”一栏下，看到自己企业目前的授信总额。
		点击进入后，能在我的授信页面查看到具体的银行授信信息。
					</p>
					<p><img src="../images/helpImg/help_03_05.jpg" witdh="900" height="350" /></p>
				</div>
			</div>
		</div>
		<div class="help_box">
			<div class="row_white"><span>4. 常见问题</span></div>
			<div class="help_block">
				<i class="anchor" id="cantregister"></i>
				<div class="row_grey">4.1 无法注册</div>
				<div class="main_cnt">
					<p>请查看网络是否连接畅顺，或者查看注册表单中具体的信息是否填写完整。如果是发送手机的验证码短信失败，未能及时收到验证码的，也许是手机号码输入错误，或者是网络的延时，用户可以检查手机号码或者再次点击发送和耐心等待。</p>
				</div>
			</div>
			<div class="help_block">
				<i class="anchor" id="cantlogin"></i>
				<div class="row_grey">4.2 无法登录</div>
				<div class="main_cnt">
					<p>请查看网络是否连接畅顺，或者检查用户名密码是否正确。当忘记用户密码的时候，可以参考“找回密码”中提及的方式重设密码。如果用户使用的是IE浏览器，可以点击IE->"工具"->"Internet选项"，选择"安全"标签，然后选择"Internet"，点击"自定义级别"，然后找到"脚本"那项，将"Java 小程序脚本"选择启用，还不行就修复IE重装IE，或者换其他浏览器例如chrome或者safari。也有可能是浏览器里保留了你第一次登陆的信息，所后来自动登陆就失效了，或者防火墙的限制等等。如果有条件的可以换朋友的一台电脑试一试，或者让别人帮忙测试一下。</p>
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