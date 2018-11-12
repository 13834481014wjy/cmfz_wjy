<%@ page pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>持名法州主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/IconExtension.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/datagrid-detailview.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.etree.js"></script>
    <script type="text/javascript">

    var login="${sessionScope.admin}";
    if(login==""){
        location.href="${pageContext.request.contextPath}/back/admin/login.jsp";
    }
	<!--菜单处理-->
    $(function () {
        //页面加载完成后显示菜单数据
        $.post("${pageContext.request.contextPath}/menu/queryAllMenu",function (menu) {
            //通过Accordion的添加方法追加菜单
            //先遍历一级菜单
            $.each(menu,function (index,m) {
                //遍历二级菜单
                var content="<div style='text-align: center'>";
                $.each(m.children,function (idx,child) {
                    content+="<a onclick=\"addTabs('"+child.title+"','"+child.iconCls+"','"+child.href+"')\" style='width:95%;margin:10px 0;border:2px solid red' class='easyui-linkbutton' data-options=\"plain:true,iconCls:'"+child.iconCls+"'\">"+child.title+"</a><br>";
                });
                content+="</div>"
                $("#menu").accordion('add',{
                    title:m.title,
                    iconCls:m.iconCls,
                    content:content,
                });
            });

        });
    });

    function addTabs(title,iconCls,href) {
        if(!$("#tabs").tabs('exists',title)){
            $("#tabs").tabs('add',{
                title:title,
                iconCls:iconCls,
                closable:true,
                fit:true,
                href:"${pageContext.request.contextPath}/"+href,
            });
        }else{
            $("#tabs").tabs('select',title);
        }
    }


    /*修改密码*/
    function updateAdmin(){
        $("#updatePwdDialog").dialog({
            href:'${pageContext.request.contextPath}/back/admin/savePwd.jsp',
            buttons:[{
               iconCls:'icon-save',
               text:'修改',
               handler:function () {
                   $("#savePwdForm").form('submit',{
                       url:'${pageContext.request.contextPath}/admin/update',
                        success:function (result) {
                           location.href="${pageContext.request.contextPath}/"+result;
                            //关闭对话框
                            $("#updatePwdDialog").dialog('close');
                        }
                   });
               }
            },{
                iconCls:'icon-cancel',
                text:'关闭',
                handler:function () {
                    $("#updatePwdDialog").dialog('close');
                }
            }]


        })
    }
</script>

</head>
<body class="easyui-layout">
    <%--头部分--%>
    <div data-options="region:'north',split:true" style="height:60px;background-color: #5C160C">
        <div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" >持名法州后台管理系统</div>
        <div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">
            欢迎您:${sessionScope.admin.name} &nbsp;
            <a id="updateUserDialog" onclick="updateAdmin()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/admin/logout" class="easyui-linkbutton" data-options="iconCls:'icon-01'">退出系统</a>
        </div>
    </div>

    <%--尾部分--%>
    <div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
        <div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 htf@zparkhr.com.cn</div>
    </div>


    <%--左边部分--%>
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    	<div id="menu" class="easyui-accordion" data-options="fit:true">
		</div>  
    </div>

    <%--中间部分--%>
    <div data-options="region:'center'">
    	<div id="tabs" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
		    <div title="主页" data-options="iconCls:'icon-neighbourhood'" style="background-image:url(${pageContext.request.contextPath}/back/img/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%"></div>
		</div>  
    </div>

    <%--修改密码对话框--%>
    <div id="updatePwdDialog" data-options="href:'${pageContext.request.contextPath}/back/admin/savePwd.jsp',draggable:false,iconCls:'icon-edit',title:'修改密码',width:400,height:300">

    </div>

</body> 
</html>