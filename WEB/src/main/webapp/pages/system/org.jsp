<%--
  Created by IntelliJ IDEA.
  User: LT
  Date: 14-4-2
  Time: 下午6:22
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${ctx}/rs/plugins/ztree/css/metroStyle/metroStyle.css"/>
<script src="${ctx}/rs/jquery-easyui-1.5/src/jquery.parser.js"></script>
<script type="text/javascript" src="${ctx}/rs/plugins/ztree/jquery.ztree.all.min.js"></script>
<section class="content box box-primary easyui-layout" style="height:100%">
    <div data-options="region:'west',split:false,collapsible:false" style="width:20%">
        <div class="easyui-panel" title="组织架构" data-options="closable:false,fit:true">
            <div style="padding:5px 5px;">
                <a id="addChildBtn" href="javascript:void(0)" class="easyui-linkbutton"
                   data-options="iconCls:'icon-add'">添加下级</a>
                <a id="editOrgBtn" href="javascript:void(0)" class="easyui-linkbutton"
                   data-options="iconCls:'icon-edit'">修改</a>
                <a id="deleteOrgBtn" href="javascript:void(0)" class="easyui-linkbutton"
                   data-options="iconCls:'icon-remove'">删除</a>
            </div>
            <ul id="orgTree" class="easyui-tree"></ul>
        </div>
    </div>
    <div data-options="region:'center',title:'授权管理'" style="width:80%">
        <table id="userGrid" class="easyui-datagrid" toolbar="#toolbar">
        </table>
        <div id="toolbar" class="tool-bar">
        <span class="tool-btn">
            <a href="javascript:void(0)" class="easyui-linkbutton sys-button" iconCls="icon-add" plain="true"
               id="addBtn" code="user_add">新增</a>
            <a href="javascript:void(0)" class="easyui-linkbutton sys-button" iconCls="icon-edit" plain="true"
               id="editBtn" code="user_update">修改</a>
            <a href="javascript:void(0)" class="easyui-linkbutton sys-button" iconCls="icon-remove" plain="true"
               id="delBtn" code="user_delete">删除</a>
            <a href="javascript:void(0)" class="easyui-linkbutton sys-button" iconCls="icon-man" plain="true"
               id="setRoleBtn" code="user_set_role">设置角色</a>
        </span>
        </div>
    </div>
    <div id="orgWin" class="easyui-dialog" style="width:400px"
         closed="true" buttons="#dlg-buttons">
        <form id="orgForm" method="post" novalidate style="margin:0;padding:20px 50px">
            <input type="hidden" name="id">
            <input id="pid" type="hidden" name="pid">
            <div style="margin-bottom:10px">
                <input id="name" name="name" class="easyui-textbox" required="true" label="名称:"
                       style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input id='code' name="descp" class="easyui-textbox" required="true" label="描述:"
                       style="width:94%">
            </div>
        </form>
        <div id="dlg-buttons">
            <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" id="saveOrgBtn"
               style="width:90px">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
               onclick="javascript:$('#orgWin').window('close')" style="width:90px">取消</a>
        </div>
    </div>
</section>
<script type="text/javascript">
    $(function () {
        var orgTree = $("#orgTree").tree({
                    url: "${ctx}/org/loadTree.do?root=0",
                    lines: true,
                    loadFilter: function (data, parent) {
                        debugger;
                        var root = {
                            id: 0,
                            name: "组织架构",
                            children: LOEO.buildTreeData(data, 0)
                        };
                        return [root];
                    }, formatter: function (node) {
                        return node.name;
                    }
                }),
                orgForm = LOEO.initForm("orgForm", function (result) {
            if (result.state===LOEO.SUCCESS) {
                $('#orgWin').window('close');
                orgTree.tree("reload");
            }
            LOEO.messager(result.msg);
        });

        $("#addChildBtn").on("click", function () {
            var node = orgTree.tree("getSelected");
            if (node) {
                LOEO.openFormWin("orgWin", {
                    title: "新增组织"
                }, function () {
                    orgForm.form("clear")
                            .form({url: "${ctx}/org/add.do"})
                            .form("load", {pid: node.id});
                });
            } else {
                LOEO.messager("请选择上级组织！");
            }
        });

        $("#editOrgBtn").on("click", function () {
            var node = orgTree.tree("getSelected");
            if (node) {
                orgForm.form("load", node).form({url: "${ctx}/org/edit.do"});
                LOEO.openFormWin("orgWin", {
                    title: "修改组织"
                });
            } else {
                LOEO.messager("请选择一个组织！");
            }
        });

        $("#deleteOrgBtn").on("click", function () {
            var node = orgTree.tree("getSelected");
            if (node) {
                if (node.leaf === "false") {
                    LOEO.messager("非叶子节点不能删除！");
                    return;
                }
                $.messager.confirm('提示', '确定要删除吗?', function (r) {
                    if (r) {
                        $.post("${ctx}/org/delete.do", {
                            id: node.id
                        }, function (result) {
                            if (result.state===LOEO.SUCCESS) {
                                orgTree.tree("reload");
                            }
                            LOEO.messager(result.msg);
                        });

                    }
                });
            } else {
                LOEO.messager("请选择一行数据！");
            }
        });

        $("#saveOrgBtn").on("click", function () {
            orgForm.form("submit");
        });

    });
</script>

