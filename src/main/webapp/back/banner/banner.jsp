<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function() {
        $("#bannerDg").datagrid({
            url:"${pageContext.request.contextPath}/banner/queryAll",
            pagination:true,
            fitColumns:true,//列自适应整个容器
            resizeHandle:'left',//自定义调整列的宽度
            autoRowHeight:true,//自适应行高
            toolbar:"#tool",
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
                {title:"标题",field:'title',width:120},
                {title:"图片路径",field:'imgPath',width:120},
                {title:"描述",field:'description',width:120},
                {title:"状态",field:'status',width:120},
                {title:"上传时间",field:'createDate',width:120},
                {title:"options",field:"options",width:120,
                    formatter:function (value,row,index) {
                        return "<a href='#' onclick=\"delRow('"+row.id+"')\" class='options' data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;" +
                            "<a href='#' onclick=\"updateBanner('"+row.id+"')\" class='options' data-options=\"iconCls:'icon-edit',plain:true\">修改</a>"
                    }}
            ]],
            onLoadSuccess:function () {
                $(".options").linkbutton();
            },
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>description: ' + rowData.description + '</p>' +
                    '<p>Status: ' + rowData.status + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        });


    });

    //添加图片
    function addBannerDialog(){
        $("#saveBannerDg").dialog({
            href:'${pageContext.request.contextPath}/back/banner/saveBanner.jsp',
            draggable:false,
            buttons:[
                {
                    text:'保存',
                    iconCls:"icon-save",
                    handler:function(){
                        //保存图片信息
                        $("#saveBannerForm").form('submit',{
                            url:'${pageContext.request.contextPath}/banner/insert',
                            success:function (result) {
                                var parseJSON = $.parseJSON(result);
                                if(parseJSON.success){
                                    //提示信息
                                    $.messager.show({title:'提示',msg:"图片添加成功！！"});
                                }else{
                                    //提示信息
                                    $.messager.show({title:'提示',msg:parseJSON.message});
                                }
                                //关闭对话框
                                $("#saveBannerDg").dialog('close');
                                //刷新datagrid
                                $("#bannerDg").datagrid('reload');
                            }
                        });
                    }
                },
                {
                    text:'关闭',
                    iconCls:"icon-cancel",
                    handler:function(){
                        $("#saveBannerDg").dialog('close');
                    }
                },
            ]
        });
    }


    //删除一行
    function delRow(id) {
        //获取当前id 发送ajax 删除这行信息
        $.post("${pageContext.request.contextPath}/banner/delete",{"id":id},function(result){//响应成功之后回调
            if (result.success){
                //提示信息
                $.messager.show({title:'提示',msg:"图片删除成功！！"});
            } else{
                //提示信息
                $.messager.show({title:'提示',msg:result.message});
            }

            //刷新datagrid数据
            $("#bannerDg").datagrid('reload');
        });
    }

    //修改图片
    function updateBanner(id) {
        $("#updateBannerDialog").dialog({
            draggable:false,
            href:'${pageContext.request.contextPath}/back/banner/updateBanner.jsp?id='+id,
            buttons:[{
                iconCls:'icon-save',
                text:'修改',
                handler:function () {
                    //保存用户信息
                    $("#updateBannerForm").form('submit',{
                        url:'${pageContext.request.contextPath}/banner/update',
                        success:function (result) {
                            var parseJSON = $.parseJSON(result);
                            if(parseJSON.success){
                                //提示信息
                                $.messager.show({title:'提示',msg:"图片修改成功！！"});
                            }else{
                                //提示信息
                                $.messager.show({title:'提示',msg:parseJSON.message});
                            }
                            //关闭对话框
                            $("#updateBannerDialog").dialog('close');
                            //刷新datagrid
                            $("#bannerDg").datagrid('reload');
                        }
                    });
                }
            }, {
                iconCls:'icon-cancel',
                text:'关闭',
                handler:function () {
                    $("#updateBannerDialog").dialog('close');
                }
            }]
        });
    }

    //批量删除
    function delBannerDialog() {
        var rows = $("#bannerDg").datagrid('getSelections');
        if (rows.length<=0){
            $.messager.show({title:'提示',msg:"至少选中一行！！"});
        }else{
            var ids=[];
            for (var i = 0; i <rows.length ; i++) {
                ids.push(rows[i].id);
            }

            //发送ajax请求
            $.ajax({
                url:"${pageContext.request.contextPath}/banner/deleteAll",
                type:"POST",
                traditional:true,// 传递数据类型的数据时必须设置这个属性
                data:{ids:ids},
                success:function (result) {
                    if(result){
                        //提示信息
                        $.messager.show({title:'提示',msg:"图片删除成功！！"});
                    }else{
                        //提示信息
                        $.messager.show({title:'提示',msg:"图片删除失败！！"});
                    }
                    //刷新datagrid
                    $("#bannerDg").datagrid('reload');
                }

            })
        }

    }
</script>


<table id="bannerDg" class="easyui-datagrid" data-options="fit:true">

</table>

<%--创建工具栏--%>
<div id="tool">
    <a href="#" class="easyui-linkbutton" onclick="addBannerDialog();" data-options="iconCls:'icon-add'">添加</a>
    <a href="#" class="easyui-linkbutton" onclick="delBannerDialog();" data-options="iconCls:'icon-remove'">批量删除</a>
</div>
<%--添加图片--%>
<div id="saveBannerDg" data-options="width:600,height:450,iconCls:'icon-add',title:'上传图片'">

</div>
<%--修改对话框--%>
<div id="updateBannerDialog" data-options="draggable:false,iconCls:'icon-edit',title:'修改图片',width:600,height:400">

</div>
