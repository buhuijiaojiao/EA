<%@ page language="java"
        contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>教务管理系统</title>
    <link rel="stylesheet" href="view/login.css">
    <script>
        function check(){
            const name=document.getElementById('username')
            const pw=document.getElementById('password')
            if(name.value.length==0||pw.value.length==0){
                alert("用户名或密码不能为空！");
                pw.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<%
    String username = "";
    String password = "";

    Cookie[] cookies = request.getCookies();
    if(cookies != null) {
        for(Cookie c:cookies) {
            if(c.getName().equals("username")) {
                username = c.getValue();
            }
            if(c.getName().equals("password")) {
                password = c.getValue();
            }
        }
    }
%>
<%--cookie--%>
<h1 class="ccc"><%= "欢迎使用!" %>
</h1>
<div class="login">
    <h1>登录</h1>
    <form action=<%=request.getContextPath()%>/auth/login method="post" onsubmit="return check()">
        <input type="text" name="username" placeholder="账号" id="username">
        <input type="password" name="password" placeholder="密码" id="password">
        <span class="remember">记住密码
        <input type="checkbox" name="remember" value="1">
        </span>
        <button type="submit" >登录</button>
    </form>

    <div class="register">
        没有账号? <a href=<%=request.getContextPath()%>/regist.jsp>注册</a>
    </div>
</div>
<div class="null"></div>
</body>
</html>