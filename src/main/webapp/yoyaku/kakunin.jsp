<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setContentType("text/html; charset=UTF-8");
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String date = request.getParameter("date");
String time = request.getParameter("time");
String first = request.getParameter("first");
int price = Integer.parseInt(request.getParameter("price"));
int people = Integer.parseInt(request.getParameter("hito"));


%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>予約確認画面</title>
	</head>
	<body>
		<h1>ドキドキスポーツセンター</h1>
		<h2>予約確認画面</h2>
		
	
		<table>
		<tr>
			<th>コート</th>
			<td><% out.print(name); %></td>
		</tr>
		<tr>
			<th>予約日</th>
			<td><% out.print(date); %></td>
		</tr>
		
		<tr>
			<th>予約時間</th>
			<td><% out.print(time); %></td>
		</tr>
		
		<tr>
			<th>貸出物</th>
			<td><% out.print(first); %></td>
		</tr>
		
		<tr>
			<th>値段</th>
			<td><% out.print(price); %>円</td>
		</tr>
		
		<tr>
			<th>人数</th>
			<td><% out.print(people); %>人</td>
		</tr>
		</table>
		
		<%
		String names = "";
		if(name.equals("サッカーコート")) {
			names = "0001";
		} else if(name.equals("テニスコート")) {
			names = "0002";
		} else if(name.equals("フットサルコート")) {
			names = "0003";
		} else if(name.equals("バスケットコート")) {
			names = "0004";
		} else if(name.equals("バレーコート")) {
			names = "0005";
		}
		
		String times = "";
		if(time.equals("7:00~8:00")) {
			times = "01";
		} else if(time.equals("8:00~9:00")) {
			times = "02";
		} else if(time.equals("9:00~10:00")) {
			times = "03";
		} else if(time.equals("10:00~11:00")) {
			times = "04"; 
		} else if(time.equals("11:00~12:00")) {
			times = "05";
		} else if(time.equals("12:00~13:00")) {
			times = "06";
		} else if(time.equals("13:00~14:00")) {
			times = "07";
		} else if(time.equals("14:00~15:00")) {
			times = "08";
		} else if(time.equals("15:00~16:00")) {
			times = "09";
		} else if(time.equals("16:00~17:00")) {
			times = "10";
		} else if(time.equals("17:00~18:00")) {
			times = "11";
		} else if(time.equals("18:00~19:00")) {
			times = "12";
		} else if(time.equals("19:00~20:00")) {
			times = "13";
		} else if(time.equals("20:00~21:00")) {
			times = "14";
		} else if(time.equals("21:00~22:00")) {
			times = "15";
		} else if(time.equals("22:00~23:00")) {
			times = "16";
		}
		
		int use;
		if(first.equals("あり")) {
			use = 1;
		} else {
			use = 0;
		}
		%>
		
		<form method="Post" action="../yoyaku">
			<input type="hidden" name="names" value="<%= names %>">
			<input type="hidden" name="date" value="<%= date %>">
			<input type="hidden" name="times" value="<%= times %>">
			<input type="hidden" name="use" value="<%= use %>">
			<input type="hidden" name="price" value="<%= price %>">
			<input type="hidden" name="people" value="<%= people %>">
			<input type="submit" id="register" name="register" value="登録">
		</form>
		<a href="yoyaku.jsp">戻る</a>

	</body>
</html>
