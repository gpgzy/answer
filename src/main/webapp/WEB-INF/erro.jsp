<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
    <title>出错啦</title>
    <meta name="viewport" content="width=device-width,initial-scale=5.0,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
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
        margin-top: 10%;
        padding: 6%;
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
</style>

</head>
<body>
<div class="center">

    <h1>status 404 呀！页面跑丢了~~~ 请检查你输入的信息是否有误</h1>
    <a href="/api/login">返回登录页面</a>
</div>
</body>
</html>