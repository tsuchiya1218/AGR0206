<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>健康管理</title>
</head>
<body>
	<h1>ドキドキスポーツセンター</h1>
    <h2>健康情報登録</h2>
    <p>健康情報を登録してください</p>
    <form action="health" method="post">
    今日の日付<input type="date" name="h_day"><br>
    身長：<input type="number" name="height">cm<br>
    体重：<input type="number" step="0.1" name="weight">kg<br>
    体温：<input type="number" step="0.1" name="temp">℃<br>
    <input type="submit" value="登録"><br>
    <input type="reset" value="リセット"><br>
    <a href="health2.jsp">戻る</a><br>
    </form>
</body>
<footer>
    <p>さいたま市ドキドキスポーツセンター<br>
    〒338-0822  埼玉県さいたま市桜区中島4－12－10 <br>
    ℡：048-859-3374</p>
</footer>
</html>