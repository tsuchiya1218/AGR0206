<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<title>会員登録確認</title>
</head>
<body>
	<%
	int year[] = { 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006,
			2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020 };
	int month[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
	int day[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
			30, 31 };
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	int year_id = year[Integer.parseInt(request.getParameter("year_id"))];
	int month_id = month[Integer.parseInt(request.getParameter("month_id"))];
	int day_id = day[Integer.parseInt(request.getParameter("day_id"))];
	String denwa = request.getParameter("denwa");
	String yuubin = request.getParameter("yuubin");
	String zyu = request.getParameter("zyu");
	String mail = request.getParameter("mail");
	String pas = request.getParameter("pas");
	String time = request.getParameter("time");
	String f_name = request.getParameter("f_name");
	String first = request.getParameter("first");
	int price = Integer.parseInt(request.getParameter("price"));
	int people = Integer.parseInt(request.getParameter("people"));
	String date = request.getParameter("date");
	%>
	<h1>ドキドキスポーツセンター</h1>
	<h2>当日予約確認画面</h2>
	<p>
		入力内容を確認してください。<br> お間違いない場合、登録ボタンを押してください。
	</p>
		<table border="1" style="border-collapse: collapse">
			<tr>
				<th>氏名</th>
				<td><%=name%></td>
			</tr>
			<tr>
				<th>生年月日</th>
				<td><%=year_id%>年<%=month_id%>月<%=day_id%>日</td>
			</tr>
			<tr>
				<th>電話番号</th>
				<td><%=denwa%></td>
			</tr>
			<tr>
				<th>郵便番号</th>
				<td><%=yuubin%></td>
			<tr>
				<th>住所</th>
				<td><%=zyu%></td>
			</tr>
			<tr>
				<th>メールアドレス</th>
				<td><%=mail%></td>
			</tr>
			<tr>
				<th>日付</th>
				<td><%=date%></td>
			</tr>
			<tr>
				<th>利用時間</th>
				<td><%=time%></td>
			</tr>
			<tr>
				<th>コート</th>
				<td><%=f_name%></td>
			</tr>
			<tr>
				<th>貸出物</th>
				<td><%=first%></td>
			</tr>
			<tr>
				<th>値段</th>
				<td><%=price%></td>
			</tr>
			<tr>
				<th>人数</th>
				<td><%=people%></td>
			</tr>
		</table>
		
		<%
		String f_names = "";
		if(f_name.equals("サッカーコート")) {
			f_names = "0001";
		} else if(f_name.equals("テニスコート")) {
			f_names = "0002";
		} else if(f_name.equals("フットサルコート")) {
			f_names = "0003";
		} else if(f_name.equals("バスケットコート")) {
			f_names = "0004";
		} else if(f_name.equals("バレーコート")) {
			f_names = "0005";
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
		
	<form action="../todaytouroku" method="post">
		<div>
			<p>
				<input type="hidden" name="name" value="<%=name%>"> 
				<input type="hidden" name="year_id" value="<%=year_id%>"> 
				<input type="hidden" name="month_id" value="<%=month_id%>"> 
				<input type="hidden" name="day_id" value="<%=day_id%>"> 
				<input type="hidden" name="denwa" value="<%=denwa%>"> 
				<input type="hidden" name="yuubin" value="<%=yuubin%>"> 
				<input type="hidden" name="zyu" value="<%=zyu%>"> 
				<input type="hidden" name="mail" value="<%=mail%>"> 
				<input type="hidden" name="pas" value="<%=pas%>"> 
				<input type="hidden" name="times" value="<%=times%>">
				<input type="hidden" name="f_names" value="<%=f_names%>">
				<input type="hidden" name="use" value="<%=use%>">
				<input type="hidden" name="price" value="<%=price%>">
				<input type="hidden" name="people" value="<%=people%>">
				<input type="hidden" name="date" value="<%=date%>">
 				<input type="submit" value="登録">
			</p>
		</div>
	</form>
	<footer>
		<p>
			さいたま市ドキドキスポーツセンター<br> 〒338-0822 埼玉県さいたま市桜区中島4－12－10<br>
			℡：048-859-3374
		</p>
	</footer>
</html>