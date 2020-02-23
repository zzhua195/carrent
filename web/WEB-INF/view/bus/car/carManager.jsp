<%--
  Created by IntelliJ IDEA.
  Car: Administrator
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
                <label class="layui-form-label">用户姓名: </label>
                <div class="layui-input-inline">
                    <input type="text" name="realname"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">登录名称: </label>
                <div class="layui-input-inline">
                    <input type="text" name="loginname"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户地址: </label>
                <div class="layui-input-inline">
                    <input type="text" name="address" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item" >
            <div class="layui-inline">
                <label class="layui-form-label">用户电话: </label>
                <div class="layui-input-inline">
                    <input type="text" name="phone"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">身份证号: </label>
                <div class="layui-input-inline">
                    <input type="text" name="identity"   autocomplete="off" class="layui-input">
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
    <table id="carTable" lay-filter="carTable"></table>
    <%--表格结束--%>

    <%--头工具条开始--%>
    <script type="text/html" id="carToolBar">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
            <button class="layui-btn layui-btn-sm" lay-event="deleteBatchCar">批量删除</button>
        </div>
    </script>
    <%--头工具条结束--%>

    <%--工具条开始--%>
    <script type="text/html" id="carBar">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="selectCarRole">分配角色</a>
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
                <label class="layui-form-label">登录名称: </label>
                <div class="layui-input-inline">
                    <input type="text" name="loginname"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户姓名: </label>
                <div class="layui-input-inline">
                    <input type="text" name="realname"   autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户电话: </label>
                <div class="layui-input-inline">
                    <input type="text" name="phone"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户地址: </label>
                <div class="layui-input-inline">
                    <input type="text" name="address" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item" >
            <div class="layui-inline">
                <label class="layui-form-label">用户职位: </label>
                <div class="layui-input-inline">
                    <input type="text" name="position"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">身份证号: </label>
                <div class="layui-input-inline">
                    <input type="text" name="identity"   autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">性别</label>
                <div  class="layui-input-inline">
                    <input type="radio" name="sex" value="1" title="男">
                    <input type="radio" name="sex" value="0" title="女">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">是否可用</label>
                <div  class="layui-input-inline">
                    <input type="radio" name="available" value="1" title="可用">
                    <input type="radio" name="available" value="0" title="不可用">
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

<%--用户分配角色弹框开始--%>
<div style="display: none;margin: 10px;" id="selectCarRoleDiv">
    <table class="layui-hide" id="roleTable" lay-filter="roleTable"></table>
</div>
<%--用户分配角色弹框结束--%>
<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script>

    var carTable;

    layui.extend({
        dtree: '${ctx}/resources/layui_ext/dtree/dtree'   // {/}的意思即代表采用自有路径，即不跟随 base 路径
    }).use(['table','jquery','form','dtree'],function () {
        var $ = layui.jquery;
        var table = layui.table;
        var form  = layui.form;
        var dtree = layui.dtree;
        carTable = table.render({
            elem: '#carTable'
            ,id:'carTable'
            ,toolbar: '#carToolBar'
            ,url:'../car/loadCarByPage.action'
            ,page:true
            ,limit:7
            ,limits:[7,14]
            ,cols: [[
                {type:'checkbox'}
                ,{field:'carid', title:'ID',align:'center',width:'5%'}
                ,{field:'realname', title:'用户姓名',align:'center'}
                ,{field:'loginname', title:'登录名',align:'center'}
                ,{field:'identity', title:'身份证号',align:'center'}
                ,{field:'phone', title:'用户电话',align:'center'}
                ,{field:'address', title:'用户地址',align:'center'}
                ,{ title:'性别',align:'center',width:'8%',
                    templet:function (d) {
                        if(d.sex==1) return '男';
                            return '女';
                    }
                 }
                ,{fixed:'right',title:'操作', toolbar: '#carBar',align:'center',width:'20%'}
            ]]
            ,height:420
            ,text: {
                none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
            }
        });



        //搜索按钮
        form.on('submit(*)', function(data){
            var params = $("#dataFrm").serialize();
            carTable.reload({
                url:'../car/loadCarByPage.action?'+params,
                page:{
                    curr:1
                }
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        var mainIndex;
        var url;

        //监听头工具条事件
        table.on('toolbar(carTable)', function(obj){
            switch(obj.event){
                case 'add':
                    $("#saveOrUpdateFrm")[0].reset();
                    mainIndex = layer.open({
                        title:'添加用户',
                        type:1,
                        content:$("#saveOrUpdateDiv"),
                        offset:'20px',
                        area:['700px','380px'],
                        success:function (layero, index) {
                            url='../car/addCar.action';
                            mainIndex = index;
                        }
                    });
                    break;
                case 'deleteBatchCar':
                    // 获取选中行的数据
                    var checkStatus = table.checkStatus(obj.config.id);
                    var data = checkStatus.data;
                    var params = ""
                    $.each(data,function (index, item) {
                        if(index==0){
                            params+="uids="+item.carid;
                        }else{
                            params+="&uids="+item.carid;
                        }
                    })
                    $.post('../car/deleteBatchCar.action',params,function (resp) {
                        layer.msg(resp.msg);
                        if(resp.code==0){
                            layer.msg(resp.msg);
                            carTable.reload();
                        }
                    })
                    break;
            };
        });

        var roleTableIns;

        //监听行工具事件
        table.on('tool(carTable)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除用户【'+data.loginname+'】吗?', {offset:'50px'},function(index){

                    //删除用户
                    $.post('../car/deleteCar.action?id='+data.carid,function (resp) {
                        if(resp.code==0){
                            layer.close(index);
                            layer.msg(resp.msg);
                            carTable.reload();
                        }else{
                            layer.msg(resp.msg);
                        }
                    })
                });
            } else if(obj.event === 'edit'){
                mainIndex = layer.open({
                    title:'修改用户',
                    type:1,
                    offset:'20px',
                    area:['700px','380px'],
                    content:$("#saveOrUpdateDiv"),
                    success:function (layero, index) {
                        url = '../car/updateCar.action?carid='+data.carid;
                        form.val('saveOrUpdateFrm',data);
                    }
                });
            }else if(obj.event === 'selectCarRole'){
                layer.open({
                    type: 1
                    ,title: '给用户【'+data.loginname+'】分配角色'
                    ,content: $("#selectCarRoleDiv")
                    ,offset:'20px'
                    ,area: ['650px', '350px']
                    ,success:function (layero,index) {
                        roleTableIns = table.render({
                            elem: '#roleTable'
                            ,url:'${ctx}/role/queryRoleByUid.action?uid='+data.carid
                            ,cols: [[
                                {type: 'checkbox', fixed: 'left'}
                                ,{field:'roleid', title:'角色ID', width:80}
                                ,{field:'rolename', title:'角色名称', width:'40%'}
                                ,{field:'roledesc', title:'角色描述', width:'40%'}
                            ]]
                        });

                    }
                    ,btn: ['确认分配', '取消']
                    ,btnAlign: 'c'
                    ,yes: function(index, layero){
                        // 获取用户
                        var params = "carid="+data.carid;
                        // 获取选中的角色
                        var roleData = table.checkStatus(roleTableIns.config.id).data;
                        $.each(roleData,function (index, item) {
                            params+="&rids="+item.roleid;
                        })
                        $.post('${ctx}/car/resetCarRole.action',params,function (resp) {
                            if(resp.code<0){
                                layer.msg(resp.msg);
                            }else{
                                layer.close(mainIndex);
                            }
                        })
                        layer.close(index);
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
                    carTable.reload();
                }
            })

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

    })



</script>
</html>
