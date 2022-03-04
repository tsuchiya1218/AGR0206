package admin;

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
 * Servlet implementation class faclility
 */
@WebServlet("/todaytouroku")
public class todaytouroku extends HttpServlet {
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

		String ren_id = "";
		String mail = "";
		int rental_id = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		//予約番号の最大のidを取得する
		try {
            conn = DriverManager.getConnection(url, user, password);
            String sql = "select MAX(r_id) AS id from rental";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            
            if(rs.getString("id") == null) {
            	rental_id = 1;
            	ren_id = String.format("%010d",rental_id);
            } else {
            	rental_id = Integer.parseInt(rs.getString("id"));
            	rental_id += 1;
            	ren_id = String.format("%010d",rental_id);
            }
  
		 } catch (SQLException e) {
			 throw new ServletException(e);
		} 
		
		//個人情報登録
			try {
				conn = DriverManager.getConnection(url, user, password);
				String sql = "INSERT INTO user values (?,?,?,?,?,?,?)";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				mail =  request.getParameter("mail");
				
				pstmt.setString(1, mail);
				pstmt.setString(2, request.getParameter("name"));
				pstmt.setString(3, request.getParameter("year_id") + "-" + request.getParameter("month_id") + "-"+ request.getParameter("day_id"));
				pstmt.setString(4, request.getParameter("denwa"));
				pstmt.setString(5, request.getParameter("yuubin"));
				pstmt.setString(6, request.getParameter("zyu"));
				pstmt.setString(7, request.getParameter("pas"));
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		
		//rental 予約番号、日付、貸出物、人数、コート番号、値段
		try {
			conn = DriverManager.getConnection(url, user, password);
			String sql = "INSERT INTO rental VALUES (?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			String names = request.getParameter("f_names");
			String date = request.getParameter("date");
			int use = Integer.parseInt(request.getParameter("use"));
			int price = Integer.parseInt(request.getParameter("price"));
			int people = Integer.parseInt(request.getParameter("people"));
			
			pstmt.setString(1,ren_id);
			pstmt.setString(2,mail);
			pstmt.setString(3,date);
			pstmt.setInt(4,people);
			pstmt.setInt(5,use);
			pstmt.setInt(6,0);
			pstmt.setString(7,names);
			pstmt.setInt(8,price);

			System.out.println(ren_id);
			System.out.println(mail);
			System.out.println(date);
			System.out.println(people);
			System.out.println(use);
			System.out.println(names);
			System.out.println(price);


			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		//ren_time 予約番号、予約時間id
		try {
			conn = DriverManager.getConnection(url, user, password);
			String sql = "INSERT INTO ren_time VALUES (?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			String times = request.getParameter("times");
			
			pstmt.setString(1,ren_id);
			pstmt.setString(2,times);

			System.out.println(ren_id);
			System.out.println(times);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title>コート</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>予約番号：" + ren_id + "</h1>");
		out.println("<p>予約が完了しました。</p>");
		out.println("<a href=\"main.jsp\">ホームに戻る");
		out.println("</body>");
		out.println("</html>");
		
	}
}
