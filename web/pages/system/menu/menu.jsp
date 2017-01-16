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
    <div data-options="region:'west',split:false,collapsible:false" title="菜单树" style="width:15%">
        <ul id="menuTree" class="ztree"></ul>
    </div>
    <div data-options="region:'center',title:'菜单管理'">
        <table class="easyui-datagrid" id="menuGrid" toolbar="#toolbar" style="height: 60%">
        </table>
        <table class="easyui-datagrid" id="buttonGrid" toolbar="#buttonToolbar" style="height: 40%">
        </table>
    </div>
    <div id="toolbar" class="tool-bar">
        <span class="tool-btn">
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" id="addBtn">新增</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="editBtn">修改</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="delBtn">删除</a>
        </span>
    </div>
    <div id="buttonToolbar" class="tool-bar">
        <span class="tool-btn">
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true"
               id="addButtonBtn">新增</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
               id="editButtonBtn">修改</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
               id="delButtonBtn">删除</a>
        </span>
    </div>
    <div id="menuWin" class="easyui-dialog" style="width:400px"
         closed="true" buttons="#menu-win-buttons">
        <form id="menuForm" method="post" novalidate style="margin:0;padding:20px 50px">
            <input type="hidden" name="id">
            <input type="hidden" id="pid" name="pid"/>
            <input type="hidden" id="isLeaf" name="isLeaf"/>
            <div style="margin-bottom:10px">
                <input id="name" name="name" class="easyui-textbox" required="true" label="菜单名称:"
                       style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input id='url' name="link" class="easyui-textbox" required="true" label="菜单链接:"
                       style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input name="iconCls" class="easyui-textbox" label="图标:" style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input name="orde" class="easyui-numberbox" data-options="min:0" label="排序:" style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input id='enable' name="enable" class="easyui-combobox" required="true" label="状态:" panelHeight="auto"
                       style="width:94%"
                       data-options="value:1,editable:false,valueField: 'id',textField: 'text',data:[{id:'1',text:'启用'},{id:'0',text:'禁用'}]"
                >
            </div>
        </form>
        <div id="menu-win-buttons">
            <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" id="saveMenuBtn"
               style="width:90px">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
               onclick="javascript:$('#menuWin').window('close')" style="width:90px">取消</a>
        </div>
    </div>
    <div id="buttonWin" class="easyui-dialog" style="width:400px"
         closed="true" buttons="#button-win-buttons">
        <form id="buttonForm" method="post" novalidate style="margin:0;padding:20px 50px">
            <input type="hidden" name="id">
            <input type="hidden" id="menuId" name="menuId"/>
            <div style="margin-bottom:10px">
                <input name="name" class="easyui-textbox" required="true" label="按钮名称:"
                       style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input name="iconCls" class="easyui-textbox" label="按钮图标:" style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input name="clazz" class="easyui-textbox" label="按钮Class:" style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input name="script" class="easyui-textbox" label="按钮Script:" style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input name="orde" class="easyui-numberbox" data-options="min:0" label="排序:" style="width:94%">
            </div>
            <div style="margin-bottom:10px">
                <input id='btnEnable' name="enable" class="easyui-combobox" required="true" label="状态:"
                       panelHeight="auto"
                       style="width:94%"
                       data-options="value:1,editable:false,valueField: 'id',textField: 'text',data:[{id:'1',text:'启用'},{id:'0',text:'禁用'}]"
                >
            </div>
        </form>
        <div id="button-win-buttons">
            <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" id="saveButtonBtn"
               style="width:90px">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
               onclick="javascript:$('#buttonWin').window('close')" style="width:90px">取消</a>
        </div>
    </div>
