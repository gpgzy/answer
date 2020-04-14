<!DOCTYPE html>
<html>
<head>
    <title>welcome</title>
    <script >
        function getVerify(obj){

            obj.src = "getVerify?"+Math.random();
        }
    </script>
</head>
<body>
<h1>你的得分是${score}</h1>
<form action="/api/checkVerify" method="post" >
    <input  name="inputStr"  placeholder="请输入验证码" maxlength="4">

        <div class="col-xs-6 pull_left">
            <a href="javascript:void(0);" rel="external nofollow" title="点击更换验证码">
                <img id="imgVerify" src="/api/getVerify/" alt="更换验证码" height="36" width="10%" onclick="getVerify(this);">
            </a>
        </div>
    </div>
    <button type="submit">submit</button>
</form>

</body>
</html>