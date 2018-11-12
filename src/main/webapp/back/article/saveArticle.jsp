<%@page pageEncoding="UTF-8" isELIgnored="false" %>


<script>
    $(function () {
        $("#gName").combobox({
            url:'${pageContext.request.contextPath}/guru/findAllName',
            valueField: 'id',
            textField: 'name' ,
            /*formatter:function (row) {
                return row.name;
            }*/
        })
    })
</script>
<div style="text-align: center">
    <form id="saveArticleForm" method="post" enctype="multipart/form-data">
        <input type="hidden"  name="id">
        <div style="padding-top: 60px">
            标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：<input type="text" class="easyui-textbox" data-options="width:140,height:25" name="title">
        </div>
        <div style="padding-top: 15px">
            内&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;容：<input type="text" class="easyui-textbox" data-options="width:140,height:25" name="content">
        </div>
        <div style="padding-top: 15px">
            文章图片：<input class="easyui-filebox" data-options="width:140,height:25,buttonAlign:'right'" name="multipartFile">
        </div>
        <div style="padding-top: 15px">
            出版日期：<input type="text" class="easyui-datebox" data-options="width:140,height:25" name="publishDate">
        </div>
        <div style="padding-top: 15px">
            所属上师：<input type="text" id="gName" class="easyui-textbox" data-options="width:140,height:25" name="guru_id">
        </div>


    </form>
</div>