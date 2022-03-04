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
	%>
	<h1>ドキドキスポーツセンター</h1>
	<h2>会員登録確認画面</h2>
	<p>
		入力内容を確認してください。<br> お間違いない場合、登録ボタンを押してください。
	</p>
	<form action="touroku" method="post">
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
				<th>パスワード</th>
				<td><%=pas%></td>
			</tr>
			<tr>
				<th>パスワード再入力</th>
				<td><%=pas%></td>
			</tr>
		</table>
		<div>
			<p>
				<input type="hidden" name="name" value="<%=name%>"> <input
					type="hidden" name="year_id" value="<%=year_id%>"> <input
					type="hidden" name="month_id" value="<%=month_id%>"> <input
					type="hidden" name="day_id" value="<%=day_id%>"> <input
					type="hidden" name="denwa" value="<%=denwa%>"> <input
					type="hidden" name="yuubin" value="<%=yuubin%>"> <input
					type="hidden" name="zyu" value="<%=zyu%>"> <input
					type="hidden" name="mail" value="<%=mail%>"> <input
					type="hidden" name="pas" value="<%=pas%>"> <input
					type="submit" value="登録">
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