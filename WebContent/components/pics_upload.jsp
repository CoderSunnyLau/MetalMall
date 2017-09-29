<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- <link href="../libs/fileUpload/css/iconfont.css" rel="stylesheet" type="text/css"/>
<link href="../libs/fileUpload/css/fileUpload.css" rel="stylesheet" type="text/css"> -->
<script src="../libs/jquery.min.js"></script>
<script type="text/javascript" src="../libs/fileUpload/js/fileUpload.js"></script>
<div id="fileUploadContent" class="fileUploadContent"></div>

<script type="text/javascript">
    $("#fileUploadContent").initUpload({
        "uploadUrl":"http://localhost:8080/yijinsuo/ueditor/jsp/controller.jsp?action=uploadimage",//上传文件信息地址
        "size":1024,//文件大小限制，单位kb,默认不限制
        "maxFileNumber":5,//文件个数限制，为整数
		//"filelSavePath":"",//文件上传地址，后台设置的根目录
        "beforeUpload":beforeUploadFun,//在上传前执行的函数
        //"onUpload":onUploadFun，//在上传后执行的函数
        //autoCommit:true,//文件是否自动上传
        "fileType":['png','jpg','gif']//文件类型限制，默认不限制，注意写的是文件后缀
    });
    function beforeUploadFun(opt){
        opt.otherData =[{"name":"name","value":"zxm"}];
    }
    function onUploadFun(opt,data){
        alert(data);
        uploadTools.uploadError(opt);//显示上传错误
    }
</script>