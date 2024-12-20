<%--
  Created by IntelliJ IDEA.
  User: Acimer
  Date: 2024/12/17
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>教务管理系统</title>
    <link rel="stylesheet" href="view/index.css">

</head>
<body>

<div class="container">
    <!-- 左侧侧边栏 -->
    <div class="sidebar">
        <h2>功能选项</h2>
        <ul>
            <%--            默认显示该页面，隐藏其他页面--%>
            <li class="ccc"><a href="<%=request.getContextPath()%>/student.jsp">学生管理</a></li>
            <li class="ccc"><a href="<%=request.getContextPath()%>/course.jsp">课程管理</a></li>
            <li><a href="#" id="course-management">选课</a></li>
        </ul>
    </div>

    <!-- 右侧内容区 -->
    <div class="content">
        <!-- 顶部导航 -->
        <div class="top-bar">
            <a href=<%=request.getContextPath()%>/auth/logout>退出登录</a>
        </div>


    </div>

</div>
</body>

</html>