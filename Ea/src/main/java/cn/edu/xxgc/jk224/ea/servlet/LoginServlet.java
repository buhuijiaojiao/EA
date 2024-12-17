package cn.edu.xxgc.jk224.ea.servlet;

import cn.edu.xxgc.jk224.ea.util.DBUtil;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        //初步校验
        if (username.length()==0 || password.length()==0 ) {
            //重定向
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }
        ServletContext application = this.getServletContext();
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();

        // 获取用户注册时的密码
        String e_pwd = "";
        try {
            Connection conn = DBUtil.getConnection();
            String sql = "SELECT password FROM user where name=? ";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                //获取到用户名对应的记录中的密码字段
                e_pwd = rs.getString("password");
            }
            DBUtil.destory(conn, pstmt, rs);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        //密码校验
        if (password.equals(e_pwd)) {  // 登录成功
            System.out.println(username + "登录成功");
            //同步到会话
            session.setAttribute("username", username);
            //创建cookie
            Cookie c1 = new Cookie("username", username);
            Cookie c2 = new Cookie("password", password);
            if (req.getParameter("remember") != null) {
                // 用户名和密码写入cookie
                c1.setMaxAge(30 * 60);
                c2.setMaxAge(30 * 60);
            } else {
                // 删除cookie
                c1.setMaxAge(0);
                c2.setMaxAge(0);
            }
            c1.setPath(req.getContextPath());
            c2.setPath(req.getContextPath());

            resp.addCookie(c1);
            resp.addCookie(c2);

            //重定向到首页
            resp.sendRedirect(req.getContextPath() + "/index.jsp");


        } else {  // 登录失败
            System.out.println("用户名或密码错误！登录失败");
            out.print("用户名或密码错误！3秒后跳转到<a href='" + req.getContextPath() + "/login.jsp'>登录</a>页面。");

            resp.setHeader("refresh", "3;" + req.getContextPath() + "/login.jsp");
        }


    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

}