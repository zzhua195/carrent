<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/5
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${ctx}/resources/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/resources/layui_ext/dtree/dtree.css">
    <link rel="stylesheet" href="${ctx}/resources/layui_ext/dtree/font/dtreefont.css">
    <link rel="stylesheet" href="${ctx}/resources/css/public.css"/>
</head>
<body>

    <ul id="menuTree" class="dtree" data-id="0"></ul>



</body>
<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script>
    var menuTree
    layui.extend({
        dtree: '${ctx}/resources/layui_ext/dtree/dtree'   // {/}的意思即代表采用自有路径，即不跟随 base 路径
    }).use(['dtree','layer','jquery'], function(){
        var dtree = layui.dtree, layer = layui.layer, $ = layui.jquery;

        // 初始化树
        menuTree = dtree.render({
            elem: "#menuTree",
            url: "${ctx}/menu/loadLeftMenuTree.action",
            dataStyle: "layuiStyle",  //使用layui风格的数据格式
            response:{message:"msg",statusCode:0} , //修改response中返回数据的定义
            checkbar:false
        });

        dtree.on("node('menuTree')" ,function(obj){
            window.parent.right.reloadTable(obj.param.nodeId);
        });



    });

    function refreshMenuTree(){
        menuTree.reload({
            url: "${ctx}/menu/loadLeftMenuTree.action?spread=1"
        });
    }
</script>
</html>
