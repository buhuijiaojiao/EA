package cn.edu.xxgc.jk224.ea.servlet.studentManageServlet;


import cn.edu.xxgc.jk224.ea.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/del-student")
public class DelStudentServlet extends HttpServlet {
    public DelStudentServlet() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.getWriter().append("Served at: ").append(request.getContextPath());
        String id = request.getParameter("Sid");
        int rows = 0;
        try {

            Connection conn = DBUtil.getConnection();

            String sql = "delete from `student` WHERE `Sid` = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);

            rows = pstmt.executeUpdate();

            DBUtil.destory(conn, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (rows > 0) {
            response.sendRedirect(request.getContextPath() + "/student.jsp");
        } else {
            //删除失败
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}