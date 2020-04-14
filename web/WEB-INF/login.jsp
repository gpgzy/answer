<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%--    <meta charset="utf-8">--%>
    <title>登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
    <link rel="icon" href="/static/favicon.ico">
<%--    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">--%>
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
            if ($("#committee").val()=='请选择')
            {
                alert("请填写党工委和党支部");
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
        height:28px;
        width:50%;
        line-height:28px;
        border:1px solid #9bc0dd;
        -moz-border-radius:2px;
        -webkit-border-radius:2px;
        border-radius:2px;
        margin: 10px;
        padding-left: 5px;
    }
    *{
        /*background-color: #FF0000;*/
    }
    .center{
        background-color: white;
        border-radius: 10px;
        border: 1px solid whitesmoke;
        width: 40%;
        margin-left: 28%;
        /*height: 120%;*/
        margin-top: 3%;
        text-align: center;
    }

    input{
        margin: 10px;
        font-size: 15px;
        background:#fafdfe;
        height:25px;
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
       margin-top: 5%;
        margin-bottom: 1%;
        width: 30%;
        cursor: pointer;
    }
    button:hover{
        opacity: 120%;

    }
    p{
        text-align: center;
    }
    img{
        margin-top: 10px;
    }
</style>
</head>
<body>
<div class="center">
    <form id="form1" action="/api/login" method="post" onsubmit=" return form1submit()">
        <p>欢迎参与答题</p>
      姓  &nbsp;名 <input required class="login_input" id="name" name="name" placeholder="请输入姓名" maxlength="6">
            <br>
        身份证<input required id="idcard" name="idCard" placeholder="请输入身份证号" maxlength="18">
           <br>
        党工委
        <select id="committee" name="committee" onChange="move()">
            <option selected>请选择</option>
            <option  >市直工委</option>
            <option  >教育工委</option>
            <option  >工信工委</option>
        </select>
        <br>
        党支部
        <select id="branch" name="branch">

        </select>
        <br>
        手机号<input required id="telNo" name="telNo" placeholder="请输入联系方式" maxlength="11">

        <br>


        <div class="col-xs-6 pull_left">
            验证码<input required id="str"  name="inputStr"  placeholder="请输入验证码" maxlength="4"></rt>

<br>
            <a href="javascript:void(0);" rel="external nofollow" title="点击更换验证码">
                <img id="imgVerify" src="/api/getVerify/" alt="更换验证码" height="40px"  width="120px" onclick="getVerify(this);">
            </a>
        </div>

<button type="submit">开始答题</button>
</form>
    <div class="bottom">欢迎参与</div>
</div>
<script>

    function move() {

        var YiJi = document.getElementById("committee");

        var ErJi = document.getElementById("branch");

        //获取一级和二级的属性

        var add;

        if (YiJi.value == "市直工委") {

            add = new Array("市委办", "组织部", "政府办"); //对比value值，实现对应二级text值的动态生成

        } else if (YiJi.value == "教育工委") {

            add = new Array("高平一中", "高平二中", "高平三中", "高平四中");

        } else if (YiJi.value == "工信工委") {

            add = new Array("财政局", "工信局", "科兴集团");

        } else if (YiJi.value == "YiJi") {

            add = new Array("请选择");

        }

        else {

            add = null; //如果没有的话就为空,在这里是不存在这种情况，不过你也可以自己设置出来；

        }

        ErJi.length = 0;

        for (var i = 0; i < add.length; i++) {

            var aaa = new Option();

            aaa.text = add[i].split()[0];

            ErJi.add(aaa);

            //把text值添加到二级select中，显示出来

        }

    }
</script>
</body>
</html>

