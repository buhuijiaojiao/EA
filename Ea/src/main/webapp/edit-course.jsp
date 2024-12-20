<%--
  Created by IntelliJ IDEA.
  User: 15156
  Date: 2024/12/19
  Time: 23:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改课程</title>
    <link rel="stylesheet" href="view/add-edit.css">
    <script>
        function checkForm() {

            // 课程名正则表达式

            const nameRegex = /^.{1,40}$/;
            const name = document.getElementById('name')
            if (!nameRegex.test(name.value)) {
                alert("课程名格式错误！");
                name.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="container">
    <h1>编辑课程信息</h1>
    <form action="<%=request.getContextPath()%>/edit-course" method="post" onsubmit="return checkForm()">
        <%--课程ID--%>
        <div class="form-group">
            <label for="name">ID：</label>
            <input type="text" id="id" name="Cid" value="<%=request.getParameter("id") %>"
                   readonly>
        </div>
        <!-- 姓名 -->
        <div class="form-group">
            <label for="name">课程内容：</label>
            <input type="text" id="name" name="courseName" value="<%=request.getParameter("name") %>"
                   placeholder="请输入课程名(1-40位)" required>
        </div>


        <!-- 提交按钮 -->
        <div class="form-group">
            <button type="submit" class="submit-btn">提交</button>
        </div>
    </form>
</div>

</body>
</html>
