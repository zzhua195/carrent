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
                <label class="layui-form-label">菜单名称: </label>
                <div class="layui-input-inline">
                    <input type="tel" name="title" id="keyword"  autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <button class="layui-btn layui-btn-warm" lay-submit lay-filter="*" id="searchBtn">
                        <i class="layui-icon">&#xe615;</i> 搜索
                    </button>
                    <button type="reset" class="layui-btn layui-btn-normal">
                        <i class="layui-icon">&#xe666;</i>重置
                    </button>
                </div>
            </div>
        </div>
    </form>
<%--查询条件结束--%>

    <%--表格开始--%>
    <table id="menuTable" lay-filter="menuTable"></table>
    <%--表格结束--%>

    <%--头工具条开始--%>
    <script type="text/html" id="menuToolBar">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
        </div>
    </script>
    <%--头工具条结束--%>

    <%--工具条开始--%>
    <script type="text/html" id="menuBar">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <%--工具条结束--%>

</div>
</body>

<%--弹框开始--%>
<div style="display: none;padding: 20px;" id="saveOrUpdateDiv">
    <form class="layui-form" id="saveOrUpdateFrm" lay-filter="saveOrUpdateFrm">
        <input name="id" style="display: none;"/>
        <div class="layui-form-item">
            <div class="layui-inline gap">
                <label class="layui-form-label">父级菜单</label>
                <div class="layui-input-inline" id="selMenuTreeDiv">
                    <input type="hidden" id="pid" name="pid" autocomplete="off"  class="layui-input">
                    <ul id="selMenuTree" class="dtree" data-id="0" data-value="" ></ul>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">TARGET</label>
                <div class="layui-input-inline">
                    <select name="target">
                        <option value=""  selected="">默认</option>
                        <option value="_blank">_blank</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline gap">
                <label class="layui-form-label">菜单名称:</label>
                <div class="layui-input-inline">
                    <input type="tel" name="title" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline gap">
                <label class="layui-form-label">菜单地址</label>
                <div class="layui-input-inline">
                    <input type="text" name="href" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">选择图标</label>
            <div class="layui-input-block" style="width:515px">
                <input type="text" name="icon" lay-reqtext="用户名是必填项，岂能为空？" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">是否展开</label>
                <div class="layui-input-inline">
                    <input type="radio" name="spread" value="1" title="展开" >
                    <input type="radio" name="spread" value="0" title="不展开">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">是否可用</label>
                <div class="layui-input-inline">
                    <input type="radio" name="available" value="1" title="可用" >
                    <input type="radio" name="available" value="0" title="不可用">
                </div>
            </div>
        </div>


        <div class="layui-form-item" >
            <div class="layui-input-block" style="margin-left: 250px;">
                <div class="layui-input-inline">
                    <button class="layui-btn layui-btn-warm" lay-submit lay-filter="doSubmit" id="doSubmit">
                        <i class="layui-icon">&#xe609;</i> 提交
                    </button>
                    <button type="reset" class="layui-btn layui-btn-normal">
                        <i class="layui-icon">&#xe666;</i>重置
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>
<%--弹框结束--%>
<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script>

    var menuTable;

    layui.extend({
        dtree: '${ctx}/resources/layui_ext/dtree/dtree'   // {/}的意思即代表采用自有路径，即不跟随 base 路径
    }).use(['table','jquery','form','dtree'],function () {
        var $ = layui.jquery;
        var table = layui.table;
        var form  = layui.form;
        var dtree = layui.dtree;
        menuTable = table.render({
            elem: '#menuTable'
            ,id:'menuTabble'
            ,toolbar: '#menuToolBar'
            ,url:'../menu/loadMenuByPage.action'
            ,page:true
            ,limit:7
            ,limits:[7,14]
            ,cols: [[
                {field:'id', title:'ID', width:'8%',align:'center'}
                ,{field:'title', title:'菜单名称', width:'18%',align:'center'}
                ,{ title:'图标',width:'10%', align:'center',templet:function (d) {
                        return '<div><i class="layui-icon">'+d.icon+'</i></div>'
                    }}
                ,{field:'href', title:'菜单地址',width:'30%', align:'center'}
                ,{title:'是否可用',width:'10%', align:'center',templet:function (d) {
                        if(d.available==1){
                            return "<div><i class='layui-icon' style='color: #91ee2b;'>&#xe605;</i></div>"
                        }else{
                            return "<div><i class='layui-icon' style='color: #6e1233;'>&#x1006;</i></div>"
                        }
                    }}
                ,{title:'是否展开',width:'10%', align:'center',templet:function (d) {
                        if(d.spread==1){
                            return "<div><i class='layui-icon' style='color: #91ee2b;'>&#xe605;</i></div>"
                        }else{
                            return "<div><i class='layui-icon' style='color: #6e1233;'>&#x1006;</i></div>"
                        }
                    }}
                ,{fixed:'right',title:'操作', toolbar: '#menuBar', width:'17%',align:'center'}
            ]]
            ,height:420
            ,text: {
                none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
            }
        });



        //搜索按钮
        form.on('submit(*)', function(data){
            var params = $("#dataFrm").serialize();
            menuTable.reload({
                url:'../menu/loadMenuByPage.action?'+params,
                page:{
                    curr:1
                }
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        var mainIndex;
        var url;

        //初始化渲染下拉树
        var selMenuTree = dtree.renderSelect({
            elem: "#selMenuTree",
            url: "${ctx}/menu/loadLeftMenuTree.action?spread=1",
            dataStyle: "layuiStyle",  //使用layui风格的数据格式
            response:{message:"msg",statusCode:0} , //修改response中返回数据的定义
            checkbar:false,
            selectCardHeight: "50"


        });

        dtree.on("node('selMenuTree')" ,function(obj){
            $("#pid").val(obj.param.nodeId);
        });


        //监听头工具条事件
        table.on('toolbar(menuTable)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'add':
                    $("#saveOrUpdateFrm")[0].reset();
                    dtree.reload("selMenuTree",{
                        url: "${ctx}/menu/loadLeftMenuTree.action?spread=1",
                        selectCardHeight: "50",
                        done: function(res, $ul, first){
                            if(first) {
                                dtree.dataInit("selMenuTree", "");
                                // 也可以在这里指定，第二个参数如果不填，则会自动返显当前选中的数据
                                var selectParam = dtree.selectVal("selMenuTree");
                            }

                        }
                    });

                    mainIndex = layer.open({
                        title:'添加菜单',
                        type:1,
                        content:$("#saveOrUpdateDiv"),
                        area:['710px','380px'],
                        success:function (layero, index) {
                            url='../menu/addMenu.action';
                            mainIndex = index;
                        }
                    });
            };
        });

        //监听行工具事件
        table.on('tool(menuTable)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除菜单【'+data.title+'】吗?', function(index){

                    //判断是否有父节点
                    $.post('../menu/hasChidrenNode.action?id='+data.id,function (resp) {
                        if(resp.code==0){
                            layer.msg("请先删除所属的子节点")
                        }else{
                            $.post('../menu/deleteMenu.action?id='+data.id,function (resp) {
                                layer.msg(resp.msg);
                                if(resp.code==0){
                                    menuTable.reload({page:{curr:1}});
                                    window.parent.left.refreshMenuTree();
                                }
                            });
                            layer.close(index);
                        }
                    })



                });
            } else if(obj.event === 'edit'){
                mainIndex = layer.open({
                        type:1,
                    content:$("#saveOrUpdateDiv"),
                    area:['710px','380px'],
                    success:function (layero, index) {
                        url = '../menu/updateMenu.action';
                        form.val('saveOrUpdateFrm',data);
                        dtree.reload("selMenuTree",{
                            url: "${ctx}/menu/loadLeftMenuTree.action?spread=1",
                            dataStyle: "layuiStyle",  //使用layui风格的数据格式
                            selectCardHeight: "50",
                            response:{message:"msg",statusCode:0} , //修改response中返回数据的定义
                            checkbar:false,
                            done: function(res, $ul, first){
                                if(first) {
                                    dtree.dataInit("selMenuTree", data.pid);
                                    // 也可以在这里指定，第二个参数如果不填，则会自动返显当前选中的数据
                                    var selectParam = dtree.selectVal("selMenuTree");
                                }
                            }

                        })
                    }
                });
            }
        });

        // 弹框表单提交
        form.on('submit(doSubmit)', function(data){
            if($("#pid").val()==undefined||$("#pid").val()==''){
                layer.msg("请选择父节点");
                return;
            }
            $.post(url,data.field,function (resp) {
                if(resp.code<0){
                    layer.msg(resp.msg);
                }else{
                    layer.msg(resp.msg);
                    layer.close(mainIndex);
                    $("#saveOrUpdateFrm")[0].reset();
                    //刷新左侧的菜单树
                    window.parent.left.refreshMenuTree();
                    //刷新表格
                    menuTable.reload();
                    // 刷新添加和修改的选择下拉树
                    selMenuTree.reload();
                }
            })

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

    })



    //用于菜单树调用，重载菜单表格
    function reloadTable(id){
        menuTable.reload({
            url:'../menu/loadMenuByPage.action?id='+id,
            page:{
                curr:1
            }
        });
    }



</script>
</html>
