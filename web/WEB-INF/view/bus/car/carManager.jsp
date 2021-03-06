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
                <label class="layui-form-label">车牌号: </label>
                <div class="layui-input-inline">
                    <input type="text" name="carnumber"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">车辆类型: </label>
                <div class="layui-input-inline">
                    <input type="text" name="cartype"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">车辆颜色: </label>
                <div class="layui-input-inline">
                    <input type="text" name="color" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item" >
            <div class="layui-inline">
                <label class="layui-form-label">车辆描述: </label>
                <div class="layui-input-inline">
                    <input type="text" name="description"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">是否出租</label>
                <div class="layui-input-block">
                    <input type="radio" name="isrenting" value="1" title="已出租">
                    <input type="radio" name="isrenting" value="0" title="可出租">
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
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="viewImg">查看大图</a>
    </script>
    <%--工具条结束--%>

</div>
</body>

<%--添加修改弹框--%>
<div style="display: none;padding: 20px;" id="saveOrUpdateDiv">
    <form class="layui-form layui-row layui-col-space10" id="saveOrUpdateFrm" lay-filter="saveOrUpdateFrm" >
        <div class="layui-col-md9 layui-col-xs7">
            <div class="layui-form-item magt3">
                <label class="layui-form-label">车牌号</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" id="carnumber" name="carnumber" lay-verify="required"
                           placeholder="请输入车牌号">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">车辆类型</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="cartype" lay-verify="required"
                           placeholder="请输入车辆类型">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">车辆颜色</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="color" lay-verify="required"
                           placeholder="请输入车辆颜色">
                </div>
            </div>
        </div>
        <div class="layui-col-md3 layui-col-xs5">
            <div class="layui-upload-list thumbBox mag0 magt3" id="carimgDiv">
                <img class="layui-upload-img thumbImg" id="showCarimg">
                <input type="hidden" name="carimg" id="carimg"/>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">购买价格: </label>
                <div class="layui-input-inline">
                    <input type="text" name="price"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出租价格: </label>
                <div class="layui-input-inline">
                    <input type="text" name="rentprice"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出租押金: </label>
                <div class="layui-input-inline">
                    <input type="text" name="deposit"   autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-block">
                <label class="layui-form-label">车辆描述: </label>
                <div class="layui-input-inline">
                    <input type="text" name="description"   autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">是否出租</label>
                <div class="layui-input-block">
                    <input type="radio" name="isrenting" value="1" title="已出租">
                    <input type="radio" name="isrenting" value="0" title="可出租">
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

<%--显示大图开始--%>
<div style="display: none;" id="showBigImg">
    <img alt="汽车图片" width="700px" height="350px" id="bigImg"/>
</div>
<%--显示大图结束--%>

<%--汽车分配角色弹框开始--%>
<div style="display: none;margin: 10px;" id="selectCarRoleDiv">
    <table class="layui-hide" id="roleTable" lay-filter="roleTable"></table>
</div>
<%--汽车分配角色弹框结束--%>
<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script>

    var carTable;

    layui.use(['table','jquery','form','upload'],function () {
        var $ = layui.jquery;
        var table = layui.table;
        var form  = layui.form;
        var upload = layui.upload;

        upload.render({
            elem: '#carimgDiv' //绑定元素
            ,acceptMime: 'image/*'
            ,size:200
            ,field:'mf'
            ,url: '${ctx}/file/upload.action' //上传接口
            ,done: function(res){
                //上传完毕回调
                $("#carimg").val(res.data.src);
                $("#showCarimg").attr("src",'${ctx}/file/downloadShowFile.action?filepath='+res.data.src);

            }
            ,error: function(){
                //请求异常回调
            }

        });

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
                    $("#carnumber").removeAttr("readonly");
                    $("#showCarimg").attr("src","${ctx}/file/downloadShowFile.action?filepath=images/defaultcarimage.jpg");
                    $("#saveOrUpdateFrm")[0].reset();
                    $('#carimg').val("/images/defaultcarimage.jpg");
                    mainIndex = layer.open({
                        title:'添加汽车',
                        type:1,
                        content:$("#saveOrUpdateDiv"),
                        offset:'5px',
                        area:['1100px','480px'],
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
                    layer.confirm('真的删除这【'+data.length+'】辆汽车吗?', {offset:'50px'},function(index){
                        var params = ""
                        $.each(data,function (index, item) {
                            if(index==0){
                                params+="ids="+item.carnumber;
                            }else{
                                params+="&ids="+item.carnumber;
                            }
                        })
                        $.post('../car/deleteBatchCar.action',params,function (resp) {
                            layer.msg(resp.msg);
                            if(resp.code==0){
                                layer.msg(resp.msg);
                                carTable.reload();
                            }
                        })
                    });
                    break;
            };
        });

        var roleTableIns;

        //监听行工具事件
        table.on('tool(carTable)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除汽车【'+data.carnumber+'】吗?', {offset:'50px'},function(index){

                    //删除汽车
                    $.post('../car/deleteCar.action?carnumber='+data.carnumber,function (resp) {
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
                    title:'修改汽车',
                    type:1,
                    offset:'5px',
                    area:['1100px','480px'],
                    content:$("#saveOrUpdateDiv"),
                    success:function (layero, index) {
                        url = '../car/updateCar.action';
                        form.val('saveOrUpdateFrm',data);
                        $("#showCarimg").attr("src","${ctx}/file/downloadShowFile.action?filepath="+data.carimg);
                        $('#carnumber').attr("readonly","readonly");
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
