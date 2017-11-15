<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=66">
<style>
	.fill_block select, .fill_block input{
		background-color:#FFF;
		border:none;
		font-size: 13px;
	}
	.fill_block span{
		color:#999;
	}
	[name="description"]{
		float:left;
		width: 80%;
		border:1px solid #DDD;
	}
	.back{
		width:200px;
		margin:0 auto;
		display:block;
	}
</style>
<div class="cnt_header">
	<span>首页 > 需求中心 > 需求单管理 > 需求单详情</span>
</div>
<div class="cnt_body demand_add">
	<p class="user_title">需求单详情信息</p>
	<div class="fill_block">
		<p><span>名称</span><input type="text" class="field" name="name" tip="需求单名称" disabled="disabled"/></p>
		<p><span>材质</span><input type="text" class="field" name="material" tip="材质" disabled="disabled"/></p>
		<p><span>规格</span><input type="text" class="field" name="specification" tip="规格" disabled="disabled"/></p>
		<p><span>所需数量</span><input type="text" class="field" name="quantityReqrm" tip="所需数量"  disabled="disabled"/></p>
		<p><span>单位</span><input type="text" class="field" name="unit" tip="单位" disabled="disabled" /></p>
		<p><span>商品类型</span>
			<input class="field" id="da_type" name="productType" tip="商品类型" value="" disabled="disabled" />
		</p>
		<p><span>所属企业</span><input class="field" name="companyName" tip="所属企业"></p>
		<p><span>地区</span>
			<input class="field" id="da_area" name="area" tip="地区" value="" disabled="disabled" />
		</p>
		<p><span>联系电话</span><input type="text" class="field" name="phone"  tip="联系电话" disabled="disabled"/></p>
		<p><span>预算</span><input type="text" class="field" name="minBudget" tip="预算" disabled="disabled" style="width:80px;" />~<input type="text" class="field" name="maxBudget" tip="预算"  disabled="disabled"/></p>
	</div>
	<div class="fill_block pdts_pics">
		<div class="pics_row">
			<span>需求单介绍</span>
			<div class="field" name="description" tip="需求单介绍"></div>
		</div>
	</div>
	<div class="fill_block pdts_state">
		<p><span>审核状态</span><i class="cd_approval"></i></p>
		<ul>
			<li><span>新增人：</span><i class="username cd_whoAdd">--</i><span>新增时间：</span><i class="cd_addTime">--</i></li>
			<li><span>修改人：</span><i class="username cd_whoEdit">--</i><span>修改时间：</span><i class="cd_editTime">--</i></li>
		</ul>
	</div>
	<div class="button_block">
		<button class="back">返 回</button>
	</div>
</div>
<script>
	sysInit();
	
	var demandId = getSysUrlParam('demandId'),
		postData,
		prepage = getSysUrlParam('prepage');
	
	var successCallback = function(){
		$.ajax({
			url: DOMAIN + '/getReqFormDetailInfoById',
			type: 'GET',
			data: {
				formId: demandId
			},
			success: function(res){
				$('.cnt_body').show();
				$('.field').each(function(){
					$(this).val(res[$(this).attr('name')]);
				});
				$('.field[name="description"]').html(res.description);
				doFill(res, [
					'whoAdd',
					'whoEdit',
					'addTime',
					'editTime',
					'approval'
				], 'cd_');
			}
		});
		$('.back').click(function(){
			jump('admin', prepage);
		});
	}
</script>


