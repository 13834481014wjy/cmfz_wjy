<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="text-align: center">
    <form id="saveBannerForm" method="post" enctype="multipart/form-data">
        <input type="hidden"  name="id">
        <div style="padding-top: 60px">
            标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：<input type="text" class="easyui-textbox" data-options="width:140,height:25" name="title">
        </div>
        <div style="padding-top: 15px">
            图&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片：<input class="easyui-filebox" data-options="width:140,height:25,buttonAlign:'right'" name="imgOne">
        </div>
        <div style="padding-top: 15px">
            描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：<input type="text" class="easyui-textbox" data-options="width:140,height:25" name="description">
        </div>
        <div style="padding-top: 15px">
            状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：<select type="text" class="easyui-combobox" name="status" data-options="width:140,height:25">
                                                            <option value="显示">显示</option>
                                                            <option value="不显示">不显示</option>
                                                        </select>
        </div>
        <div style="padding-top: 15px">
            上传日期：<input type="text" class="easyui-datebox" data-options="width:140,height:25" name="createDate">
        </div>


    </form>
</div>