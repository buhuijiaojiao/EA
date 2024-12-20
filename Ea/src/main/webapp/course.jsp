<%--
  Created by IntelliJ IDEA.
  User: 15156
  Date: 2024/12/20
  Time: 11:27
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
            <li class="ccc"><a href="<%=request.getContextPath()%>/student.jsp">学生管理</a></li>
            <%--            <li><a href="#" id="course-management" onclick="showContent('courses')">选课</a></li>--%>
            <li class="ccc"><a href="<%=request.getContextPath()%>/course.jsp">课程管理</a></li>
            <li><a href="#" id="course-management">选课</a></li>
        </ul>
    </div>

    <!-- 右侧内容区 -->
    <div class="content">
        <!-- 顶部导航 -->
        <div class="top-bar">
            <a href=<%=request.getContextPath()%>/index.jsp>退回首页</a>
        </div>

        <!-- 学生管理内容 -->

        <!-- 课程管理内容 -->
        <div id="courses" class="aaa">
            <div class="header">
                <h1>课程管理</h1>
                <a href=<%=request.getContextPath()%>/list-course>查询所有课程信息</a>
                <a href=<%=request.getContextPath()%>/add-course.jsp>添加课程</a>
            </div>
            <%
                List<Course> courses = (List<Course>) request.getAttribute("courseInfo");
                if (courses == null)
                    return;
                if (courses.size() == 0) {
                    out.print("<p style='color: red;text-align:center;font-size:30px;'>暂无数据！</p>");
                    return;
                }
            %>
            <%
                //                   提取request域中的课程集合并遍历
                for (Course course : courses) {
            %>
            <div class="course-item">

                    <span class="course-info">书籍编号: <%=course.getId() %> |
                                               课程内容: <%=course.getName() %>
                        <span class="del-edit"><a
                                href=<%=request.getContextPath()%>/edit-course.jsp?id=<%=course.getId() %>&name=<%=course.getName() %>>修改</a></span>
                        <span class="del-edit"><a href=<%=request.getContextPath()%>/del-course?id=<%=course.getId() %>>删除</a></span>
                    </span>
            </div>
            <% } %>

        </div>
        <%--        <div id="select-course" class="content-section hidden">--%>
        <%--            <h1>课程管理</h1>--%>
        <%--            &lt;%&ndash;            <span class="student-info">课程ID:<%=course.getId() %> | 课程内容:<%=crouse.getContext() %> </span>&ndash;%&gt;--%>
        <%--        </div>--%>
    </div>

</div>
</body>

</html>
