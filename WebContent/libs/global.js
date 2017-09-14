
var getUrlParameter = function(param){
     var reg = new RegExp("(^|&)"+ param +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r != null)
    	 return  unescape(r[2]);
     return null;
}

var setUrlParameter = function(arg, arg_val){
	var url = window.location.href;
    var pattern = arg + '=([^&]*)';
    var replaceText = arg + '=' + arg_val;
    if(url.match(pattern)){
        var tmp = '/('+ arg+'=)([^&]*)/gi';
        tmp = url.replace(eval(tmp), replaceText);
        var targetUrl = tmp;
    }else{
        if(url.match('[\?]')){
            var targetUrl =  url + '&' + replaceText;
        }else{
            var targetUrl = url + '?' + replaceText; 
        } 
    }
    window.location.href = targetUrl;
}

var doFill = function(data, arr, prefix){
	for(var i = 0; i < arr.length; i++){
		var obj = arr[i];
		if(typeof(obj) == 'string'){
			$('.' + prefix + obj).html(data[obj]);
		}else if(typeof(obj) == 'object'){
			if(obj.length == 4){
				var fill_cnt = data[obj[1]] + data[obj[2]];
			}else{
				var fill_cnt = data[obj[1]][obj[2]];
			}
			$('.' + obj[0]).html(fill_cnt);
		}
	}
}

var crrClass = function(el, className){
	$('.' + className).removeClass(className);
	el.addClass(className);
}

var cntLoad = function(el){
	el.click(function(){
		$('.cnt').load('../admin/' + el.attr('name') + '.jsp');
	});
}