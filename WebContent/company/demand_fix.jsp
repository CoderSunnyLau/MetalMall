<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=66">
<div class="cnt_header">
	<span>首页 > 需求中心 > 需求单管理 > 修改需求单</span>
</div>
<div class="cnt_body demand_add">
	<p class="user_title">修改需求单详情信息</p>
	<div class="fill_block">
		<p><span>名称</span><input type="text" class="field" name="name" tip="需求单名称"/></p>
		<p><span>材质</span><input type="text" class="field" name="material" tip="材质"/></p>
		<p><span>规格</span><input type="text" class="field" name="specification" tip="规格"/></p>
		<p><span>所需数量</span><input type="text" class="field" name="quantityReqrm" tip="所需数量" /></p>
		<p><span>单位</span><input type="text" class="field" name="unit" tip="单位" /></p>
		<p><span>商品类型</span>
			<select class="field" id="da_type" name="productType" tip="商品类型" value="">
				<option>请选择商品类型</option>
			</select>
		</p>
		<!-- 
		<p><span>所属企业</span>
			<select class="???field" name="" tip="所属企业">
				<option></option>
			</select>
		</p>
		 -->
		<p><span>地区</span>
			<select class="field" id="da_area" name="area" tip="地区" value="">
				<option>请选择地区</option>
			</select>
		</p>
		<p><span>联系电话</span><input type="text" class="field" name="phone"  tip="联系电话"/></p>
		<p><span>预算</span><input type="text" class="field" name="minBudget" tip="预算" />~<input type="text" class="field" name="maxBudget" tip="预算" /></p>
	</div>
	<div class="fill_block pdts_pics">
		<div class="pics_row">
			<span>需求单介绍</span>
			<div class="field" name="description" tip="需求单介绍"><jsp:include page="../components/ueditor.jsp"></jsp:include></div>
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
		<button class="submit demand_add_btn">提　交</button>
		<button class="preview white_btn" onclick="return $EDITORUI['edui22']._onClick(event, this);">预　览</button>
	</div>
</div>
<script>
	sysInit();
	
	var demandId = getSysUrlParam('demandId'),
		postData;
	
	var successCallback = function(){
		$.get('../data/config.json', function(res){
			optionConfigInit('da_area', res.area);
			optionConfigInit('da_type', res.productType);
			getInfoCallback();
		});
		var getInfoCallback = function(){
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
					UE.getEditor('editor').setContent(res.description, false);
					doFill(res, [
						'whoAdd',
						'whoEdit',
						'addTime',
						'editTime',
						'approval'
					], 'cd_');
				}
			});
		}
		$('.submit').click(function(){
			$(this).addClass('sent').html('正在提交...');
			
			postData = {
				"id": demandId,
				"userId": USER.id,
				"name": getVal('name'),
				"productType": getVal('productType'),
				"description": UE.getEditor('editor').getContent(),
				"material": getVal('material'),
				"specification": getVal('specification'),
				"quantityReqrm": getVal('quantityReqrm'),
				"unit": getVal('unit'),
				"ownerId": USER.id,
				"phone": getVal('phone'),
				"minBudget": getVal('minBudget'),
				"maxBudget": getVal('maxBudget'),
				"area": getVal('area'),
			}
			doFixDemand();
		});
		var doFixDemand = function(){
			$.ajax({
				url: DOMAIN + '/editReqForm',
				type: "POST",
				data: JSON.stringify(postData),
				dataType: 'JSON',
				contentType : "application/json ; charset=utf-8",
				success: function(res){
					if(res.saved){
						alert('提交成功！');
						jump('company', 'demand', 'demandId')
					}
				}
			});
		}
	}
</script>


