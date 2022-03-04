<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sample.DBTest,java.sql.*"%>
<%
Connection conn = null;
String url = "jdbc:mysql://10.42.129.142/20gr26";
String user = "20gr26";
String password = "20gr26";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, user, password);
String sql = "SELECT h_day,weight,temp FROM hls where address = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, (String)session.getAttribute("mail"));
ResultSet rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/chart.css">
<title>健康管理</title>
</head>
<body>
<script src="./chartjs/chart.min.js"></script>
	<h1>ドキドキスポーツセンター</h1>
    <h2>健康状態確認画面</h2>
    <p>自分の健康状態を把握しましょう。</p>
    <h3>身長</h3>
<% 
int height = Integer.parseInt(request.getParameter("height"));
out.println(height+"cm");
%>
    <h3>体重</h3>
    
<div class="chart-container" style="position: relative; height:20vh; width:40vw">
	<canvas id="myChart1"></canvas>
<script>
var ctx = document.getElementById('myChart1').getContext('2d');
var chart1 = new Chart(ctx, {
    type: 'line',

    // データを指定
    data: {
        labels: [<%
        	while(rs.next()){
        		out.print("'"+rs.getString("h_day")+"',");
        	}
        	%>],
        datasets: [{
            label: '体重',
            borderColor: 'rgb(75, 192, 192)',
            fill: false,
            data: [<%
                rs = pstmt.executeQuery();
                while(rs.next()){
                	out.print(rs.getDouble("weight")+",");
                }
                %>]
        }]
    },

    // 設定はoptionsに記述
    options: {
      //タイトル
      title: {
        display: true,
        text: '体重'
      }
    }
});
</script>
</div>
<br>
    <h3>体温</h3>
    
<div class="chart-container" style="position: relative; height:20vh; width:40vw">
<canvas id="myChart2"></canvas>
<script>
var ctx = document.getElementById('myChart2').getContext('2d');
var chart2 = new Chart(ctx, {
    type: 'line',

    // データを指定
    data: {
        labels: [<%
            rs = pstmt.executeQuery();
            while(rs.next()){
            	out.print(rs.getString("h_day")+",");
            }
            %>],
        datasets: [{
            label: '体温',
            borderColor: 'rgb(75, 192, 192)',
            fill: false,
            data: [<%
                rs = pstmt.executeQuery();
                while(rs.next()){
                	out.print(rs.getDouble("temp")+",");
                }
                %>]
        }]
    },

    // 設定はoptionsに記述
    options: {
      //タイトル
      title: {
        display: true,
        text: '体温'
      }
    }
});

</script>
</div>
<br>
    <a href="health.jsp">健康管理画面に戻る</a><br>
    <a href="index.jsp">ホームに戻る</a>
</body>
<footer>
    <p>さいたま市ドキドキスポーツセンター<br>
    〒338-0822  埼玉県さいたま市桜区中島4－12－10 <br>
    ℡：048-859-3374</p>
</footer>
</html>