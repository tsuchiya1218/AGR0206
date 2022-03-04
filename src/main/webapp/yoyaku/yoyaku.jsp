<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="admin.facility,java.sql.*"%>

<%
int time = 1;
String[] tzone = new String[16];
//年、月、日
int y = Integer.parseInt(request.getParameter("y"));
int m = Integer.parseInt(request.getParameter("m"));
int d = Integer.parseInt(request.getParameter("d"));
String date = String.format("%4d-%02d-%02d", y, m, d);
//施設ID
String id = request.getParameter("id");
//名前
String n = request.getParameter("n");
//値段
int p = Integer.parseInt(request.getParameter("p"));

Connection conn = null;
String url = "jdbc:mysql://10.42.129.142/20gr26";
String user = "20gr26";
String password = "20gr26";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);

for (int i = 0; i < 16; i++) {
	String sql = "SELECT count(*) FROM rental INNER JOIN ren_time ON rental.r_id = ren_time.r_id WHERE ren_time.tzone_id = ? AND rental.r_day = ? AND fac_id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	time = time + i;
	String t = String.format("%02d", time);
	pstmt.setString(1, t);
	pstmt.setString(2, date);
	pstmt.setString(3, id);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	//配列入れる
	tzone[i] = rs.getString(1);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>予約画面</title>
</head>
<body>
	<h1>ドキドキスポーツセンター</h1>

	<h2>予約画面</h2>

	<form method="Post" action="kakunin.jsp">
		<table>
			<tr>
				<th>コート</th>
				<td>
					<%
					out.print(n);
					%>
				</td>
			</tr>
			<tr>
				<th>予約日</th>
				<td>
					<%
					out.print(date);
					%>


				</td>
			</tr>

			<tr>
				<th>予約時間</th>
				<td>
					<%
					if (tzone[0].equals("1")) {
					%> <input
					type="checkbox" id="time" name="time"  disabled="disabled">7:00~8:00 <%
 } else {
 %>
					<input type="checkbox" id="time" name="time" value="7:00~8:00">7:00~8:00 <%
					}
%> <%
 if (tzone[1].equals("1")) {
 %> <input
					type="checkbox" id="time" name="time" disabled="disabled">8:00~9:00 <%
 } else {
 %>
					<input type="checkbox" id="time" name="time" value="8:00~9:00">8:00~9:00 
					<%
}
%> <%
 if (tzone[2].equals("1")) {
 %> <input
					type="checkbox" id="time" name="time" disabled="disabled">9:00~10:00
					<%
 } else {
 %> <input type="checkbox" id="time" name="time" value="9:00~10:00">9:00~10:00 
 					<%
 }
%><%
if (tzone[3].equals("1")) {
%> <input
					type="checkbox" id="time" name="time" disabled="disabled">10:00~11:00
					<%
 } else {
 %> <input type="checkbox" id="time" name="time" value="10:00~11:00">10:00~11:00
					<%
 }
 %> <%
 if (tzone[4].equals("1")) {
 %> <input
					type="checkbox" id="time" name="time" disabled="disabled">11:00~12:00
					<%
 } else {
 %> <input type="checkbox" id="time" name="time" value="11:00~12:00">11:00~12:00
					<%
 }
 %> <%
 if (tzone[5].equals("1")) {
 %> <input
					type="checkbox" id="time" name="time" disabled="disabled">12:00~13:00
					<%
 } else {
 %> <input type="checkbox" id="time" name="time" value="12:00~13:00">12:00~13:00
					<%
 }
 %> <%
 if (tzone[6].equals("1")) {
 %> <input
					type="checkbox" id="time" name="time" disabled="disabled">13:00~14:00
					<%
 } else {
 %> <input type="checkbox" id="time" name="time" value="13:00~14:00">13:00~14:00
					<%
 }
 %> <%
 if (tzone[7].equals("1")) {
 %> <input
					type="checkbox" id="time" name="time" disabled="disabled">14:00~15:00
					<%
 } else {
 %> <input type="checkbox" id="time" name="time" value="14:00~15:00">14:00~15:00
					<%
 }
 %> <br> <%
 if (tzone[8].equals("1")) {
 %> <input
					type="checkbox" id="time" name="time" disabled="disabled">15:00~16:00
					<%
 } else {
 %> <input type="checkbox" id="time" name="time" value="15:00~16:00">15:00~16:00
					<%
 }
 %> <%
 if (tzone[9].equals("1")) {
 %> <input
					type="checkbox" id="time" name="time" disabled="disabled">16:00~17:00
					<%
 } else {
 %> <input type="checkbox" id="time" name="time" value="16:00~17:00">16:00~17:00
					<%
 }
 %> <%
 if (tzone[10].equals("1")) {
 %> <input
					type="checkbox" id="time" name="time" disabled="disabled">17:00~18:00
					<%
 } else {
 %> <input type="checkbox" id="time" name="time" value="17:00~18:00">17:00~18:00
					<%
 }
 %> <%
 if (tzone[11].equals("1")) {
 %> <input
					type="checkbox" id="time" name="time" disabled="disabled">18:00~19:00
					<%
 } else {
 %> <input type="checkbox" id="time" name="time" value="18:00~19:00">18:00~19:00
					<%
 }
 %> <%
 if (tzone[12].equals("1")) {
 %> <input
					type="checkbox" id="time" name="time" disabled="disabled">19:00~20:00
					<%
 } else {
 %> <input type="checkbox" id="time" name="time" value="19:00~20:00">19:00~20:00
					<%
 }
 %> <%
 if (tzone[13].equals("1")) {
 %> <input
					type="checkbox" id="time" name="time" disabled="disabled">20:00~21:00
					<%
 } else {
 %> <input type="checkbox" id="time" name="time" value="20:00~21:00">20:00~21:00
					<%
 }
 %> <%
 if (tzone[14].equals("1")) {
 %> <input
					type="checkbox" id="time" name="time" disabled="disabled">21:00~22:00
					<%
 } else {
 %> <input type="checkbox" id="time" name="time" value="21:00~22:00">21:00~22:00
					<%
 }
 %> <%
 if (tzone[15].equals("1")) {
 %> <input
					type="checkbox" id="time" name="time" disabled="disabled">22:00~23:00
					<%
 } else {
 %> <input type="checkbox" id="time" name="time" value="22:00~23:00">22:00~23:00
					<%
 }
 %>

				</td>
			</tr>

			<tr>
				<th>貸出物</th>
				<td><input type="radio" id="first" name="first" value="あり" checked>あり <input
					type="radio" id="first" name="first" value="なし"> なし</td>
			</tr>

			<tr>
				<th>値段</th>
				<td>
					<% out.print(p); %>円
				</td>
			</tr>

			<tr>
				<th>人数</th>
				<td><input type="text" id="hito" name="hito" size="1">人</td>
			</tr>
		</table>

		<input type="hidden" name="name" value="<%= n %>">
		<input type="hidden" name="date" value="<%= date %>">
		<input type="hidden" name="price" value="<%= p %>">
		<input type="submit" id="register" name="register" value="確認">
	</form>
	<a href="yoyaku.jsp">戻る</a>
</body>
</html>