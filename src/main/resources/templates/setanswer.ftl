<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html";charset="utf-8"/>
    <link rel="icon" href="/static/favicon.ico">
  <link rel="stylesheet" href="/static/css/wcss.css" type="text/css"/>
</head>
<style>
    body{
        margin-left:15px;
        margin-right:15px;
        margin-bottom:15px;
        maigin-top:15px;
    }

    h1,p{
        text-align:center;
    }

    section,.title1,.title2{
        border: 1.5px solid rgb(225,225,225);
        margin-left:15px;
        margin-bottom: 15px;
        margin-right:15px;
        maigin-top:15px;
        border-radius: 10px;
    }

    .la,.lb {
        display: inline-block;
        width: 29%;
        padding: 14px 4px 14px 4px;
        font-size: 25px;
        font-weight: bold;
    }

    input{
        border: 1.5px solid rgb(225,225,225);
        padding:5px 3em;
        border-radius: 5px;
        zoom: 170%;
    }

    .title{
        /*background: rgb(225,225,225);*/
        background: aqua;
        padding: 1px 5px 5px 10px;
        font-size: 17px;
        font-weight: bold;
        height:60px;
    }

    .all{
        font-weight:bold;
        font-size: 20px;
    }

    ol{
        padding:4px 2em;
        list-style:decimal inside;
    }

    li{
        line-height:30px
    }

    .blank,.choice,.choicem,.answer{
        line-height:30px;
        padding:5px 15px;

    }

    textarea{
        display: inline-block;
        width: 100%;
        height: 100%;
        border: 1.5px solid rgb(225,225,225);
        padding:2px 1em;
        border-radius: 5px;
    }

    button{
        text-align:center;
        background-color: rgb(100,200,230);
        border: none;
        padding: 10px;
        color: white;
        border-radius: 10px;
        margin:10px 10px 10px 30px;
        cursor: pointer;        /*鼠标上移变成小手*/
    }

    .yes{
        color:Green;
        font-weight:bold;
    }

    .no{
        color:Red;
        font-weight:bold;
    }
    a{
        text-decoration: none;
        margin: 10px;
        color: deepskyblue;
    }
    #top1{
        padding: 10px;
    }
    p{
        text-align: left;
    }
