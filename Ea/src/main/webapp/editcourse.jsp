<%--
  Created by IntelliJ IDEA.
  User: 16130
  Date: 2024/12/19
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改课程</title>
    <style>
        form {
            width: 500px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="reset"] {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        table{
            text-align: center;
        }
    </style>
<body>
<form method="post" action="<%=request.getContextPath()%>/edit-Course?id=${param.id}">
    <h2>修改课程信息</h2>
    <label for="title">课程号：</label>
    <input type="text" id="title" name="id" value="${param.id}" ><br>
    <label for="author">课程名：</label>
    <input type="text" id="author" name="name" value="${param.name}" ><br>
    <input type="submit" value="修改">
    <input type="reset" value="重置">
</form>
</body>
</html>
