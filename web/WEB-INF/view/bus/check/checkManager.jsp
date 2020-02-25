<%--
  Created by IntelliJ IDEA.
  Check: Administrator
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
    <style>
        .gap{
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<%--查询条件开始--%>
<div style="margin: 5px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>查询条件</legend>
    </fieldset>
    <form class="layui-form" id="dataFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">检查单号: </label>
                <div class="layui-input-inline">
                    <input type="text" name="checkid"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出租单号: </label>
                <div class="layui-input-inline">
                    <input type="text" name="rentid"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">存在问题: </label>
                <div class="layui-input-inline">
                    <input type="text" name="problem" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item" >
            <div class="layui-inline">
                <label class="layui-form-label">开始时间: </label>
                <div class="layui-input-inline">
                    <input type="text" name="starttime" id="starttime"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">结束时间: </label>
                <div class="layui-input-inline">
                    <input type="text" name="endtime" id="endtime"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">问题描述</label>
                <div class="layui-input-inline">
                    <input type="text" name="checkdesc" autocomplete="off" class="layui-input">
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
    <table id="checkTable" lay-filter="checkTable"></table>
    <%--表格结束--%>

    <%--工具条开始--%>
    <script type="text/html" id="checkBar">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    </script>
    <%--工具条结束--%>

</div>
</body>

<%--添加修改弹框--%>
<%--添加修改弹框--%>
<div style="display: none;padding: 20px;" id="checkCarDiv">
    <form class="layui-form layui-row layui-col-space10" id="checkCarFrm" lay-filter="checkCarFrm" >
        <div class="layui-form-item magt3">
            <div class="layui-inline">
                <label class="layui-form-label">检查单号</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" readonly  name="checkid">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出租单号</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" readonly name="rentid" lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">检查时间</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="checkdate" lay-verify="required" >
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">存在问题</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="problem"  lay-verify="required" >
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">赔付金额</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input"  name="paymoney" lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">操作员</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="opername" id="opername" lay-verify="required" >
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">问题描述</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容"  name="checkdesc" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item" >
            <div class="layui-block" style="text-align: center;">
                <button class="layui-btn layui-btn-warm" lay-submit lay-filter="doSubmit" id="doSubmit">
                    <i class="layui-icon">&#xe609;</i> 提交
                </button>
            </div>
        </div>
    </form>
</div>
<%--弹框结束--%>


<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script>

    var checkTable;

    layui.use(['table','jquery','form','laydate'],function () {
        var $ = layui.jquery;
        var table = layui.table;
        var form  = layui.form;
        var upload = layui.upload;
        var laydate = layui.laydate;

        laydate.render({
            elem:"#starttime",
            type:"datetime"
        });
        laydate.render({
            elem:"#endtime",
            type:"datetime"
        });

        laydate.render({
            elem:'#begindate',
            type:'datetime'
        });
        laydate.render({
            elem:'#returndate',
            type:'datetime'
        });

        checkTable = table.render({
            elem: '#checkTable'
            ,id:'checkTable'
            ,url:'../check/loadCheckByPage.action'
            ,page:true
            ,limit:7
            ,limits:[7,14]
            ,cols: [[
                {type:'checkbox'}
                ,{field:'checkid', title:'检查单号',align:'center'}
                ,{field:'rentid', title:'出租单号',align:'center'}
                ,{field:'checkdate', title:'检查时间',align:'center'}
                ,{field:'problem', title:'问题',align:'center'}
                ,{field:'paymoney', title:'赔付金额',align:'center'}
                ,{field:'opername', title:'操作员',align:'center'}
                ,{field:'createtime', title:'录入时间',align:'center'}
                ,{fixed:'right',title:'操作', toolbar: '#checkBar',align:'center',width:'10%'}
            ]]
            ,height:420
            ,text: {
                none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
            }
        });



        //搜索按钮
        form.on('submit(*)', function(data){
            var params = $("#dataFrm").serialize();
            checkTable.reload({
                url:'../check/loadCheckByPage.action?'+params,
                page:{
                    curr:1
                }
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        var mainIndex;
        var url;
        var roleTableIns;

        //监听行工具事件
        table.on('tool(checkTable)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除订单【'+data.checkid+'】吗?', {offset:'50px'},function(index){

                    //删除汽车
                    $.post('../check/deleteCheck.action?checkid='+data.checkid,function (resp) {
                        if(resp.code==0){
                            layer.close(index);
                            layer.msg(resp.msg);
                            checkTable.reload();
                        }else{
                            layer.msg(resp.msg);
                        }
                    })
                });
            } else if(obj.event === 'edit'){
                mainIndex = layer.open({
                    title:'修改出租单',
                    type:1,
                    offset:'5px',
                    area:['700px','490px'],
                    content:$("#checkCarDiv"),
                    success:function (layero, index) {
                        url = '../check/updateCheck.action';
                        form.val('checkCarFrm',data);
                    }
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
                    checkTable.reload();
                }
            })

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

    })



</script>
</html>
