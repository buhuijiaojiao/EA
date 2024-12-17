<%--
  Created by IntelliJ IDEA.
  User: Acimer
  Date: 2024/12/17
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" href="./view/regist.css">
    <meta charset="UTF-8">
    <title>用户注册页面</title>
    <script>
        const reg =document.querySelector('.reg')
        const check =document.querySelector('.btn')
        check.addEventListener("click",function () {
            if(reg.password.value==""){
                alert("密码不能为空！");
                return false;
            }
            if(reg.password.value!=reg.password2.value){
                alert("密码与确认密码不一致！");
                return false;
            }
            if(reg.name.value==""){
                alert("姓名不能为空！");
                return false;
            }
            if(reg.username.value==""){
                alert("账号不能为空！");
                return false;
            }
            return true;
        });
    </script>

</head>
<body>
<div class="register-container">
    <h2>注册</h2>
    <!-- 注册表单 -->
    <form action=<%=request.getContextPath()%>/reg method="post" class="reg">
        <div class="input-field">
            <label for="password">姓名：</label>
            <input type="text" id="name" name="name" placeholder="请输入姓名" required>
        </div>
        <div class="input-field">
            <label for="username">账号：</label>
            <input type="text" id="username" name="username" placeholder="请输入账号" required>
        </div>
        <div class="input-field">
            <label for="password">密码：</label>
            <input type="password" id="password" name="password" placeholder="请输入密码" required>
        </div>
        <div class="input-field">
            <label for="password">请再次输入密码：</label>
            <input type="password" id="password2" name="password2" placeholder="请输入密码" required>
        </div>

        <button type="submit" class="btn">注册</button>
    </form>
    <!-- 登录提示 -->
    <div class="login-link">
        已有账号？<a href="login.jsp">点击登录</a>
    </div>
</div>
</body>
</html>
