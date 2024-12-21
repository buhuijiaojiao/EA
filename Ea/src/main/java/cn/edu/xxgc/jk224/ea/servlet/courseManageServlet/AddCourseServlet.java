package cn.edu.xxgc.jk224.ea.servlet.courseManageServlet;

import cn.edu.xxgc.jk224.ea.entity.Course;
import cn.edu.xxgc.jk224.ea.util.CurdUtil;
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

@WebServlet("/add-course")
public class AddCourseServlet extends HttpServlet {
    public AddCourseServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("Cid");
        String name = request.getParameter("courseName");
        Course course = new Course(id, name);
        int rows = 0;
        try {
            Connection conn = DBUtil.getConnection();

            String sql = "insert into `course` (`Cid`, `cname`) VALUES (?, ?)";
            //创建sql操作对象--stmt
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, course.getId());
            pstmt.setString(2, course.getName());


            //executeUpdate()方法用于对于执行sql语句INSERT、UPDATE 或 DELETE 语句的效果是修改表中零行或多行中的一列或多列。
            //executeUpdate  的返回值是一个整数（int），指示受影响的行数（即更新计数）。
            rows = pstmt.executeUpdate();

            //释放sql
            DBUtil.destory(conn, pstmt, null);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if (rows > 0) {
            response.sendRedirect(request.getContextPath() + "/course.jsp");
        } else {
            //添加失败
            CurdUtil.failed(request, response, "添加失败,可能添加课程的课程号已存在！", "/add-course.jsp");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
