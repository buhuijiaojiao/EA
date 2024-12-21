package cn.edu.xxgc.jk224.ea.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class CurdUtil {
    public static void failed(HttpServletRequest request, HttpServletResponse response,String message,String targetRelativelyURL) throws IOException {
        PrintWriter out=response.getWriter();
        String path=request.getContextPath()+targetRelativelyURL;
        out.println("<script>alert('"+message+"')</script>");
        out.println("<script>window.location.href='"+path+"'</script>");
    }
}
