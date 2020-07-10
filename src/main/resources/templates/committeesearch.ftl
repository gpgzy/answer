<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人员名单</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="icon" href="/static/favicon.ico">
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
        th{
            text-align: center;
        }
        h4{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="top">
    <a class="unselect" href="/committee/branch">支部情况</a> <a class="select" href="/committee/alluser">人员名单</a><a class="unselect" href="/logout">安全退出</a>

</div>
<div class="center">
    <p>你好：${name}</p>
    <form action="/committee/user" method="post">
        <select  class="form-control" name="branchname">
            <#list branchs as c >
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
            <th>姓名</th>
            <th>手机号</th>
            <th>最高分</th>
        </tr>
        </thead>
        <tbody>
        <#assign i = 0/>
        <#list users as s>
            <#assign i++/>
            <tr>
                <td>${i}</td>
                <td>${s.name}</td>
                <td>${s.telNo}</td>
                <td>${s.maxScore}</td>
            </tr>
        </#list>
        </tbody>
    </table>
</div>
<p>电子邮箱：&nbsp;danhecloud@163.com</p>
</body>
</html>