<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#openAlbumForm").form(
            'load','${pageContext.request.contextPath}/album/queryOne?id=${param.id}'
        )

        $("#openAlbumForm").form({
            onLoadSuccess(data){
                console.log(data);
                $("img").attr('src','${pageContext.request.contextPath}'+data.coverImg)
            }}
        )
    });




</script>

<div style="text-align: center">
    <form id="openAlbumForm" method="post" >
        <input type="hidden"  name="id">
        <div style="padding-top: 60px">
            名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：<input type="text" class="easyui-textbox" data-options="width:140,height:25" name="name">
        </div>
        <div style="padding-top: 15px">
            出版日期：<input type="text" class="easyui-datebox" data-options="width:140,height:25" name="publishDate">
        </div>
        <div style="padding-top: 15px">
            集&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数：<input type="text" class="easyui-textbox" data-options="width:140,height:25" name="count">
        </div>
        <div style="padding-top: 15px">
            封面图片：<input class="easyui-textbox" data-options="width:140,height:25,buttonAlign:'right'" name="coverImg">
            <div style="margin-top: 5px">
                <img width="50px" height="50px">
            </div>

        </div>
        <div style="padding-top: 15px">
            星&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：<input type="text" class="easyui-textbox" data-options="width:140,height:25" name="star">
         </div>
        <div style="padding-top: 15px">
            作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：<input type="text" class="easyui-textbox" data-options="width:140,height:25" name="author">
        </div>
        <div style="padding-top: 15px">
            播&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;音：<input type="text" class="easyui-textbox" data-options="width:140,height:25" name="broadCast">
        </div>
        <div style="padding-top: 15px">
            内容简介：<input type="text" class="easyui-textbox" data-options="width:140,height:25" name="brief">
        </div>

    </form>
</div>