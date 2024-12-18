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
            <li><a href="#" id="student-select-management" onclick="showContent('courses')">课程管理</a></li>
        </ul>
    </div>

    <!-- 右侧内容区 -->
    <div class="content">
        <!-- 顶部导航 -->
        <div class="top-bar">
            <button class="logout-btn" onclick="logout()">退出登录</button>
        </div>

        <!-- 学生管理内容 -->
        <div id="students" class="content-section">
            <div class="header">
                <h1>学生管理</h1>
                <button class="add-btn" onclick="addStudent()">添加学生</button>
            </div>
            <div class="student-list">
                <!-- 示例学生信息 -->
                <div class="student-item">
                    <span class="student-info">姓名: 张三 | 性别: 男 | 院系: 计算机学院 | 专业: 软件工程</span>
                    <button class="edit-btn">修改</button>
                    <button class="delete-btn" onclick="confirmDelete('张三')">删除</button>
                </div>
                <div class="student-item">
                    <span class="student-info">姓名: 李四 | 性别: 女 | 院系: 数学学院 | 专业: 应用数学</span>
                    <button class="edit-btn">修改</button>
                    <button class="delete-btn" onclick="confirmDelete('李四')">删除</button>
                </div>
            </div>
        </div>

        <!-- 课程管理内容 -->
        <div id="courses" class="content-section hidden">
            <h1>课程管理</h1>
            <p>这里可以展示课程信息。</p>
        </div>
    </div>
</div>

<script>
    // 切换内容显示
    function showContent(section) {
        document.querySelectorAll('.content-section').forEach(el => el.classList.add('hidden'));
        document.getElementById(section).classList.remove('hidden');
    }

    // 删除确认提示
    function confirmDelete(name) {
        if (confirm(`确定要删除 "${name}" 吗？`)) {
            alert(`"${name}" 已删除！`);
        } else {
            alert("操作已取消！");
        }
    }

    // 模拟添加学生操作
    function addStudent() {
        alert("跳转到添加学生页面！");
    }

    // 模拟退出登录
    function logout() {
        alert("退出登录成功！");
        // 可跳转到登录页面，例如：location.href = 'login.jsp';
    }
</script>
</body>
</html>



