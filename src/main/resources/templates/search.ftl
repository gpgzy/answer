<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="icon" href="/static/favicon.ico">
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
            margin-left: 30%;
            /*height: 120%;*/
            margin-top: 8%;
            text-align: center;
        }
        button{
            text-align:center;
            background-color: rgb(245, 41, 27);
            border-radius: 10px;
            opacity: 85%;
            border: none;
            color: white;
            padding: 10px;
            margin-top: 1%;
            margin-bottom: 1%;
            width: 30%;
            cursor: pointer;
        }
        body{
            background:  #2F4056;
            width: 98%;
            height: 100%;
        }

    </style>
</head>
<body>
<div class="center">
    <form action="/api/admin/findByCommittee">
        <p>党工委查询</p>
        党工委
        <select  name="committee">
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
        </select><br>
        <button type="submit">查询</button>
    </form>
    <form action="/api/admin/findByBranch">
        <p>党支部查询</p>
        党工委
        <select id="committee"  name="committee" onChange="move()">
            <option selected>请选择</option>
            <option  >党工委1</option>
            <option  >党工委2</option>
            <option  >党工委3</option>
        </select>
        <br>
        党支部
        <select required id="branch" name="branch">
        </select><br>
        <button type="submit">查询</button>
    </form>
</div>
<script>
    function move() {

        var YiJi = document.getElementById("committee");

        var ErJi = document.getElementById("branch");

        //获取一级和二级的属性

        var add;

        if (YiJi.value == "党工委1") {

            add = new Array("支部1-1", "支部1-2", "支部1-3"); //对比value值，实现对应二级text值的动态生成

        } else if (YiJi.value == "党工委2") {

            add = new Array("支部2-1", "支部2-2");

        } else if (YiJi.value == "党工委3") {

            add = new Array("支部3-1", "支部3-2");

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