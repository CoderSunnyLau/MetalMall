<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>图形验证码</title>
        <script src="excanvas.js"></script>
    </head>
    <body>
　　　　　　<div id="v_container" style="width: 100px;height: 40px;">
　　　　　　　　<canvas id="verifyCanvas" width="100" height="40" style="cursor: pointer;"></canvas>
　　　　　　</div>
　　　　　　<input type="text" id="code_input" value="" placeholder="请输入验证码"/><button id="my_button">验证</button>
    </body>
    <script src="js/gVerify.js"></script>
    <script>
        var verifyCode = new GVerify("v_container");

        document.getElementById("my_button").onclick = function(){
            var res = verifyCode.validate(document.getElementById("code_input").value);
            if(res){
                alert("验证正确");
            }else{
                alert("验证码错误");
            }
        }
    </script>
</html>