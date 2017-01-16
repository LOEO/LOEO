<%--
  Created by IntelliJ IDEA.
  User: LT
  Date: 14-3-20
  Time: 下午7:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@include file="common/head.jsp" %>
    <link rel="stylesheet" href="${ctx}/rs/zui/css/zui.min.css"/>
    <title>用户登录</title>

    <style>
        body{
            background-color: #DADADA;
        }
        .login-panel {
            position:absolute;
            width: 400px;
            height: 300px;
            padding:0;
            top:50%;
            left:50%;
            margin-top: -150px;
            margin-left: -200px;;
        }
    </style>
</head>
<body>
<c:if test="${param.error !=null}">
    <div class="alert alert-danger with-icon">
        <i class="icon-frown"></i>
        <div class="content"> <p>
            用户名或密码错误！
        </p></div>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
    </div>
</c:if>
<c:if test="${param.logout !=null}">
    <div class="alert alert-info with-icon">
        <i class="icon-frown"></i>
        <div class="content"> <p>
            您已经退出系统！
        </p></div>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
    </div>
</c:if>
    <form class="login-panel panel panel-primary" action="/login" method="post">
        <div class="panel-heading">
            登录
        </div>
        <div class="panel-body">
            <div class="input-group">
                <span class="input-group-addon "><i class="icon icon-user" style="color: blue"></i></span>
                <input type="text" class="form-control" name="username" placeholder="用户名">
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon icon-key" style="color: blue"></i></span>
                <input type="password" class="form-control" name="password" placeholder="密码">
            </div>
            <br>
            <div class="input-group">
                <input type="checkbox"  name="remanberme" id="remanberme">&nbsp;
                <lable for="remanberme">记住密码</lable>
            </div>
            <br>
            <input class="btn btn-success btn-block" type="submit" value="登录">
        </div>
    </form>

<%@include file="common/foot.jsp" %>
<script>

</script>
</body>
</html>
