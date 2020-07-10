<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>信息登记</title>
    <link rel="icon" href="/static/favicon.ico">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <style>
        select{
            cursor: pointer;        /*鼠标上移变成小手*/
            font-size: 15px;
            background:#fafdfe;
            height:30px;
            width:100%;
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
            width:100%;
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
            margin-top: 6%;
            margin-bottom: 10%;
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
            margin-bottom: 4%;
        }

        img{
            /*margin-top: 10px;*/
            margin: 7%;
        }
        a{
            text-decoration: none;
            color: black;
        }
        table{
            width: 80%;
            margin-left: auto;
            margin-right: auto;
        }
        .td-left{
            width: 50px;
        }
    </style>
</head>
<body>
<div class="center">
    <form id="form1" action="/api/login" method="post" onsubmit=" return form1submit()">
        <p>欢迎参与</p>
        <table>
            <tr>
                <td class="td-left">姓 &nbsp;&nbsp;名</td>
                <td><input class="login_input" id="name" name="name" placeholder="请输入姓名" maxlength="6">
                </td>
            </tr>
            <tr>
                <td>身份证</td>
                <td> <input id="idcard" name="idCard" placeholder="请输入身份证号" maxlength="18">
                </td>
            </tr>
            <tr>
                <td>党工委</td>
                <td><select id="committee" name="committee" onChange="move()" required >
                        <option selected>请选择</option>
                        <option>东城街街道党工委</option>
                        <option>南城街街道党工委</option>
                        <option>北城街街道党工委</option>
                        <option>米山镇党委</option>
                        <option>三甲镇党委</option>
                        <option>神农镇党委</option>
                        <option>陈区镇党委</option>
                        <option>建宁乡党委</option>
                        <option>北诗镇党委</option>
                        <option>石末乡党委</option>
                        <option>河西镇党委</option>
                        <option>马村镇党委</option>
                        <option>原村乡党委</option>
                        <option>野川镇党委</option>
                        <option>寺庄镇党委</option>
                        <option>永禄乡党委</option>
                        <option>市直工委</option>
                        <option>工信工委</option>
                        <option>教育工委</option>
                        <option>非公工委</option>
                        <option>公安局党委</option>
                        <option>老干局党委</option>
                        <option>开发区党工委</option>
                    </select></td>
            </tr>
            <tr>
                <td>党支部</td>
                <td><select required id="branch" name="branch">
                    </select></td>
            </tr>
            <tr>
                <td>手机号</td>
                <td><input id="telNo" name="telNo" placeholder="请输入联系方式" maxlength="11">
                </td>
            </tr>
            <tr>
                <td>我&nbsp;&nbsp;是</td>
                <td><select name="identity">
                        <option>党员</option>
                        <option>发展对象</option>
                        <option>积极分子</option>
                    </select></td>
            </tr>
            <tr>
                <td>验证码</td>
                <td> <input id="str"  name="inputStr"  placeholder="请输入验证码" maxlength="4"></rt>
                </td>
            </tr>
        </table>
        <div class="col-xs-6 pull_left">
            <a href="javascript:void(0);" rel="external nofollow" title="点击更换验证码">
                <img id="imgVerify" src="/api/getVerify/" alt="更换验证码" height="40px"  width="120px" onclick="getVerify(this);">
            </a>
        </div>

        <button type="submit">开始答题</button>
    </form>
    <div class="bottom"><a class="beian" href="http://beian.miit.gov.cn">晋ICP备20004056号-1</a><br><a >晋公网安备14050002000927号</a><br>
        <a>电子邮箱：&nbsp;danhecloud@163.com</a></div>
</div>
<script >
    function getVerify(obj){

        obj.src = "getVerify?"+Math.random();
    }
    function move() {

        var YiJi = document.getElementById("committee");

        var ErJi = document.getElementById("branch");

        //获取一级和二级的属性

        var add;

        // if (YiJi.value == "党工委1") {
        //
        //     add = new Array("支部1-1", "支部1-2", "支部1-3"); //对比value值，实现对应二级text值的动态生成
        //
        // } else if (YiJi.value == "党工委2") {
        //
        //     add = new Array("支部2-1", "支部2-2");
        //
        // } else if (YiJi.value == "党工委3") {
        //
        //     add = new Array("支部3-1", "支部3-2");
        //
        // } else if (YiJi.value == "YiJi") {
        //
        //     add = new Array("请选择");
        //
        // }
        //
        // else {
        //
        //     add = null; //如果没有的话就为空,在这里是不存在这种情况，不过你也可以自己设置出来；
        //
        // }
        $.ajax({
            type:"GET",
            url:"/ajax/branch",
            data:{committee:$("select[name='committee']").val()},
            dataType:'json',
            success:function (data) {
                //alert(data.branch);
               add = data.branch;
                ErJi.length = 0;

                for (var i = 0; i < add.length; i++) {

                    var aaa = new Option();

                    aaa.text = add[i].split()[0];

                    ErJi.add(aaa);
                }
                    //把text值添加到二级select中，显示出来
            },
            error:function (data) {
                add = new Array("请选择");
            }
        });





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
</body>
</html>

