$.get('../data/market.json', function(res){
	var today = 'live_today';
	for(var date in res){
		var $ul = $("<ul></ul>");
		for(var i = 0; i < res[date].length; i++){
			var item = res[date][i];
			$ul.append('<li class="live_time"><div class="item_left"><span>' + item.updateTime.split(" ")[1] + 
				'</span></div><div class="item_right"><p class="live_title">' + item.title + 
				'</p><p class="live_cnt">' + item.description + '</p></div></li>'
			);
		}
		var $li = ('<li class="live_date ' + today + '"><i class="live_tag">' + date + '</i><ul>' + $ul[0].innerHTML + '</ul><hr></li>');
		$('.live_box').append($li);
		if(today != ""){
			today = "";
		}
	}
});

var myChart = echarts.init(document.getElementById('market_chart'));
// 指定图表的配置项和数据
var option = {
    tooltip: {
        trigger: 'axis'
    },
    toolbox: {
//    	        show: true,
//    	        feature: {
//    	            saveAsImage: {show: true}
//    	        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: ["13/8","14/8","15/8","16/8","17/8","18/8"]
    },
    yAxis: {
        type: 'value',
    	min: 2750,
    	max:4000,
    	splitNumber: 4,
    	interval:250,
	    axisLine: {show: false}
    },
    series: [{
    	name:'商品',
        type: 'line',
        data: [3750, 3000, 3250, 3700, 3350, 3660],
        showSymbol:false,
        smooth:true
    }],
    color:['#0085D0','#2f4554', '#61a0a8', '#d48265', '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570', '#c4ccd3']
};
// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);