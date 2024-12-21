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

@WebServlet("/edit-course")
public class EditCourseServlet extends HttpServlet {
    @Override
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

            String sql = "update `course` set `cname` = ? where `Cid` = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, course.getName());
            stmt.setString(2, course.getId());
            //executeUpdate()方法用于对于执行sql语句INSERT、UPDATE 或 DELETE 语句的效果是修改表中零行或多行中的一列或多列。
            //executeUpdate  的返回值是一个整数（int），指示受影响的行数（即更新计数）。
            rows = stmt.executeUpdate();

            //释放资源
            DBUtil.destory(conn, stmt, null);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if (rows > 0) {
            response.sendRedirect(request.getContextPath() + "/course.jsp");
        } else {
            //修改失败
            CurdUtil.failed(request, response, "修改失败", "/edit-course.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
