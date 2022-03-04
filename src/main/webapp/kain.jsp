<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会員登録</title>
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<script type="text/javascript">
	function check() {
		var flag = 0;

		if (document.form1.denwa.value.match(/[^0-9]+/)) {
			flag = 1;
		} else if (document.form1.yuubin.value.match(/[^0-9]+/)) {
			flag = 1;
		} else if (document.form1.name.value == "") {
			flag = 1;
		} else if (document.form1.denwa.value == "") {
			flag = 1;
		} else if (document.form1.yuubin.value == "") {
			flag = 1;
		} else if (document.form1.zyu.value == "") {
			flag = 1;
		} else if (document.form1.mail.value == "") {
			flag = 1;
		} else if (document.form1.pas.value == "") {
			flag = 1;
		} else if (document.form1.pas1.value == "") {
			flag = 1;
		}
		if (flag) {
			window.alert('未入力または、入力形式が違います。');
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>
	<h1>ドキドキスポーツセンター</h1>
	<h2>会員登録</h2>
	<p>下記の内容をご入力の上、お進みください。</p>
	<form action="yoyakukakunin.jsp" method="post" name="form1"
		onSubmit="return check()">
		<table border="1" style="border-collapse: collapse">
			<tr>
				<th>氏名</th>
				<td><input type="text" name="name" placeholder="山田太郎" />
				</td>
			</tr>
			<tr>
				<th>生年月日</th>
				<td><p>
						<b>生年月日</b>
						<%
						int year[] = { 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006,
								2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020 };
						int month[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
						int day[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
								30, 31 };
						%>
						<select id="year_id" name="year_id">
							<%
							for (int i = 0; i < year.length; i++) {
							%>
							<option value="<%=i%>"><%=year[i]%></option>
							<%
							}
							%>
						</select> 年 <select id="month_id" name="month_id">
							<%
							for (int j = 0; j < month.length; j++) {
							%>
							<option value="<%=j%>"><%=month[j]%></option>
							<%
							}
							%>
						</select> 月 <select id="day_id" name="day_id">
							<%
							for (int k = 0; k < day.length; k++) {
							%>
							<option value="<%=k%>"><%=day[k]%></option>
							<%
							}
							%>
						</select> 日
					</p> <label>※年は西暦、半角数字</label></td>
			</tr>
			<tr>
				<th>電話番号</th>
				<td><input type="number" name="denwa"
					placeholder="(例）0312345678" /> <label>※半角数字で入力</label></td>
			</tr>
			<tr>
				<th>郵便番号</th>
				<td><input type="number" name="yuubin"
					placeholder="(例）1000005" /> <label>※半角数字で入力</label></td>
			<tr>
				<th>住所</th>
				<td><input type="text" name="zyu" size="50px"
					placeholder="(例）東京都千代田区1-1" /></td>
			</tr>
			<tr>
				<th>メールアドレス</th>
				<td><input type="email" name="mail" size="50px"
					placeholder="(例）20jy0241@jec.ac.jp" /></td>
			</tr>
			<tr>
				<th>パスワード</th>
				<td><input type="password"
					pattern="^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{8,100}$" name="pas" />
					<div class="pasu">
						<label>※８文字以上半角英数</label>
					</div></td>
			</tr>
			<tr>
				<th>パスワード再入力</th>
				<td><input type="password"
					pattern="^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{8,100}$" name="pas1" /></td>
			</tr>
		</table>
		<div>
			<p>
				<input type="submit" value="確認画面へ">
			</p>
		</div>
		<div>
			<a href="login">戻る</a>	
		</div>
	</form>
	<footer>
		<p>
			さいたま市ドキドキスポーツセンター<br> 〒338-0822 埼玉県さいたま市桜区中島4－12－10<br>
			℡：048-859-3374
		</p>
	</footer>
</html>