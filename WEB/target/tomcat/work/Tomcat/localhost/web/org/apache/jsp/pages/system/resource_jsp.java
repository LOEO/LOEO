/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2017-02-08 16:53:30 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.pages.system;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class resource_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/rs/plugins/ztree/css/metroStyle/metroStyle.css\"/>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/rs/jquery-easyui-1.5/src/jquery.parser.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/rs/plugins/ztree/jquery.ztree.all.min.js\"></script>\r\n");
      out.write("<section class=\"content box box-primary easyui-layout\" style=\"height:100%\">\r\n");
      out.write("    <table id=\"resourceGrid\" class=\"easyui-treegrid\" toolbar=\"#toolbar\">\r\n");
      out.write("    </table>\r\n");
      out.write("    <div id=\"toolbar\" class=\"tool-bar\">\r\n");
      out.write("        <span class=\"tool-btn\">\r\n");
      out.write("            <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-add\" plain=\"true\" id=\"addBtn\" code=\"resource_add\">新增</a>\r\n");
      out.write("            <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-edit\" plain=\"true\" id=\"editBtn\" code=\"resource_update\">修改</a>\r\n");
      out.write("            <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-remove\" plain=\"true\" id=\"delBtn\" code=\"resource_delete\">删除</a>\r\n");
      out.write("        </span>\r\n");
      out.write("        <span class=\"search-box\">\r\n");
      out.write("            <input type=\"text\" class=\"easyui-textbox\" id=\"s_name\"\r\n");
      out.write("                   data-options=\"label:'资源名:',labelWidth:50,width:200\">\r\n");
      out.write("            <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" plain=\"true\" iconCls=\"icon-search\"\r\n");
      out.write("               id=\"searchBtn\"></a>\r\n");
      out.write("        </span>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div id=\"resourceWin\" class=\"easyui-dialog\" style=\"width:400px\"\r\n");
      out.write("         closed=\"true\" buttons=\"#dlg-buttons\">\r\n");
      out.write("        <form id=\"resourceForm\" method=\"post\" novalidate style=\"margin:0;padding:20px 50px\">\r\n");
      out.write("            <input type=\"hidden\" name=\"id\">\r\n");
      out.write("            <input type=\"hidden\" id=\"resourcePid\" name=\"pid\">\r\n");
      out.write("            <input type=\"hidden\" id=\"resourceIsLeaf\" name=\"isLeaf\">\r\n");
      out.write("            <div style=\"margin-bottom:10px\">\r\n");
      out.write("                <input id=\"name\" name=\"name\" class=\"easyui-textbox\" required=\"true\" label=\"资源名:\"\r\n");
      out.write("                       style=\"width:94%\" >\r\n");
      out.write("            </div>\r\n");
      out.write("            <div style=\"margin-bottom:10px\">\r\n");
      out.write("                <input id=\"resourceType\" name=\"type\" class=\"easyui-combobox\" required=\"true\" label=\"类型:\"\r\n");
      out.write("                       panelHeight=\"auto\"\r\n");
      out.write("                       style=\"width:94%\"\r\n");
      out.write("                       data-options=\"\"\r\n");
      out.write("                >\r\n");
      out.write("            </div>\r\n");
      out.write("            <div style=\"margin-bottom:10px;display:none;\">\r\n");
      out.write("                <input id='resourceLink' name=\"link\" class=\"easyui-textbox\" label=\"链接:\"\r\n");
      out.write("                       style=\"width:94%\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <div style=\"margin-bottom:10px\">\r\n");
      out.write("                <input name=\"iconCls\" class=\"easyui-textbox\" label=\"图标:\"\r\n");
      out.write("                       style=\"width:94%\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <div style=\"margin-bottom:10px\">\r\n");
      out.write("                <input name=\"code\" class=\"easyui-textbox\" label=\"代码:1\"\r\n");
      out.write("                       style=\"width:94%\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <div style=\"margin-bottom:10px\">\r\n");
      out.write("                <input name=\"orde\" class=\"easyui-textbox\" label=\"排序:\"\r\n");
      out.write("                       style=\"width:94%\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <div style=\"margin-bottom:10px\">\r\n");
      out.write("                <input id='enable' name=\"enable\" class=\"easyui-combobox\" required=\"true\" label=\"状态:\" panelHeight=\"auto\"\r\n");
      out.write("                       style=\"width:94%\"\r\n");
      out.write("                       data-options=\"value:1,editable:false,valueField: 'id',textField: 'text',data:[{id:'1',text:'启用'},{id:'0',text:'禁用'}]\"\r\n");
      out.write("                >\r\n");
      out.write("            </div>\r\n");
      out.write("            <div style=\"margin-bottom:10px\">\r\n");
      out.write("                <input name=\"descp\" class=\"easyui-textbox\" data-options=\"multiline:true\" label=\"描述:\"\r\n");
      out.write("                       style=\"width:94%\">\r\n");
      out.write("            </div>\r\n");
      out.write("        </form>\r\n");
      out.write("        <div id=\"dlg-buttons\">\r\n");
      out.write("            <a href=\"javascript:void(0)\" class=\"easyui-linkbutton c6\" iconCls=\"icon-ok\" id=\"saveResourceBtn\"\r\n");
      out.write("               style=\"width:90px\">保存</a>\r\n");
      out.write("            <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-cancel\"\r\n");
      out.write("               onclick=\"javascript:$('#resourceWin').window('close')\" style=\"width:90px\">取消</a>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</section>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    $(function () {\r\n");
      out.write("        var resourceGrid = LOEO.treeGrid(\"resourceGrid\",{\r\n");
      out.write("            url: '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resource/list.do',\r\n");
      out.write("            idField: 'id',\r\n");
      out.write("            treeField: 'name',\r\n");
      out.write("            useCustomIcon:true,\r\n");
      out.write("            checkbox:false,\r\n");
      out.write("            columns: [[\r\n");
      out.write("                {field: 'id', title: 'id', hidden: true, align: 'center'},\r\n");
      out.write("                {field: 'name', title: '资源名', align: 'center'},\r\n");
      out.write("                {field: 'link', title: '链接', width: 100, align: 'center'},\r\n");
      out.write("                {field: 'type', title: '类型', align: 'center', width: 60,formatter:function(value){\r\n");
      out.write("                    switch (value) {\r\n");
      out.write("                        case \"0\":return \"目录\";\r\n");
      out.write("                        case \"1\":return \"菜单\";\r\n");
      out.write("                        case \"2\":return \"按钮\";\r\n");
      out.write("                    }\r\n");
      out.write("                }},\r\n");
      out.write("                {field: 'pid', title: '父id', align: 'center', width: 60},\r\n");
      out.write("                {field: 'iconCls', title: '图标', align: 'center', width: 60,formatter:function(value) {\r\n");
      out.write("                    return '<i class=\"'+value+'\"></i>';\r\n");
      out.write("                }},\r\n");
      out.write("                {field: 'code', title: '代码', align: 'center', width: 60},\r\n");
      out.write("                {field: 'orde', title: '排序', align: 'center', width: 60},\r\n");
      out.write("                {field: 'isLeaf', title: '叶子节点', align: 'center', width: 60},\r\n");
      out.write("                {\r\n");
      out.write("                    field: 'enable', title: '状态', width: 80, align: 'center', formatter: function (value) {\r\n");
      out.write("                    return LOEO.ENABLE[value];\r\n");
      out.write("                }\r\n");
      out.write("                },\r\n");
      out.write("                {field: 'descp', title: '描述', align: 'center', width: 60},\r\n");
      out.write("                {field: 'createUser', title: '创建人', align: 'center'},\r\n");
      out.write("                {field: 'createDt', title: '创建时间', align: 'center'},\r\n");
      out.write("                {field: 'updateUser', title: '修改人', align: 'center'},\r\n");
      out.write("                {field: 'updateDt', title: '修改时间', align: 'center'}\r\n");
      out.write("            ]]\r\n");
      out.write("        });\r\n");
      out.write("        $(\"#searchBtn\").on(\"click\", function () {\r\n");
      out.write("            resourceGrid.datagrid(\"load\", {\r\n");
      out.write("                username: $(\"#s_username\").textbox('getValue')\r\n");
      out.write("            });\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("        var resourceForm = LOEO.initForm(\"resourceForm\", function (result) {\r\n");
      out.write("            if (result.state === LOEO.SUCCESS) {\r\n");
      out.write("                $('#resourceWin').window('close');\r\n");
      out.write("                resourceGrid.treegrid(\"reload\");\r\n");
      out.write("            }\r\n");
      out.write("            LOEO.messager(result.msg);\r\n");
      out.write("        });\r\n");
      out.write("        $(\"#resourceType\").combobox({\r\n");
      out.write("            editable: false,\r\n");
      out.write("            valueField: 'id',\r\n");
      out.write("            textField: 'text',\r\n");
      out.write("            data: [{id: '0', text: '目录'}, {id: '1', text: '菜单'}, {id: '2', text: '按钮'}],\r\n");
      out.write("            onSelect:function(selected) {\r\n");
      out.write("                debugger;\r\n");
      out.write("                if(selected.id!==\"0\"){\r\n");
      out.write("                    $(\"#resourceLink\").textbox({\r\n");
      out.write("                        required:true\r\n");
      out.write("                    }).parent().show().find(\"#resourceLink + span\").width(187).find(\"input\").width(187);\r\n");
      out.write("                }else{\r\n");
      out.write("                    $(\"#resourceLink\").hide().textbox({\r\n");
      out.write("                        required:false\r\n");
      out.write("                    }).parent().hide();\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        $(\"#addBtn\").on(\"click\", function () {\r\n");
      out.write("            var row = resourceGrid.datagrid(\"getSelected\");\r\n");
      out.write("            if(row && row.type===\"2\"){\r\n");
      out.write("                LOEO.messager(\"按钮下不能添加子节点！\");\r\n");
      out.write("                return;\r\n");
      out.write("            }\r\n");
      out.write("            LOEO.openFormWin(\"resourceWin\", {\r\n");
      out.write("                title: \"新增资源\"\r\n");
      out.write("            }, function () {\r\n");
      out.write("                debugger;\r\n");
      out.write("                $(\"#resourceType\").combobox(\"clear\");\r\n");
      out.write("                resourceForm.form(\"clear\").form({url:\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resource/add.do\"});\r\n");
      out.write("                $(\"#resourceLink\").parent().hide();\r\n");
      out.write("                var row = resourceGrid.treegrid(\"getSelected\");\r\n");
      out.write("                if (row) {\r\n");
      out.write("                    $(\"#resourcePid\").val(row.id);\r\n");
      out.write("                } else {\r\n");
      out.write("                    $(\"#resourcePid\").val(0);\r\n");
      out.write("                }\r\n");
      out.write("                $(\"#enable\").combobox(\"setValue\", \"1\");\r\n");
      out.write("            });\r\n");
      out.write("        });\r\n");
      out.write("        $(\"#editBtn\").on(\"click\", function () {\r\n");
      out.write("            var row = resourceGrid.datagrid(\"getSelected\");\r\n");
      out.write("            if (row) {\r\n");
      out.write("                resourceForm.form(\"load\", row).form({url:\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resource/edit.do\"});\r\n");
      out.write("                $(\"#username\").textbox({editable: false});\r\n");
      out.write("                $(\"#password\").textbox(\"setValue\", \"\");\r\n");
      out.write("                $(\"#password1\").textbox(\"setValue\", \"\");\r\n");
      out.write("                LOEO.openFormWin(\"resourceWin\", {\r\n");
      out.write("                    title: \"修改资源\"\r\n");
      out.write("                });\r\n");
      out.write("            } else {\r\n");
      out.write("                LOEO.messager(\"请选择一行数据！\");\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("        $(\"#saveResourceBtn\").on(\"click\", function () {\r\n");
      out.write("            resourceForm.form(\"submit\");\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("        $(\"#delBtn\").on(\"click\", function () {\r\n");
      out.write("            debugger;\r\n");
      out.write("            var row = resourceGrid.datagrid(\"getSelected\");\r\n");
      out.write("            if(row.isLeaf==0) {\r\n");
      out.write("                LOEO.messager(\"非叶子节点不能删除！\");\r\n");
      out.write("                return;\r\n");
      out.write("            }\r\n");
      out.write("            if (row) {\r\n");
      out.write("                $.messager.confirm('提示', '确定要删除吗?', function (r) {\r\n");
      out.write("                    if (r) {\r\n");
      out.write("                        $.post(\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resource/delete.do\", {\r\n");
      out.write("                            id: row.id,\r\n");
      out.write("                            pid:row.pid\r\n");
      out.write("                        }, function (result) {\r\n");
      out.write("                            debugger;\r\n");
      out.write("                            if (result.state === LOEO.SUCCESS) {\r\n");
      out.write("                                resourceGrid.treegrid(\"reload\");\r\n");
      out.write("                            }\r\n");
      out.write("                            LOEO.messager(result.msg);\r\n");
      out.write("                        });\r\n");
      out.write("\r\n");
      out.write("                    }\r\n");
      out.write("                });\r\n");
      out.write("            } else {\r\n");
      out.write("                LOEO.messager(\"请选择一行数据！\");\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    });\r\n");
      out.write("</script>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}