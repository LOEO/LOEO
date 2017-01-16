<%--
  Created by IntelliJ IDEA.
  User: LT
  Date: 14-4-2
  Time: 下午6:22
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${ctx}/rs/jquery-easyui-1.5/src/jquery.parser.js"></script>
<style type="text/css">
    .datagrid-body > table{
        width:100%
    }
</style>
<section class="content box box-primary" style="height:100%">
    <table id="userGrid" class="easyui-datagrid" toolbar="#toolbar">
    </table>
    <div id="toolbar" class="tool-bar">

        <span class="tool-btn">
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="addBtn">新增</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="editBtn">修改</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="delBtn">删除</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-man" plain="true" id="setRoleBtn">设置角色</a>
        </span>
        <span class="search-box">
            <input type="text" class="easyui-textbox" id="s_username"
                   data-options="label:'用户名:',labelWidth:50,width:200">
            <a href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-search"
               id="searchBtn"></a>
        </span>
    </div>
    <div id="userWin" class="easyui-dialog" style="width:400px"
         closed="true" buttons="#dlg-buttons">
        <form id="userForm" method="post" novalidate style="margin:0;padding:20px 50px">
            <input type="hidden" name="id">
            <div style="margin-bottom:10px">
                <input id="username" name="username" class="easyui-textbox" required="true" label="用户名:"
                       style="width:94%" data-options="validType:'minLength[6]'">
            </div>
            <div style="margin-bottom:10px">
                <input id='password' name="password" class="easyui-passwordbox" required="true" label="密码:"
                       style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input id='password1' name="password1" class="easyui-passwordbox" required="true" label="确认密码:"
                       style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input name="nickname" class="easyui-textbox" required="true" label="姓名:" style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input name="birthday" class="easyui-datebox" required="true" label="生日:" editable="false"
                       style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input name="sex" class="easyui-combobox" required="true" label="性别:" panelHeight="auto"
                       style="width:94%"
                       data-options="editable:false,valueField: 'id',textField: 'text',data:[{id:'保密',text:'保密'},{id:'男',text:'男'},{id:'女',text:'女'}]"
                >
            </div>
            <div style="margin-bottom:10px">
                <input name="email" class="easyui-textbox" required="true" validType="email" label="邮箱:"
                       style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input name="phone" class="easyui-textbox" required="true" validType="phone" label="电话:"
                       style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input id='enable' name="enable" class="easyui-combobox" required="true" label="状态:" panelHeight="auto"
                       style="width:94%"
                       data-options="value:1,editable:false,valueField: 'id',textField: 'text',data:[{id:'1',text:'启用'},{id:'0',text:'禁用'}]"
                >
            </div>
        </form>
        <div id="dlg-buttons">
            <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" id="saveUserBtn"
               style="width:90px">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
               onclick="javascript:$('#userWin').window('close')" style="width:90px">取消</a>
        </div>
    </div>
    <div id="setUserWin" class="easyui-dialog" style="width:600px;height:400px"
         closed="true" buttons="#setUserWin-buttons">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'east',split:false" style="width:280px;">
                <div class="easyui-datalist" data-options="fit:true,title:'已有角色'" id="hasRoleList">
                </div>
            </div>
            <div data-options="region:'west',split:false" style="width:280px;">
                <div class="easyui-datalist" data-options="fit:true,title:'角色列表'" id="notHasRoleList">
                </div>
            </div>
            <div data-options="region:'center'">
                <div style="margin:100px 0;">
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="pagination-last" plain="true" id="addAllRoleBtn"></a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="pagination-next" plain="true" id="addRoleBtn"></a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="pagination-prev" plain="true" id="deleteRoleBtn"></a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="pagination-first" plain="true" id="deleteAllRoleBtn"></a>
                </div>
            </div>
        </div>
        <div id="setUserWin-buttons">
            <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" id="saveUserRoleBtn"
               style="width:90px">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
               onclick="javascript:$('#setUserWin').window('close')" style="width:90px">取消</a>
        </div>
    </div>
