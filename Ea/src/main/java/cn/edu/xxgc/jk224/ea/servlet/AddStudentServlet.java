package cn.edu.xxgc.jk224.ea.servlet;


import cn.edu.xxgc.jk224.ea.entity.Student;
import cn.edu.xxgc.jk224.ea.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/add-student")
public class AddStudentServlet extends HttpServlet {

    public AddStudentServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        //获取表单输入的学生信息
        String id = request.getParameter("Sid");
        String name = request.getParameter("studentName");
        String sex = request.getParameter("studentSex");
        String college = request.getParameter("college");
        String major = request.getParameter("studentMajor");
        Student student = new Student(id, name, sex, college, major);


        int rows = 0;
        try {
            Connection conn = DBUtil.getConnection();

            String sql = "insert into `student` (`Sid`, `sname`, `ssex`, `scollege`, `smajor`) VALUES (?, ?, ?, ?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, student.getId());
            pstmt.setString(2, student.getName());
            pstmt.setString(3, student.getSex());
            pstmt.setString(4, student.getCollege());
            pstmt.setString(5, student.getMajor());
            rows = pstmt.executeUpdate();
            DBUtil.destory(conn, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (rows > 0) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            //添加失败
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}