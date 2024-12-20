package cn.edu.xxgc.jk224.ea.servlet.courseManageServlet;


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

@WebServlet("/del-course")
public class DelCourseServlet extends HttpServlet {
    public DelCourseServlet() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        String id = request.getParameter("id");
        int rows = 0;
        try {

            Connection conn = DBUtil.getConnection();

            String sql = "delete from `course` WHERE `Cid` = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);

            rows = pstmt.executeUpdate();

            DBUtil.destory(conn, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (rows > 0) {
            response.sendRedirect(request.getContextPath() + "/course.jsp");
        } else {
            //删除失败
            out.println("<script>alert('删除失败')</script>");
            out.println("<script>window.location.href='/Ea_war_exploded/course.jsp'</script>");

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
