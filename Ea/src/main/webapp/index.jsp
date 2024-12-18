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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>教务管理系统</title>
    <link rel="stylesheet" href="./view/welcome.css">

</head>
<body>

<div class="container">
    <!-- 左侧侧边栏 -->
    <div class="sidebar">
        <h2>功能选项</h2>
        <ul>
            <%--            默认显示该页面，隐藏其他页面，获取焦点--%>
            <li><a href="<%=request.getContextPath()%>/set-student" id="student-management"
                   onclick="showContent('students')">学生管理</a></li>
            <%--            <li><a href="#" id="course-management" onclick="showContent('courses')">选课</a></li>--%>
            <%--            <li><a href="#" id="student-select-management" onclick="showContent('checkcourses')">课程管理</a></li>--%>
        </ul>
    </div>

    <!-- 右侧内容区 -->
    <div class="content">
        <!-- 顶部导航 -->
        <div class="top-bar">
            <a href=<%=request.getContextPath()%>/auth/logout>退出登录</a>
        </div>

        <!-- 学生管理内容 -->
        <div id="students" class="content-section">
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
                        <span class="del-edit"><a  href=<%=request.getContextPath()%>/edit-student.jsp?Sid=<%=student.getId() %>&studentName=<%=student.getName() %>&studentSex=<%=student.getSex() %>&college=<%=student.getCollege() %>&studentMajor=<%=student.getMajor() %>>修改</a></span>
                        <span class="del-edit"><a  href=<%=request.getContextPath()%>/del-student?Sid=<%=student.getId() %>>删除</a></span>
                    </span>
                </div>
                <% } %>


            </div>
        </div>

        <!-- 课程管理内容 -->
        <div id="courses" class="content-section hidden">
            <h1>选课</h1>

        </div>
        <div id="checkcourses" class="content-section hidden">
            <h1>课程管理</h1>
            <%--            <span class="student-info">课程ID:<%=course.getId() %> | 课程内容:<%=crouse.getContext() %> </span>--%>
        </div>
    </div>

</div>


</body>
<script>
    // 显示指定内容区，并隐藏其他内容区
    function showContent(sectionId) {
        // 获取所有内容区元素
        const sections = document.querySelectorAll(".content-section");

        // 遍历内容区，隐藏不匹配的内容
        sections.forEach(section => {
            if (section.id === sectionId) {
                section.classList.remove("hidden"); // 显示目标内容
            } else {
                section.classList.add("hidden"); // 隐藏其他内容
            }
        });
    }
</script>

</html>