<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="admin.facility,java.sql.*,java.util.Calendar" %>

<%
int time = 1;
String[] tzone = new String[16];

Calendar calendar = Calendar.getInstance();
int year = calendar.get(Calendar.YEAR);
int month = calendar.get(Calendar.MONTH) + 1;
int day = calendar.get(Calendar.DATE);
String date = String.format("%4d-%02d-%02d", year, month, day);
//施設ID
String id = request.getParameter("id");
//名前
String name = request.getParameter("name");
//値段
String price = request.getParameter("price");

Connection conn = null;
String url = "jdbc:mysql://10.42.129.142/20gr26";
String user = "20gr26";
String password = "20gr26";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);


//もう一回繰り返すコート分


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
		<title>コート空き状況確認</title>
	</head>
	<body>
		<body>
    <h1>ドキドキスポーツセンター</h1>
    <h2>コート空き状況確認</h2>
    <h3><% out.print(date); %></h3>
    <h3><% out.print(name); %></h3>
        <table border="1" style="border-collapse: collapse">
            <tr>
                <th>時間</th>
                <th>空き状況</th>
            </tr>
            
            <tr>
            	<td>7:00~8:00</td>
            	<td>
<%
if (tzone[0].equals("1")) {%> 
<p>×</p><%
 } else {%>
<a href="today.jsp?time=7:00~8:00&name=<% out.print(name); %>&price=<% out.print(price); %>&date=<% out.print(date); %>">〇</a> <%
}
%>
				</td>
			</tr>
			
			<tr>
				<td>8:00~9:00</td>
				<td>
<%
if (tzone[1].equals("1")) {%> 
<p>×</p><%
 } else {%>
<a href="today.jsp?time=8:00~9:00&name=<% out.print(name); %>&price=<% out.print(price); %>&date=<% out.print(date); %>">〇</a> <%
}
%> 
				</td>
			</tr>
			
			<tr>
				<td>9:00~10:00</td>
				<td>
<%
if (tzone[2].equals("1")) {%> 
<p>×</p><%
 } else {%>
<a href="today.jsp?time=9:00~10:00&name=<% out.print(name); %>&price=<% out.print(price); %>&date=<% out.print(date); %>">〇</a> <%
}
%> 
				</td>
			</tr>
			
			<tr>
				<td>10:00~11:00</td>
				<td>
<%
if (tzone[3].equals("1")) {%> 
<p>×</p><%
 } else {%>
<a href="today.jsp?time=10:00~11:00&name=<% out.print(name); %>&price=<% out.print(price); %>&date=<% out.print(date); %>">〇</a> <%
}
%> 
				</td>
			</tr>
			<tr>
				<td>11:00~12:00</td>
				<td>
<%
if (tzone[4].equals("1")) {%> 
<p>×</p><%
 } else {%>
<a href="today.jsp?time=11:00~12:00&name=<% out.print(name); %>&price=<% out.print(price); %>&date=<% out.print(date); %>">〇</a> <%
}
%> 
				</td>
			</tr>
			
			<tr>
				<td>12:00~13:00</td>
				<td>
<%
if (tzone[5].equals("1")) {%> 
<p>×</p><%
 } else {%>
<a href="today.jsp?time=12:00~13:00&name=<% out.print(name); %>&price=<% out.print(price); %>&date=<% out.print(date); %>">〇</a> <%
}
%> 
				</td>
			</tr>
			
			<tr>
				<td>13:00~14:00</td>
				<td>
<%
if (tzone[6].equals("1")) {%> 
<p>×</p><%
 } else {%>
<a href="today.jsp?time=13:00~14:00&name=<% out.print(name); %>&price=<% out.print(price); %>&date=<% out.print(date); %>">〇</a> <%
}
%> 
				</td>
			</tr>
			
			<tr>
				<td>14:00~15:00</td>
				<td>
<%
if (tzone[7].equals("1")) {%> 
<p>×</p><%
 } else {%>
<a href="today.jsp?time=14:00~15:00&name=<% out.print(name); %>&price=<% out.print(price); %>&date=<% out.print(date); %>">〇</a> <%
}
%> 
				</td>
			</tr>
			
			<tr>
				<td>15:00~16:00</td>
				<td>
<%
if (tzone[8].equals("1")) {%> 
<p>×</p><%
 } else {%>
<a href="today.jsp?time=15:00~16:00&name=<% out.print(name); %>&price=<% out.print(price); %>&date=<% out.print(date); %>">〇</a> <%
}
%> 
				</td>
			</tr>
			
			<tr>
				<td>16:00~17:00</td>
				<td>
<%
if (tzone[9].equals("1")) {%> 
<p>×</p><%
 } else {%>
<a href="today.jsp?time=16:00~17:00&name=<% out.print(name); %>&price=<% out.print(price); %>&date=<% out.print(date); %>">〇</a> <%
}
%> 
				</td>
			</tr>
			
			<tr>
				<td>17:00~18:00</td>
				<td>
			
<%
if (tzone[10].equals("1")) {%> 
<p>×</p><%
 } else {%>
<a href="today.jsp?time=17:00~18:00&name=<% out.print(name); %>&price=<% out.print(price); %>&date=<% out.print(date); %>">〇</a> <%
}
%> 
				</td>
			</tr>
			
			<tr>
				<td>18:00~19:00</td>
				<td>
<%
if (tzone[11].equals("1")) {%> 
<p>×</p><%
 } else {%>
<a href="today.jsp?time=18:00~19:00&name=<% out.print(name); %>&price=<% out.print(price); %>&date=<% out.print(date); %>">〇</a> <%
}
%> 
				</td>
			</tr>
			
			<tr>
				<td>19:00~20:00</td>
				<td>
<%
if (tzone[12].equals("1")) {%> 
<p>×</p><%
 } else {%>
<a href="../yoyaku/yoyaku.jsp?time=19:00~20:00&name=<% out.print(name); %>&price=<% out.print(price); %>&date=<% out.print(date); %>">〇</a> <%
}
%> 
				</td>
			</tr>
			
			<tr>
				<td>20:00~21:00</td>
				<td>
<%
if (tzone[13].equals("1")) {%> 
<p>×</p><%
 } else {%>
<a href="today.jsp?time=20:00~21:00&name=<% out.print(name); %>&price=<% out.print(price); %>&date=<% out.print(date); %>">〇</a> <%
}
%> 
				</td>
			</tr>
			
			<tr>
				<td>21:00~22:00</td>
				<td>
<%
if (tzone[14].equals("1")) {%> 
<p>×</p><%
 } else {%>
<a href="today.jsp?time=21:00~22:00&name=<% out.print(name); %>&price=<% out.print(price); %>&date=<% out.print(date); %>">〇</a> <%
}
%> 
				</td>
			</tr>
			
			<tr>
				<td>22:00~23:00</td>
				<td>
<%
if (tzone[15].equals("1")) {%> 
<p>×</p><%
 } else {%>
<a href="today.jsp?time=22:00~23:00&name=<% out.print(name); %>&price=<% out.print(price); %>&date=<% out.print(date); %>">〇</a> <%
}
%>
				</td>
			</tr>
        </table>
        
</body>

</html>