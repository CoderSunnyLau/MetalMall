sysInit();

var successCallback = function(){
	if($('.cnt_body').hasClass('demand')){
		cntLoad($('.add_btn [jump="demand_add"]'), 'company');
		$.ajax({
			url: DOMAIN + '/getReqFormsByCompanyIdOnBackend',
			type: 'GET',
			data: {
				'companyId': USER.id,
				'pageIndex': getSysUrlParam('pageIndex') || 0,
				'pageSize': 20
			},
			success: function(res){
				$('.cnt_body').show();
				$('.demands').empty();
				if(res.totalElements){
					for(var i = 0; i < res.content.length; i++){
						var demand = res.content[i];
						var _class = i % 2 == 0 ? '' : 'odd';
						var _operation = demand.approval == '待审核' ? '<a class="op to_fix" jump="demand_fix">修改</a>|' : '';
						$('.demands').append(
							'<tr class="' + _class + 
							'"><td>' + demand.name + 
							'</td><td>' + demand.productType +
							'</td><td>' + demand.specification +
							'</td><td>' + demand.material +
							'</td><td>' + demand.quantityReqrm + demand.unit +
							'</td><td>' + demand.minBudget + '~' + demand.maxBudget +
							'</td><td>' + demand.addTime +
							'</td><td>' + demand.approval +
							'</td><td>' + demand.status +
							'</td><td>' + demand.applicantCount +
							'</td><td demandId="' + demand.id + '">' + _operation + '<a class="op view" jump="demand_detail">详情</a></td></tr>'
						);
					}
					pageInit(res.totalPages);
				}else{
					noRes($('.demands'));
				}
			}
		});
		
		$('.demands').on('click', '.op', function(){
			var demandId =$(this).parent().attr('demandId');
			if($(this).hasClass('to_fix')){
				jump('company', {
					page: 'demand_fix',
					demandId: demandId
				});
			}else if($(this).hasClass('view')){
				jump('company', {
					page: 'demand_detail',
					demandId: demandId
				});
			}
		});
	}else{
		var demandId = getSysUrlParam('demandId');
		/*if(demandId != ""){
			$.ajax({
				url: DOMAIN + '/',
				type: 'GET',
				data: {
					formId: demandId,
					pageIndex: getSysUrlParam('pageIndex') || 0,
					pageSize: 20
					
				},
				success: function(res){
					
				}
			});
		}*/
		$.get('../data/config.json', function(res){
			optionConfigInit('da_area', res.area);
			optionConfigInit('da_type', res.productType);
			$('.cnt_body').show();
		});
		$('.demand_add_btn').click(function(){
			var postData = {
				"id": demandId || null,
				"name": getVal('name'),
				"productType": getVal('productType'),
				"description": UE.getEditor('editor').getContent(),
				"material": getVal('material'),
				"specification": getVal('specification'),
				"quantityReqrm": 1000,
				"unit": getVal('unit'),
				"ownerId": USER.id,
				"phone": getVal('phone'),
				"minBudget": getVal('minBudget'),
				"maxBudget": getVal('maxBudget'),
				"area": getVal('area')
			};
			
			var _finished = false;
			console.log(0, _finished)
			$('.field').each(function(){
				console.log($(this).attr('name'))
				if($(this).attr('name') == "description"){
					if(UE.getEditor('editor').getContent() == ""){
						alert('请填写需求单描述');
						_finished = false;
						return false;
					}
				}else if($(this).val() == ""){
					alert('请填写' + $(this).attr('tip'));
					_finished = false;
					return false;
				}else{
					//postData[$(this).attr('name')] = $(this).val();
					_finished = true;
					console.log(8888)
				}
			});
			console.log(1, _finished)
			if(_finished){
				$.ajax({
					url: DOMAIN + '/addReqForm',
					type: 'POST',
					dataType: 'json',
					contentType : "application/json ; charset=utf-8", 
					data: JSON.stringify(postData),
					success: function(res){
						if(res.saved){
							alert('提交成功！');
							jump('company', 'demand');
						}else{
							
						}
					},
					error:function(res){
						console.log(res)
					}
				});
			}
		});
	}
}