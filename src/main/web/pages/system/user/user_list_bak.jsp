<%--
  Created by IntelliJ IDEA.
  User: LT
  Date: 14-4-2
  Time: 下午6:22
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section class="content box box-primary">
    <div class="menu form-inline">
        <div class="btn-group">
            <button type="button" class="btn btn-info btn-flat" id="userAddBtn">新增</button>
            <button type="button" class="btn btn-info btn-flat" id="userEditBtn">修改</button>
            <button type="button" class="btn btn-info btn-flat" id="userDelBtn">删除</button>
        </div>
        <div class="input-group pull-right">
            <div class="input-group-btn">
                <button type="button" class="btn btn-info btn-flat dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Action
                    <span class="fa fa-caret-down"></span></button>
                <ul class="dropdown-menu ">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>
            <!-- /btn-group -->
            <input type="text" class="form-control">
            <span class="input-group-btn">
                      <button type="button" class="btn btn-info btn-flat">查询</button>
                    </span>
        </div>
    </div>

    <table id="userTable" class="table table-striped table-bordered table-hover table-condensed" cellspacing="0" width="100%">
        <thead>
        <tr>
            <th>用户名</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>性别</th>
            <th>生日</th>
            <th>邮箱</th>
            <th>电话</th>
            <th>启用</th>
        </tr>
        </thead>
    </table>
</section>
<div class="modal fade " id="userFormWin" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">新增用户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="userForm" action="${ctx}/userAjax/user_add.do">
                    <input name="id" type="hidden">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="username" class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control leo-notnull" name="username" id="username" validType="notnull" placeholder="用户名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control leo-notnull" data-bv-identical-field="passwrod1" data-bv-identical-message="两次输入的密码不一致！" name="password" id="password" placeholder="密码">
                            </div>
                        </div>
                        <%--<div class="form-group">
                            <label for="password" class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control leo-notnull" name="password1" id="password1" data-bv-identical-field="passwrod" data-bv-identical-message="两次输入的密码不一致！" placeholder="确认密码">
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <label for="nickname" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control leo-notnull" name="nickname" id="nickname" placeholder="姓名">
                            </div>
                        </div>
                       <%-- <div class="form-group">
                            <label for="age" class="col-sm-2 control-label">年龄</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control leo-notnull leo-integer" name="age" id="age" placeholder="年龄">
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <label for="sex" class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="sex" id="sex">
                                    <option selected>保密</option>
                                    <option>男</option>
                                    <option>女</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="birthday" class="col-sm-2 control-label">生日</label>
                            <div class="col-sm-10">
                                <div class="input-group date" style="z-index:100000">
                                    <input type="text" data-provide="datepicker" data-date-format="yyyy-mm-dd" data-auto-close="true" class="form-control" id="birthday" name="birthday">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control leo-email leo-notnull " name="email" id="email" placeholder="邮箱">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="col-sm-2 control-label">电话</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="phone" id="phone" placeholder="电话">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="enable" class="col-sm-2 control-label">启用</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="enable" id="enable">
                                    <option value="1" selected>是</option>
                                    <option value="0">否</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-info" id="userSaveBtn">保存</button>
                <button type="submit" class="btn btn-default pull-right" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    $(function () {
        debugger;
        var userDt=LEO.DataTable("userTable", {
            "ajax": {
                url: "${ctx}/user/list.do"
            },
            "columns": [
                {"data": "username"},
                {"data": "nickname"},
                {"data": "age"},
                {"data": "sex"},
                {"data": "birthday"},
                {"data": "email"},
                {"data": "phone"},
                {"data":"enable",render:function(data,type,full,meta) {
                    if(data=="1"){
                        return "是";
                    }
                    return "否";
                }}
            ]
        }),
        userFormWin=$("#userFormWin"),form = LEO.initForm({
            id:"userForm",
            url:"${ctx}/user/insert.do",
            success:function(data) {
                if(data.SUCCESS) {
                    userDt.refresh();
                    userFormWin.modal('hide');
                }else{
                    bootbox.alert(data.msg);
                }
            }
        });
        $("#userAddBtn").on("click",function() {
            form.reset();
            userFormWin.modal('show');
        });
        $("#userEditBtn").on("click",function() {
            form.reset();
            var row = userDt.getSelected();
            if(row) {
                form.load(row);
                userFormWin.modal('show');
            }else{
                bootbox.alert("请选择一行数据！");
            }
        });
        $("#userDelBtn").on("click",function() {
            var row = userDt.getSelected();
            if(row) {
                bootbox.confirm("确定要删除吗？", function (r) {
                    if(r){
                        $.post("${ctx}/user/delete.do",{id:row.id},function(data) {
                            if(data.success) {
                                bootbox.alert("删除成功！");
                                userDt.refresh();
                            }
                        });
                    }
                });
            }else{
                bootbox.alert("请选择一行数据！");
            }

        });
        $("#userSaveBtn").on("click",function() {
            form.submit();
        });

    });

</script>
