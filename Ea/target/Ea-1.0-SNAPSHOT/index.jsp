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
    <title>欢迎使用</title>
    <link rel="stylesheet" href="./view/welcome.css">
</head>
<body>
<div class="dashboard">
    <!-- 左侧导航栏 -->
    <div class="sidebar">
        <h2>功能选项</h2>
        <ul>
            <li><a href="#" id="option1">学生选课</a></li>
            <li><a href="#" id="option2">学生管理</a></li>
            <li><a href="#" id="option3">课程管理</a></li>
        </ul>
    </div>

    <!-- 右侧内容区 -->
    <div class="content">
        <div id="content-placeholder">
            <h1>欢迎使用</h1>
            <p>点击左侧选项以查看内容</p>
        </div>
    </div>
</div>

<script>
    // 简单 JavaScript 逻辑，切换显示内容
    const placeholder = document.getElementById('content-placeholder');
    document.getElementById('option1').addEventListener('click', () => {
        placeholder.innerHTML = '<h1>学生选课</h1><p>这里是学生选课的内容。</p>';
    });
    document.getElementById('option2').addEventListener('click', () => {
        placeholder.innerHTML = '<h1>学生管理</h1><p>这里是学生管理的内容。</p>';
    });
    document.getElementById('option3').addEventListener('click', () => {
        placeholder.innerHTML = '<h1>课程管理</h1><p>这里是课程管理的内容。</p>';
    });
</script>
</body>
</html>


