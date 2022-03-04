<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sample.DBTest,java.sql.*"%>
<%
Connection conn = null;
String url = "jdbc:mysql://10.42.129.142/20gr26";
String user = "20gr26";
String password = "20gr26";
conn = DriverManager.getConnection(url, user, password);
String sql = "SELECT rental.r_id,u_name,r_day,tzone,user.address,facility.fac_name,equi,p_num FROM rental left OUTER JOIN user ON rental.address = user.address LEFT OUTER JOIN facility ON rental.fac_id = facility.fac_id LEFT OUTER JOIN ren_time ON rental.r_id = ren_time.r_id LEFT OUTER JOIN time_zone ON ren_time.tzone_id = time_zone.tzone_id where fac_name like 'フットサルコート' and r_day = CURDATE()";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./CSS/common.css">
    <title>フットサルコート予約情報</title>
</head>
<body>
    <h1>予約情報確認画面</h1>
    <h2>本日の予約情報</h2>
    <table border="1">
    	<tr>
			<th>予約番号</th>
			<th>氏名</th>
			<th>予約日</th>
			<th>予約時間</th>
			<th>メールアドレス</th>
			<th>予約施設</th>
			<th>備品の貸出</th>
			<th>人数</th>
		</tr>
<% 
while (rs.next()) {
	out.println("<tr>");
	out.println("<td>"+rs.getString("r_id")+"</td>");
	out.println("<td>"+rs.getString("u_name")+"</td>");
	out.println("<td>"+rs.getString("address")+"</td>");
	out.println("<td>"+rs.getString("tzone")+"</td>");
	out.println("<td>"+rs.getString("address")+"</td>");
	out.println("<td>"+rs.getString("fac_name")+"</td>");
	int e = rs.getInt("equi");
	if(e == 0){
		out.println("<td>有</td>");
	}else{
		out.println("<td>無</td>");
	}
	out.println("<td>"+rs.getString("p_num")+"</td>");
	out.println("</tr>");
}
%>

    </table>
    <br>
    <a href = "reserv_fut2.jsp">明日以降の予約を確認</a><br>
    <a href="reserv_info.jsp">戻る</a>
</body>
</html>