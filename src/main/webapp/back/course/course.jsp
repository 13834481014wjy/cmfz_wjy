<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function() {
        $("#courseDg").datagrid({
            url:"${pageContext.request.contextPath}/course/findAll",
            pagination:true,
            fitColumns:true,//列自适应整个容器
            resizeHandle:'left',//自定义调整列的宽度
            autoRowHeight:true,//自适应行高
            toolbar:"#tool5",
            striped:true,//斑马线
            method:"GET",//请求方式
            loadMsg:"正在加载，请稍后。。。。",
            pagination:true,
            rownumbers:true,
            pageSize:10,//每页显示的记录数
            pageList:[2,4,10,20],//下拉列表的值
            columns:[[
                {title:"id",field:'id',width:120},
                {title:"标题",field:'title',width:120},
                {title:"标记",field:'flag',width:120},
                {title:"上传时间",field:'createTime',width:120},
                {title:"options",field:"options",width:120,
                    formatter:function (value,row,index) {
                        return "<a href='#' onclick=\"delRow('"+row.id+"')\" class='options' data-options=\"iconCls:'icon-remove',plain:true\">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;"
                    }}
            ]],
            onLoadSuccess:function () {
                $(".options").linkbutton();
            }
        });

    });

    //添加
    function addCourse() {
        $("#saveCourseDg").dialog({
            href:'${pageContext.request.contextPath}/back/course/saveCourse.jsp',
            draggable:false,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:function () {
                    $("#saveCourseForm").form('submit',{
                        url:'${pageContext.request.contextPath}/course/insert',
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
                            $("#saveCourseDg").dialog('close');
                            //刷新datagrid
                            $("#courseDg").datagrid('reload');
                        }
                    });
                }
            },{
                text:'关闭',
                iconCls:"icon-cancel",
                handler:function(){
                    $("#saveCourseDg").dialog('close');
                }
            }]
        })
    }
    //删除一行
    function delRow(id) {
        //获取当前id 发送ajax 删除这行信息
        $.post("${pageContext.request.contextPath}/course/delete",{"id":id},function(result){//响应成功之后回调
            if (result.success){
                //提示信息
                $.messager.show({title:'提示',msg:"功课删除成功！！"});
            } else{
                //提示信息
                $.messager.show({title:'提示',msg:result.message});
            }

            //刷新datagrid数据
            $("#courseDg").datagrid('reload');
        });
    }

</script>


<table id="courseDg" class="easyui-datagrid" data-options="fit:true">

</table>

<%--创建工具栏--%>
<div id="tool5">
    <a href="#" class="easyui-linkbutton" onclick="addCourse();" data-options="iconCls:'icon-add'">添加</a>
</div>
<%--添加--%>
<div id="saveCourseDg" data-options="width:600,height:450,iconCls:'icon-add',title:'添加功课'">

</div>



