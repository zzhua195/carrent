<%--
  Created by IntelliJ IDEA.
  Customer: Administrator
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
                <label class="layui-form-label">身份证号: </label>
                <div class="layui-input-inline">
                    <input type="text" name="identity"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">客户姓名: </label>
                <div class="layui-input-inline">
                    <input type="text" name="custname"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">客户电话: </label>
                <div class="layui-input-inline">
                    <input type="text" name="phone"   autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">客户地址: </label>
                <div class="layui-input-inline">
                    <input type="text" name="address" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">客户职位: </label>
                <div class="layui-input-inline">
                    <input type="text" name="career"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="1" title="男">
                    <input type="radio" name="sex" value="0" title="女">
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
    <table id="customerTable" lay-filter="customerTable"></table>
    <%--表格结束--%>

    <%--头工具条开始--%>
    <script type="text/html" id="customerToolBar">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
            <button class="layui-btn  layui-btn-danger layui-btn-sm" lay-event="deleteBatchCustomer">批量删除</button>
        </div>
    </script>
    <%--头工具条结束--%>

    <%--工具条开始--%>
    <script type="text/html" id="customerBar">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <%--工具条结束--%>

</div>
</body>

<%--弹框开始--%>
<div style="display: none;padding: 20px;" id="saveOrUpdateDiv">
    <form class="layui-form" id="saveOrUpdateFrm" lay-filter="saveOrUpdateFrm" >
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">身份证号: </label>
                <div class="layui-input-inline">
                    <input type="text" name="identity"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">客户姓名: </label>
                <div class="layui-input-inline">
                    <input type="text" name="custname"   autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">客户电话: </label>
                <div class="layui-input-inline">
                    <input type="text" name="phone"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">客户地址: </label>
                <div class="layui-input-inline">
                    <input type="text" name="address" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item" >
            <div class="layui-inline">
                <label class="layui-form-label">客户职位: </label>
                <div class="layui-input-inline">
                    <input type="text" name="career"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="1" title="男">
                    <input type="radio" name="sex" value="0" title="女">
                </div>
            </div>
        </div>
        <div class="layui-form-item" >
            <div class="layui-block" style="text-align: center;">
                <button class="layui-btn layui-btn-warm" lay-submit lay-filter="doSubmit" id="doSubmit">
                    <i class="layui-icon">&#xe609;</i> 提交
                </button>
                <button type="reset" class="layui-btn layui-btn-normal">
                    <i class="layui-icon">&#xe666;</i>重置
                </button>
            </div>
        </div>
    </form>
</div>
<%--弹框结束--%>

<%--客户分配角色弹框开始--%>
<div style="display: none;margin: 10px;" id="selectCustomerRoleDiv">
    <table class="layui-hide" id="roleTable" lay-filter="roleTable"></table>
</div>
<%--客户分配角色弹框结束--%>
<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script>

    var customerTable;

    layui.use(['table','jquery','form'],function () {
        var $ = layui.jquery;
        var table = layui.table;
        var form  = layui.form;
        var dtree = layui.dtree;
        customerTable = table.render({
            elem: '#customerTable'
            ,id:'customerTable'
            ,toolbar: '#customerToolBar'
            ,url:'../customer/loadCustomerByPage.action'
            ,page:true
            ,limit:7
            ,limits:[7,14]
            ,cols: [[
                {type:'checkbox'}
                ,{field:'identity', title:'身份证号',align:'center'}
                ,{field:'custname', title:'客户姓名',align:'center'}
                ,{field:'phone', title:'客户电话',align:'center',width:'5%'}
                ,{field:'address', title:'客户地址',align:'center'}
                ,{field:'career', title:'客户职位',align:'center'}
                ,{ title:'性别',align:'center',width:'8%',
                    templet:function (d) {
                        if(d.sex==1) return '男';
                        return '女';
                    }
                }
                ,{ title:'录入时间',align:'center',
                    templet: "<div>{{layui.util.toDateString(d.createtime, 'yyyy/MM/dd HH:mm:ss')}}</div>"}

                ,{fixed:'right',title:'操作', toolbar: '#customerBar',align:'center',width:'20%'}
            ]]
            ,height:420
            ,text: {
                none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
            }
        });

        //搜索按钮
        form.on('submit(*)', function(data){
            var params = $("#dataFrm").serialize();
            customerTable.reload({
                url:'../customer/loadCustomerByPage.action?'+params,
                page:{
                    curr:1
                }
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        var mainIndex;
        var url;

        var flag;

        //监听头工具条事件
        table.on('toolbar(customerTable)', function(obj){
            switch(obj.event){
                case 'add':
                    flag = true;
                    $("#identity").attr("readonly",false);
                    $("#saveOrUpdateFrm")[0].reset();
                    mainIndex = layer.open({
                        title:'添加客户',
                        type:1,
                        content:$("#saveOrUpdateDiv"),
                        offset:'20px',
                        area:['700px','380px'],
                        success:function (layero, index) {
                            url='../customer/addCustomer.action';
                            mainIndex = index;
                        }
                    });
                    break;
                case 'deleteBatchCustomer':
                    // 获取选中行的数据
                    var checkStatus = table.checkStatus(obj.config.id);
                    var data = checkStatus.data;
                    var params = ""
                    layer.confirm('真的删除这【'+data.length+'】个客户吗?', {offset:'50px'},function(index){
                        $.each(data,function (index, item) {
                            if(index==0){
                                params+="identitys="+item.identity;
                            }else{
                                params+="&identitys="+item.identity;
                            }
                        })
                        $.post('../customer/deleteBatchCustomer.action?idy='+data.identity,params,function (resp) {
                            layer.msg(resp.msg);
                            if(resp.code==0){
                                layer.msg(resp.msg);
                                customerTable.reload();
                            }
                        })
                    });
                    break;
            };
        });

        var roleTableIns;

        //监听行工具事件
        table.on('tool(customerTable)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除客户【'+data.custname+'】吗?', {offset:'50px'},function(index){

                    //删除客户
                    $.post('../customer/deleteCustomer.action?identity='+data.identity,function (resp) {
                        if(resp.code==0){
                            layer.close(index);
                            layer.msg(resp.msg);
                            customerTable.reload();
                        }else{
                            layer.msg(resp.msg);
                        }
                    })
                });
            } else if(obj.event === 'edit'){
                flag = false;
                $("#identity").attr("readonly",true);
                mainIndex = layer.open({
                    title:'修改客户',
                    type:1,
                    offset:'20px',
                    area:['700px','380px'],
                    content:$("#saveOrUpdateDiv"),
                    success:function (layero, index) {

                        url = '../customer/updateCustomer.action';
                        form.val('saveOrUpdateFrm',data);
                    }
                });
            }
        });

        // 弹框表单提交
        form.on('submit(doSubmit)', function(data){
            if(flag){
                $.post('../customer/checkIdentity.action?identity='+$("#identity").val(),function (resp) {
                    if(resp.code<0){
                        layer.msg(resp.msg);
                        $("#identity").val()
                    }else{
                        $.post(url,data.field,function (resp) {
                            if(resp.code<0){
                                layer.msg(resp.msg);
                            }else{
                                layer.close(mainIndex);
                                customerTable.reload();
                            }
                        })
                    }
                })
                return false;
            }else{
                $.post(url,data.field,function (resp) {
                    if(resp.code<0){
                        layer.msg(resp.msg);
                    }else{
                        layer.close(mainIndex);
                        customerTable.reload();
                    }
                })
                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            }



        });

    })



</script>
</html>
