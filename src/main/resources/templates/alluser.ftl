<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="icon" href="/static/favicon.ico">
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <style>
        .center  {

            padding: 20px;
            text-align: center;
            /*margin-left: 20%;*/
            /*margin-right: 20%;*/
            width: 90%;
            margin: auto;
            margin-top: 1%;
            color: black;
            background-color: white;
        }
        .top{
            padding: 3px;
            text-align: center;
            /*margin-top: 3%;*/
            margin-top: 20px;
        }
        table{
            border-collapse: collapse;
        }
        td {
            margin: 5px;
            padding: 5px 10px 5px 10px;
            border: 1px  solid gray;
        }
        .butt{
            text-align:center;
            background-color: rgb(245, 41, 27);
            border-radius: 10px;
            opacity: 85%;
            border: none;
            color: white;
            padding: 10px;
            padding-left: 25px;
            padding-right: 25px;
            margin: 20px;
            width: 100px;
            cursor: pointer;
            text-decoration: none;
        }
        .butt:hover{
            text-align:center;
            background-color: rgb(245, 41, 27);
            border-radius: 10px;
            opacity: 100%;
            border: none;
            color: white;
            padding: 10px;
            padding-left: 25px;
            padding-right: 25px;
            margin: 20px;
            width: 100px;
            cursor: pointer;
            text-decoration: none;
        }
        .title{
            margin-left: 5px;
            margin-right: 5px;
            font-weight: bold;
            color: black;
        }
        .title:hover{
            margin-left: 5px;
            margin-right: 5px;
            font-weight: bold;
            color: black;
            text-decoration: none;
        }
        .title1{
            font-weight: bold;
            color: black;
        }
        .title1:hover{
            font-weight: bold;
            color: black;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="top">
    <a class="title">最高分：${max}</a>
    <a class="title">最低分：${min}</a>
    <a class="title">平均分：${aver}</a>
    <a class="title">参与人数：${list?size}</a>
</div>
<div class="center">
    <table class="table table-bordered">
        <tr>
            <td><a class="title1">序号</a></td>
            <td><a class="title1">姓 名</a></td>
            <td><a class="title1">党工委</a></td>
            <td><a class="title1">党支部</a></td>
            <td><a class="title1">电话号码</a></td>
            <td><a class="title1">得分</a></td>
            <td><a class="title1">历史得分</a></td>
            <td><a class="title1">答题次数</a></td>
        </tr>
       <#assign i = 0/>
        <#list list as s>
            <#assign i++ />
            <tr>
                <td>
                    ${i}
                </td>
                <td>${s.name}</td>
                <td>${s.branch.committees.name}</td>
                <td>${s.branch.name}</td>
                <td>${s.telNo}</td>
                <td>${s.maxScore}</td>
                <td><#list s.scoreList as sc >${ sc.scores+" "}</#list></td>
                <td>${s.scoreList?size}</td>
            </tr>
        </#list>
    </table>
    <br>
    <a href="/api/admin/search" class="butt">返回</a>
    </div>

</body>
</html>