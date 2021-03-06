<%--
  Created by IntelliJ IDEA.
  User: LT
  Date: 14-4-2
  Time: 下午6:22
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${ctx}/rs/jquery-easyui-1.5/src/jquery.parser.js"></script>
<section class="content box box-primary" style="height:100%">
    <table id="roleGrid" class="easyui-datagrid" toolbar="#toolbar">

    </table>
    <div id="toolbar" class="tool-bar">

        <span class="tool-btn">
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="addBtn" code="role_add">新增</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="editBtn" code="role_update">修改</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="delBtn" code="role_delete">删除</a>
        </span>
        <span class="search-box">
            <input type="text" class="easyui-textbox" id="s_name"
                   data-options="label:'角色名:',labelWidth:50,width:200">
            <a href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-search"
               id="searchBtn"></a>
        </span>
    </div>
    <div id="roleWin" class="easyui-dialog" style="width:400px"
         closed="true" buttons="#dlg-buttons">
        <form id="roleForm" method="post" novalidate style="margin:0;padding:20px 50px">
            <input type="hidden" name="id">
            <div style="margin-bottom:10px">
                <input id="name" name="name" class="easyui-textbox" required="true" label="角色名:"
                       style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input id='code' name="code" class="easyui-textbox" required="true" label="角色代码:"
                       style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input name="descp" class="easyui-textbox" label="描述:" style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input id='enable' name="enable" class="easyui-combobox" required="true" label="状态:" panelHeight="auto"
                       style="width:94%"
                       data-options="value:1,editable:false,valueField: 'id',textField: 'text',data:[{id:'1',text:'启用'},{id:'0',text:'禁用'}]"
                >
            </div>
        </form>
        <div id="dlg-buttons">
            <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" id="saveRoleBtn"
               style="width:90px">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
               onclick="javascript:$('#roleWin').window('close')" style="width:90px">取消</a>
        </div>
    </div>
</section>
<script type="text/javascript">
    $(function () {
        var roleGrid = LOEO.initGrid("roleGrid", {
            url: '${ctx}/role/list.do',
            columns: [[
                {field: 'id', title: 'id',hidden:true, width: 80, align: 'center'},
                {field: 'name', title: '角色名', width: 80, align: 'center'},
                {field: 'code', title: '角色代码', width: 100, align: 'center'},
                {field: 'descp', title: '描述', align: 'center', width: 60},
                {field: 'enable', title: '状态', width: 80, align: 'center',formatter:function(value) {
                    return LOEO.ENABLE[value];
                }},
                {field: 'createDt', title: '创建时间', align: 'center', width: 60},
                {field: 'createUser', title: '创建人', align: 'center', width: 60},
                {field: 'updateDt', title: '修改时间', align: 'center', width: 60},
                {field: 'updateUser', title: '修改人', align: 'center', width: 60}
            ]]
        });
        $("#searchBtn").on("click", function () {
            roleGrid.datagrid("load", {
                name: $("#s_name").textbox('getValue')
            });
        });

        var roleForm = LOEO.initForm("roleForm", function (result) {
            if (result.state===LOEO.SUCCESS) {
                $('#roleWin').window('close');
                roleGrid.datagrid("reload");
            }
            LOEO.messager(result.msg);
        });

        $("#addBtn").on("click", function () {
            LOEO.openFormWin("roleWin", {
                title: "新增用户"
            }, function () {
                roleForm.form("clear").form({url:"${ctx}/role/add.do"});
                $("#enable").combobox("setValue", "1");
            });
        });
        $("#editBtn").on("click", function () {
            var row = roleGrid.datagrid("getSelected");
            if (row) {
                roleForm.form("load", row).form({url:"${ctx}/role/edit.do"});
                $("#username").textbox({editable: false});
                $("#password").textbox("setValue", "");
                $("#password1").textbox("setValue", "");
                LOEO.openFormWin("roleWin", {
                    title: "修改用户"
                });
            } else {
                LOEO.messager("请选择一行数据！");
            }
        });

        $("#saveRoleBtn").on("click", function () {
            roleForm.form("submit");
        });

        $("#delBtn").on("click", function () {
            var row = roleGrid.datagrid("getSelected");
            if (row) {
                $.messager.confirm('提示', '确定要删除吗?', function (r) {
                    if (r) {
                        $.post("${ctx}/role/delete.do", {
                            id: row.id
                        }, function (result) {
                            if (result.state===LOEO.SUCCESS) {
                                roleGrid.datagrid("reload");
                            }
                            LOEO.messager(result.msg);
                        });

                    }
                });
            } else {
                LOEO.messager("请选择一行数据！");
            }
        });
    });
</script>

