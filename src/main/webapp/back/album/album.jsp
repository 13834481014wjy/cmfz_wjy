<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function() {
        $("#albumDg").treegrid({
            url:"${pageContext.request.contextPath}/album/findAll",
            idField:'id',
            treeField:'name',
            animate:true,
            onlyLeafCheck:true,
            pagination:true,
            fitColumns:true,//列自适应整个容器
            resizeHandle:'left',//自定义调整列的宽度
            autoRowHeight:true,//自适应行高
            toolbar:"#tool3",
            striped:true,//斑马线
            method:"GET",//请求方式
            loadMsg:"正在加载，请稍后。。。。",
            pageSize:10,//每页显示的记录数
            pageList:[2,4,10,20],//下拉列表的值
            columns:[[
                {title:"ckx",field:"ckx",checkbox:true},
                {title:"id",field:'id',hidden:true},
                {title:"名字",field:'name',width:120},
                {title:"下载路径",field:'downPath',width:120},
                {title:"章节大小",field:'size',width:120},
                {title:"章节时长",field:'duration',width:120}
            ]]

        });

    });

    //添加专辑
    function addAlbumDialog() {
        $("#saveAlbumDg").dialog({
            href:'${pageContext.request.contextPath}/back/album/saveAlbum.jsp',
            draggable:false,
            buttons:[
                {
                    text:'保存',
                    iconCls:"icon-save",
                    handler:function(){
                        //保存图片信息
                        $("#saveAlbumForm").form('submit',{
                            url:'${pageContext.request.contextPath}/album/insert',
                            success:function (result) {
                                var parseJSON = $.parseJSON(result);
                                if(parseJSON.success){
                                    //提示信息
                                    $.messager.show({title:'提示',msg:"专辑添加成功！！"});
                                }else{
                                    //提示信息
                                    $.messager.show({title:'提示',msg:parseJSON.message});
                                }
                                //关闭对话框
                                $("#saveAlbumDg").dialog('close');
                                //刷新
                                $("#albumDg").treegrid('reload');
                            }
                        });
                    }
                },
                {
                    text:'关闭',
                    iconCls:"icon-cancel",
                    handler:function(){
                        $("#saveAlbumDg").dialog('close');
                    }
                },
            ]
        })
    }

    //专辑详情
    function openAlbum() {
        var selectRow1=$("#albumDg").treegrid("getSelected");
        if(selectRow1!=null){
            if(selectRow1.size==null){
                    $("#openAlbumDg").dialog({
                        href:'${pageContext.request.contextPath}/back/album/openAlbum.jsp?id='+selectRow1.id,
                        buttons:[{
                            iconCls:'icon-cancel',
                            text:'关闭',
                            handler:function () {
                                $("#openAlbumDg").dialog('close');
                            }
                        }]
                    });
            }else{
                $.messager.show({title: '提示', msg: "请选择专辑！！"});
            }
        }else{
            $.messager.show({title: '提示', msg: "请选择一行！！"});
        }
    }

    //添加章节
    function addChapterDialog() {
        var selectRow1=$("#albumDg").treegrid("getSelected");
        if(selectRow1!=null){
            if(selectRow1.size==null){
                //添加章节
                    $("#saveChapterDg").dialog({
                        href:'${pageContext.request.contextPath}/back/album/saveChapter.jsp?id='+selectRow1.id,
                        draggable:false,
                        buttons:[
                            {
                                text:'保存',
                                iconCls:"icon-save",
                                handler:function(){
                                    //保存信息
                                    $("#saveChapterForm").form('submit',{
                                        url:'${pageContext.request.contextPath}/chapter/insert',
                                        success:function (result) {
                                            var parseJSON = $.parseJSON(result);
                                            if(parseJSON.success){
                                                //提示信息
                                                $.messager.show({title:'提示',msg:"章节添加成功！！"});
                                            }else{
                                                //提示信息
                                                $.messager.show({title:'提示',msg:parseJSON.message});
                                            }
                                            //关闭对话框
                                            $("#saveChapterDg").dialog('close');
                                            //刷新
                                            $("#albumDg").treegrid('reload');
                                        }
                                    });
                                }
                            },
                            {
                                text:'关闭',
                                iconCls:"icon-cancel",
                                handler:function(){
                                    $("#saveChapterDg").dialog('close');
                                }
                            },
                        ]
                    })
            }else{
                $.messager.show({title: '提示', msg: "请选择专辑！！"});
            }
        }else{
            $.messager.show({title: '提示', msg: "请选择一行！！"});
        }
    }

    
    //下载音频
    function uploadRadio() {
        var selectRow1=$("#albumDg").treegrid("getSelected");
        if(selectRow1!=null){
            if(selectRow1.size!=null){
                location.href="${pageContext.request.contextPath}/chapter/download?fileName="+selectRow1.downPath

            }else{
                $.messager.show({title: '提示', msg: "请选择章节！！"});
            }
        }else{
            $.messager.show({title: '提示', msg: "请选择一行！！"});
        }
    }

</script>


<table id="albumDg" class="easyui-treegrid" data-options="fit:true">

</table>

<%--创建工具栏--%>
<div id="tool3">
    <a href="#" class="easyui-linkbutton" onclick="openAlbum();" data-options="iconCls:'icon-tip'">专辑详情</a>
    <a href="#" class="easyui-linkbutton" onclick="addAlbumDialog();" data-options="iconCls:'icon-add'">添加专辑</a>
    <a href="#" class="easyui-linkbutton" onclick="addChapterDialog();" data-options="iconCls:'icon-add'">添加章节</a>
    <a href="#" class="easyui-linkbutton" onclick="uploadRadio();" data-options="iconCls:'icon-undo'">下载音频</a>
</div>
<%--添加专辑--%>
<div id="saveAlbumDg" data-options="width:600,height:450,iconCls:'icon-add',title:'添加专辑'">

</div>

<%--添加章节--%>
<div id="saveChapterDg" data-options="width:600,height:450,iconCls:'icon-add',title:'添加章节'">

</div>

<%--专辑详情--%>
<div id="openAlbumDg" data-options="width:600,height:450,iconCls:'icon-add',title:'专辑详情'">

</div>
