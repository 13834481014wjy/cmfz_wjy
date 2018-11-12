<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="text-align: center">
    <form id="saveAlbumForm" method="post" enctype="multipart/form-data">
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
            封面图片：<input class="easyui-filebox" data-options="width:140,height:25,buttonAlign:'right',required:'true'" name="multipartFile">
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