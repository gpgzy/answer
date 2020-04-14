<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>welcome</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <script >
        function getVerify(obj){

            obj.src = "getVerify?"+Math.random();
        }
        function form1submit()
        {
            if ($("#name").val()=='')
            {
                alert("姓名不能为空");
                return false;
            }
            if ($("#name").val().length>6||$("#name").val().length<2)
            {
                alert("姓名输入格式错误");
                return false;
            }
            if ($("#idcard").val()=='')
            {
                alert("身份证号不能为空");
                return false;
            }
            if (!(/^\d{15}$|^\d{18}$|^\d{17}x$|^\d{17}X$/.test($("#idcard").val()))) {
                alert("请输入15位或18位身份证号");
                $("#chidcard").focus();
                return false;
            }
            //单位
            if ($("#committee option:selected").val()==' ')
            {
                alert('请选择具体工委');
                return false;
            }
            if ($("#branch option:selected").val()==' ')
            {
                alert('请选择具体支部');
                return false;
            }

            if ($("#str").val()=='')
            {
                alert("图片验证码不能为空");
                return false;
            }
            if ( $("#telNo").val()=='')
            {
                alert("手机不能为空");
                $("#chtel").focus();
                return false;
            }

            if( !(/^\d{11}$/.test($("#telNo").val()))){
                alert("手机号码为11位数字");
                $("#telNo").focus();
                return false;
            }
        };
    </script>
    <style>
        select{
            cursor: pointer;        /*鼠标上移变成小手*/
            font-size: 15px;
            background:#fafdfe;
            height:30px;
            width:50%;
            line-height:28px;
            border:1px solid #9bc0dd;
            -moz-border-radius:2px;
            -webkit-border-radius:2px;
            border-radius:2px;
            margin: 5%;
            padding-left: 5px;
        }
        *{
            /*background-color: #FF0000;*/
        }
        .center{
            background-color: white;
            border-radius: 10px;
            border: 1px solid whitesmoke;
            width: 95%;
            height: 100%;
            /*height: 120%;*/
            /* margin-top: 3%; */
            margin: 0px;
            padding: 3%;
            text-align: center;
        }

        input{
            margin: 5%;
            font-size: 15px;
            background:#fafdfe;
            height:30px;
            width:50%;
            border: 1px solid lightgray;
            border-radius: 3px;
            /*padding: 2px;*/
            padding-left: 5px;
        }
        .bottom{
            height: 10%;
            margin-top: 5%;
            background-color:#f5f5f5;
            /*background-color: #f58011;*/
            margin-bottom: 0px;
            padding: 3%;
            border-radius: 10px;
        }
        form{
            margin: 10%;
        }
        body{
            background:  #2F4056;
            width: 98%;
            height: 100%;
        }
        button{
            text-align:center;
            background-color: rgb(245, 41, 27);
            border-radius: 10px;
            opacity: 85%;
            border: none;
            color: white;
            padding: 10px;
            margin-top: 3%;
            margin-bottom: 3%;
            cursor: pointer;
            width: 70%;
            height: 50px;
        }
        button:hover{
            opacity: 120%;

        }
        p{
            text-align: center;
            font-size: 30px;
            margin: 1%;
        }

        img{
            /*margin-top: 10px;*/
            margin: 5%;
        }
    </style>
</head>
<body>
<div class="center">
    <form id="form1" action="/api/login" method="post" onsubmit=" return form1submit()">
        <p>欢迎参与答题</p>
        姓  &nbsp;名 <input class="login_input" id="name" name="name" placeholder="请输入姓名" maxlength="6">
        <br>
        身份证<input id="idcard" name="idCard" placeholder="请输入身份证号" maxlength="18">
        <br>
        党工委
        <select id="committee" name="committee">

            <option  >市直工委</option>
            <option  >教育工委</option>
            <option  >工信工委</option>
        </select>
        <br>
        党支部
        <select id="branch" name="branch">
            <option  >高平一中</option>
            <option  >高平二中</option>
            <option  >高平三中</option>
        </select>
        <br>
        手机号<input id="telNo" name="telNo" placeholder="请输入联系方式" maxlength="11">

        <br>


        <div class="col-xs-6 pull_left">
            验证码<input id="str"  name="inputStr"  placeholder="请输入验证码" maxlength="4"></rt>

            <br>
            <a href="javascript:void(0);" rel="external nofollow" title="点击更换验证码">
                <img id="imgVerify" src="/api/getVerify/" alt="更换验证码" height="40px"  width="120px" onclick="getVerify(this);">
            </a>
        </div>

        <button type="submit">开始答题</button>
    </form>
    <div class="bottom">欢迎参与</div>
</div>

</body>
</html>

