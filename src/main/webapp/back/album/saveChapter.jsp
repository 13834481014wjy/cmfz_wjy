<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="text-align: center">
    <form id="saveChapterForm" method="post" enctype="multipart/form-data">
        <input type="hidden"  name="id">
        <div style="padding-top: 60px">
            名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：<input type="text" class="easyui-textbox" data-options="width:140,height:25" name="name">
        </div>
        <div style="padding-top:  15px">
            下载路径：<input type="text" class="easyui-filebox" data-options="width:140,height:25" name="multipartFile">
        </div>
        <div style="padding-top: 15px">
            下载时间：<input type="text" class="easyui-datebox" data-options="width:140,height:25" name="uploadTime">
        </div>
        <div style="padding-top: 60px">
           <input type="hidden"  data-options="width:140,height:25" name="album_id" value="${param.id}">
        </div>

    </form>
</div>