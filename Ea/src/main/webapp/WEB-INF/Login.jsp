<%--
  Created by IntelliJ IDEA.
  User: 16130
  Date: 2024/12/17
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
</head>
<body>
<form method="post" name="form_login" action="${pageContext.request.contextPath}/auth/login"
      style="align-content: center">
    <table border="1" width="35%">
        <tr><th width="30%">姓名</th><td><input type="text" name="name" value="${cookie.username.value}"></td></tr>
        <tr><th>密码</th><td><input type="password" name="pw" value="${cookie.password.value}"></td></tr>
        <tr><th></th><td><input type="checkbox" name="remember" >3天免登录</td></tr>
        <tr><td colspan="2" align="center">
            <input type="submit" value="登录">
            <input type="reset" value="重置" />
            <a href="${pageContext.request.contextPath}/jsp/Reg.jsp">没有账号？点我注册</a>
        </td></tr>
    </table>
</form>
</body>
</html>
