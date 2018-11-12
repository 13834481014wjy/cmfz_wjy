<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="text-align: center">
        <form id="saveCourseForm" method="post" >
        <div style="padding-top: 60px">
            标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：<input type="text" class="easyui-textbox" data-options="width:140,height:25" name="title">
        </div>

        <div style="padding-top: 15px">
            标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;记：<select type="text" class="easyui-combobox" name="flag" data-options="width:140,height:25">
                                                            <option value="必修">必修</option>
                                                            <option value="选修">选修</option>
                                                        </select>
        </div>


    </form>
</div>