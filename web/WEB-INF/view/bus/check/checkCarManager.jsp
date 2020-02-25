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
                <label class="layui-form-label">出租单号: </label>
                <div class="layui-input-inline">
                    <input type="text" name="rentid" id="rentid"   autocomplete="off" class="layui-input">
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


</div>
</body>

<%--check表单--%>

<div style="display: none;padding: 20px;" id="checkDiv">
    <blockquote class="layui-elem-quote">
    <form class="layui-form layui-row layui-col-space10" id="checkFrm" lay-filter="checkFrm" >
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
                    <input type="text" class="layui-input" readonly name="checkdate" lay-verify="required" >
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
                    <input type="text" class="layui-input" name="opername" readonly id="opername" lay-verify="required" >
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">问题描述</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容"  name="checkdesc" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <button class="layui-btn layui-btn-danger" lay-submit lay-filter="doSubmit" id="doSubmit">
                <i class="layui-icon layui-icon-ok"></i> 保存
            </button>
        </div>
    </form>

    </blockquote>

    <div style="padding: 20px; background-color: #F2F2F2;">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md4">
                <div class="layui-card">
                    <div class="layui-card-header">车辆信息</div>
                    <div class="layui-card-body">
                        <form class="layui-form" id="carform" lay-filter="carform">
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">车牌号</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="carnumber"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">车牌类型</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="cartype"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">车辆颜色</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="color"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">购买价格</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="price"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">出租价格</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="rentprice"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">出租押金</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="deposit"   lay-verify="required" >
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">车辆描述</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="description"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <img id="carimg" width="300" height="200"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="layui-col-md4">
                <div class="layui-card">
                    <div class="layui-card-header">出租单</div>
                    <div class="layui-card-body">
                        <form class="layui-form" id="rentform" lay-filter="rentform">
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">出租单号</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="rentid"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">出租价格</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="price"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">起租时间</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="begindate"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">还车时间</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="returndate"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">操作员</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="opername"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="layui-col-md4">
                <div class="layui-card">
                    <div class="layui-card-header">客户信息</div>
                    <div class="layui-card-body">
                        <form class="layui-form" id="custform" lay-filter="custform">
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">身份证号</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="identity"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">客户姓名</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="custname"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">客户性别</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="sex" id="sex"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">客户地址</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="address"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">客户电话</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="phone"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">客户职位</label>
                                    <div class="layui-input-block">
                                        <input type="text" class="layui-input" readonly name="career"   lay-verify="required" >
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
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

    layui.use(['jquery','form','laydate'],function () {
        var $ = layui.jquery;
        var form  = layui.form;
        var laydate = layui.laydate;

        /*laydate.render({
           elem:'#begindate',
            type:'datetime'
        });
        laydate.render({
            elem:'#returndate',
            type:'datetime'
        });*/

        //搜索按钮
        form.on('submit(*)', function(data){
            if($("#rentid").val()==""||$("#rentid").val()==""||$("#rentid").val()==undefined){
                $("#checkDiv").hide();
                layer.msg("请填写出租单号");
                return false;
            }
            $.post('${ctx}/checkCar/checkRentExsit.action?rentid='+$("#rentid").val(),function (resp) {
                if(resp.code<0){
                    layer.msg("抱歉，没有找到该出租单号");
                    $("#checkDiv").hide();
                    return false;
                }else{
                    if(resp.code==1){
                        layer.msg(resp.msg);
                        $("#checkDiv").hide();
                        return false;
                    }
                    $.post('../checkCar/initCheckCarForm.action?rentid='+$("#rentid").val(),function (resp) {
                        var check = resp.check;
                        var rent = resp.rent;
                        var car = resp.car;
                        var customer = resp.customer;


                        form.val('checkFrm',check);
                        form.val('carform',car);
                        form.val('rentform',rent);
                        form.val('custform',customer);
                        $("#carimg").attr("src","${ctx}/file/downloadShowFile.action?filepath="+car.carimg);
                        $("#sex").val(customer.sex==1?'男':'女');
                        form.val('');
                        $("#checkDiv").show();
                    })


                }
            })
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        var mainIndex;

        // 弹框表单提交
        form.on('submit(doSubmit)', function(data){
            $.post('../check/addCheck.action',data.field,function (resp) {
                if(resp.code<0){
                    layer.msg(resp.msg);
                }else{
                    $("#checkDiv").hide();
                    layer.msg(resp.msg);
                }

            })

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

    })



</script>
</html>
