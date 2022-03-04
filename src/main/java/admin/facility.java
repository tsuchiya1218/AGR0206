package admin;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class faclility
 */
@WebServlet("/facility")
public class facility extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		Connection conn = null;
		String url = "jdbc:mysql://10.42.129.142/20gr26";
		String user = "20gr26";
		String password = "20gr26";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			throw new ServletException(e);
		}
		try {
			conn = DriverManager.getConnection(url, user, password);
			String sql = "INSERT INTO facility VALUES (?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String exp = request.getParameter("exp");
			String rental = request.getParameter("rental");
			String photo = request.getParameter("photo");
			int price = Integer.parseInt(request.getParameter("price"));
			int cat = Integer.parseInt(request.getParameter("cat"));
			
			pstmt.setString(1,id);
			pstmt.setString(2,name);
			pstmt.setString(3,exp);
			pstmt.setString(4,rental);
			pstmt.setString(5,photo);
			pstmt.setInt(6,price);
			pstmt.setInt(7,cat);
			
			System.out.println(id);
			System.out.println(name);
			System.out.println(exp);
			System.out.println(rental);
			System.out.println(photo);
			System.out.println(price);
			System.out.println(cat);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title>コート</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>登録が完了しました</h1>");
		out.println("<a href=\"main.jsp\">ホームに戻る");
		out.println("</body>");
		out.println("</html>");
		
	}
}
