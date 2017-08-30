var xItem = [],
	yItem = {'p':[], 'a':[], 'c':[]},
	zName = ['商品', '地区', '企业'];

var index_el = new Vue({
	el: '#index_el',
	data: {
		boards: {},
		productSort: {},
		areaSort: {},
		companySort: {},
		banks: {},
		demands: {},
		goodCompanies: {}
	},
	created: function(){
			var _this = this;
			_this.$http.get('index.json').then(function(res){
				_this.banks = res.body.bankProductInfos;
				_this.productSort = res.body.statisticsPriceInfos.product_sort;
				_this.areaSort = res.body.statisticsPriceInfos.area_sort;
				_this.companySort = res.body.statisticsPriceInfos.company_sort;
				_this.boards = res.body.orderPriceBoardInfos;
				_this.demands = res.body.requirementFormInfos;
				_this.goodCompanies = res.body.outstandingCompanys;
				for(name in res.body.typeChartData){
					xItem.push(name.substr(4 , 4));
					yItem.p.push(Number(res.body.typeChartData[name]));
				}for(name in res.body.areaChartData){
					yItem.a.push(Number(res.body.areaChartData[name]));
				}for(name in res.body.companyChartData){
					yItem.c.push(Number(res.body.companyChartData[name]));
				}
				drawCharts();
			},function(res){
				//error
			});
		}
	})
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
			toolbox: {
			// show: true,
			// feature: {
			// 	saveAsImage: {show: true}
			// }
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
				// interval:250,
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
	// 使用刚指定的配置项和数据显示图表。
	myChart.setOption(chartOption[0]);
	myChart2.setOption(chartOption[1]);
	myChart3.setOption(chartOption[2]);
}