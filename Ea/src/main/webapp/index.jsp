<%--
  Created by IntelliJ IDEA.
  User: Acimer
  Date: 2024/12/17
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.HashSet,cn.edu.xxgc.jk224.ea.entity.*" %>
<%@ page import="java.util.List" %>
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
            <li class="ccc"><a href="<%=request.getContextPath()%>/index.jsp">学生管理</a></li>
                        <li><a href="#" id="course-management">选课</a></li>
            <li class="ccc"><a href="<%=request.getContextPath()%>/course.jsp">课程管理</a></li>
        </ul>
    </div>

    <!-- 右侧内容区 -->
    <div class="content">
        <!-- 顶部导航 -->
        <div class="top-bar">
            <a href=<%=request.getContextPath()%>/auth/logout>退出登录</a>
        </div>

        <!-- 学生管理内容 -->
        <div id="students" class="aaa">
            <div class="header">
                <h1>学生管理</h1>
                <a href=<%=request.getContextPath()%>/set-student>查询所有学生信息</a>
                <a href=<%=request.getContextPath()%>/add-student.jsp>添加学生</a>
            </div>
            <div class="student-list">
                <%
                    HashSet<Student> students = (HashSet<Student>) request.getAttribute("studentInfo");
                    if (students == null)
                        return;
                    if (students.size() == 0) {
                        out.print("<p style='color: red;text-align:center;font-size:30px;'>暂无数据！</p>");
                        return;
                    }
                %>
                <%
                    //                   提取request域中的学生集合并遍历
                    for (Student student : students) {
                %>
                <div class="student-item">

                    <span class="student-info">学号: <%=student.getId() %> |
                                               姓名: <%=student.getName() %> |
                                               性别: <%=student.getSex() %> |
                                               院系: <%=student.getCollege() %> |
                                               专业: <%=student.getMajor() %>
                        <span class="del-edit"><a
                                href=<%=request.getContextPath()%>/edit-student.jsp?Sid=<%=student.getId() %>&studentName=<%=student.getName() %>&studentSex=<%=student.getSex() %>&college=<%=student.getCollege() %>&studentMajor=<%=student.getMajor() %>>修改</a></span>
                        <span class="del-edit"><a
                                href=<%=request.getContextPath()%>/del-student?Sid=<%=student.getId() %>>删除</a></span>
                    </span>
                </div>
                <% } %>


            </div>
        </div>
    </div>

</div>
</body>

</html>