package cn.edu.xxgc.jk224.ea.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import javax.xml.crypto.dsig.spec.XPathType;
import java.io.IOException;
import java.io.PrintWriter;
@WebFilter("/*")
public class AuthFilter extends HttpFilter {

    public void doFilter(ServletRequest servletRequest, ServletResponse HttpServletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request=(HttpServletRequest) servletRequest;
        HttpServletResponse response=(HttpServletResponse) HttpServletResponse;
        response.setContentType("text/html;charset=utf-8");
        //获取到用户认证会话
        HttpSession session=request.getSession();
        String path=request.getServletPath();
        String uri=request.getRequestURI();

        if ("/login.jsp".equals(path) || "/regist.jsp".equals(path) || path.startsWith("/auth")
            || (session!=null && session.getAttribute("username")!=null)
            || uri.startsWith(request.getContextPath() + "/view/")){
            //过滤完成，交给下一个过滤器
            filterChain.doFilter(request,response);

        }else {
            //拦截重定向
            PrintWriter out=response.getWriter();
            out.println("<script>alert('请登录后再访问')</script>");
            out.println("<script>window.location.href='"+request.getContextPath()+"/login.jsp"+"'</script>");
        }
    }
}
