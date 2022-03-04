package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/pas")
public class pas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = null;
		String url = "jdbc:mysql://10.42.129.142/20gr26";
		String user = "20gr26";
		String password = "20gr26";

		response.setContentType("text/html;charset=UTF-8");

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			throw new ServletException(e);
		}
		try {
			conn = DriverManager.getConnection(url, user, password);
			String sql = "UPDATE user SET pass = ? WHERE address=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("pass"));
			pstmt.setString(2, request.getParameter("name"));
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("pashen.jsp");
		dispatcher.forward(request, response);
	}
}
