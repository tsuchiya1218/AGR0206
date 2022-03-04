<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Boolean b = (Boolean) request.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
</head>
<body>
	<h1>ドキドキスポーツセンター</h1>
	<h2>ログイン</h2>
	<%
	if (b) {
	%>
	<p>
		<font color="red">入力内容に誤りまたは、未入力項目があります。</font>
	</p>
	<%
	}
	%>
	<p>ログイン情報を入力してください。</p>
	<form action="login" method="post">
		<div class="a">
			<label>メールアドレス:</label> <input type="text" name="mail">
		</div>
		<div class="b">
			<label>パスワード:</label> <input type="password" name="password">
		</div>
		<div>
		<input type="submit" value="ログイン">
		</div>
	</form>
	<p>
		<a href="saihen.jsp">パスワードをお忘れですか</a>
	</p>
	<p>
		<a href="kain.jsp">新規会員登録はこちら</a>
	</p>
	<p>
		<a href="index.jsp">戻る</a>
	</p>
</body>
</html>