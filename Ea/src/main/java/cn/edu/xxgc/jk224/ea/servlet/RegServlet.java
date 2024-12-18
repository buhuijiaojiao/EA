package cn.edu.xxgc.jk224.ea.servlet;

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

@WebServlet("/reg")
public class RegServlet extends HttpServlet {

    private static final long serialVersionUID = -2111792517260973671L;

    public RegServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username.length() == 0 || password.length() == 0) {
            response.sendRedirect(request.getContextPath() + "/reg.jsp");
            return;
        }

        PrintWriter out = response.getWriter();

//        连接数据库
        Connection conn = null;


        String sql = "INSERT INTO `teacher` (`name`, `password`) VALUES (?, ?)";
        PreparedStatement pstmt = null;
        int row = 0;
        try {
            conn = DBUtil.getConnection();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            row = pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        DBUtil.destory(conn, pstmt, null);

        if (row > 0) {
            //注册成功！
            out.print("注册成功！");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            out.print("注册失败");
            response.sendRedirect(request.getContextPath() + "/regist.jsp");
        }

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    public void destroy() {
        super.destroy();
    }

}

