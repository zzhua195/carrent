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
                <label class="layui-form-label">标题: </label>
                <div class="layui-input-inline">
                    <input type="tel" name="title"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">内容: </label>
                <div class="layui-input-inline">
                    <input type="tel" name="content"  autocomplete="off" class="layui-input">
                </div>
            </div>


        </div>
        <div class="layui-form-item" >
            <div class="layui-inline">
                <label class="layui-form-label">开始时间: </label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="starttime" id="starttime" >
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">结束时间: </label>
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
    <table id="newsTable" lay-filter="newsTable"></table>
    <%--表格结束--%>

    <%--头工具条开始--%>
    <script type="text/html" id="newsToolBar">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
            <button class="layui-btn layui-btn-sm" lay-event="deleteBatchNews">批量删除</button>
        </div>
    </script>
    <%--头工具条结束--%>

    <%--工具条开始--%>
    <script type="text/html" id="newsBar">
        <a class="layui-btn layui-btn-normal layui-btn-xs " lay-event="viewNews">查看</a>
        <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <%--工具条结束--%>

</div>
</body>

<%--添加和修改公告弹框开始--%>
<div style="display:none;padding: 20px;" id="saveOrUpdateDiv">
    <form class="layui-form" id="saveOrUpdateFrm" lay-filter="saveOrUpdateFrm">
        <input type="hidden" name="id">
        <div class="layui-form-item" >
            <label class="layui-form-label">标题: </label>
            <div class="layui-input-block">
                <input type="text" name="title" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" >
            <label class="layui-form-label">内容: </label>
            <div class="layui-input-block">
                <textarea id="content" name="content" style="display: none;height: 100px;"></textarea>
            </div>
        </div>
        <div class="layui-form-item" >
            <div class="layui-block" style="text-align: center;">
                <button class="layui-btn layui-btn-warm" lay-submit lay-filter="doSubmit" id="doSubmit">
                    <i class="layui-icon">&#xe615;</i> 提交
                </button>
                <button type="reset" class="layui-btn layui-btn-normal" id="resetFrm">
                    <i class="layui-icon">&#xe666;</i>重置
                </button>
            </div>
        </div>
    </form>
</div>
<%--添加和修改公告弹框开始--%>

<%--查看公告--%>
<div style="display: none;padding: 5px;" id="viewNewsDiv">
    <h2 id="title" align="center"></h2>

    <div style="float: right;font-size: 10px;color: grey;">
        发布人: <span id="s1"></span> <span style="display: inline-block;width: 20px" ></span>
        发布时间: <span id="s2"></span>
    </div>
    <hr/>
    <div id="s3">
    </div>
