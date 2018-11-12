<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="text-align: center">
    <form id="saveGuruForm" method="post" enctype="multipart/form-data">
        <input type="hidden"  name="id">
        <div style="padding-top: 60px">
            姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" class="easyui-textbox" data-options="width:140,height:25" name="name">
        </div>
        <div style="padding-top: 15px">
            头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像：<input class="easyui-filebox" data-options="width:140,height:25,buttonAlign:'right'" name="imgThree">
        </div>
        <div style="padding-top: 15px">
            性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<select type="text" class="easyui-combobox" name="sex" data-options="width:140,height:25">
                                                            <option value="男">男</option>
                                                            <option value="女">女</option>
                                                        </select>
        </div>

        <div style="padding-top: 15px">
            状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：<select type="text" class="easyui-combobox" name="status" data-options="width:140,height:25">
                                                            <option value="y">显示</option>
                                                            <option value="x">不显示</option>
                                                        </select>
        </div>

    </form>
</div>