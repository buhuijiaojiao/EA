package cn.edu.xxgc.jk224.ea.servlet.studentManageServlet;

import cn.edu.xxgc.jk224.ea.entity.Student;
import cn.edu.xxgc.jk224.ea.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
@WebServlet("/edit-student")
public class EditStudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("Sid");
        String name = request.getParameter("studentName");
        String sex = request.getParameter("studentSex");
        String college = request.getParameter("college");
        String major = request.getParameter("studentMajor");
        Student student = new Student(id, name, sex, college, major);

        int rows = 0;
        try {
            Connection conn = DBUtil.getConnection();

            String sql = "update `student` set `sname` = ?,`ssex` = ? ,`scollege` = ?, `smajor` = ? where `Sid` = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, student.getName());
            pstmt.setString(2, student.getSex());
            pstmt.setString(3, student.getCollege());
            pstmt.setString(4, student.getMajor());
            pstmt.setString(5, student.getId());

            //executeUpdate()方法用于对于执行sql语句INSERT、UPDATE 或 DELETE 语句的效果是修改表中零行或多行中的一列或多列。
            //executeUpdate  的返回值是一个整数（int），指示受影响的行数（即更新计数）。
            rows = pstmt.executeUpdate();

            //释放资源
            DBUtil.destory(conn, pstmt, null);
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        if(rows > 0) {
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }else {
            //修改失败
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}