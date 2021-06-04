<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*, javax.sql.*, java.io.*" %>

<html>
<head>
<title>AllsetDB.jsp</title>
</head>
	<link rel="stylesheet" href="./styles/tableStyle.css">
<body>
<h1>실습데이터 입력</h1>
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
	stmt.execute("insert into examtable (name, studentid, kor, eng, mat)" 
		+ "values ('나연', 202101, 95, 100, 95),"
		+ "	('정연', 202102, 100, 90, 80),"
		+ "	('모모', 202103, 100, 90, 100),"
		+ "	('사나', 202104, 100, 95, 90),"
		+ "	('지효', 202105, 100, 100, 70),"
		+ "	('미나', 202106, 100, 100, 70),"
		+ "	('다현', 202107, 70, 70, 70),"
		+ "	('채영', 202108, 70, 70, 70),"
		+ "	('쯔위', 202109, 70, 70, 70);");
	out.println("<h3>데이터가 입력되었습니다.</h3>");
} catch (SQLIntegrityConstraintViolationException primary) {
	out.println("<h3>테이블에 이미 값이 있습니다.</h3>");
} catch (SQLSyntaxErrorException e1) {
	out.println("<h3>테이블이 존재하지 않습니다.</h3>");
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