</section>
<script type="text/javascript">
    $(function () {
        var menuTree, curTreeNode, treeSetting = {
                    view: {
                        dblClickExpand: false,
                        showLine: true,
                        selectedMulti: false
                    },
                    data: {
                        simpleData: {
                            enable: true,
                            idKey: "id",
                            pIdKey: "pid",
                            rootPId: "0"
                        },
                        key: {
                            name: "name"
                        }
                    },
                    callback: {
                        onClick: function (event, treeId, treeNode) {
                            curTreeNode = treeNode;
                            menuGrid.datagrid({
                                url: '${ctx}/menu/list.do',
                                queryParams: {
                                    pid: treeNode.id
                                }
                            });
                            buttonGrid.datagrid({
                                url: '${ctx}/button/list.do',
                                queryParams: {
                                    menuId: 0
                                }
                            });
                            //loadTree(treeId);
                        }
                    }
                },
                loadTree = function () {
                    $.post("${ctx}/menu/list.do", function (data) {
                        debugger;
                        menuTree = $.fn.zTree.init($("#menuTree"), treeSetting, data);
                        menuTree.expandAll(true);
                        if (curTreeNode) {
                            menuTree.selectNode(curTreeNode);
                            menuGrid.datagrid("reload");
                        }
                    });
                },
                menuGrid = LEO.initGrid("menuGrid", {
                    pagination: false,
                    columns: [[
                        {field: 'id', title: 'id',hidden:true, width: 80, align: 'center'},
                        {field: 'name', title: '菜单名称', width: 80, align: 'center'},
                        {field: 'link', title: '链接', width: 100, align: 'center'},
                        {field: 'iconCls', title: '图标', width: 80, align: 'center'},
                        {field: 'isLeaf', title: '是否叶子节点', width: 80, align: 'center'},
                        {field: 'orde', title: '排序', width: 80, align: 'center'},
                        {
                            field: 'enable', title: '状态', width: 80, align: 'center', formatter: function (value) {
                            return LEO.ENABLE[value];
                        }
                        },
                        {field: 'createDt', title: '创建时间', width: 80, align: 'center'},
                        {field: 'createUser', title: '创建人', width: 80, align: 'center'},
                        {field: 'updateDt', title: '修改时间', width: 80, align: 'center'},
                        {field: 'updateUser', title: '修改人', width: 80, align: 'center'}
                    ]],
                    onSelect: function (index, row) {
                        buttonGrid.datagrid("reload", {
                            menuId: row.id
                        });
                    }
                }),
                buttonGrid = LEO.initGrid("buttonGrid", {
                    title: "按钮管理",
                    pagination: false,
                    queryParams: {menuId: 0},
                    columns: [[
                        {field: 'id', title: 'id', hidden:true,width: 80, align: 'center'},
                        {field: 'name', title: '按钮名称', width: 80, align: 'center'},
                        {field: 'clazz', title: 'class', width: 100, align: 'center'},
                        {field: 'iconCls', title: '图标', width: 80, align: 'center'},
                        {field: 'script', title: 'script', width: 80, align: 'center'},
                        {field: 'orde', title: '排序', width: 80, align: 'center'},
                        {
                            field: 'enable', title: '状态', width: 80, align: 'center', formatter: function (value) {
                            return LEO.ENABLE[value];
                        }
                        },
                        {field: 'createDt', title: '创建时间', width: 80, align: 'center'},
                        {field: 'createUser', title: '创建人', width: 80, align: 'center'},
                        {field: 'updateDt', title: '修改时间', width: 80, align: 'center'},
                        {field: 'updateUser', title: '修改人', width: 80, align: 'center'}
                    ]]
                }),
                menuForm = LEO.initForm("menuForm", "${ctx}/menu/save.do", function (result) {
                    if (result.state === LEO.SUCCESS) {
                        $('#menuWin').window('close');
                        loadTree();
                    }
                    LEO.messager(result.msg);
                }),
                buttonForm = LEO.initForm("buttonForm", "${ctx}/button/save.do", function (result) {
                    if (result.state === LEO.SUCCESS) {
                        buttonGrid.datagrid("reload", {menuId: $("#menuId").val()});
                        $('#buttonWin').window('close');
                    }
                    LEO.messager(result.msg);
                });
        loadTree();
        $("#searchBtn").on("click", function () {
            menuGrid.datagrid("load", {
                name: $("#s_name").textbox('getValue')
            });
        });

        $("#addBtn").on("click", function () {
            if (!curTreeNode) {
                LEO.messager("请先选中一个父级菜单！");
                return;
            }
            LEO.openFormWin("menuWin", {
                title: "新增菜单"
            }, function () {
                menuForm.form("clear");
                $("#enable").combobox("setValue", "1");
                $("#isLeaf").val("1");
                $("#pid").val(curTreeNode.id);
            });
        });

        $("#editBtn").on("click", function () {
            var row = menuGrid.datagrid("getSelected");
            if (row) {
                menuForm.form("load", row);
                LEO.openFormWin("menuWin", {
                    title: "修改菜单"
                });
            } else {
                LEO.messager("请选择一行数据！");
            }
        });

        $("#saveMenuBtn").on("click", function () {
            menuForm.form("submit");
        });

        $("#delBtn").on("click", function () {
            var row = menuGrid.datagrid("getSelected");
            if (row) {
                $.messager.confirm('提示', '确定要删除吗?', function (r) {
                    if (r) {
                        $.post("${ctx}/menu/delete.do", {
                            id: row.id,
                            pid: row.pid
                        }, function (result) {
                            if (result.state === LEO.SUCCESS) {
                                loadTree();
                            }
                            LEO.messager(result.msg);
                        });

                    }
                });
            } else {
                LEO.messager("请选择一行数据！");
            }
        });

        $("#addButtonBtn").on("click", function () {
            var row = menuGrid.datagrid("getSelected");
            if (!row) {
                LEO.messager("请先选中一个菜单！");
                return;
            }
            LEO.openFormWin("buttonWin", {
                title: "新增按钮"
            }, function () {
                buttonForm.form("clear");
                $("#btnEnable").combobox("setValue", "1");
                $("#menuId").val(row.id);
            });
        });

        $("#editButtonBtn").on("click", function () {
            var row = buttonGrid.datagrid("getSelected");
            if (row) {
                buttonForm.form("load", row);
                LEO.openFormWin("buttonWin", {
                    title: "修改按钮"
                });
            } else {
                LEO.messager("请选择一行数据！");
            }
        });

        $("#saveButtonBtn").on("click", function () {
            buttonForm.form("submit");
        });

        $("#delButtonBtn").on("click", function () {
            var row = buttonGrid.datagrid("getSelected");
            if (row) {
                $.messager.confirm('提示', '确定要删除吗?', function (r) {
                    if (r) {
                        $.post("${ctx}/button/delete.do", {
                            id: row.id
                        }, function (result) {
                            if (result.state === LEO.SUCCESS) {
                                buttonGrid.datagrid("reload");
                            }
                            LEO.messager(result.msg);
                        });

                    }
                });
            } else {
                LEO.messager("请选择一行数据！");
            }
        });
    });
</script>

