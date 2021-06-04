<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*, javax.sql.*, java.io.*" %>

<html>
<head>
<title>Insert title here</title>
</head>
	<link rel="stylesheet" href="../styles/tableStyle.css">
<body>
<h1>테이블만들기 OK</h1>
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
	stmt.execute("create table examtable("+
		"name varchar(20),"+
		"studentid int not null primary key,"+
		"kor int,"+
		"eng int,"+
		"mat int) DEFAULT CHARSET=utf8;");
} catch (SQLSyntaxErrorException e1) {
	out.println("<h3>테이블이 이미 있습니다.</h3>");
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