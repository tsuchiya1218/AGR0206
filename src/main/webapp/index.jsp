<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./CSS/common.css">
    <title>ドキドキスポーツセンターTOP</title>
</head>
<body>
    <h1>ドキドキスポーツセンター</h1>
    <div class="login">
<%

String name = (String)session.getAttribute("name");

if(name == null){
%>
	<button type="button" onclick="location.href='login'">ログイン</button><br>
<%
	
}else{
	out.println(name + " でログイン中"); 
%>
	<button type="button" onclick="location.href='logout'">ログアウト</button><br>
<%
}
%>
        
    </div>
    <h2>トップ</h2>
    <h3>さいたま市最大規模のスポーツセンター！！</h3>
    <ul>
        <li>屋外のコート</li>
        <a href="./sports/soccer.jsp">サッカーコート</a><br>
        <a href="./sports/tennis.jsp">テニスコート</a><br>
        <a href="./sports/futsal.jsp">フットサルコート</a><br>
        <br><li>屋内のコート</a></li>
        <a href="./sports/volleyball.jsp">バレーコート</a><br>
        <a href="./sports/basketball.jsp">バスケコート</a><br>
    </ul>
    <br>
    
<%
if(name == null){
	
}else{
%>
	<button type="button" onclick="location.href='health.jsp'">健康管理機能を使う</button>
<%
}
%>
    
    
</body>
<footer>
    <p>さいたま市ドキドキスポーツセンター<br>
    〒338-0822  埼玉県さいたま市桜区中島4－12－10 <br>
    ℡：048-859-3374</p>
</footer>
</html>