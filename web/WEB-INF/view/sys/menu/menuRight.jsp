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
    <link rel="stylesheet" href="${ctx}/resources/css/public.css"/>
</head>
<body>
<div style="margin: 10px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>查询条件</legend>
    </fieldset>
    <form class="layui-form" id="dataFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">菜单名称: </label>
                <div class="layui-input-inline">
                    <input type="tel" name="title" id="keyword"  autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <button class="layui-btn layui-btn-warm" id="searchBtn">
                        <i class="layui-icon">&#xe615;</i> 搜索
                    </button>
                    <button type="reset" class="layui-btn layui-btn-normal">
                        <i class="layui-icon">&#xe666;</i>重置
                    </button>
                </div>
            </div>
        </div>
    </form>

    <table id="menuTable" lay-filter="menuTable"></table>
    <script type="text/html" id="menuToolBar">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
            <button class="layui-btn layui-btn-sm" lay-event="batcheDelete">删除</button>
        </div>
    </script>

    <script type="text/html" id="menuBar">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

</div>


<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script>

    var menuTable;

    layui.use(['table','jquery','form'],function () {
        var $ = layui.jquery;
        var table = layui.table;
        menuTable = table.render({
            elem: '#menuTable'
            ,id:'menuTabble'
            ,toolbar: '#menuToolBar'
            ,url:'../menu/loadMenuByPage.action'
            ,page:true
            ,limit:7
            ,limits:[7,14]
            ,cols: [[
                {type: 'checkbox', fixed: 'left',width:'8%',align:'center'}
                ,{field:'id', title:'ID', width:'5%',align:'center'}
                ,{field:'pid', title:'父节点ID', width:'10%',align:'center'}
                ,{field:'title', title:'菜单名称', width:'18%',align:'center'}
                ,{field:'href', title:'菜单地址',width:'30%', align:'center'}
                ,{title:'是否展开', width:'12%',
                    templet: function(d){
                        if(d.spread==0)
                            return '不展开';
                        return '展开';
                    },align:'center'
                }
                ,{title:'操作', toolbar: '#menuBar', width:'15%',align:'center'}
            ]]
            ,height:420
            ,text: {
                none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
            }
        });

        //搜索按钮
        $("#searchBtn").click(function () {
            var params = $("#dataFrm").serialize();
            alert(params);
            table.reload({
                url:'../menu/loadMenuByPage.action?'+params
            });
        });

        //监听头工具条事件
        table.on('toolbar(menuTable)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'add':
                    layer.msg('添加');
                    break;
                case 'delete':
                    layer.msg('删除');
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(menuTable)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.prompt({
                    formType: 2
                    ,value: data.email
                }, function(value, index){
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });
            }
        });

    })

    function reloadTable(id){
        menuTable.reload({

        });
    }



</script>
</body>
</html>
