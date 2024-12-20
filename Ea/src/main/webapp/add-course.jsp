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
    <title>添加课程</title>
    <link rel="stylesheet" href="view/add-edit.css">
</head>
<body>
<div class="container">
    <h1>添加课程信息</h1>
    <form action="<%=request.getContextPath()%>/add-course" method="post" onsubmit="return checkfrom()">
        <%--课程ID--%>
        <div class="form-group">
            <label for="name">ID：</label>
            <input type="text" id="id" name="Cid" placeholder="请输入课程ID(1-8位数字)" required>
        </div>
        <!-- 姓名 -->
        <div class="form-group">
            <label for="name">课程内容：</label>
            <input type="text" id="name" name="courseName" placeholder="请输入课程名(1-20位)" required>
        </div>


        <!-- 提交按钮 -->
        <div class="form-group">
            <button type="submit" class="submit-btn">提交</button>
        </div>
    </form>
</div>

</body>
<script>
    function checkfrom() {
        const idRegex = /^[0-9]{1,8}$/
        const nameRegex = /^.{1,20}$/;
        const id = document.getElementById('id')
        const name = document.getElementById('name')
        if (!idRegex.test(id.value)) {
            alert("课程ID格式错误！");
            id.focus();
            return false;
        }
        if (!nameRegex.test(name.value)) {
            alert("课程名称格式错误！");
            name.focus();
            return false;
        }
        return true;
    }
</script>
</html>
