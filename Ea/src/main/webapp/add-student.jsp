<%--
  Created by IntelliJ IDEA.
  User: 15156
  Date: 2024/12/18
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加学生信息</title>
    <link rel="stylesheet" href="view/add-edit.css">
    <script>
        function updateMajors() {
            const department = document.getElementById("department").value;
            const majorSelect = document.getElementById("major");
            majorSelect.innerHTML = ""; // 清空专业选项

            const majors = {
                "信息工程学院": ["软件工程", "计算机科学与技术", "网络工程"],
                "外国语学院": ["英语", "日语", "翻译"],
                "商学院": ["工商管理", "市场营销", "会计学"],
                "艺术学院": ["音乐学", "美术学", "舞蹈学"]
            };

            if (majors[department]) {
                // 添加一个默认提示选项
                const defaultOption = document.createElement("option");
                defaultOption.value = "";
                defaultOption.textContent = "请选择专业";
                defaultOption.disabled = true;
                defaultOption.selected = true;
                majorSelect.appendChild(defaultOption);

                // 添加对应院系的专业选项
                majors[department].forEach(major => {
                    const option = document.createElement("option");
                    option.value = major;
                    option.textContent = major;
                    majorSelect.appendChild(option);
                });
            } else {
                // 如果未选择院系，添加一个提示选项
                const noOption = document.createElement("option");
                noOption.value = "";
                noOption.textContent = "请先选择院系";
                noOption.disabled = true;
                noOption.selected = true;
                majorSelect.appendChild(noOption);
            }
        }

        function checkForm() {
            const id = document.getElementById("number").value;
            const name = document.getElementById("name").value;
            const gender = document.getElementById("gender").value;
            const department = document.getElementById("department").value;
            const major = document.getElementById("major").value;
            const idRegex = /^[0-9]{10}$/
            const nameRegex = /^[a-zA-Z0-9_-]{4,16}$/

            if (!name || !gender || !department || !major) {
                alert("请填写完整信息！");
                return false;
            }
            // if (!idRegex.test(id.value)) {
            //     alert("id格式错误！");
            //     id.focus();
            //     return false;
            // }
        }
    </script>
</head>
<body>
<div class="container">
    <h1>添加学生信息</h1>
    <form action="<%=request.getContextPath()%>/add-student" method="post" onsubmit="checkForm()">
        <%--学号--%>
        <div class="form-group">
            <label for="name">学号：</label>
            <input type="text" id="number" name="Sid" placeholder="请输入学号" required>
        </div>
        <!-- 姓名 -->
        <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" id="name" name="studentName" placeholder="请输入姓名" required>
        </div>

        <!-- 性别 -->
        <div class="form-group">
            <label for="gender">性别：</label>
            <select id="gender" name="studentSex" required>
                <option value="">请选择性别</option>
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>

        <!-- 院系 -->
        <div class="form-group">
            <label for="department">院系：</label>
            <select id="department" name="college" onchange="updateMajors()" required>
                <option value="">请选择院系</option>
                <option value="信息工程学院">信息工程学院</option>
                <option value="外国语学院">外国语学院</option>
                <option value="商学院">商学院</option>
                <option value="艺术学院">艺术学院</option>
            </select>
        </div>

        <!-- 专业 -->
        <div class="form-group">
            <label for="major">专业：</label>
            <select id="major" name="studentMajor" required>
                <option value="">请选择专业</option>
                <!-- 专业选项将由 JavaScript 动态更新 -->
            </select>
        </div>

        <!-- 提交按钮 -->
        <div class="form-group">
            <button type="submit" class="submit-btn">提交</button>
        </div>
    </form>
</div>
</body>
</html>

