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


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //初步校验
        if (username.length()==0 || password.length()==0 ) {
            //重定向
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        ServletContext application = this.getServletContext();
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        // 获取用户注册时的密码
        String e_pwd = "";
        try {
            Connection conn = DBUtil.getConnection();
            String sql = "SELECT password FROM teacher where name=? ";
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
            if (request.getParameter("remember") != null) {
                // 用户名和密码写入cookie
                c1.setMaxAge(30 * 60);
                c2.setMaxAge(30 * 60);
            } else {
                // 删除cookie
                c1.setMaxAge(0);
                c2.setMaxAge(0);
            }
            c1.setPath(request.getContextPath());
            c2.setPath(request.getContextPath());

            response.addCookie(c1);
            response.addCookie(c2);

            //重定向到首页
            response.sendRedirect(request.getContextPath() + "/index.jsp");


        } else {  // 登录失败
            System.out.println("用户名或密码错误！登录失败");
            out.print("用户名或密码错误！3秒后跳转到<a href='" + request.getContextPath() + "/login.jsp'>登录</a>页面。");

            response.setHeader("refresh", "3;" + request.getContextPath() + "/login.jsp");
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse  response) throws ServletException, IOException {
        doGet(request,response);
    }

}