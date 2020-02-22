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
    <style>
        .gap{
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<%--查询条件开始--%>
<div style="margin: 10px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>查询条件</legend>
    </fieldset>
    <form class="layui-form" id="dataFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">登录名称: </label>
                <div class="layui-input-inline">
                    <input type="tel" name="loginname"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">登录ip: </label>
                <div class="layui-input-inline">
                    <input type="tel" name="loginip"  autocomplete="off" class="layui-input">
                </div>
            </div>


        </div>
        <div class="layui-form-item" >
            <div class="layui-inline">
                <label class="layui-form-label">开始时间</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="starttime" id="starttime" >
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">结束时间</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="endtime" id="endtime">
                </div>
            </div>
        </div>
        <div class="layui-form-item" >
            <div class="layui-block" style="text-align: center;">
                <button class="layui-btn layui-btn-warm" lay-submit lay-filter="*" id="searchBtn">
                    <i class="layui-icon">&#xe615;</i> 搜索
                </button>
                <button type="reset" class="layui-btn layui-btn-normal">
                    <i class="layui-icon">&#xe666;</i>重置
                </button>
            </div>
        </div>
    </form>
<%--查询条件结束--%>

    <%--表格开始--%>
    <table id="logInfoTable" lay-filter="logInfoTable"></table>
    <%--表格结束--%>

    <%--头工具条开始--%>
    <script type="text/html" id="logInfoToolBar">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="deleteBatchLogInfo">批量删除</button>
        </div>
    </script>
    <%--头工具条结束--%>

    <%--工具条开始--%>
    <script type="text/html" id="logInfoBar">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <%--工具条结束--%>

</div>
</body>

<%--登录分配菜单弹框开始--%>
<div style="display: none;" id="selectLogInfoMenuDiv">
    <ul id="menuTree" class="dtree" data-id="0"></ul>
</div>
<%--登录分配菜单弹框结束--%>
<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script>

    var logInfoTable;

    layui.use(['table','jquery','form','laydate'],function () {
        var $ = layui.jquery;
        var table = layui.table;
        var form  = layui.form;
        var laydate = layui.laydate;

        laydate.render({
            elem: '#starttime'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#endtime'
            ,type: 'datetime'
        });
        logInfoTable = table.render({
            elem: '#logInfoTable'
            ,id:'logInfoTable'
            ,toolbar: '#logInfoToolBar'
            ,url:'../logInfo/loadLogInfoByPage.action'
            ,page:true
            ,limit:7
            ,limits:[7,14]
            ,cols: [[
                {type:'checkbox'}
                ,{field:'id', title:'ID',align:'center'}
                ,{field:'loginname', title:'登录名称',align:'center'}
                ,{field:'loginip', title:'登录ip',align:'center'}
                ,{ title:'登录时间',align:'center',
                    templet:"<div>{{layui.util.toDateString(d.logintime, 'yyyy/MM/dd HH:mm:ss')}}</div>"
                }

                ,{fixed:'right',title:'操作', toolbar: '#logInfoBar',align:'center'}
            ]]
            ,height:420
            ,text: {
                none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
            }
        });



        //搜索按钮
        form.on('submit(*)', function(data){
            var params = $("#dataFrm").serialize();
            logInfoTable.reload({
                url:'../logInfo/loadLogInfoByPage.action?'+params,
                page:{
                    curr:1
                }
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        var mainIndex;
        var url;


        //监听头工具条事件
        table.on('toolbar(logInfoTable)', function(obj){
            switch(obj.event){
                case 'add':
                    $("#saveOrUpdateFrm")[0].reset();
                    mainIndex = layer.open({
                        title:'添加登录',
                        type:1,
                        content:$("#saveOrUpdateDiv"),
                        offset:'100px',
                        area:['700px','300px'],
                        success:function (layero, index) {
                            url='../logInfo/addLogInfo.action';
                            mainIndex = index;
                        }
                    });
                    break;
                case 'deleteBatchLogInfo':
                    // 获取选中行的数据
                    var checkStatus = table.checkStatus(obj.config.id);
                    var data = checkStatus.data;
                    layer.confirm('真的删除<span style="color: red">【'+data.length+'】</span>条记录吗?', function(index){

                        var params = ""
                        $.each(data,function (index, item) {
                            if(index==0){
                                params+="ids="+item.id;
                            }else{
                                params+="&ids="+item.id;
                            }
                        })
                        $.post('../logInfo/deleteBatchLogInfo.action',params,function (resp) {
                            layer.msg(resp.msg);
                            if(resp.code==0){
                                layer.msg(resp.msg);
                                logInfoTable.reload();
                            }
                        })
                    })

                    break;


            };
        });

        //监听行工具事件
        table.on('tool(logInfoTable)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除【'+data.id+'】这条记录吗?', function(index){

                    //删除登录
                    $.post('../logInfo/deleteLogInfo.action?id='+data.id,function (resp) {
                        if(resp.code==0){
                            layer.close(index);
                            layer.msg(resp.msg);
                            logInfoTable.reload();
                        }else{
                            layer.msg(resp.msg);
                        }
                    })
                });
            }
        });

        // 弹框表单提交
        form.on('submit(doSubmit)', function(data){
            $.post(url,data.field,function (resp) {
                if(resp.code<0){
                    layer.msg(resp.msg);
                }else{
                    layer.close(mainIndex);
                    logInfoTable.reload();
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

    })



</script>
</html>
