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
                <label class="layui-form-label">身份证号: </label>
                <div class="layui-input-inline">
                    <input type="text" name="identity" id="identity"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
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
    <div id="carTableDiv">
        <table id="carTable" lay-filter="carTable"></table>
    </div>
    <%--表格结束--%>

    <%--工具条开始--%>
    <script type="text/html" id="carBar">
        <a class="layui-btn layui-btn-green layui-btn-xs" lay-event="rentCar">出租汽车</a>
        <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="viewImg">查看大图</a>
    </script>
    <%--工具条结束--%>

</div>
</body>

<%--添加修改弹框--%>
<div style="display: none;padding: 20px;" id="rentCarDiv">
    <form class="layui-form layui-row layui-col-space10" id="rentCarFrm" lay-filter="rentCarFrm" >
        <div class="layui-form-item magt3">
            <div class="layui-inline">
                <label class="layui-form-label">起租时间</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" readonly id="begindate" name="begindate">
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
                <input type="text" class="layui-input" readonly name="rentid" id="rentid" lay-verify="required" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">身份证号</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" readonly name="identity" id="identity" lay-verify="required" >
            </div>
        </div>
        <div class="layui-form-item magt3">
            <div class="layui-inline">
                <label class="layui-form-label">车牌号</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" readonly id="carnumber" name="carnumber" lay-verify="required">
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
                <input type="text" class="layui-input" name="opername" readonly id="opername" lay-verify="required" >
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

<%--显示大图开始--%>
<div style="display: none;" id="showBigImg">
    <img alt="汽车图片" width="700px" height="350px" id="bigImg"/>
</div>
<%--显示大图结束--%>

<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script>

    var carTable;

    layui.use(['table','jquery','form','laydate'],function () {
        var $ = layui.jquery;
        var table = layui.table;
        var form  = layui.form;
        var laydate = layui.laydate;

        laydate.render({
           elem:'#begindate',
            type:'datetime'
        });
        laydate.render({
            elem:'#returndate',
            type:'datetime'
        });

        //搜索按钮
        form.on('submit(*)', function(data){
            // 先验证身份证号
            if($("#identity").val()==""||$("#identity").val()==""||$("#identity").val()==undefined){
                $("#carTableDiv").hide();
                layer.msg("请填写身份证号");
                return false;
            }
            $.post('${ctx}/customer/checkIdentity.action?identity='+$("#identity").val(),function (resp) {
                if(resp.code==0){
                    layer.msg("没有找到该客户,请添加该客户后重试");
                    $("#carTableDiv").hide();
                    return;
                }else{
                    $("#carTableDiv").show();
                    carTable = table.render({
                        elem: '#carTable'
                        ,id:'carTable'
                        ,toolbar: '#carToolBar'
                        ,url:'../car/loadCarByPage.action?isrenting=0'
                        ,page:true
                        ,limit:7
                        ,limits:[7,14]
                        ,cols: [[
                            {type:'checkbox'}
                            ,{field:'carnumber', title:'车牌号',align:'center'}
                            ,{field:'cartype', title:'类型',align:'center'}
                            ,{field:'color', title:'颜色',align:'center'}
                            ,{field:'price', title:'购买价格',align:'center'}
                            ,{field:'rentprice', title:'出租价格',align:'center'}
                            ,{field:'deposit', title:'出租押金',align:'center'}
                            ,{field:'description', title:'车辆描述',align:'center'}
                            ,{title:'缩略图',align:'center',templet:function (d) {
                                    return '<div><img width="40px" height="30px" src="${ctx}/file/downloadShowFile.action?filepath='+d.carimg+'"></div>';
                                }}
                            ,{ title:'出租状态',align:'center',
                                templet:function (d) {
                                    if(d.isrenting==1) return '<div style="color: red">已出租</div>';
                                    return '<div style="color: green">可出租</div>';
                                }
                            }
                            ,{fixed:'right',title:'操作', toolbar: '#carBar',align:'center',width:'20%'}
                        ]]
                        ,height:420
                        ,text: {
                            none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
                        }
                    });
                }
            })
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        var mainIndex;

        //监听行工具事件
        table.on('tool(carTable)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'rentCar'){
                mainIndex = layer.open({
                    title:'租用汽车',
                    type:1,
                    offset:'5px',
                    area:['800px','480px'],
                    content:$("#rentCarDiv"),
                    success:function (layero, index) {
                        $.post('../rent/initRentForm.action',{
                            carnumber:data.carnumber,
                            price:data.rentprice,
                            identity:$("#identity").val(),
                        },function (resp) {
                            form.val('rentCarFrm',resp);
                        })



                    }
                });
            }else if(obj.event === 'viewImg'){
                layer.open({
                    type: 1
                    ,title: '车牌号【'+data.carnumber+'】'
                    ,content: $("#showBigImg")
                    ,offset:'10px'
                    ,area: ['700px', '450px']
                    ,success:function (layero,index) {
                        $("#bigImg").attr("src","${ctx}/file/downloadShowFile.action?filepath="+data.carimg);
                    }
                });
            }
        });

        // 弹框表单提交
        form.on('submit(doSubmit)', function(data){
            $.post('../rent/addRent.action',data.field,function (resp) {
                if(resp.code<0){
                    layer.msg(resp.msg);
                }else{
                    layer.close(mainIndex);
                    table.reload();
                    layer.msg(resp.msg);
                }

            })

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

    })



</script>
</html>
