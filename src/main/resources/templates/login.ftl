<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
    <title>登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
    <meta name="viewport" content="width=device-width,initial-scale=0.9,minimum-scale=0.8, maximum-scale=1.2,user-scalable=yes">
    <link rel="icon" href="/static/favicon.ico">
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
            $('#submit').attr("disabled",true);
        };
    </script>
<style>
    select{
        cursor: pointer;        /*鼠标上移变成小手*/
        background:#fafdfe;
        height:28px;
        width:220px;
        line-height:28px;
        border:1px solid #9bc0dd;
        -moz-border-radius:2px;
        -webkit-border-radius:2px;
        border-radius:2px;
        margin: 10px;
        padding-left: 5px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        font-size: 15px;
    }

    *{
        /*background-color: #FF0000;*/
    }
    .center{
        background-color: white;
        border-radius: 10px;
        border: 1px solid whitesmoke;
        /*width: 40%;*/
        /*margin-left: 28%;*/
        width: 25rem;
        margin-right: auto;
        margin-left: auto;
        /*height: 120%;*/
        margin-top: 60px;
        text-align: center;
    }

    .bottom{
        height: 10%;
        margin-top: 10px;
        background-color:#f5f5f5;
        /*background-color: #f58011;*/
        margin-bottom: 0px;
        padding: 3%;
        border-radius: 10px;
    }
    form{
        margin: 10%;
        margin-bottom: 10px;
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
        margin-bottom: 10px;
        width: 50%;
        cursor: pointer;
        font-size: 20px;
        /*font-weight: bold;*/
    }
    button:hover{
        opacity: 100%;
    }
    p{
        text-align: center;
    }
    img{
        margin-top: 10px;
    }
    .beian{
        text-decoration: none;
        color: black;
        text-align: right;
    }
    input:focus{
        border-color: #66afe9;
        outline: 0;
        -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
    }
    input{
        margin: 10px;
        font-size: 15px;
        background:#fafdfe;
        height:30px;
        border: 1px solid lightgray;
        border-radius: 3px;
        /*padding: 2px;*/
        padding-left: 1px;
        width:90%;
        padding-left: 5px;
    }
    .center p{
        font-size: 20px;
    }
    body{
        /*background-image: url("/static/back.jpg");*/
        /*background-image: url("https://i.picsum.photos/id/16/1920/1080.jpg");*/
        background-size: cover ;
        background-color:  #2F4056;
    }
    table{
        margin-left: auto;
        margin-right: auto;
    }
</style>
</head>
<body>
<div class="center">
    <form id="form1" action="/api/login" method="post" onsubmit=" return form1submit()">
        <p>欢迎参与</p>
        <table>
            <tr>
                <td>姓  &nbsp;名</td>
                <td> <input required class="login_input" id="name" name="name" placeholder="请输入姓名" maxlength="6">
                </td>
            </tr>
            <tr>
                <td>手机号</td>
                <td><input id="telNo" name="telNo" placeholder="请输入联系方式" maxlength="11">
                </td>
            </tr>
            <tr>
                <td>党工委</td>
                <td><select  id="committee" name="committee"   onChange="move()">
                        <option selected>请选择</option>
                        <div width="250px">
                            <option>中共沁水县龙港镇委员会</option>
                            <option>中共沁水县樊村河乡委员会</option>
                            <option>中共沁水县中村镇委员会</option>
                            <option>中共沁水县土沃乡委员会</option>
                            <option>中共沁水县张村乡委员会</option>
                            <option>中共沁水县郑庄镇委员会</option>
                            <option>中共沁水县苏庄乡委员会</option>
                            <option>中共沁水县端氏镇委员会</option>
                            <option>中共沁水县嘉峰镇委员会</option>
                            <option>中共沁水县郑村镇委员会</option>
                            <option>中共沁水县胡底乡委员会</option>
                            <option>中共沁水县固县乡委员会</option>
                            <option>中共沁水县柿庄镇委员会</option>
                            <option>中共沁水县十里乡委员会</option>
                            <option>中共沁水县委直属机关工作委员会</option>
                            <option>中共沁水县委企业工作委员会</option>
                            <option>中共沁水县委非公经济组织和社会组织工作委员会</option>
                            <option>中共沁水县委教育工作委员会</option>
                            <option>中共沁水县卫生健康和体育局委员会</option>
                            <option>中共沁水县公安局委员会</option>
                            <option>中共沁水县委经济技术开发区工作委员会</option>
                        </div>
                    </select></td>
            </tr>
            <tr>
                <td> 党支部</td>
                <td><select id="branch" name="branch">

                    </select></td>
            </tr>
            <tr>
                <td>我&nbsp;&nbsp;是</td>
                <td><select name="identity">
                        <option selected>党员</option>
                    </select></td>
            </tr>
            <tr>
                <td>验证码</td>
                <td><input required id="str"  name="inputStr"  placeholder="请输入验证码" maxlength="4"></rt>
                </td>
            </tr>
        </table>
          <div class="col-xs-6 pull_left">
            <a href="javascript:void(0);" rel="external nofollow" title="点击更换验证码">
                <img id="imgVerify" src="/api/getVerify/" alt="更换验证码" height="40px"  width="120px" onclick="getVerify(this);">
            </a>
        </div>

<button type="submit" id="submit">开始答题</button>
</form>
    <div class="bottom"><a class="beian" href="http://beian.miit.gov.cn">晋ICP备20004056号-1</a><br><a >晋公网安备14050002000927号</a> </div>
</div>
<script>

    function move() {

        var YiJi = document.getElementById("committee");

        var ErJi = document.getElementById("branch");

        //获取一级和二级的属性

        var add;
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
</script>
</body>
</html>

