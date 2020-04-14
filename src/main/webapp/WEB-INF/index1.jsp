<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style>
        .center{

            width: 60%;
        }
        .left{
            text-align: left;
            border: 1px solid red;
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
</head>
<body>
Hi ${uname}你于  ${now}登录成功
<p>${message}</p>
<span>
    你的剩余时间:
<a id="timer"></a>
</span>

<div class="center">
    <form action="/api/submit" method="post" onsubmit="return form1submit();">
        <input type="hidden" name="idCard" value="${idCard}">
        <div class="left">
            <p>一、单选题</p>
            <c:forEach items="${single}" var="s" >
                <p>
                        ${s.id}.  ${s.question}
                </p>
                <input type="radio" name="${s.id}" value="A">A.${s.selectA}
                <br>
                <input type="radio" name="${s.id}" value="B">B.${s.selectB}
                <br>
                <input type="radio" name="${s.id}" value="C">C.${s.selectC}
                <br>
            </c:forEach>
        </div>
        <p>二、多选题</p>
        <div class="left">
            <c:forEach items="${many}" var="s" >
                <p>
                        ${s.id}.  ${s.question}
                </p>
                <input type="checkbox" name="${s.id+singlesize}" value="A">A.${s.selectA}<br>
                <input type="checkbox" name="${s.id+singlesize}" value="B">B.${s.selectB}<br>
                <input type="checkbox" name="${s.id+singlesize}" value="C">C.${s.selectC}<br>
            </c:forEach>
        </div>
        <p>三、判断题</p>
        <div class="left">
            <c:forEach items="${judge}" var="s" >
                <p>
                        ${s.id}.  ${s.question}
                </p>
                <input type="radio" name="${s.id+singlesize+manysize}" value="true">对<br>
                <input type="radio" name="${s.id+singlesize+manysize}" value="false">错<br>
            </c:forEach>
        </div>
        <button type="submit">submit</button>
    </form>
<!--测试发现更改jsp文件,也需要重启启动类(清缓存也不行!)
答题时间（开始时间）
显示姓名
-->
</body>
</html>