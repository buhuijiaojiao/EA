package cn.edu.xxgc.jk224.ea.servlet;



import cn.edu.xxgc.jk224.ea.entity.Course;
import cn.edu.xxgc.jk224.ea.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ListCourse extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Course> courses=new ArrayList<>();

        try {
            Connection conn= DBUtil.getConnection();
            String sql = "select * from course";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next())
            {
                Course course=new Course();
                course.setId(rs.getString("id"));
                course.setName(rs.getString("name"));
                courses.add(course);
            }

            DBUtil.destory(conn, pstmt, rs);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        request.setAttribute("course info", courses);
        request.getRequestDispatcher("/showcourse.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
