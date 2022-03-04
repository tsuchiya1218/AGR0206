<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>新しいパスワード作成</title>
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<script type="text/javascript">
	function check() {
		var flag = 0;
		if (document.form2.pass.value == "") {
			flag = 1;
		} else if (document.form2.pass1.value == "") {
			flag = 1;
		}
		if (flag) {
			window.alert('未入力項目があります。');
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>
	<h1>ドキドキスポーツセンター</h1>
	<h2>新しいパスワードの入力</h2>
	<p>
		新しく設定するパスワードを入力して変更ボタンを押してください。<br> ※８文字以上半角英数
	</p>
	<form action="pas" method="post" name="form2" onSubmit="return check()">
		<div>
			<label>新しいパスワード</label> <input type="password"
				pattern="^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{8,100}$" name="pass">
		</div>
		<div>
			<label>新しいパスワード（確認用）</label> <input type="password"
				pattern="^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{8,100}$" name="pass1">
		</div>
		<div>
			<p>
				<input type="hidden" name="name"
					value="<%=request.getParameter("mail")%>"> <input
					type="submit" value="変更する">
			</p>
		</div>
	</form>
</body>
<footer>
	<p>
		さいたま市ドキドキスポーツセンター<br> 〒338-0822 埼玉県さいたま市桜区中島4－12－10<br>
		℡：048-859-3374
	</p>
</footer>
</html>