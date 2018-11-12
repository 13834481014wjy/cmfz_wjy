<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function() {
        $("#articleDg").datagrid({
            url:"${pageContext.request.contextPath}/article/findAll",
            pagination:true,
            fitColumns:true,//列自适应整个容器
            resizeHandle:'left',//自定义调整列的宽度
            autoRowHeight:true,//自适应行高
            toolbar:"#tool2",
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
                {title:"内容",field:'content',width:120},
                {title:"所属上师",field:'guru_name',width:120,formatter:function (value,row,index) {
                        return row.guru.name;
                    }},
                {title:"出版日期",field:'publishDate',width:120}
            ]]
        });


    });


    //添加图片
    function addArticleDialog(){
        $("#saveArticleDg").dialog({
            href:'${pageContext.request.contextPath}/back/article/saveArticle.jsp',
            draggable:false,
            buttons:[
                {
                    text:'保存',
                    iconCls:"icon-save",
                    handler:function(){
                        //保存图片信息
                        $("#saveArticleForm").form('submit',{
                            url:'${pageContext.request.contextPath}/article/insert',
                            success:function (result) {
                                var parseJSON = $.parseJSON(result);
                                if(parseJSON.success){
                                    //提示信息
                                    $.messager.show({title:'提示',msg:"文章添加成功！！"});
                                }else{
                                    //提示信息
                                    $.messager.show({title:'提示',msg:parseJSON.message});
                                }
                                //关闭对话框
                                $("#saveArticleDg").dialog('close');
                                //刷新datagrid
                                $("#articleDg").datagrid('reload');
                            }
                        });
                    }
                },
                {
                    text:'关闭',
                    iconCls:"icon-cancel",
                    handler:function(){
                        $("#saveArticleDg").dialog('close');
                    }
                },
            ]
        });
    }


</script>


<table id="articleDg" class="easyui-datagrid" data-options="fit:true">

</table>

<%--创建工具栏--%>
<div id="tool2">
    <a href="#" onclick="addArticleDialog()" class="easyui-linkbutton"  data-options="iconCls:'icon-add'" >添加</a>
</div>

<%--添加图片--%>
<div id="saveArticleDg" data-options="width:600,height:450,iconCls:'icon-add',title:'添加文章'">

</div>

