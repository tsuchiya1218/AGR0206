<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>コート詳細登録画面</title>
	</head>
	
	<body>
		<h1>ドキドキスポーツセンター</h1>
		
		<h2>施設詳細登録画面</h2>
		
		<form method="Post" action="../facility">
		
		<p>施設ID</p>
		<input type="text" id="id" name="id">
		
		<p>施設名</p>
		<input type="text" id="name" name="name">
		
		<p>施設説明</p>
		<input type="text" id="exp" name="exp">
		
		<p>貸出物</p>
		<input type="text" id="rental" name="rental">
		
		<p>写真</p>
		<input type="file" id="photo" name="photo">
		
		<p>値段</p>
		<input type="text" id="price" name="price">
		
		<p>カテゴリー</p>
		<input type="text" id="cat" name="cat">
		
		<p>
		<input type="submit" id="register" name="register" value="登録">
		</p>
		
		</form>
	</body>
	
	</html>