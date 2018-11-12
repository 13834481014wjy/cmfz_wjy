<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="text-align: center">
    <form id="savePwdForm" method="post">
        <input type="hidden"  name="id" value="${sessionScope.admin.id}">
        <div style="padding-top: 60px">
            用&nbsp;&nbsp;户&nbsp;&nbsp;名：<input type="text" readonly="readonly" class="easyui-textbox" name="username" value="${sessionScope.admin.name}">
        </div>
        <div style="padding-top: 15px">
            新&nbsp;&nbsp;密&nbsp;&nbsp;码：<input type="password" class="easyui-textbox"  name="password">
        </div>


    </form>
</div>