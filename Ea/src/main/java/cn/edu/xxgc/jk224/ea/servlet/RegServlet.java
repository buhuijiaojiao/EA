package cn.edu.xxgc.jk224.ea.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/reg")
public class RegServlet extends HttpServlet {
    public RegServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse  response) throws ServletException, IOException {
         response.setContentType("text/html; charset=UTF-8");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse  response) throws ServletException, IOException {
        doGet(request,response);
    }

    public void destroy() {
        super.destroy();
    }


}
