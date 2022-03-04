package sample;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DBTest
 */
@WebServlet("/DBTest")
public class DBTest extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null;
        String url = "jdbc:mysql://10.42.129.142/20gr26";
        String user = "20gr26";
        String password = "20gr26";

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception e) {
            throw new ServletException(e);
        }
        try {
            conn = DriverManager.getConnection(url, user, password);
            String sql = "select u_name from user";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                out.print(rs.getString("u_name") + "　");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        }
    }
}