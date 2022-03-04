<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="admin.facility,java.sql.*,java.util.Calendar"%>
<%
Connection conn = null;
String url = "jdbc:mysql://10.42.129.142/20gr26";
String user = "20gr26";
String password = "20gr26";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);
String sql = "select * from facility WHERE fac_id = 0001";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
rs.next();


/* カレンダー */
Calendar calendar = Calendar.getInstance();
int year = calendar.get(Calendar.YEAR);
int month = calendar.get(Calendar.MONTH);
int day = calendar.get(Calendar.DATE);
/* 今月が何曜日から開始されているか確認する */
calendar.set(year, month, 1);
int startWeek = calendar.get(Calendar.DAY_OF_WEEK);

/* 先月が何日までだったかを確認する */
calendar.set(year, month, 0);
int beforeMonthlastDay = calendar.get(Calendar.DATE);

/* 今月が何日までかを確認する */
calendar.set(year, month + 1, 0);
int thisMonthlastDay = calendar.get(Calendar.DATE);

int[] calendarDay = new int[42];
int count = 0;

/* 先月分の日付を格納する */
for (int i = startWeek - 2 ; i >= 0 ; i--){
  calendarDay[count++] = beforeMonthlastDay - i;
}

/* 今月分の日付を格納する */
for (int i = 1 ; i <= thisMonthlastDay ; i++){
  calendarDay[count++] = i;
}

/* 翌月分の日付を格納する */
int nextMonthDay = 1;
while (count % 7 != 0){
  calendarDay[count++] = nextMonthDay++;
}

int weekCount = count / 7;

String[] weeks = {"日","月","火","水","木","金","土"};
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>サッカーコート</title>
<link rel="stylesheet" href="../CSS/sports.css">
</head>

<body>
	<h1>ドキドキスポーツセンター</h1>
	<h2>
		<% out.print(rs.getString("fac_name")); %> 
	</h2>

	<img src="../img/<% out.print(rs.getString("fac_img")); %>">

	<h2>空き状況</h2>
	
	<!-- カレンダー -->

	<form action="soccer2.jsp" method="Post">
	<% out.print(year + "年" + (month + 1) + "月"); %>
	<input type="submit" id="left" name="left" value="＞">
	</form>
	
	<table border="1" style="border-collapse:	collapse">
	<!-- 曜日 -->
		<tr>
			<% for(String s : weeks) {%>
				<th><%out.print(s);%></th>
			<% } %>
		</tr>
		<!-- 日付け -->
		<% for (int i = 0 ; i < weekCount ; i++){ %>
		<tr>
			<% for (int j = i * 7 ; j < i * 7 + 7 ; j++){ %>
				<td><% if (calendarDay[j] < 10){
					out.print(" " + calendarDay[j] + " ");
					%><a href="../yoyaku/yoyaku.jsp?y=<% out.print(year); %>&m=<% out.print(month + 1); %>&d=<% out.print(calendarDay[j]); %>&n=<% out.print(rs.getString("fac_name")); %>&id=<% out.print(rs.getString("fac_id")); %>&p=<% out.print(rs.getString("price")); %>">〇</a><%
			       }else{
			          out.print(calendarDay[j] + " ");
			          %><a href="../yoyaku/yoyaku.jsp?y=<% out.print(year); %>&m=<% out.print(month + 1); %>&d=<% out.print(calendarDay[j]); %>&n=<% out.print(rs.getString("fac_name")); %>&id=<% out.print(rs.getString("fac_id")); %>&p=<% out.print(rs.getString("price")); %>">〇</a><%
			       } %></td>
			<% } %>
		</tr>
		<% } %>	
	</table>
	<h2>施設概要</h2>
	<% out.print(rs.getString("fac_exp")); %>

	<h2>貸出物</h2>
	<% out.print(rs.getString("len")); %>

	<h2>値段</h2>
	<% out.print(rs.getInt("price")); %>

</body>
<footer>
    <p>さいたま市ドキドキスポーツセンター<br>
    〒338-0822  埼玉県さいたま市桜区中島4－12－10 <br>
    ℡：048-859-3374</p>
</footer>
</html>