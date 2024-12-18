<%--
  Created by IntelliJ IDEA.
  User: Acimer
  Date: 2024/12/17
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="./view/regist.css">
    <meta charset="UTF-8">
    <title>用户注册页面</title>
    <script>
        function check() {
            const pw1 = document.getElementById('password')
            const pw2 = document.getElementById('password2')
            const username = document.getElementById('username')
            const userRegex=/^[a-zA-Z0-9_-]{4,16}$/
            if (pw1.value != pw2.value) {
                alert("密码与确认密码不一致！");
                pw1.focus();
                return false;
            }
            if (!userRegex.test(username.value)) {
                alert("账号格式错误！");
                username.focus();
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
<div class="register-container">
    <h2>注册</h2>
    <!-- 注册表单 -->
    <form action=<%=request.getContextPath()%>/reg method="post" id="regs" class="reg" onsubmit="return check()">
        <div class="input-field">
            <label for="username">账号：</label>
            <input type="text" id="username" name="username" placeholder="请输入账号,4到16位(字母,数字,下划线,减号)"
                   required>
        </div>
        <div class="input-field">
            <label for="password">密码：</label>
            <input type="password" id="password" name="password" placeholder="请输入密码" required>
        </div>
        <div class="input-field">
            <label for="password">请再次输入密码：</label>
            <input type="password" id="password2" name="password2" required>
        </div>

        <button type="submit" id="but" class="btn">注册</button>
    </form>
    <!-- 登录提示 -->
    <div class="login-link">
        已有账号？<a href="login.jsp">点击登录。</a>
    </div>
</div>
</body>
<%--<script>--%>
<%--    // 获取表单和输入框--%>
<%--    const form = document.getElementById('regs');--%>
<%--    const password1 = document.getElementById('password');--%>
<%--    const password2 = document.getElementById('password2');--%>

<%--    // 监听表单的提交事件--%>
<%--    form.addEventListener('submit', function (event) {--%>
<%--        console("ssss");--%>
<%--        // 获取用户输入的密码值,在此处获取密码值是因为此时用户已经输入完成，可以获取--%>
<%--        // 写在侦听外会导致用户还没输入就被获取了值，导致两个密码一直为null，判定一直为真--%>
<%--        const pw1 = password1.value;--%>
<%--        const pw2 = password2.value;--%>

<%--        // 检查两次密码是否一致--%>
<%--        if (pw1 !== pw2) {--%>
<%--            event.preventDefault(); // 阻止表单提交--%>
<%--            alert("密码与确认密码不一致！");--%>
<%--        } else {--%>
<%--            alert("注册成功！3秒后跳转到首页");--%>
<%--            setTimeout(() => {--%>
<%--                // 模拟跳转逻辑--%>
<%--                window.location.href = './index.jsp';--%>
<%--            }, 3000);--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>

</html>
