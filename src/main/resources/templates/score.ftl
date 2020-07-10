<!DOCTYPE html>
<html>
<head>
      <meta charset="utf-8">
    <title>成绩单</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" href="/static/favicon.ico">
        <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0.4, maximum-scale=1.2,user-scalable=no">
</head>
<style>
    body{
        /*background-image: url("/static/scoreback1.jpg");*/
        /*background:  red;*/
        background-size: cover  ;
        /*width: 98%;*/
        /*height: 100%;*/
        background-color: darkred;
        padding-bottom: 0;
    }
    .center{
        background-color: white;
        border-radius: 10px;
        border: 1px solid whitesmoke;
        /*width: 90%;*/
        width: 90%;
        margin-left: auto;
        margin-right: auto;
        /*height: 120%;*/
        margin-top: 100px;
        padding: 2%;
    }
    a{
        text-decoration: none;
    }
    h1{
        font-size: 2rem;
        color: black;
    }
    .hh{
        color: dodgerblue;
    }
    .jj{
        font-size: 20px;
    }
    h1{
        text-align: center;
        color: red;
    }
    .p-right{
        text-align: right;
    }
    .weight{
        font-weight: bold;
    }
</style>
<body>
<div class="center">
    <h1 class="jj">成&nbsp;绩&nbsp;单</h1>
    <p><a class="weight">&nbsp;${name}&nbsp;</a>同志：</p>
    <p>&emsp;&emsp;你已完成沁水县“学党章党规、做合格党员”云答题知识竞赛，成绩为&nbsp;<a class="weight">${score}</a>&nbsp;分,希望能在今后的工作中再接再厉，学习好相关知识。</p>
    <p class="p-right">${year?c}年${month}月${day}日</p>
    <a class="hh" href="/">返回登录页面</a>
</div>

</body>
</html>