</style>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
</script>
<script type="text/javascript">
    function DateAdd(interval,number,date)
    {
        /*
         *--------------- DateAdd(interval,number,date) -----------------
         * DateAdd(interval,number,date)
         * 功能:实现VBScript的DateAdd功能.
         * 参数:interval,字符串表达式，表示要添加的时间间隔.
         * 参数:number,数值表达式，表示要添加的时间间隔的个数.
         * 参数:date,时间对象.
         * 返回:新的时间对象.
         * var now = new Date();
         * var newDate = DateAdd("d",5,now);
         * author:wanghr100(灰豆宝宝.net)
         * update:2004-5-28 11:46
         *--------------- DateAdd(interval,number,date) -----------------
         */
        switch(interval)
        {
            case "y" : {
                date.setFullYear(date.getFullYear()+number);
                return date;
                break;
            }
            case "q" : {
                date.setMonth(date.getMonth()+number*3);
                return date;
                break;
            }
            case "m" : {
                date.setMonth(date.getMonth()+number);
                return date;
                break;
            }
            case "w" : {
                date.setDate(date.getDate()+number*7);
                return date;
                break;
            }
            case "d" : {
                date.setDate(date.getDate()+number);
                return date;
                break;
            }
            case "h" : {
                date.setHours(date.getHours()+number);
                return date;
                break;
            }
            case "m" : {
                date.setMinutes(date.getMinutes()+number);
                return date;
                break;
            }
            case "s" : {
                date.setSeconds(date.getSeconds()+number);
                return date;
                break;
            }
            default : {
                date.setDate(d.getDate()+number);
                return date;
                break;
            }
        }
    }
    var time_now_server,time_now_client,time_end,time_server_client;
    setInterval("show_time.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);

    var now = new Date();
    var newDate = DateAdd("h",2,now);
    time_end=newDate;//结束的时间
    time_end=time_end.getTime();//获取的是毫秒

    time_now_server=new Date();//开始的时间
    time_now_server=time_now_server.getTime();
    setTimeout("show_time()",1000);

    function show_time()
    {
        var timer = document.getElementById("timer");
        var hourid = document.getElementById("hour");
        if(!timer){
            return ;
        }
        timer.innerHTML =time_now_server;

        var time_now,time_distance,str_time;
        var int_day,int_hour,int_minute,int_second;
        var time_now=new Date();
        time_now=time_now.getTime();
        time_distance=time_end-time_now;
        if(time_distance>0)
        {
            int_day=Math.floor(time_distance/86400000)
            time_distance-=int_day*86400000;
            int_hour=Math.floor(time_distance/3600000)
            time_distance-=int_hour*3600000;
            int_minute=Math.floor(time_distance/60000)
            time_distance-=int_minute*60000;
            int_second=Math.floor(time_distance/1000)

            if(int_hour < 10)
                int_hour="0"+int_hour;
            if(int_minute<10)
                int_minute="0"+int_minute;
            if(int_second<10)
                int_second="0"+int_second;
            str_time=int_hour+"小时"+int_minute+"分钟"+int_second+"秒";
            timer.innerHTML=str_time;
            setTimeout("show_time()",1000);
        }
        else
        {
            timer.innerHTML =0;
        }
    }
    var autosubmit=false;
    function form1submit()
    {
        //if (window.prompt("是否交卷，如交卷，请在下面输入ok","")=="ok")
//	alert(autosubmit);
        if (autosubmit)
        {
            return true;
        }
        if (getanswercnt()<${singlesize+manysize+judgesize})
        {
            if (window.confirm('还有'+(${singlesize+manysize+judgesize}-getanswercnt())+"道题没有答，是否交卷?"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        if (!autosubmit && window.confirm("确定是否交卷?交卷后将显示分数"))
        {
            return true;
        }
        else
            return false;
    }
    //获取已经答数
    function getanswercnt(){
        var ar=new Array;
        var cc=$("input:checked");
        //alert(cc.size());
        var ss='';
        for (i=0;i<cc.size();i++)
        {
            var n1=$("input:checked:eq("+i+")").attr("name");
            var bin=false;
            //alert(ar.length);
            for (j=0;j<ar.length;j++)
            {
                if (n1==ar[j]){
                    bin=true;
                }
            }
            if (!bin)
                ar.push(n1);
        }
        return ar.length;
    };
</script>
<body>

<header>
    <h1>理论测试答案设置</h1></header>
<div class="title1" id="top1">
    <a href="/api/admin/findall">查看所有成员</a>
    <a href="search">按党工委/党支部查看</a>
</div>
<form action="/api/admin/submit" method="post" onsubmit="return form1submit();">
    <section>
        <div class="title"><h4>一、选择题（每题10分，共${singlesize}题）</h4></div>
        <ol>
            <#list single as s >
                <span class="all"><li>  ${s.question}</li></span>
                <div class="choice">
                    <label><input type="radio"  name="${s.id}" value="A" />${s.selectA}</label><br/>
                    <label><input type="radio" name="${s.id}" value="B"/>${s.selectB}</label><br/>
                    <label><input type="radio" name="${s.id}" value="C"/>${s.selectC}</label><br/>
                    <label><input type="radio" name="${s.id}" value="D"/>${s.selectD}</label><br/>
                    <p>原答案：${s.correctSelect}</p>
                </div>
            </#list>
        </ol>
    </section>

    <section>
        <div class="title"><h4>二、多项选择题（每题10分，共${manysize}题）</h4></div>
        <ol>
            <#list many as s >
                <span class="all"><li>${s.question}</li></span>
                <div class="choicem">
                    <label><input type="checkbox" name="${s.id+singlesize}" value="A"/>${s.selectA}</label><br/>
                    <label><input type="checkbox" name="${s.id+singlesize}" value="B"/>${s.selectB}</label><br/>
                    <label><input type="checkbox" name="${s.id+singlesize}" value="C"/>${s.selectC}</label><br/>
                    <label><input type="checkbox" name="${s.id}" value="D"/>${s.selectD}</label><br/>
                    <#if s.selectE?exists> <label><input type="checkbox" name="${s.id}" value="E"/>${s.selectE}</label><br/>
                    </#if>
                    <#if s.selectF?exists> <label><input type="checkbox" name="${s.id}" value="F"/>${s.selectF}</label><br/>
                    </#if>
                    <p>原答案：${s.correctSelect}</p>
                </div>
            </#list>

        </ol>
    </section>

    <section>
        <div class="title"><h4>三、判断题（每题10分，共20分）</h4></div>
        <ol>
            <#list judge as s >
                <span class="all"><li>${s.question}</span><br>
                <input type="radio" value="true" name="${s.id+singlesize+manysize}"/><span class="yes">√
        </span><input type="radio" value="false" name="${s.id+singlesize+manysize}"/><span class="no">×</span></li>
                <p>原答案：${s.answer}</p>
            </#list>
        </ol>
    </section>
<div class="title1"><button type="submit">立即交卷</button></div>

</form>


</body>
</html>