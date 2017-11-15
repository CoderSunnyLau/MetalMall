<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="../css/system_pdts.css">
<style>
	.fill_block p{
		line-height:25px;
		padding:5px 0;
	}
	.fill_block i{
		display:inline-block;
		width:auto;
		padding:0 20px;
		font-size:13px;
		color:#666;
		vertical-align:top;
	}
	.fill_block span{
		color:#969696;
	}
	.pics_row span{
		height:auto;
	}
	.back{
		width:20%;
		margin:0 auto;
	}
	.p_description{
		float:left;
		padding-left:15px;
		width: 80%;
		border:1px solid #DDD;
	}
</style>
<div class="cnt_header">
	<span class="nav_head">首页 > 供货中心 > 商品管理 > 商品详情</span>
</div>
<div class="cnt_body cnt_pdt_add">
	<p class="user_title">商品详情</p>
	<div class="fill_block">
		<p><span>名称</span><i class="p_name"/></i></p>
		<p><span>材质</span><i class="p_material"/></i></p>
		<p><span>规格</span><i class="p_specification"/></i></p>
		<p><span>库存</span><i class="p_stockQuantity"/></i></p>
		<p><span>单价</span><i class="p_price"/></i></p>
		<p><span>单位</span><i class="p_unit"/></i></p>
		<p><span>件重</span><i class="p_weight"/></i></p>
		<p><span>起订量</span><i class="p_minOrderQuantity"/></i></p>
		<p><span>商品类型</span><i class="p_type"></i></p>
		<p><span>所属企业</span><i class="p_companyName"></i></p>
		<p><span>地区</span><i class="p_area"></i></p>
	</div>
	<div class="fill_block pdts_pics">
		<div class="pics_row">
			<span>商品图片</span>
			<div class="add_pics pics_ul"></div>
		</div>
		<div class="pics_row">
			<span>商品介绍</span>
			<div class="p_description"></div>
		</div>
		<div class="pics_row"><span>售后保障</span><i class="p_soldService"></i></div>
	</div>
	<div class="fill_block pdts_state">
		<p><span style="margin-left:40px;">审核状态</span><i class="p_status"></i></p>
		<ul>
			<li><span>新增人：</span><i class="username p_whoAdd">王大伟</i><span>新增时间：</span><i class="p_formatAddTime"></i></li>
			<li><span>修改人：</span><i class="username p_whoEdit">王大伟</i><span>修改时间：</span><i class="p_formatEditTime"></i></li>
		</ul>
	</div>
	<div class="button_block">
		<button class="back" jump="pdts">返 回</button>
	</div>
</div>
<script>
	sysInit();
	if(window.location.href.indexOf('favorite') > 0){
		$('.nav_head').html('首页 > 系统管理 > 我的收藏 > 商品详情');
	}
	var pdtId = getSysUrlParam('pdtId'),
		prepage = getSysUrlParam('prepage');
	$.ajax({
		url: DOMAIN + '/getProductDetailInfo',
		type: 'GET',
		data: {
			id: parseInt(pdtId)
		},
		success: function(res){
			var getData = [];
			for(item in res){
				getData.push(item);
			}
			doFill(res, getData, 'p_');
			$('.cnt_body').show();
			for(var i = 0; i < res.images.length; i++){
				$('.add_pics').append(
					'<img src="' + res.images[i] + '" />'
				);
			}
		}
	});
	$('.back').click(function(){
		jump('company', prepage);
	});
</script>

