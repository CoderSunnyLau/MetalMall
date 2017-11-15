
	// init
	var xItem = [],
		yItem = {'p':[], 'a':[], 'c':[]},
		zName = ['商品', '地区', '企业'];
	$.get( DOMAIN + '/getIndexTotalData', function(res){
		$('.loading_wrapper').hide();
		$('.index_block').show();
		for(i in res.orderPriceBoardInfos){
			$('.scroll').append("<li>" + res.orderPriceBoardInfos[i] + "</li>");
		}
		
		var fillTable = function(type){
			for(i in res.statisticsPriceInfos[type +'_sort']){
				var obj = res.statisticsPriceInfos[type +'_sort'][i];
				if(i < 8){
					if(i % 2 == 0){
						var el = $('.' + type + '_l');
					}else{
						var el = $('.' + type + '_r');
					}
				}else{
					var el = {};
				}
				el.append(
					"<tr><td class='type'>" + obj.name + "</td>" +
					"<td class='this_week'>" + obj.weekPrice + "</td>" +
					"<td class='this_month'>" + obj.monthPrice + "</td>" +
					"<td class='pre_month'>" + obj.lastMonthPrice + "</td></tr>"
				);
			}
		}
		fillTable('product');
		fillTable('area');
		fillTable('company');
		
		for(i in res.bankProductInfos){
			var bank = res.bankProductInfos[i];
			$('.trend_dynamics').append(
				"<li class='trend_box'><p class='trend_title'><a target='_blank' href='financial_detail.jsp?id=" + bank.id + "'><span>" +
				bank.name + "</span><a><i>" + bank.paymentType + " | 工商银行</i></p><p class='trend_cnt'><a target='blank' href='financial_detail.jsp?id=" + bank.id + "'>" +
				bank.brief + "</a></p></li>"
			);
		}

		for(i in res.requirementFormInfos){
			var demand = res.requirementFormInfos[i];
			$('.demand_trend').append(
				"<li class='demand_box'><div class='demand_cnt'><a href='demand_detail.jsp?id=" + demand.id + 
				"' target='_blank'><p class='demand_title'>" + demand.name +
				"</p></a><ul class='demand_detail'><li><span>发布时间：</span><i>" + demand.addTime +
				"</i></li><li><span>需求地区：</span><i>" + demand.area +
				"</i></li><li><span>商品类别：</span><i>" + demand.productType +
				"</i></li><li><span>材质要求：</span><i>" + demand.specification +
				"</i></li><li><span>需求数量：</span><i>" + demand.quantityReqrm + demand.unit +
				"</i></li></ul></div><div class='demand_action'><p class='demand_company'>" + demand.companyName +
				"</p><p class='demand_budget'>预算：<span>" + demand.minBudget + "万~" + demand.maxBudget +
				"万</span></p><a href='demand_detail.jsp?id=" + demand.id + "' class='btn' target='_blank'>我要供货</a></div></li>"
			);
		}

		for(i in res.outstandingCompanys){
			$('.good_company').append(
				"<li><img src='" + res.outstandingCompanys[i].logo + "/></li>"
			);
		}
		
		for(name in res.typeChartData){
			xItem.push(name.substr(4 , 4));
			yItem.p.push(Number(res.typeChartData[name]));
		}
		for(name in res.areaChartData){
			yItem.a.push(Number(res.areaChartData[name]));
		}
		for(name in res.companyChartData){
			yItem.c.push(Number(res.companyChartData[name]));
		}
		drawCharts();
	});
	
	var drawCharts = function(){
		var myChart = echarts.init(document.getElementById('pdt_chart')),
			myChart2 = echarts.init(document.getElementById('area_chart')),
			myChart3 = echarts.init(document.getElementById('company_chart'));
	
		var defaultChart = function(x, y, name){
			// 指定图表的配置项和数据
			var option = {
				tooltip: {
					trigger: 'axis'
				},
				grid: { // 控制图的大小，调整下面这些值就可以，
					x: 40,
					x2: '4%'
					//y2: 20// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
					    },
				xAxis: {
					type: 'category',
					boundaryGap: false,
					data: x
				},
				yAxis: {
					type: 'value',
					min: Math.min.apply(Math, y) - 10,
					max: Math.max.apply(Math, y) + 10,
					splitNumber: 5,
					axisLine: {show: false}
				},
				series: [{
					name: name,
					type: 'line',
					data: y,
					showSymbol:false,
					smooth:true
				}],
				color:['#0085D0','#2f4554', '#61a0a8', '#d48265', '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570', '#c4ccd3']
			}
			return option;
		}
		var chartOption = [];
		for(var i = 0; i < 3; i++){
			var n = (i == 0) ? 'p' : ((i == 1) ? 'a' : 'c');
			chartOption[i] = defaultChart(xItem, yItem[n], zName[i]);
		}
		
		myChart.setOption(chartOption[0]);
		myChart2.setOption(chartOption[1]);
		myChart3.setOption(chartOption[2]);
	}
	
	//slide to left
	var isScroll = 0;
	var scrollFn = function(){
		if(isScroll == 0){
			$('.scroll').stop().css({left:1200}).animate({left:0},10000,'linear');
			isScroll = 1;
		}else if(isScroll == 1){
			$('.scroll').stop().animate({left:-950},10000,'linear');
			isScroll = 2;
		}else{
			$('.scroll').stop().append($('.scroll li:first')).css({left:0}).animate({left:-950},10000,'linear');
		}
	}
	scrollFn();
	setInterval(scrollFn,10000);


// function

/***********  [Search] pdts and demands  ************/
/* change search type */
$('.tabs .tab').click(function(){
	$('.tab_crr').removeClass('tab_crr');
	$(this).addClass('tab_crr');
	if($(this).attr('type') == "demand"){
		$('.search_pdts').hide();
	}else{
		$('.search_pdts').show();
	}
});

/* search */
$('.search_btn').click(function(){
	var searchType = $('.tab_crr').attr('type');
	//window.open(searchType + '.jsp');
});