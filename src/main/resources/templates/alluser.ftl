<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="icon" href="/static/favicon.ico">
    <style>
        .center  {

            padding: 20px;
            text-align: center;
            margin-left: 27%;
            margin-top: 2%;
            background-color: white;
        }
        .top{
            padding: 3px;
            text-align: center;
            /*margin-top: 3%;*/
        }
        table{
            border-collapse: collapse;
        }
        td{
            margin: 5px;
            padding: 5px 10px 5px 10px;
            border: 1px  solid gray;
        }
        a{
            margin-left: 10px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div class="top">
    <a>最高分：${max}</a>
    <a>最低分：${min}</a>
    <a>平均分：${aver}</a>
</div>
<div class="center">
    <table>
        <tr>
            <td>序号</td>
            <td>姓名</td>
            <td>身份证号</td>
            <td>党工委</td>
            <td>党支部</td>
            <td>电话号码</td>
            <td>得分</td>
        </tr>
       <#assign i = 0/>
        <#list list as s>
            <#assign i++ />
            <tr>
                <td>
                    ${i}
                </td>
                <td>${s.name}</td>
                <td>${s.idCard}</td>
                <td>${s.committee}</td>
                <td>${s.branch}</td>
                <td>${s.telNo}</td>
                <td>${s.maxScore}</td>
            </tr>
        </#list>
    </table>
    </div>

</body>
</html>