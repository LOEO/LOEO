<%--
  Created by IntelliJ IDEA.
  User: LT
  Date: 14-3-20
  Time: 下午7:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-default" role="navigation">
    <!-- 导航头部 -->
    <div class="navbar-header">
        <a class="navbar-brand" href="#">LEO</a>
    </div>

    <!-- 导航项目 -->
    <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
            <li class="active"><a href="/index.do"><i class="icon icon-home">  </i>首页</a></li>
            <li><a href="your/nice/url">需求</a></li>
            <!-- 导航中的下拉菜单 -->
            <li>
                <a href="your/nice/url" class="dropdown-toggle" data-toggle="dropdown">系统管理 <b class="caret"></b></a>
                <%--<ul class="dropdown-menu" role="menu">
                    <li><a href="${ctx}/user/user_list.do"><i class="icon-user">   </i>用户管理</a></li>
                    <li><a href="your/nice/url"><i class="icon-group">  </i>角色管理</a></li>
                    <li class="divider"></li>
                    <li><a href="your/nice/url"><i class="icon-sitemap">  </i>组织架构</a></li>
                </ul>--%>
            </li>
        </ul>
        <!-- 右侧的导航项目 -->
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="#"><i class="icon icon-envelope" style="font-size: 18px;"></i>11</a>
            </li>
            <li class="dropdown">
                <a href="your/nice/url" class="dropdown-toggle" data-toggle="dropdown"><sec:authentication property="principal.user.nickname" /> <b class="caret"></b></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="your/nice/url">修改密码</a></li>
                    <li><a href="your/nice/url">个人设置</a></li>
                    <li class="divider"></li>
                    <li><a href="${ctx}/logout">退出</a></li>
                </ul>
            </li>
            <li><a href="your/nice/url">帮助</a></li>
            <li class="dropdown">
                <a href="your/nice/url" class="dropdown-toggle" data-toggle="dropdown">探索 <b class="caret"></b></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="your/nice/url">敏捷开发</a></li>
                    <li><a href="your/nice/url">HTML5</a></li>
                    <li><a href="your/nice/url">Javascript</a></li>
                    <li class="divider"></li>
                    <li><a href="your/nice/url">探索宇宙</a></li>
                </ul>
            </li>
        </ul>
    </div><!-- END .navbar-collapse -->
</nav>

