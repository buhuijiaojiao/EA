package cn.edu.xxgc.jk224.ea.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {

    private static String drivername = "com.mysql.cj.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/ea?characterEncoding=utf8&serverTimezone=GMT%2B8";
    private static String user = "root";
    private static String password = "123456";

    // 驱动只需注册一次，放到静态代码块中，仅在加载类时执行一次。
    static {
        // 1. 注册数据库驱动
        try {
            Class.forName(drivername);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 建立数据库连接
     * @return 数据库连接对象 Connection
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException {
        // 2. 建立数据库连接
        Connection conn =  DriverManager.getConnection(url, user, password);
        return conn;
    }

    /**
     * 释放资源
     * @param conn 数据库连接对象
     * @param stmt 数据库操作对象
     * @param rs 结果集对象
     */
    public static void destory(Connection conn, Statement stmt, ResultSet rs) {
        if(conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        if(stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        if(rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}