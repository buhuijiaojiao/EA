<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>教务管理系统</title>
    <link rel="stylesheet" href="view/login.css">
</head>
<body>
<h1 class="ccc"><%= "欢迎使用!" %>
</h1>
<div class="login">
    <h1>登录</h1>
    <form action="<!-- 登录跳转路径 -->" method="post">
        <input type="text" name="username" placeholder="Username">
        <input type="password" name="password" placeholder="Password">
        <button type="submit">登录</button>
    </form>
    <div class="register">
        没有账号? <a href="<!-- 注册跳转路径 -->">注册</a>
    </div>
</div>
<div class="null"></div>
</body>
</html>