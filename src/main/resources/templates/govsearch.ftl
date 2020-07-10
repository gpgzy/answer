<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>支部情况</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <style>
        .center{
            width: 80%;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }
        .top a.unselect{
            color: #fafdfe;
            background-color: dodgerblue;
            text-align: center;
            text-decoration: none;
            /*padding-left: 20px;*/
            /*padding-right: 20px;*/
            padding: 20px;
            width: 30%;
            margin-top: 0;
        }
        .top a.select{
            color: #fafdfe;
            background-color: blue;
            text-align: center;
            text-decoration: none;
            /*padding-left: 20px;*/
            /*padding-right: 20px;*/
            padding: 20px;
            width: 30%;
            margin-top: 0;
        }
        .top a.unselect:hover{
            background-color: blue;
        }
        .top{
            width: 90%;
            margin-left: auto;
            margin-right: auto;
            border-radius: 10px;
            background-color: dodgerblue;
            margin-top: 20px;
            color: #fafdfe;
            font-size: 20px;
            display: flex;
            padding-left: 50px;
        }
        p{
            text-align: center;
            margin: 10px;
        }
        button{
            border: none;
            border-radius: 5px;
            color: white;
            padding-left: 20px;
            padding-right: 20px;
            margin-left: 20px;
            height: 40px;
            background-color: limegreen;
            margin-top: 10px;
        }
        .form-control{
            width: 35%;
            margin: 10px;
        }
        form{
            display: flex;
            margin-bottom: 20px;
        }
        h4{
            text-align: center;
        }
        th{
            text-align: center;
        }
        form p{
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="top">
    <a class="unselect" href="/gov/all">党工委情况</a> <a class="select" href="/gov/branch">支部情况</a><a class="unselect" href="/gov/user">答题人员</a><a class="unselect" href="/logout">安全退出</a>

</div>
<div class="center">
    <p>你好：中共沁水县委组织部</p>
     <form action="/gov/branch" method="post">
       <p>请选择党工委：</p> <select class="form-control" name="committeename">
            <#list committees as c >
                <option>${c.name}</option>
            </#list>
        </select>
        <button type="submit">查询</button>
    </form>
    <h4>${message}</h4>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>序号</th>
            <th>名称</th>
            <th>参与人数</th>
            <th>参与率</th>
            <th>平均分</th>
            <th>100分以上人数</th>
            <th>90分以上人数</th>
            <th>80分以上人数</th>
            <th>70分以上人数</th>
            <th>60分以上人数</th>
        </tr>
        </thead>
        <tbody>
        <#assign i = 0/>
        <#list row as r>
            <#assign i++/>
            <tr>
                <td>${i}</td>
                <td>${r.name}</td>
                <td>${r.sum}</td>
                <td>${r.ratio}%</td>
                <td>${r.aver}</td>
                <td>${r.max_100} </td>
                <td>${r.max_90} </td>
                <td>${r.max_80} </td>
                <td>${r.max_70} </td>
                <td>${r.max_60} </td>
            </tr>
        </#list>
        </tbody>
    </table>
</div>
<p>电子邮箱：&nbsp;danhecloud@163.com</p>
</body>
</html>