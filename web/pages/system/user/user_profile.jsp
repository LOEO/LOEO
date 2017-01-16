<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../common/start.jsp" %>
<div class="page-content">
    <div id="user-profile-3" class="user-profile row">
        <div class="col-sm-offset-1 col-sm-10">
            <div class="well well-sm">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                &nbsp;
                <div class="inline middle blue bigger-110"> 你的资料已完成 70%</div>

                &nbsp; &nbsp; &nbsp;
                <div style="width:200px;" data-percent="70%"
                     class="inline middle no-margin progress progress-striped active">
                    <div class="progress-bar progress-bar-success" style="width:70%"></div>
                </div>
            </div>
            <!-- /well -->

            <div class="space"></div>

            <form class="form-horizontal" action="/user/user_profile_save.do?" method="post">
                <div class="tabbable">
                    <ul class="nav nav-tabs padding-16">
                        <li class="active">
                            <a data-toggle="tab" href="#edit-basic">
                                <i class="green icon-edit bigger-125"></i>
                                基本信息
                            </a>
                        </li>

                        <li>
                            <a data-toggle="tab" href="#edit-settings">
                                <i class="purple icon-cog bigger-125"></i>
                                设置
                            </a>
                        </li>

                        <li>
                            <a data-toggle="tab" href="#edit-password">
                                <i class="blue icon-key bigger-125"></i>
                                密码
                            </a>
                        </li>
                    </ul>

                    <div class="tab-content profile-edit-tab-content">
                        <div id="edit-basic" class="tab-pane in active">
                            <h4 class="header blue bolder smaller">基本</h4>

                            <div class="row">
                                <%--<div class="col-xs-12 col-sm-4">
                                    <span class="profile-picture">
                                        <img id="avatar" class="editable img-responsive" alt="Alex's Avatar" src="assets/avatars/profile-pic.jpg" />
                                    </span>
                                    &lt;%&ndash; <input type="file" name="photo" />
                                    <img src="${ctx}/upload/${curUser.photo}" alt="Alex's Avatar" class="editable img-responsive editable-click editable-empty" id="avatar">Empty</img>&ndash;%&gt;
                                </div>--%>
                                <div class="col-xs-12 col-sm-3 center">
                                    <div>
                                        <span class="profile-picture">
                                            <img id="avatar" class="editable img-responsive" alt="Alex's Avatar"
                                                 src="${ctx}/upload/${(user.avatar == null || user.avatar == "") ? "upload.png" : user.avatar}"/>
                                        </span>

                                        <div class="space-4"></div>

                                        <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                                            <div class="inline position-relative">
                                                <a href="#" class="user-title-label dropdown-toggle"
                                                   data-toggle="dropdown">
                                                    <i class="icon-circle light-green middle"></i>
                                                    &nbsp;
                                                    <span class="white">${user.username}</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="vspace-xs"></div>
                                <input type="hidden" name="id" value="${user.id}"/>

                                <div class="col-xs-12 col-sm-8">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right"
                                               for="form-field-username">用户名</label>

                                        <div class="col-sm-8">
                                            <input class="col-xs-12 col-sm-10" type="text" id="form-field-username"
                                                   name="username" disabled
                                                   placeholder="Username" value="${user.username}"/>
                                        </div>
                                    </div>

                                    <div class="space-4"></div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right"
                                               for="form-field-name">昵称</label>

                                        <div class="col-sm-8">
                                            <input class="col-xs-12 col-sm-10" type="text" id="form-field-name"
                                                   name="nickname"
                                                   placeholder="" value="${user.nickname}"/>
                                        </div>
                                    </div>
                                    <div class="space-4"></div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right" for="form-field-date">出生日期</label>

                                        <div class="col-sm-8">
                                            <div class="input-medium">
                                                <div class="input-group">
                                                    <input class="input-medium date-picker " id="form-field-date"
                                                           name="birthday" type="text"
                                                           data-date-format="yyyy-mm-dd" placeholder="yyyy-mm-dd"
                                                           value="<fmt:formatDate value="${user.birthday}"></fmt:formatDate>"/>
																			<span class="input-group-addon">
																				<i class="icon-calendar"></i>
																			</span>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space-4"></div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right">性别</label>

                                        <div class="col-sm-8">
                                            <label class="inline">
                                                <input name="sex" type="radio" class="ace" value="男"
                                                       checked=${user.sex == "男"? "checked=checked":false}/>
                                                <span class="lbl"> 男</span>
                                            </label>

                                            &nbsp; &nbsp; &nbsp;
                                            <label class="inline">
                                                <input name="sex" type="radio" class="ace"
                                                       value="女" ${user.sex == "女"? "checked=checked":""} />
                                                <span class="lbl"> 女</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right">年龄</label>

                                        <div class="col-sm-8">
                                            <label class="inline">
                                                <input name="age" type="number" class="ace" value="${user.age==null?0:user.age}"
                                                    max="120" min="0"   />
                                            </label>
                                        </div>
                                    </div>
                                    <%--<div class="space-4"></div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right" for="form-field-comment">个人介绍</label>

                                        <div class="col-sm-8">
                                            <textarea id="form-field-comment" class="col-xs-12 col-sm-10"
                                                      name="comment">${user.comment}</textarea>
                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                            <h4 class="header blue bolder smaller">联系方式</h4>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-email">邮箱</label>

                                <div class="col-sm-9">
																	<span class="input-icon input-icon-right">
																		<input type="email" id="form-field-email"
                                                                               name="email" value="${user.email}"/>
																		<i class="icon-envelope"></i>
																	</span>
                                </div>
                            </div>

                            <%-- <div class="space-4"></div>

                             <div class="form-group">
                                 <label class="col-sm-3 control-label no-padding-right"
                                        for="form-field-website">主页</label>

                                 <div class="col-sm-9">
                                                                     <span class="input-icon input-icon-right">
                                                                         <input type="url" id="form-field-website"
                                                                                name="website"
                                                                                value="${curUser.website}"/>
                                                                         <i class="icon-globe"></i>
                                                                     </span>
                                 </div>
                             </div>--%>

                            <div class="space-4"></div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-phone">电话</label>

                                <div class="col-sm-9">
																	<span class="input-icon input-icon-right">
																		<input class="input-medium input-mask-phone"
                                                                               name="phone" type="text"
                                                                               id="form-field-phone"
                                                                               value="${user.phone}"/>
																		<i class="icon-phone icon-flip-horizontal"></i>
																	</span>
                                </div>
                            </div>

                            <div class="space"></div>
                            <h4 class="header blue bolder smaller">社交</h4>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-facebook">Facebook</label>

                                <div class="col-sm-9">
																	<span class="input-icon">
																		<input type="text" value="facebook_alexdoe"
                                                                               id="form-field-facebook"/>
																		<i class="icon-facebook blue"></i>
																	</span>
                                </div>
                            </div>

                            <div class="space-4"></div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                       for="form-field-twitter">Twitter</label>

                                <div class="col-sm-9">
																	<span class="input-icon">
																		<input type="text" value="twitter_alexdoe"
                                                                               id="form-field-twitter"/>
																		<i class="icon-twitter light-blue"></i>
																	</span>
                                </div>
                            </div>

                            <div class="space-4"></div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                       for="form-field-gplus">Google+</label>

                                <div class="col-sm-9">
																	<span class="input-icon">
																		<input type="text" value="google_alexdoe"
                                                                               id="form-field-gplus"/>
																		<i class="icon-google-plus red"></i>
																	</span>
                                </div>
                            </div>
                        </div>

                        <div id="edit-settings" class="tab-pane">
                            <div class="space-10"></div>

                            <div>
                                <label class="inline">
                                    <input type="checkbox" name="form-field-checkbox" class="ace"/>
                                    <span class="lbl"> Make my profile public</span>
                                </label>
                            </div>

                            <div class="space-8"></div>

                            <div>
                                <label class="inline">
                                    <input type="checkbox" name="form-field-checkbox" class="ace"/>
                                    <span class="lbl"> Email me new updates</span>
                                </label>
                            </div>

                            <div class="space-8"></div>

                            <div>
                                <label class="inline">
                                    <input type="checkbox" name="form-field-checkbox" class="ace"/>
                                    <span class="lbl"> Keep a history of my conversations</span>
                                </label>

                                <label class="inline">
                                    <span class="space-2 block"></span>

                                    for
                                    <input type="text" class="input-mini" maxlength="3"/>
                                    days
                                </label>
                            </div>
                        </div>

                        <div id="edit-password" class="tab-pane">
                            <div class="space-10"></div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                       for="form-field-pass1">新密码</label>

                                <div class="col-sm-9">
                                    <input type="password" id="form-field-pass1"/>
                                </div>
                            </div>

                            <div class="space-4"></div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"
                                       for="form-field-pass2">确认密码</label>

                                <div class="col-sm-9">
                                    <input type="password" id="form-field-pass2"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="clearfix form-actions">
                    <div class="col-md-offset-3 col-md-9">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok bigger-110"></i>
                            保存
                        </button>

                        &nbsp; &nbsp;
                        <button class="btn" type="reset">
                            <i class="icon-undo bigger-110"></i>
                            Reset
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /span -->
    </div>
    <!-- /user-profile -->
