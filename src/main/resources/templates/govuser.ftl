<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>答题人员</title>
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
            text-align: left;
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
    </style>
</head>
<body>
<div class="top">
    <a class="unselect" href="/gov/all">党工委情况</a> <a class="unselect" href="/gov/branch">支部情况</a><a class="select" href="/gov/user">答题人员</a><a class="unselect" href="/logout">安全退出</a>

</div>
<div class="center">
    <p>你好：中共沁水县委组织部</p>
    <form action="/gov/user" method="post">
        <select class="form-control" id="committee" name="committee" onChange="move()" required >
            <option selected>请选择党工委</option>
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
        </select>
        <select  class="form-control" required id="branch" name="branchname">
            <option selected>请选择党支部</option>
        </select>
        <button type="submit"  id="button" disabled>查询</button>
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
    <p >电子邮箱：&nbsp;danhecloud@163.com</p>
</div>

<script>
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
                $('#button').attr("disabled",false);
                for (var i = 0; i < add.length; i++) {

                    var aaa = new Option();

                    aaa.text = add[i].split()[0];

                    ErJi.add(aaa);
                }
                //把text值添加到二级select中，显示出来
            },
            error:function (data) {
                add = new Array("请选择");
                $('#button').attr("disabled",true);
            }
        });
    }
</script>

</body>
</html>