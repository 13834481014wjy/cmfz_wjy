<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function() {
        $("#guruDg").datagrid({
            url:"${pageContext.request.contextPath}/guru/findAll",
            pagination:true,
            fitColumns:true,//列自适应整个容器
            resizeHandle:'left',//自定义调整列的宽度
            autoRowHeight:true,//自适应行高
            toolbar:"#tool4",
            striped:true,//斑马线
            method:"GET",//请求方式
            loadMsg:"正在加载，请稍后。。。。",
            pagination:true,
            rownumbers:true,
            pageSize:10,//每页显示的记录数
            pageList:[2,4,10,20],//下拉列表的值
            columns:[[
                {title:"ckx",field:"ckx",checkbox:true},
                {title:"id",field:'id',width:120},
                {title:"姓名",field:'name',width:120},
                {title:"头像",field:'headPic',width:120},
                {title:"性别",field:'sex',width:120},
                {title:"状态",field:'status',width:120},
                {title:"options",field:"options",width:120,
                    formatter:function (value,row,index) {
                        return "<a href='#' onclick=\"delRow('"+row.id+"')\" class='options' data-options=\"iconCls:'icon-remove',plain:true\">删除</a>";
                    }}
            ]],
            onLoadSuccess:function () {
                $(".options").linkbutton();
            },
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}' + rowData.headPic + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>姓名: ' + rowData.name + '</p>' +
                    '<p>性别: ' + rowData.sex + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        });


    });


    //删除一行
    function delRow(id) {
        //获取当前id 发送ajax 删除这行信息
        $.post("${pageContext.request.contextPath}/guru/delete",{"id":id},function(result){//响应成功之后回调
            if (result.success){
                //提示信息
                $.messager.show({title:'提示',msg:"删除成功！！"});
            } else{
                //提示信息
                $.messager.show({title:'提示',msg:result.message});
            }

            //刷新datagrid数据
            $("#guruDg").datagrid('reload');
        });
    }


    //添加
    function addGuruDialog(){
        $("#saveGuruDg").dialog({
            href:'${pageContext.request.contextPath}/back/guru/saveGuru.jsp',
            buttons:[
                {
                    text:'保存',
                    iconCls:"icon-save",
                    handler:function(){
                        //保存图片信息
                        $("#saveGuruForm").form('submit',{
                            url:'${pageContext.request.contextPath}/guru/insert',
                            success:function (result) {
                                var parseJSON = $.parseJSON(result);
                                if(parseJSON.success){
                                    //提示信息
                                    $.messager.show({title:'提示',msg:"上师添加成功！！"});
                                }else{
                                    //提示信息
                                    $.messager.show({title:'提示',msg:parseJSON.message});
                                }
                                //关闭对话框
                                $("#saveGuruDg").dialog('close');
                                //刷新datagrid
                                $("#guruDg").datagrid('reload');
                            }
                        });
                    }
                },
                {
                    text:'关闭',
                    iconCls:"icon-cancel",
                    handler:function(){
                        $("#saveGuruDg").dialog('close');
                    }
                },
            ]
        });
    }
    //批量删除
    function delGuruDialog() {
        var rows = $("#guruDg").datagrid('getSelections');
        if (rows.length<=0){
            $.messager.show({title:'提示',msg:"至少选中一行！！"});
        }else{
            var ids=[];
            for (var i = 0; i <rows.length ; i++) {
                ids.push(rows[i].id);
            }

            //发送ajax请求
            $.ajax({
                url:"${pageContext.request.contextPath}/guru/deleteAll",
                type:"POST",
                traditional:true,// 传递数据类型的数据时必须设置这个属性
                data:{ids:ids},
                success:function (result) {
                    if(result){
                        //提示信息
                        $.messager.show({title:'提示',msg:"删除成功！！"});
                    }else{
                        //提示信息
                        $.messager.show({title:'提示',msg:"删除失败！！"});
                    }
                    //刷新datagrid
                    $("#guruDg").datagrid('reload');
                }

            })
        }

    }


</script>


<table id="guruDg" class="easyui-datagrid" data-options="fit:true">

</table>

<%--创建工具栏--%>
<div id="tool4">
    <a href="#" class="easyui-linkbutton" onclick="addGuruDialog();" data-options="iconCls:'icon-add'">添加</a>
    <a href="#" class="easyui-linkbutton" onclick="delGuruDialog();" data-options="iconCls:'icon-remove'">批量删除</a>
</div>
<%--添加--%>
<div id="saveGuruDg" data-options="width:600,height:450,iconCls:'icon-add',title:'添加上师'">

</div>

