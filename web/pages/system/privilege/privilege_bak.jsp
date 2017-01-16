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
    <div data-options="region:'west',split:false,collapsible:false" style="width:70%">
        <div class="easyui-tabs" style="width:100%;height:100%" id="tabs">
            <div title="角色" style="padding:0px" data-options="master:'role'">
                <table class="easyui-datagrid" id="roleGrid" toolbar="#toolbar">
                </table>
            </div>
            <div title="组织" style="padding:0px" data-options="master:'org'">
                <table class="easyui-datagrid" id="orgGrid" toolbar="#buttonToolbar">
                </table>
            </div>
            <div title="用户" style="padding:0px" data-options="master:'user'">
                <table class="easyui-datagrid" id="userGrid" toolbar="#buttonToolbar">
                </table>
            </div>
        </div>
    </div>
    <div data-options="region:'center',title:'授权管理',tools:'#tb'" style="width:30%">
        <ul id="menuTree" class="ztree"></ul>
    </div>
    <div id="tb">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true"
           id="savePrivilegeBtn"></a>
    </div>
</section>
<script type="text/javascript">
    $(function () {
        var roleGrid = LEO.initGrid("roleGrid", {
                    url: '${ctx}/role/list.do',
                    fit: true,
                    pageSize: 30,
                    columns: [[
                        {field: 'id', title: 'id', hidden: true, width: 80, align: 'center'},
                        {field: 'name', title: '角色名', width: 80, align: 'center'},
                        {field: 'code', title: '角色代码', width: 100, align: 'center'},
                        {field: 'descp', title: '描述', align: 'center', width: 60},
                        {
                            field: 'enable', title: '状态', width: 80, align: 'center', formatter: function (value) {
                            return LEO.ENABLE[value];
                        }
                        }
                    ]],
                    onSelect: function (index, row) {
                        loadTree({
                            master:"role",
                            masterValue:row.id
                        });
                    }
                }),
                userGrid = LEO.initGrid("userGrid", {
                    url: '${ctx}/user/list.do',
                    fit: true,
                    columns: [[
                        {field: 'id', title: 'id', hidden: true, width: 80, align: 'center'},
                        {field: 'username', title: '用户名', width: 80, align: 'center'},
                        {field: 'nickname', title: '姓名', width: 100, align: 'center'},
                        {field: 'age', title: '年龄', align: 'center', width: 60},
                        {
                            field: 'enable', title: '状态', width: 80, align: 'center', formatter: function (value) {
                            return LEO.ENABLE[value];
                        }
                        }
                    ]],
                    onSelect: function (index, row) {
                        loadTree({
                            master:"user",
                            masterValue:row.id
                        });
                    }
                });
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
                }
            },
            check: {
                enable: true
            }
        }, loadTree = function (params) {
            $.post("${ctx}/privilege/menuAndButtonList.do", params,function (data) {
                debugger;
                $.each(data, function (i, o) {
                    if (o.type === "button") {
                        o.id = "button_" + o.id;
                        o.name = o.name + "(按钮)";
                    }
                });
                menuTree = $.fn.zTree.init($("#menuTree"), treeSetting, data);
                menuTree.expandAll(true);
            });
        };
        $("#savePrivilegeBtn").on("click", function () {
            debugger;
            var curGrid,nodes = menuTree.getCheckedNodes(),
                    master = $("#tabs").tabs("getSelected").panel('options').master,
                    params = {
                        nodes: COMMON.json2str(nodes).replace(/button_/g,""),
                        master: master
                    };
            if (master === "role") {
                curGrid = roleGrid;
            } else if (master === "user") {
                curGrid = userGrid;
            }
            params.masterValue = curGrid.datagrid("getSelected").id;
            $.post("${ctx}/privilege/save.do", params, function (result) {
                LEO.messager(result.msg);
            });

        });
        $("#searchBtn").on("click", function () {
            roleGrid.datagrid("load", {
                name: $("#s_name").textbox('getValue')
            });
        });

        var roleForm = LEO.initForm("roleForm", "${ctx}/role/save.do", function (result) {
            if (result.state === LEO.SUCCESS) {
                $('#roleWin').window('close');
                roleGrid.datagrid("reload");
            }
            LEO.messager(result.msg);
        });

        $("#addBtn").on("click", function () {
            LEO.openFormWin("roleWin", {
                title: "新增用户"
            }, function () {
                roleForm.form("clear");
                $("#enable").combobox("setValue", "1");
            });
        });
        $("#editBtn").on("click", function () {
            var row = roleGrid.datagrid("getSelected");
            if (row) {
                roleForm.form("load", row);
                $("#username").textbox({editable: false});
                $("#password").textbox("setValue", "");
                $("#password1").textbox("setValue", "");
                LEO.openFormWin("roleWin", {
                    title: "修改用户"
                });
            } else {
                LEO.messager("请选择一行数据！");
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
                            if (result.state === LEO.SUCCESS) {
                                roleGrid.datagrid("reload");
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

