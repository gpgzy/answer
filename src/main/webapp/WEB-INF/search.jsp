<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

            <option  >市直工委</option>
            <option  >教育工委</option>
            <option  >工信工委</option>
        </select><br>
        <button type="submit">查询</button>
    </form>
    <form action="/api/admin/findByBranch">
        <p>党支部查询</p>
        党工委
        <select id="committee"  name="committee" onChange="move()">
            <option selected>请选择</option>
            <option  >市直工委</option>
            <option  >教育工委</option>
            <option  >工信工委</option>
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