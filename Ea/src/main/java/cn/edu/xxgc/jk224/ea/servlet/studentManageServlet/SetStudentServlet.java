package cn.edu.xxgc.jk224.ea.servlet.studentManageServlet;

import cn.edu.xxgc.jk224.ea.entity.Student;
import cn.edu.xxgc.jk224.ea.util.*;

import java.io.IOException;
import java.sql.*;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/set-student")
public class SetStudentServlet extends HttpServlet {
    public SetStudentServlet() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HashSet<Student> students = null;
        try {
            Connection conn = DBUtil.getConnection();

            String sql = "select * from student";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            //查询操作较多且无需考虑数据
            students = new HashSet<>();
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getString("Sid"));
                student.setName(rs.getString("sname"));
                student.setSex(rs.getString("ssex"));
                student.setCollege(rs.getString("scollege"));
                student.setMajor(rs.getString("smajor"));
                students.add(student);
            }

            DBUtil.destory(conn, pstmt, rs);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("studentInfo", students);
        //转发请求到首页
        request.getRequestDispatcher("/index.jsp").forward(request, response);

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
