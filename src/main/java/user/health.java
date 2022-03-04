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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class health
 */
@WebServlet("/health")
public class health extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		String url = "jdbc:mysql://10.42.129.142/20gr26";
		String user = "20gr26";
		String password = "20gr26";
		HttpSession session = request.getSession();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			String sql = "INSERT INTO hls values(?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, (String) session.getAttribute("mail"));
			pstmt.setString(2, (String)request.getParameter("h_day"));
			pstmt.setString(3, (String)request.getParameter("weight"));
			pstmt.setString(4, (String)request.getParameter("temp"));
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		int height = Integer.parseInt(request.getParameter("height"));
		request.setAttribute("height", height);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("health3.jsp");
		dispatcher.forward(request, response);
		
	}

}