</div>
<%--查看公告--%>
<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script>

    var newsTable;

    layui.use(['table','jquery','form','laydate','layedit'],function () {
        var $ = layui.jquery;
        var table = layui.table;
        var form  = layui.form;
        var laydate = layui.laydate,layedit= layui.layedit;
        newsTable = table.render({
            elem: '#newsTable'
            ,id:'newsTable'
            ,toolbar: '#newsToolBar'
            ,url:'../news/loadNewsByPage.action'
            ,page:true
            ,limit:7
            ,limits:[7,14]
            ,cols: [[
                {type:'checkbox'}
                ,{field:'id', title:'ID',align:'center'}
                ,{field:'title', title:'公告标题',align:'center'}
                ,{title:'发布时间',align:'center',
                    templet:"<div>{{layui.util.toDateString(d.createtime, 'yyyy/MM/dd HH:mm:ss')}}</div>"
                }
                ,{field:'opername', title:'发布人',align:'center'}
                ,{fixed:'right',title:'操作', toolbar: '#newsBar',align:'center'}
            ]]
            ,height:420
            ,text: {
                none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
            }
        });

        laydate.render({
            elem:'#starttime',
            type:'datetime'
        });

        laydate.render({
            elem:'#endtime',
            type:'datetime'
        });

        //搜索按钮
        form.on('submit(*)', function(data){
            var params = $("#dataFrm").serialize();
            newsTable.reload({
                url:'../news/loadNewsByPage.action?'+params,
                page:{
                    curr:1
                }
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        var mainIndex;
        var url;

        var editbox;

        //监听头工具条事件
        table.on('toolbar(newsTable)', function(obj){
            switch(obj.event){
                case 'add':
                    $("#saveOrUpdateFrm")[0].reset();
                    mainIndex = layer.open({
                        title:'添加公告',
                        type:1,
                        content:$("#saveOrUpdateDiv"),
                        offset:'10px',
                        area:['700px','450px'],
                        success:function (layero, index) {
                            editbox = layedit.build('content',{
                                height:200
                            });
                            url='../news/addNews.action';
                            mainIndex = index;
                        }
                    });
                    break;
                case 'deleteBatchNews':
                    // 获取选中行的数据
                    var checkStatus = table.checkStatus(obj.config.id);
                    var data = checkStatus.data;
                    layer.confirm('真的删除这【'+data.length+'】条公告吗?', function(index){
                        var params = ""
                        $.each(data,function (index, item) {
                            if(index==0){
                                params+="ids="+item.id;
                            }else{
                                params+="&ids="+item.id;
                            }
                        })
                        $.post('../news/deleteBatchNews.action',params,function (resp) {
                            layer.msg(resp.msg);
                            if(resp.code==0){
                                layer.msg(resp.msg);
                                newsTable.reload();
                            }
                        })

                    });

                    break;
            };
        });

        $("#resetFrm").click(function () {
            layedit.setContent(editbox,"");
        });

        //监听行工具事件
        table.on('tool(newsTable)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除公告【'+data.title+'】吗?', function(index){

                    //删除公告
                    $.post('../news/deleteNews.action?id='+data.id,function (resp) {
                        if(resp.code==0){
                            layer.close(index);
                            layer.msg(resp.msg);
                            newsTable.reload();
                        }else{
                            layer.msg(resp.msg);
                        }
                    })
                });
            } else if(obj.event === 'edit'){
                mainIndex = layer.open({
                    title:'修改公告',
                    type:1,
                    content:$("#saveOrUpdateDiv"),
                    offset:'10px',
                    area:['700px','450px'],
                    success:function (layero, index) {
                        editbox = layedit.build('content',{
                            height:200
                        });
                        url = '../news/updateNews.action?newsid='+data.newsid;
                        form.val('saveOrUpdateFrm',data);
                    }
                });
            }else if(obj.event === 'viewNews'){
                layer.open({
                    title:'查看【'+data.title+'】公告',
                    type:1,
                    content:$("#viewNewsDiv"),
                    offset:'10px',
                    area:['700px','450px'],
                    success:function (layero, index) {
                        $('#title').html(data.title);
                        $('#s1').html(data.opername);
                        $('#s2').html(formatDateTime(data.createtime));
                        $('#s3').html(data.content);
                    }
                });
            }
        });

            //时间格式化: 时间戳转日期时间
            function formatDateTime(inputTime) {
                var date = new Date(inputTime);
                var y = date.getFullYear();
                var m = date.getMonth() + 1;
                m = m < 10 ? ('0' + m) : m;
                var d = date.getDate();
                d = d < 10 ? ('0' + d) : d;
                var h = date.getHours();
                h = h < 10 ? ('0' + h) : h;
                var minute = date.getMinutes();
                var second = date.getSeconds();
                minute = minute < 10 ? ('0' + minute) : minute;
                second = second < 10 ? ('0' + second) : second;
                return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;
            };


        // 弹框表单提交
        form.on('submit(doSubmit)', function(data){
            layedit.sync(editbox);// 同步编辑器中内容到定义的文本域中
            var params = $("#saveOrUpdateFrm").serialize();
            $.post(url,params,function (resp) {
                if(resp.code<0){
                    layer.msg(resp.msg);
                }else{
                    layer.close(mainIndex);
                    newsTable.reload();
                }
            })

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

    })



</script>
</html>
