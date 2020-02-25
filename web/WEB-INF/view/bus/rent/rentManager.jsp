<%--
  Created by IntelliJ IDEA.
  Rent: Administrator
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
                <label class="layui-form-label">出租单号: </label>
                <div class="layui-input-inline">
                    <input type="text" name="rentid"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">身份证号: </label>
                <div class="layui-input-inline">
                    <input type="text" name="identity"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">车牌号: </label>
                <div class="layui-input-inline">
                    <input type="text" name="carnumber" autocomplete="off" class="layui-input">
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
                <label class="layui-form-label">是否出租</label>
                <div class="layui-input-block">
                    <input type="radio" name="rentflag" value="1" title="已归还">
                    <input type="radio" name="rentflag" value="0" title="未归还">
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
    <table id="rentTable" lay-filter="rentTable"></table>
    <%--表格结束--%>

    <%--工具条开始--%>
    <script type="text/html" id="rentBar">
        {{#  if(d.rentflag==1){ }}

        {{#  } else { }}
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        {{#  } }}

    </script>
    <%--工具条结束--%>

</div>
</body>

<%--添加修改弹框--%>
<%--添加修改弹框--%>
<div style="display: none;padding: 20px;" id="rentCarDiv">
    <form class="layui-form layui-row layui-col-space10" id="rentCarFrm" lay-filter="rentCarFrm" >
        <div class="layui-form-item magt3">
            <div class="layui-inline">
                <label class="layui-form-label">起租时间</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input"  id="begindate" name="begindate">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">还车时间</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" id="returndate" name="returndate" lay-verify="required">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">出租单号</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"  name="rentid" id="rentid" lay-verify="required" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">身份证号</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"  name="identity" id="identity" lay-verify="required" >
            </div>
        </div>
        <div class="layui-form-item magt3">
            <div class="layui-inline">
                <label class="layui-form-label">车牌号</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input"  id="carnumber" name="carnumber" lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出租价格</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="price" lay-verify="required">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">操作员</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="opername"  id="opername" lay-verify="required" >
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
<%--弹框结束--%>

<%--显示大图开始--%>
<div style="display: none;" id="showBigImg">
    <img alt="汽车图片" width="700px" height="350px" id="bigImg"/>
</div>
<%--显示大图结束--%>

<%--汽车分配角色弹框开始--%>
<div style="display: none;margin: 10px;" id="selectRentRoleDiv">
    <table class="layui-hide" id="roleTable" lay-filter="roleTable"></table>
</div>
<%--汽车分配角色弹框结束--%>
<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script>

    var rentTable;

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

        rentTable = table.render({
            elem: '#rentTable'
            ,id:'rentTable'
            ,url:'../rent/loadRentByPage.action'
            ,page:true
            ,limit:7
            ,limits:[7,14]
            ,cols: [[
                {type:'checkbox'}
                ,{field:'rentid', title:'出租单号',align:'center'}
                ,{field:'identity', title:'身份证号',align:'center'}
                ,{field:'carnumber', title:'车牌号',align:'center'}
                ,{title:'出租单状态',align:'center',
                    templet:function (d) {
                        if(d.rentflag==1){return '<div  style="color: green">已归还</div>';}

                        return '<div style="color: red">未归还</div>';
                    }}
                ,{field:'begindate', title:'起租时间',align:'center'}
                ,{field:'returndate', title:'还车时间',align:'center'}
                ,{field:'price', title:'出租价格',align:'center'}
                ,{field:'opername', title:'操作员',align:'center'}
                ,{field:'createtime', title:'c创建时间',align:'center'}
                ,{fixed:'right',title:'操作', toolbar: '#rentBar',align:'center',width:'10%'}
            ]]
            ,height:420
            ,text: {
                none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
            }
        });



        //搜索按钮
        form.on('submit(*)', function(data){
            var params = $("#dataFrm").serialize();
            rentTable.reload({
                url:'../rent/loadRentByPage.action?'+params,
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
        table.on('tool(rentTable)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除订单【'+data.rentid+'】吗?', {offset:'50px'},function(index){

                    //删除汽车
                    $.post('../rent/deleteRent.action?rentid='+data.rentid,function (resp) {
                        if(resp.code==0){
                            layer.close(index);
                            layer.msg(resp.msg);
                            rentTable.reload();
                        }else{
                            layer.msg(resp.msg);
                        }
                    })
                });
            } else if(obj.event === 'edit'){
                mainIndex = layer.open({
                    title:'修改汽车',
                    type:1,
                    offset:'5px',
                    area:['700px','480px'],
                    content:$("#rentCarDiv"),
                    success:function (layero, index) {
                        url = '../rent/updateRent.action';
                        form.val('rentCarFrm',data);
                    }
                });
            }else if(obj.event === 'viewImg'){
                layer.open({
                    type: 1
                    ,title: '车牌号【'+data.rentnumber+'】'
                    ,content: $("#showBigImg")
                    ,offset:'10px'
                    ,area: ['700px', '450px']
                    ,success:function (layero,index) {
                        $("#bigImg").attr("src","${ctx}/file/downloadShowFile.action?filepath="+data.rentimg);
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
                    rentTable.reload();
                }
            })

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

    })



</script>
</html>
