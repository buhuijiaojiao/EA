package cn.edu.xxgc.jk224.ea.servlet;

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
@WebServlet("/EaSystem/auth/edit-Course")
public class EditCourse extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String name = request.getParameter("name");

        Connection conn;
        int rows = 0;
        try {
            //注册sql驱动
            conn = DBUtil.getConnection();

            String sql = "update `course` set `cname` = ? where `id` = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, id);
            //executeUpdate()方法用于对于执行sql语句INSERT、UPDATE 或 DELETE 语句的效果是修改表中零行或多行中的一列或多列。
            //executeUpdate  的返回值是一个整数（int），指示受影响的行数（即更新计数）。
            rows = stmt.executeUpdate();

            //注消sql驱动
            DBUtil.destory(conn, stmt, null);
        }
        catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if(rows > 0) {
            response.sendRedirect(request.getContextPath()+"/jsp/showcourse.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
