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
                <label class="layui-form-label">角色名称: </label>
                <div class="layui-input-inline">
                    <input type="tel" name="rolename" id="keyword"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">角色描述: </label>
                <div class="layui-input-inline">
                    <input type="tel" name="roledesc" id="keyword"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">是否可用</label>
                <div class="layui-input-block">
                    <input type="radio" name="available" value="1" title="可用">
                    <input type="radio" name="available" value="0" title="不可用">
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
    <table id="roleTable" lay-filter="roleTable"></table>
    <%--表格结束--%>

    <%--头工具条开始--%>
    <script type="text/html" id="roleToolBar">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
            <button class="layui-btn layui-btn-sm" lay-event="deleteBatchRole">批量删除</button>
        </div>
    </script>
    <%--头工具条结束--%>

    <%--工具条开始--%>
    <script type="text/html" id="roleBar">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="selectRoleMenu">分配菜单</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <%--工具条结束--%>

</div>
</body>

<%--弹框开始--%>
<div style="display: none;padding: 20px;" id="saveOrUpdateDiv">
    <form class="layui-form" id="saveOrUpdateFrm" lay-filter="saveOrUpdateFrm">
        <div class="layui-form-item">
            <label class="layui-form-label">角色名称: </label>
            <div class="layui-input-block">
                <input type="text" name="rolename" id="keyword"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色描述: </label>
            <div class="layui-input-block">
                <input type="text" name="roledesc" id="keyword"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">是否可用</label>
                <div class="layui-input-block">
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

<%--角色分配菜单弹框开始--%>
<div style="display: none;" id="selectRoleMenuDiv">
    <ul id="menuTree" class="dtree" data-id="0"></ul>
</div>
<%--角色分配菜单弹框结束--%>
<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script>

    var roleTable;

    layui.extend({
        dtree: '${ctx}/resources/layui_ext/dtree/dtree'   // {/}的意思即代表采用自有路径，即不跟随 base 路径
    }).use(['table','jquery','form','dtree'],function () {
        var $ = layui.jquery;
        var table = layui.table;
        var form  = layui.form;
        var dtree = layui.dtree;
        roleTable = table.render({
            elem: '#roleTable'
            ,id:'roleTable'
            ,toolbar: '#roleToolBar'
            ,url:'../role/loadRoleByPage.action'
            ,page:true
            ,limit:7
            ,limits:[7,14]
            ,cols: [[
                {type:'checkbox'}
                ,{field:'roleid', title:'ID',align:'center'}
                ,{field:'rolename', title:'角色名称',align:'center'}
                ,{field:'roledesc', title:'角色描述',align:'center'}
                ,{fixed:'right',title:'操作', toolbar: '#roleBar',align:'center'}
            ]]
            ,height:420
            ,text: {
                none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
            }
        });



        //搜索按钮
        form.on('submit(*)', function(data){
            var params = $("#dataFrm").serialize();
            roleTable.reload({
                url:'../role/loadRoleByPage.action?'+params,
                page:{
                    curr:1
                }
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        var mainIndex;
        var url;

        dtree.on("node('selRoleTree')" ,function(obj){
            $("#pid").val(obj.param.nodeId);
        });


        //监听头工具条事件
        table.on('toolbar(roleTable)', function(obj){
            switch(obj.event){
                case 'add':
                    $("#saveOrUpdateFrm")[0].reset();
                    mainIndex = layer.open({
                        title:'添加角色',
                        type:1,
                        content:$("#saveOrUpdateDiv"),
                        offset:'100px',
                        area:['700px','300px'],
                        success:function (layero, index) {
                            url='../role/addRole.action';
                            mainIndex = index;
                        }
                    });
                    break;
                case 'deleteBatchRole':
                    // 获取选中行的数据
                    var checkStatus = table.checkStatus(obj.config.id);
                    var data = checkStatus.data;
                    alert(JSON.stringify(data));
                    var params = ""
                    $.each(data,function (index, item) {
                        if(index==0){
                            params+="ids="+item.roleid;
                        }else{
                            params+="&ids="+item.roleid;
                        }
                    })
                    $.post('../role/deleteBatchRole.action',params,function (resp) {
                        layer.msg(resp.msg);
                        if(resp.code==0){
                            layer.msg(resp.msg);
                            roleTable.reload();
                        }
                    })
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(roleTable)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除角色【'+data.rolename+'】吗?', function(index){

                    //删除角色
                    $.post('../role/deleteRole.action?id='+data.roleid,function (resp) {
                        if(resp.code==0){
                            layer.close(index);
                            layer.msg(resp.msg);
                            roleTable.reload();
                        }else{
                            layer.msg(resp.msg);
                        }
                    })
                });
            } else if(obj.event === 'edit'){
                mainIndex = layer.open({
                    title:'修改角色',
                    type:1,
                    offset:'100px',
                    area:['700px','300px'],
                    content:$("#saveOrUpdateDiv"),
                    success:function (layero, index) {
                        url = '../role/updateRole.action?roleid='+data.roleid;
                        form.val('saveOrUpdateFrm',data);
                    }
                });
            }else if(obj.event === 'selectRoleMenu'){
                layer.open({
                    type: 1
                    ,title: '给角色【'+data.rolename+'】分配菜单'
                    ,content: $("#selectRoleMenuDiv")
                    ,offset:'20px'
                    ,area: ['390px', '400px']
                    ,success:function (layero,index) {
                        //初始化渲染下拉树
                        var selRoleTree = dtree.render({
                            elem: "#menuTree",
                            <%--url: "${ctx}/resources/json/dataTree.json",--%>
                            url: "${ctx}/role/initRoleMenuTreeJson.action?roleid="+data.roleid,
                            dataStyle: "layuiStyle",  //使用layui风格的数据格式
                            response:{message:"msg",statusCode:0} , //修改response中返回数据的定义
                            checkbar: true,
                            checkbarData: "choose" // 记录选中（默认）， "change"：记录变更， "all"：记录全部， "halfChoose"："记录选中和半选（V2.5.0新增）"
                        });
                    }
                    ,btn: ['确认分配', '取消']
                    ,btnAlign: 'c'
                    ,yes: function(index, layero){
                        var menuData = dtree.getCheckbarNodesParam("menuTree");
                        var params = "roleid="+data.roleid;
                        $.each(menuData,function (index, item) {
                            params+="&mids="+item.nodeId;
                        })
                        $.post('${ctx}/role/dispatchRoleMenu.action',params,function (resp) {
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
                    roleTable.reload();
                }
            })

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

    })



</script>
</html>
