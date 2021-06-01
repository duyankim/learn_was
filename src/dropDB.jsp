<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*, javax.sql.*, java.io.*" %>

<html>
<head>
<title>Insert title here</title>
</head>
	<style>
	h1 {
		font-family: 'Noto Sans KR', sans-serif;
		color: #6807f9;
	}
	</style>
<body>
<h1>테이블 지우기 OK</h1>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
} catch (ClassNotFoundException e) {
	e.printStackTrace();
} 
 Connection conn = null;
try {
	conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc",                  
	                                   "root" , "kopoctc");
} catch (SQLException e) {
	e.printStackTrace();
}
  
 Statement stmt = null;
try {
	stmt = conn.createStatement();
	stmt.execute("DROP TABLE examtable;");
} catch (SQLException e1) {
	e1.printStackTrace();
} 

 try {
	stmt.close();
} catch (SQLException e) {
	e.printStackTrace();
} 
 try {
	conn.close();
} catch (SQLException e) {
	e.printStackTrace();
} 
%>
</body>
</html>