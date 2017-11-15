<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
	<title>企业管理系统-易金所</title>
	<jsp:include page="../components/head.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="../css/system.css?v=15">
</head>
<body>
	<jsp:include page="../components/header.jsp">
		<jsp:param name="systemTitle" value="企业"/> 
	</jsp:include>
	<div class="main_width cnt_box">
		<input type="file" id="file" name="file" onchange="getFilePath()" style="filter:alpha(opacity=0);opacity:0;width: 0;height: 0;"/> 
		<button onclick="selectFile();">select file</button> 
		<button onclick="postFile()">post File</button> 
	</div>
	<jsp:include page="../components/pics_upload.jsp"></jsp:include>
	<script src="../libs/ajaxFileUpload.js"></script>
	<script type='text/javascript'> 
		function selectFile(){ 
		//触发 文件选择的click事件 
		$("#file").trigger("click"); 
		//其他code如 alert($("#file").attr("value")) 
		} 
		/* 获取 文件的路径 ，用于测试*/
		function getFilePath(){ 
			alert($("#file").val()); 
		} 
		function postFile(){
			$.ajaxFileUpload({
				    url: "/yijinsuo_web/ImgsUpload",
				    //url:'http://192.168.0.108:8090/uploadFileForUser',
				    fileElementId: 'file',
				    secureuri: false,
				    dataType: 'JSON',
				    
				    success: function(res){
				    	var data = res;
				    	console.log(typeof(res))
				    	console.log(data)
				    	var rx1 = new RegExp("<pre.*?>(.*?)</pre>","i");
			            var am1 = rx1.exec(data);
			            console.log(am1)
			            //this is the desired data extracted
			            var data = (am1) ? am1[1] : "";    //the only submatch or empty
			            //eval( "data = " + data );
				    	console.log(data)
				    }
			});
			/*
			$.ajax({
			    //url: '/yijinsuo_web/ImgsUpload',
			    url:'http://192.168.0.108:8090/uploadFileForUser',
			    type: 'POST',
			    data: {
				    fileElementId: 'file'
			    },
			    secureuri: false,
			    dataType: 'JSON',
			    success: function(data){
			    	console.log(data)
			    }
			});*/
		}
	</script> 
</body>
</html>