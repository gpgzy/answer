<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8"/>
    <link rel="icon" href="/static/favicon.ico">
    <meta name="viewport" content="width=device-width,initial-scale=0.7,minimum-scale=0.4, maximum-scale=1.2,user-scalable=yes">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <title>答题</title>
    <link rel="stylesheet" href="/static/css/wcss.css" type="text/css"/>
</head>
<style>
    body{
        margin-left:15px;
        margin-right:15px;
        margin-bottom:15px;
        maigin-top:15px;
        background-color: lightskyblue;
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
        border-radius: 5px;
    }
    .la {
        display: inline-block;
        width: 40%;
        padding: 14px 4px 14px 4px;
        font-size: 15px;
        font-weight: bold;
    }
    .lb{
        width: 100%;
    }
    input{
        border: 1.5px solid rgb(225,225,225);
        padding:5px 3em;
        border-radius: 5px;
        zoom: 170%;
        margin: 5px;
    }
    .title{
        background: rgb(225,225,225);
        padding: 1px 5px;
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
        background-color: dodgerblue;
        border-radius: 5px;
        border: none;
        color: white;
        padding: 10px;
        cursor: pointer;
        font-size: 20px;
        width: 100%/*鼠标上移变成小手*/
    }
    .yes{
        color:Green;
        font-weight:bold;
        font-size: 19px;
    }
    .no{
        color:Red;
        font-weight:bold;
        font-size: 19px;
    }
    .center{
        width: 500px;
        margin-left: auto;
        margin-right: auto;
        background-color: white;
        border-radius: 5px;
        padding-top: 10px;
        padding-bottom: 10px;
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
    var autosubmit=false;
    var time_now_server,time_now_client,time_end,time_server_client;
    setInterval("show_time.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
    var now = new Date();
    var newDate = DateAdd("s",3600,now);
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
            str_time=int_minute+"分钟"+int_second+"秒";
            timer.innerHTML=str_time;
            if (int_minute == 1&& int_second == 0){
                alert("还剩1分钟，请注意把握好时间");
            }
            if (int_second == 0&&int_minute == 0){
                //alert("你的时间已经用完，答案将自动提交");
                autosubmit = true;
                $("#ff").submit();
            }
            setTimeout("show_time()",1000);
        }
        else
        {
            timer.innerHTML =0;
        }
    }

    function form1submit()
    {
        //if (window.prompt("是否交卷，如交卷，请在下面输入ok","")=="ok")
//	alert(autosubmit);
        if (autosubmit == true)
        {
            console.log("submit");
            return true;
        }
        else if (autosubmit == false && window.confirm("确定是否交卷?交卷后将显示分数") ==true )
        {$('#sub').attr("disabled",true);
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
<div class="center">
    <header>
        <h1>知识竞赛</h1></header>
    <div class="title1">
        </span>
        <label class="la">&emsp;你好：${uname}</label>
        <label class="la">剩余时间：<a id="timer"></a></label>
    </div>
    <div class="title2">
        <label class="lb">&emsp;欢迎参与沁水县“学党章党规、做合格党员”云答题知识竞赛</label>
    </div>
    <!--"-->
    <form action="/api/submit" id="ff" method="post" onsubmit="return form1submit();">
        <input type="hidden" name="tel" value="${tel}">
        <section>
            <div class="title"><h4>一、单项选择题（每题2分，共20题）</h4></div>
            <ol>
                <#list single as s >
                    <span class="all"><li>  ${s.question}</li></span>
                    <div class="choice">
                        <label><input type="radio"  name="s_${s.id}" value="A" />${s.selectA}</label><br/>
                        <label><input type="radio" name="s_${s.id}" value="B"/>${s.selectB}</label><br/>
                        <label><input type="radio" name="s_${s.id}" value="C"/>${s.selectC}</label><br/>
                        <label><input type="radio" name="s_${s.id}" value="D"/>${s.selectD}</label><br/>

                    </div>
                </#list>
            </ol>
        </section>
        <section>
            <div class="title"><h4>二、多项选择题（每题3分，共15题）</h4></div>
            <ol>
                <#list many as s>
                    <span class="all"><li>${s.question}</li></span>
                    <div class="choicem">
                        <label><input type="checkbox" name="m_${s.id}" value="A"/>${s.selectA}</label><br/>
                        <label><input type="checkbox" name="m_${s.id}" value="B"/>${s.selectB}</label><br/>
                        <label><input type="checkbox" name="m_${s.id}" value="C"/>${s.selectC}</label><br/>
                        <label><input type="checkbox" name="m_${s.id}" value="D"/>${s.selectD}</label><br/>
                        <#if s.selectE?exists> <label><input type="checkbox" name="m_${s.id}" value="E"/>${s.selectE}</label><br/>
                        </#if>
                        <#if s.selectF?exists> <label><input type="checkbox" name="m_${s.id}" value="F"/>${s.selectF}</label><br/>
                        </#if>
                    </div>
                </#list>


            </ol>
        </section>

        <section>
            <div class="title"><h4>三、判断题（每题1分，共15题）</h4></div>
            <ol>
                <#list judge as s >
                    <span class="all"><li>${s.question}</li></span>
                        <div class="choicem">
                            <label><input type="radio" value="true" name="j_${s.id}"/><a class="yes">正确</a></label>
                            <label><input type="radio" value="false" name="j_${s.id}"/> <a class="no">错误</a></label>

                        </div>
                </#list>
            </ol>
        </section>

        <div class="title1"><button type="submit" id="sub">立即交卷</button></div>
        <hr/>
        <input name="question" value="${question}" type="hidden" >
    </form>

    <p>电子邮箱：&nbsp;danhecloud@163.com</p>
</div>


</body>
</html>