package user;

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

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

@WebServlet("/touroku")
public class touroku extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = null;
		String url = "jdbc:mysql://10.42.129.142/20gr26";
		String user = "20gr26";
		String password = "20gr26";

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			throw new ServletException(e);
		}
		try {
			conn = DriverManager.getConnection(url, user, password);
			String sql = "INSERT INTO user values (?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("mail"));
			pstmt.setString(2, request.getParameter("name"));
			pstmt.setString(3, request.getParameter("year_id") + "-" + request.getParameter("month_id") + "-"
					+ request.getParameter("day_id"));
			pstmt.setString(4, request.getParameter("denwa"));
			pstmt.setString(5, request.getParameter("yuubin"));
			pstmt.setString(6, request.getParameter("zyu"));
			pstmt.setString(7, request.getParameter("pas"));
			pstmt.executeUpdate();
			
			out.println("<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"./css/footer.css\"></head><body>");
			out.println("<title>");
			out.println("新規会員登録");
			out.println("</title>");
			out.println("<h1>");
			out.println("ドキドキスポーツセンター");
			out.println("</h1>");
			out.println("<h2>");
			out.println("新規会員登録が完了しました！");
			out.println("</h2>");
			out.println("<p>");
			out.println(" 会員登録ありがとうございます。<br>\r\n"
					+ "登録したアドレスに会員登録メールを送信しました。<br>\r\n"
					+ "引き続きよろしくお願いします。");
			out.println("</p>");
			out.println("<a  href=\"login\">");
			out.println("ログインページへ");
			out.println("</a>");
			out.println("<footer>");
			out.println("さいたま市ドキドキスポーツセンター\r\n"+"〒338-0822 埼玉県さいたま市桜区中島4－12－10\r\n"
					+ "℡：048-859-3374");
			out.println("</footer>");
			out.println("</body></html>");
			SimpleEmail email = new SimpleEmail();
			try {
				email.setHostName("1252JY02");
				email.addTo("20jy0229@jynet2.jec.ac.jp");
				email.setFrom("20jy0229@jynet2.jec.ac.jp", "ドキドキスポーツセンター");
				email.setSubject("会員登録のお知らせ");
				email.setMsg("※本メールはシステムから自動送信されています。\r\n"
						+ request.getParameter("name") + "様\r\n"
						+ "この度は、会員登録いただき誠にありがとうございます。\r\n"
						+ "当メールでは、ご登録の完了を確認するため送信させていただいております。\r\n"
						+ "引き続き、" + request.getParameter("name") + "様のご利用を心よりお待ちしております。\r\n"
						+ "また、当メールに心当たりがない場合や不明な点がございましたら、お手数ですが管理者までご連絡ください。\r\n"
						+ "※ このメールは送信専用です。返信できませんのでご注意ください。\r\n"
						+ "※ このメールに心当たりがない場合、お手数ですが管理者までお問い合わせください。");
				email.send();
				System.out.println("メール送信完了");
			} catch (EmailException e) {
				e.printStackTrace();
				System.out.println("メール送信失敗");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
