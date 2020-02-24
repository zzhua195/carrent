<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/5
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>汽车出租</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${ctx}/resources/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${ctx}/resources/css/public.css" media="all" />
</head>
<body class="childrenBody">
<blockquote class="layui-elem-quote layui-bg-green">
    <div id="nowTime"></div>
</blockquote>
<div class="layui-row layui-col-space10" >
    <div class="layui-col-lg6 layui-col-md12" style="width: 50%" >
        <blockquote class="layui-elem-quote title">系统公告</blockquote>
        <table class="layui-table magt0">
            <colgroup>
                <col width="150">
                <col>
            </colgroup>
            <tbody class="hot_news">

            </tbody>
        </table>
    </div>
</div>
<%--查看公告--%>
<div style="display: none;padding: 5px;" id="viewNewsDiv">
    <h2 id="title" align="center"></h2>

    <div style="float: right;font-size: 10px;color: grey;">
        发布人: <span id="s1"></span> <span style="display: inline-block;width: 20px" ></span>
        发布时间: <span id="s2"></span>
    </div>
    <hr/>
    <div id="s3">
    </div>
</div>

<%--查看公告--%>

<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script>
    function getLangDate(){
        var dateObj = new Date(); //表示当前系统时间的Date对象
        var year = dateObj.getFullYear(); //当前系统时间的完整年份值
        var month = dateObj.getMonth()+1; //当前系统时间的月份值
        var date = dateObj.getDate(); //当前系统时间的月份中的日
        var day = dateObj.getDay(); //当前系统时间中的星期值
        var weeks = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
        var week = weeks[day]; //根据星期值，从数组中获取对应的星期字符串
        var hour = dateObj.getHours(); //当前系统时间的小时值
        var minute = dateObj.getMinutes(); //当前系统时间的分钟值
        var second = dateObj.getSeconds(); //当前系统时间的秒钟值
        var timeValue = "" +((hour >= 12) ? (hour >= 18) ? "晚上" : "下午" : "上午" ); //当前时间属于上午、晚上还是下午
        newDate = dateFilter(year)+"年"+dateFilter(month)+"月"+dateFilter(date)+"日 "+" "+dateFilter(hour)+":"+dateFilter(minute)+":"+dateFilter(second);
        document.getElementById("nowTime").innerHTML = "亲爱的${user.loginname}，"+timeValue+"好！ 欢迎使用汽车出租后台管理系统。当前时间为： "+newDate+"　"+week;
        setTimeout("getLangDate()",1000);
    }

</script>
<script type="text/javascript" src="${ctx}/resources/js/main.js"></script>
<script>
    layui.use('jquery',function () {
        var $ = layui.jquery;

        $.get('../news/loadNewsByPage.action?page=1&limit=10',function (resp) {
            var content = "";
            var data = resp.data;
            for(var i=0;i<data.length;i++){
                content += '<tr onclick="openNews('+data[i].id+');"><td>'+data[i].title+'</td><td align="right">'+formatDateTime(data[i].createtime)+'</td></tr>'
            }
            $(".hot_news").html(content);
        });
    });

    function openNews(id) {
        $.get('../news/queryNewsById.action?id='+id,function (resp) {
            var data = resp;
            layer.open({
                title:'',
                type:1,
                content:$("#viewNewsDiv"),
                offset:'10px',
                area:['700px','450px'],
                success:function (layero, index) {

                    $('#title').html(data.title);
                    $('#s1').html(data.opername);
                    $('#s2').html(formatDateTime(data.createtime));
                    $('#s3').html(data.content);
                }
            });

        });
    }

    function formatDateTime(inputTime) {
        var date = new Date(inputTime);
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        m = m < 10 ? ('0' + m) : m;
        var d = date.getDate();
        d = d < 10 ? ('0' + d) : d;
        var h = date.getHours();
        h = h < 10 ? ('0' + h) : h;
        var minute = date.getMinutes();
        var second = date.getSeconds();
        minute = minute < 10 ? ('0' + minute) : minute;
        second = second < 10 ? ('0' + second) : second;
        return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;
    };
</script>
</body>
</html>