</div>
<!-- /.page-content -->
<%@include file="../common/end.jsp" %>
<script>
    jQuery(function ($) {
        //editables on first profile page
        $.fn.editable.defaults.mode = 'inline';
        $.fn.editableform.loading = "<div class='editableform-loading'><i class='light-blue icon-2x icon-spinner icon-spin'></i></div>";
        $.fn.editableform.buttons = '<button type="submit" class="btn btn-info editable-submit"><i class="icon-ok icon-white"></i></button>' +
        '<button type="button" class="btn editable-cancel"><i class="icon-remove"></i></button>';

        // *** editable avatar *** //
        try {//ie8 throws some harmless exception, so let's catch it

            //it seems that editable plugin calls appendChild, and as Image doesn't have it, it causes errors on IE at unpredicted points
            //so let's have a fake appendChild for it!
            if (/msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase())) Image.prototype.appendChild = function (el) {
            }

            var last_gritter
            $('#avatar').editable({
                type: 'image',
                name: 'avatar',
                value: null,
                image: {
                    //specify ace file input plugin's options here
                    btn_choose: '上传头像',
                    droppable: true,
                    /**
                     //this will override the default before_change that only accepts image files
                     before_change: function(files, dropped) {
								return true;
							},
                     */

                    //and a few extra ones here
                    name: 'avatar',//put the field name here as well, will be used inside the custom plugin
                    max_size: 110000,//~100Kb
                    on_error: function (code) {//on_error function will be called when the selected file has a problem
                        if (last_gritter) $.gritter.remove(last_gritter);
                        if (code == 1) {//file format error
                            last_gritter = $.gritter.add({
                                title: '文件不是一个图片',
                                text: '请选择一个 jpg|gif|png 格式的图片!',
                                class_name: 'gritter-error gritter-center'
                            });
                        } else if (code == 2) {//file size error
                            last_gritter = $.gritter.add({
                                title: '图片太大!',
                                text: '图片大小不能超过100Kb!',
                                class_name: 'gritter-error gritter-center'
                            });
                        }
                        else {//other error
                        }
                    },
                    on_success: function () {
                        $.gritter.removeAll();
                    }
                },
                url: function (params) {
                    debugger;
                    // ***UPDATE AVATAR HERE*** //
                    //You can replace the contents of this function with examples/profile-avatar-update.js for actual upload
                    var deferred = new $.Deferred

                    //if value is empty, means no valid files were selected
                    //but it may still be submitted by the plugin, because "" (empty string) is different from previous non-empty value whatever it was
                    //so we return just here to prevent problems
                    var value = $('#avatar').next().find('input[type=hidden]:eq(0)').val();
                    if (!value || value.length == 0) {
                        deferred.resolve();
                        return deferred.promise();
                    }
                    var thumb;
                    if ("FileReader" in window) {
                        //for browsers that have a thumbnail of selected image
                        thumb = $('#avatar').next().find('img').data('thumb');
                        if (thumb) $('#avatar').get(0).src = thumb;
                    }

                    $.post("/user/user_profile_uploadAvatar.do", {
                        userName: "${user.username}",
                        avatar: thumb
                    }, function (data) {
                        var title = "",text="";
                        if(data == "success"){
                            deferred.resolve({'status': data});
                            title = "上传成功";
                            text = "头像已上传至服务器";
                        }else{
                            deferred.reject({'status': data});
                            title = "上传失败";
                            text = "上传失败";
                        }
                        if (last_gritter) $.gritter.remove(last_gritter);
                        last_gritter = $.gritter.add({
                            title: title,
                            text: text,
                            class_name: 'gritter-info gritter-center'
                        });
                        return deferred.promise();
                    });
                },

                success: function (response, newValue) {
                }
            })
        } catch (e) {
        }
        $('.input-mask-phone').mask('(999) 999-9999');
        $('.date-picker').datepicker({autoclose: true}).next().on(ace.click_event, function () {
            $(this).prev().focus();
        })

    });

</script>