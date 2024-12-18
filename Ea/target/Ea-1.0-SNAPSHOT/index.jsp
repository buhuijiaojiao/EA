<%--
  Created by IntelliJ IDEA.
  User: Acimer
  Date: 2024/12/17
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
            <li><a href="#" id="student-management" onclick="showContent('students')">学生管理</a></li>
            <li><a href="#" id="course-management" onclick="showContent('courses')">课程管理</a></li>
            <li><a href="#" id="student-select-management" onclick="showContent('checkcourses')">查看课程</a></li>
        </ul>
    </div>

    <!-- 右侧内容区 -->
    <div class="content">
        <!-- 顶部导航 -->
        <div class="top-bar">
            <a href=<%=request.getContextPath()%>/logout>退出登录</a>
        </div>

        <!-- 学生管理内容 -->
        <div id="students" class="content-section">
            <div class="header">
                <h1>学生管理</h1>
                <button class="add-btn">添加学生</button>
            </div>
            <div class="student-list">
                <!-- 示例学生信息 -->
                <div class="student-item">
                    <span class="student-info">姓名: 张三 | 性别: 男 | 院系: 计算机学院 | 专业: 软件工程</span>
                    <button class="edit-btn">修改</button>
                    <button class="delete-btn">删除</button>
                </div>
                <div class="student-item">
                    <span class="student-info">姓名: 李四 | 性别: 女 | 院系: 数学学院 | 专业: 应用数学</span>
                    <button class="edit-btn">修改</button>
                    <button class="delete-btn">删除</button>
                </div>
            </div>
        </div>

        <!-- 课程管理内容 -->
        <div id="courses" class="content-section hidden">
            <h1>课程管理</h1>
            <p>这里可以展示课程信息。</p>
        </div>
        <div id="checkcourses" class="content-section hidden">
            <h1>查看课程</h1>
            <p>这里可以展示课程信息。</p>
        </div>
    </div>
</div>


</body>
</html>



