package user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

/**
 * Servlet implementation class mails
 */
@WebServlet("/mails")
public class mails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SimpleEmail email = new SimpleEmail();
		try {
			email.setHostName("1252JY02");
			email.addTo("20jy0229@jynet2.jec.ac.jp");
			email.setFrom("20jy0229@jynet2.jec.ac.jp", "ドキドキスポーツセンター");
			email.setSubject("パスワード変更のお知らせ");
			email.setMsg(request.getParameter("mail") + "宛\r\n"
					+ "ドキドキスポーツセンターをご利用いただきありがとうございます。\r\n"
					+ "ご利用のパスワードを変更するには、1時間以内に以下のリンクをクリックしてください。\r\n"
					+ "[パスワードリセット確認ページURL]\r\n"
					+ "http://localhost:8080/seisaku/pas.jsp?mail=" + request.getParameter("mail") + "\r\n"
					+ "※ このメールは送信専用です。返信できませんのでご注意ください。\r\n"
					+ "※ このメールに心当たりがない場合、お手数ですが管理者までお問い合わせください。");
			email.send();
			System.out.println("メール送信完了");
		} catch (EmailException e) {
			e.printStackTrace();
			System.out.println("メール送信失敗");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("mail.jsp");
		dispatcher.forward(request, response);
	}
}
