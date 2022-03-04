<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sample.DBTest,java.sql.*"%>
<%
Connection conn = null;
String url = "jdbc:mysql://10.42.129.142/20gr26";
String user = "20gr26";
String password = "20gr26";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);
String sql = "SELECT rental.r_id,u_name,r_day,user.address,facility.fac_name,MAX(ren_time.tzone_id) as maxtime,MIN(ren_time.tzone_id) as mintime,equi,p_num,rental.pay,rental.use_situ FROM rental left OUTER JOIN user ON rental.address = user.address LEFT OUTER JOIN facility ON rental.fac_id = facility.fac_id LEFT OUTER JOIN ren_time ON rental.r_id = ren_time.r_id LEFT OUTER JOIN time_zone ON ren_time.tzone_id = time_zone.tzone_id WHERE r_day = CURDATE() GROUP BY rental.r_id";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>利用登録画面</title>
</head>
<body>
    <h1>利用登録画面</h1>
    <table border="1">
        <p>こちらで本日の利用状況一覧が見れます。</p>
        <tr>
            <th>予約番号</th>
            <th>氏名</th>
            <th>予約日</th>
            <th>メールアドレス</th>
            <th>予約施設</th>
            <th>開始</th>
            <th>終了</th>
            <th>備品</th>
            <th>人数</th>
            <th>支払金額</th>
            <th>利用確認</th>
            <th>入場登録</th>
            <th>退場登録</th>
        </tr>
<%! 
String[] begin = {"","7:00","8:00","9:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00"};
String[] end = {"","8:00","9:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"};
int e = 0;
int use = 0;
%>
<% 
while (rs.next()) {
	out.println("<tr>");
	out.println("<td>"+rs.getString("r_id")+"</td>");
	out.println("<td>"+rs.getString("u_name")+"</td>");
	out.println("<td>"+rs.getString("r_day")+"</td>");
	out.println("<td>"+rs.getString("address")+"</td>");
	out.println("<td>"+rs.getString("fac_name")+"</td>");
	out.println("<td>"+begin[rs.getInt("mintime")]+"</td>");
	out.println("<td>"+end[rs.getInt("maxtime")]+"</td>");
	
	e = rs.getInt("equi");
	if(e == 0){
		out.println("<td>有</td>");
	}else if(e == 1){
		out.println("<td>無</td>");
	}
	out.println("<td>"+rs.getString("p_num")+"</td>");
	out.println("<td>"+rs.getString("pay")+"</td>");
	
	use = rs.getInt("use_situ");
	if(use == 0){
		out.println("<td>受付待ち</td>");
	}else if(use == 1){
		out.println("<td>使用中</td>");
	}else if(use == 2){
		out.println("<td>退場済み</td>");
	}
	out.println("<td>");
%>
<button type="button" onclick="location.href='In?id=<%out.print(rs.getString("r_id"));%>'">入場</button>
<%
	out.println("</td>");
out.println("<td>");
%>
<button type="button" onclick="location.href='Out?id=<%out.print(rs.getString("r_id"));%>'">退場</button>
<%
	out.println("</td>");
out.println("<td>");
%>
<button type="button" onclick="location.href='Use_reset?id=<%out.print(rs.getString("r_id"));%>'">リセット</button>
<%
	out.println("</td>");
	out.println("</tr>");
}
%>
    </table>
    <div>
        <p><a href="./main.jsp">戻る</a></p>
    </div>
</body>
</html>