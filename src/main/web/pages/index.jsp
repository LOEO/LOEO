<%--
  Created by IntelliJ IDEA.
  User: LT
  Date: 14-4-2
  Time: 下午6:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!-- Ionicons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- jvectormap -->
<%@include file="common/head.jsp" %>
<!-- ADD THE CLASS sidedar-collapse TO HIDE THE SIDEBAR PRIOR TO LOADING THE SITE -->

<body class="hold-transition skin-blue sidebar-expand sidebar-mini fixed">
<!-- Site wrapper -->
<div class="wrapper">
    <%@include file="common/main_header.jsp" %>


    <!-- =============================================== -->

    <!-- Left side column. contains the sidebar -->

    <%@include file="common/left_menu.jsp" %>
    <!-- =============================================== -->
    <div class="content-wrapper" id="content-wrapper">
        <ol class="breadcrumb" style="margin-bottom: 0px">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Layout</a></li>
            <li class="active">Fixed</li>
        </ol>

        <section class="content" id="main-content" style="padding: 0;height: 100%">
            <%--<iframe id="mainframe"  src="" style="width:100%;height:100%;border: 0px;"></iframe>--%>
        </section>
    </div>

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 2.3.3
        </div>
        <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
        reserved.
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
            <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane" id="control-sidebar-home-tab">
                <h3 class="control-sidebar-heading">Recent Activity</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                                <p>Will be 23 on April 24th</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-user bg-yellow"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                                <p>New phone +1(800)555-1234</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                                <p>nora@example.com</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <i class="menu-icon fa fa-file-code-o bg-green"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                                <p>Execution time 5 seconds</p>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

                <h3 class="control-sidebar-heading">Tasks Progress</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Custom Template Design
                                <span class="label label-danger pull-right">70%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Update Resume
                                <span class="label label-success pull-right">95%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Laravel Integration
                                <span class="label label-warning pull-right">50%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <h4 class="control-sidebar-subheading">
                                Back End Framework
                                <span class="label label-primary pull-right">68%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

            </div>
            <!-- /.tab-pane -->
            <!-- Stats tab content -->
            <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <form method="post">
                    <h3 class="control-sidebar-heading">General Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Report panel usage
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Some information about this general settings option
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Allow mail redirect
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Other sets of options are available
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Expose author name in posts
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Allow the user to show his name in blog posts
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <h3 class="control-sidebar-heading">Chat Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Show me as online
                            <input type="checkbox" class="pull-right" checked>
                        </label>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Turn off notifications
                            <input type="checkbox" class="pull-right">
                        </label>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Delete chat history
                            <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                        </label>
                    </div>
                    <!-- /.form-group -->
                </form>
            </div>
            <!-- /.tab-pane -->
        </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>

<!-- ./wrapper -->
<%@include file="common/foot.jsp" %>

<script type="text/javascript">
    $(document).ajaxStart(function() { Pace.restart(); });
    $(function () {
        var expandIconTpl = '<i class="fa fa-angle-left pull-right"></i>';
        var menuItemTpl = '<li><a href="javascript:void(0);" data-url="[[url]]"  id="[[id]]"><i class="[[iconCls]]"></i> <span> [[name]]</span>[[expandIcon]]</a></li>';
        var treeMenuTpl = '<ul class="treeview-menu"></ul>';
        function buildMenuTree($menu,menus,pid) {
            var i= 0,len=menus.length,curMenu,$curMenu;
            for(;i<len;i++) {
                curMenu = menus[i];
                if(curMenu.pid===pid) {
                    //如果菜单是叶子节点或者配置了link则不再继续递归
                    if(curMenu.isLeaf===1 || curMenu.link) {
                        $curMenu = $(buildMenuHtml(curMenu, menuItemTpl));
                        $curMenu.find("a").addClass("leo_menu");
                    }else{
                        if($menu.hasClass("treeview-menu") || $menu.hasClass("treeview")){
                            $curMenu = $(buildMenuHtml(curMenu, menuItemTpl,expandIconTpl)).append(treeMenuTpl);
                        }else{
                            $curMenu = $(buildMenuHtml(curMenu, menuItemTpl,expandIconTpl)).append(treeMenuTpl).addClass("treeview");
                        }
                        buildMenuTree($curMenu.find(".treeview-menu"),menus,curMenu.id);
                    }
                    $menu.append($curMenu);
                }
            }
        }

        function buildMenuHtml(menu,tpl,expandIcon) {
            return tpl
                    .replace("[[url]]","${ctx}"+menu.link)
                    .replace("[[iconCls]]",menu.iconCls)
                    .replace("[[name]]",menu.name)
                    .replace("[[id]]","menu_"+menu.id)
                    .replace("[[expandIcon]]",expandIcon||'');
        }
        $.post("${ctx}/privilege/getUserResource.do",function(data) {
            debugger;
            buildMenuTree($("#mainMenu"), data, 0);

            $(".leo_menu").on("click", function () {
                debugger;
                $(".leo_menu").each(function () {
                    $(this).parent().removeClass("active");
                });

                $(".window").remove();
                $(".window-shadow").remove();
                $(".window-mask").remove();

                $("#main-content").load($(this).data("url"),function() {
                    Pace.stop();
                });
                /*Pace.start();
                 $mainFrame.attr("src", $(this).data("url"));*/
                $(this).parent().addClass("active");
            });
        });
    });
</script>
</body>
