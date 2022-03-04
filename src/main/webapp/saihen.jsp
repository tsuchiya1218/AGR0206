<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>パスワード再発行</title>
<link rel="stylesheet" type="text/css" href="./css/footer.css">
</head>
<body>
	<h1>ドキドキスポーツセンター</h1>
	<h2>パスワード再発行</h2>
	<p>
		パスワードを忘れた場合は以下から再発行することが可能です。<br> お手数ですが、メールアドレスの入力お願いします。
	</p>
	<div>
		<p>パスワード変更用のURLがメールで届きますので、そちらより新しいパスワードに変更してください。</p>
	</div>
	<form action="mails" method="post">
		<div>
			<label>メールアドレス</label> <input type="email" name="mail" id="mail">
		</div>
		<div>
			<p>
				<input type="submit" value="送信する">
			</p>
		</div>
	</form>
	<a href="login">戻る</a>
</body>
<footer>
	<p>
		さいたま市ドキドキスポーツセンター<br> 〒338-0822 埼玉県さいたま市桜区中島4－12－10<br>
		℡：048-859-3374
	</p>
</footer>
</html>