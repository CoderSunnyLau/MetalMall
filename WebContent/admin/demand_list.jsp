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
	.no_info{
		line-height:30px !important;
	}
</style>
<div class="cnt_header">
	<span>首页 > 需求中心 > 需求单管理 > 申请列表</span>
</div>
<div class="cnt_body demand_add">
	<p class="user_title">需求单申请列表</p>
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
	<div class="finance_order_list">
		<p class="user_title">申请列表</p>
			<table>
				<thead>
					<tr>
						<th>申请企业</th>
						<th>申请人</th>
						<th>联系电话</th>
						<th>申请描述</th>
					</tr>
				</thead>
				<tbody class="rows apply_list"></tbody>
			</table>
	</div>
	<div class="button_block">
		<button class="back">返 回</button>
	</div>
</div>
<script>
	sysInit();
	
	var demandId = getSysUrlParam('demandId'),
		postData;
	
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
				$('.apply_list').empty();
				if(res.applicantInfos.length){
					for(var i = 0; i < res.applicantInfos.length; i++){
						var item = res.applicantInfos[i];
						$('.apply_list').append('<tr><td>' + (item.applicantCompanyName || "") + 
							'</td><td>' + item.applicant + '</td><td>' + item.phone + '</td><td>' + item.description + '</td></tr>');
					}
				}else{
					noRes($('.apply_list'));
				}
			}
		});
		$('.back').click(function(){
			jump('admin', 'demand');
		});
	}
</script>


