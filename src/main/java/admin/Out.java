package admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class riyou
 */
@WebServlet("/Out")
public class Out extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null;
        String url = "jdbc:mysql://10.42.129.142/20gr26";
        String user = "20gr26";
        String password = "20gr26";

        response.setContentType("text/html; charset=UTF-8");

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            throw new ServletException(e);
        }
        try {
            conn = DriverManager.getConnection(url, user, password);
            
            String sql = "UPDATE rental SET use_situ = 2 WHERE r_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(request.getParameter("id")));
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new ServletException(e);
        } 
        getServletConfig().getServletContext()
        .getRequestDispatcher("/riyou.jsp").forward(request, response);
    }
}