</section>
<script type="text/javascript">
    $(function () {
        var userGrid = LEO.initGrid("userGrid", {
            url: '${ctx}/user/list.do',
            columns: [[
                {field: 'id', title: 'id',hidden:true, width: 80, align: 'center'},
                {field: 'username', title: '用户名', width: 80, align: 'center'},
                {field: 'nickname', title: '姓名', width: 100, align: 'center'},
                {field: 'age', title: '年龄', align: 'center', width: 60},
                {field: 'birthday', title: '生日', align: 'center', width: 60},
                {field: 'sex', title: '性别', align: 'center', width: 60},
                {field: 'avatar', title: '头像', align: 'center', width: 60},
                {field: 'email', title: '邮箱', align: 'center', width: 60},
                {field: 'phone', title: '电话', align: 'center', width: 60},
                {field: 'enable', title: '状态', width: 80, align: 'center',formatter:function(value) {
                    return LEO.ENABLE[value];
                }},
                {field: 'createDt', title: '创建时间', align: 'center', width: 60},
                {field: 'createUser', title: '创建人', align: 'center', width: 60},
                {field: 'updateDt', title: '修改时间', align: 'center', width: 60},
                {field: 'updateUser', title: '修改人', align: 'center', width: 60}
            ]]
        });
        $("#searchBtn").on("click", function () {
            userGrid.datagrid("load", {
                username: $("#s_username").textbox('getValue')
            });
        });

        $('#password1').passwordbox({
            validType: ['minLength[6]', 'equals["#password","两次输入密码不一致！"]']
        });

        var userForm = LEO.initForm("userForm", "${ctx}/user/save.do", function (result) {
                    if (result.state === LEO.SUCCESS) {
                        $('#userWin').window('close');
                        userGrid.datagrid("reload");
                    }
                    LEO.messager(result.msg);
                }),
                notHasRoleList = $("#notHasRoleList").datalist({
                    singleSelect: false,
                    textField:"name",
                    valueField:"id",
                    fitColumn:true
                }),
                hasRoleList = $("#hasRoleList").datalist({
                    singleSelect: false,
                    textField:"name",
                    valueField:"id",
                    fitColumn:true
                });

        $("#addBtn").on("click", function () {
            LEO.openFormWin("userWin", {
                title: "新增用户"
            }, function () {
                userForm.form("clear");
                $("#enable").combobox("setValue", "1");
            });
        });
        $("#editBtn").on("click", function () {
            var row = userGrid.datagrid("getSelected");
            if (row) {
                userForm.form("load", row);
                $("#username").textbox({editable: false});
                $("#password").textbox("setValue", "");
                $("#password1").textbox("setValue", "");
                LEO.openFormWin("userWin", {
                    title: "修改用户"
                });
            } else {
                LEO.messager("请选择一行数据！");
            }
        });

        $("#saveUserBtn").on("click", function () {
            userForm.form("submit");
        });

        $("#delBtn").on("click", function () {
            var row = userGrid.datagrid("getSelected");
            if (row) {
                $.messager.confirm('提示', '确定要删除吗?', function (r) {
                    if (r) {
                        $.post("${ctx}/user/delete.do", {
                            id: row.id
                        }, function (result) {
                            if (result.state===LEO.SUCCESS) {
                                userGrid.datagrid("reload");
                            }
                            LEO.messager(result.msg);
                        });

                    }
                });
            } else {
                LEO.messager("请选择一行数据！");
            }
        });

        $("#setRoleBtn").on("click", function () {
            var row = userGrid.datagrid("getSelected");
            if(row) {
                notHasRoleList.datalist({
                    url:'${ctx}/role/getUserNotHasRoles.do?userId='+row.id
                });
                hasRoleList.datalist({
                    url:'${ctx}/role/getUserHasRoles.do?userId='+row.id
                });
                LEO.openFormWin("setUserWin",{
                    title:"设置角色"
                });
            }else {
                LEO.messager("请选择一行数据！");
            }
        });

        $("#addRoleBtn").on("click", function () {
            var rows = notHasRoleList.datalist("getSelections");
            if(rows && rows.length>0) {
                for(var i= 0,len=rows.length;i<len;i++) {
                    hasRoleList.datalist("appendRow",rows[i]);
                    notHasRoleList.datalist("deleteRow", notHasRoleList.datalist("getRowIndex",rows[i]));
                }
            }
        });

        $("#addAllRoleBtn").on("click", function () {
            debugger;
            var rows = notHasRoleList.datalist("getData").rows.slice(0);
            if(rows && rows.length>0) {
                for(var i= 0,len=rows.length;i<len;i++) {
                    hasRoleList.datalist("appendRow",rows[i]);
                    notHasRoleList.datalist("deleteRow", notHasRoleList.datalist("getRowIndex",rows[i]));
                }
            }
        });

        $("#deleteRoleBtn").on("click", function () {
            var rows = hasRoleList.datalist("getSelections");
            if(rows && rows.length>0) {
                for(var i= 0,len=rows.length;i<len;i++) {
                    notHasRoleList.datalist("appendRow",rows[i]);
                    hasRoleList.datalist("deleteRow", hasRoleList.datalist("getRowIndex",rows[i]));
                }
            }
        });

        $("#deleteAllRoleBtn").on("click", function () {
            debugger;
            var rows = hasRoleList.datalist("getData").rows.slice(0);
            if(rows && rows.length>0) {
                for(var i= 0,len=rows.length;i<len;i++) {
                    notHasRoleList.datalist("appendRow",rows[i]);
                    hasRoleList.datalist("deleteRow", hasRoleList.datalist("getRowIndex",rows[i]));
                }
            }
        });

        $("#saveUserRoleBtn").on("click",function() {
            var rows = hasRoleList.datagrid("getData").rows;
            var user = userGrid.datagrid("getSelected");
            if(rows) {
                $.post("${ctx}/user/saveUserRole.do",{roles:COMMON.json2str(rows),userId:user.id},function(result) {
                    if (result.state === LEO.SUCCESS) {
                        $("#setUserWin").window("close");
                    }
                    LEO.messager(result.msg);
                });
            }else{
                LEO.messager("没有设置角色");
            }
        });
    });
</script>

