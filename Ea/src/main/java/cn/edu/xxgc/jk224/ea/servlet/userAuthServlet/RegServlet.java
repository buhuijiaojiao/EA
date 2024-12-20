package cn.edu.xxgc.jk224.ea.servlet.userAuthServlet;

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
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.regex.Pattern;

@WebServlet("/auth/reg")
public class RegServlet extends HttpServlet {

    private static final long serialVersionUID = -2111792517260973671L;

    public RegServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //校验
        String regexUsername="^[a-zA-Z0-9_-]{4,16}$";
//        String regexPassword="";
        if (!Pattern.matches(regexUsername,username) || password.length() == 0) {
            response.sendRedirect(request.getContextPath() + "/regist.jsp");
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
        }
        catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        DBUtil.destory(conn, pstmt, null);

        if (row > 0) {
            //注册成功！
            out.print("注册成功！");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            out.println("<script>alert('注册失败,可能注册的用户名已存在！')</script>");
            out.println("<script>window.location.href='/Ea_war_exploded/regist.jsp'</script>");
        }

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    public void destroy() {
        super.destroy();
    }

}

