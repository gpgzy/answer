<!DOCTYPE html>
<html>
<head>
    <%--    <meta charset="utf-8">--%>
    <title>得分</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="/static/favicon.ico">
        <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
</head>
<style>
    body{
        background:  #2F4056;
        width: 98%;
        height: 100%;
    }
    .center{
        background-color: white;
        border-radius: 10px;
        border: 1px solid whitesmoke;
        width: 90%;
        margin-left: 3%;
        /*height: 120%;*/
        margin-top: 15%;
        padding: 2%;
    }
    a{
        text-decoration: none;
        color: deepskyblue;
    }
    h1{
        font-size: 2rem;
        color: black;
    }
    a{
        color: red;
    }
    .hh{
        color: deeppink;
    }
    .jj{
        font-size: 20px;
    }
</style>
<body>
<div class="center">
    <h1 class="jj">你于<a>${time}</a>成功交卷，感谢参与！</h1>
    <h1>你的得分是<a>${score}</a></h1>
    <a class="hh" href="/api/login">返回登录页面</a>
</div>

</body>
</html>