<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script>
	window.UEDITOR_HOME_URL = "../ueditorLib/";
</script>
<!--开始加ueditor相关类  -->
<script type="text/javascript" charset="utf-8" src="../ueditorLib/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="../ueditorLib/ueditor.all.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="../ueditorLib/lang/zh-cn/zh-cn.js"></script>

<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
</script>


<!-完成ueditor相关类加载-  -->

<link rel="stylesheet" type="text/css" href="../css/system_pdts.css?a=66">
<div class="cnt_header">
    <span>首页 > 供货中心 > 商品中心 > 新增商品</span>
</div>
<div class="cnt_body">
    <p class="user_title">添加商品详情信息</p>
    <div class="fill_block">
    	<p><span>名称</span><input type="text" /></p>
    	<p><span>材质</span><input type="text" /></p>
    	<p><span>规格</span><input type="text" /></p>
    	<p><span>库存</span><input type="text" /></p>
    	<p><span>单价</span><input type="text" /></p>
    	<p><span>件重</span><input type="text" /></p>
    	<p><span>起订量</span><input type="text" /></p>
    	<p><span>商品类型</span>
    		<select>
    			<option>请选择商品类型</option>
    		</select>
    	</p>
    	<p><span>所属企业</span>
    		<select>
    			<option></option>
    		</select>
    	</p>
    	<p><span>地区</span>
    		<select>
    			<option>请选择地区</option>
    		</select>
    	</p>
    </div>
    <div class="fill_block pdts_pics">
    	<div class="pics_row">
    		<span>商品图片</span>
    		<ul class="add_pics"><li></li></ul>
    	</div>
    	<div class="pics_row">
    		<span>商品介绍</span>
    		<script id="editor" type="text/plain" style="width:535px;height:152px;float:left;"></script>
    	</div>
    	<div class="pics_row"><span>售后保障</span><textarea></textarea></div>
    </div>
    <div class="fill_block pdts_state">
    	<p><span>上架状态</span><i>待上架</i></p>
    	<ul>
    		<li><span>新增人：</span><i class="username">王大伟</i><span>新增时间：</span><i>2017-07-31 10:00:00</i></li>
    		<li><span>修改人：</span><i class="username">王大伟</i><span>修改时间：</span><i>2017-07-31 10:00:00</i></li>
    	</ul>
    </div>
    <div class="button_block">
	    	<button class="submit">提　交</button>
	    	<button class="preview">预　览</button>
    </div>
</div>