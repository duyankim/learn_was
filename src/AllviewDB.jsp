<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*, javax.sql.*, java.io.*" %>

<html>
<head>
<title>AllviewDB.jsp</title>
	<link rel="stylesheet" href="./styles/tableStyle.css">
</head>
<body>
<h1>조회</h1>
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
} catch (SQLException e1) {
	e1.printStackTrace();
} 
 ResultSet rset = null;
try {
	rset = stmt.executeQuery("select * from examtable;");
} catch (SQLException e) {
	e.printStackTrace();
} 
%>
<table>
	<tr>
		<th><p>이름</p></th>
		<th><p>학번</p></th>
		<th><p>국어</p></th>
		<th><p>영어</p></th>
		<th><p>수학</p></th>
	</tr>
<%
 try {
	while (rset.next()) { 
	
		out.println("<tr>");
	    out.println("<td><p><a href='oneview.jsp?name="+rset.getString(1)+"&studentid="+rset.getInt(2)+"'>"
					+rset.getString(1)
					+"</a></p></td>");
	    out.println("<td><p>"+Integer.toString(rset.getInt(2))+"</p></td>");
	    out.println("<td><p>"+Integer.toString(rset.getInt(3))+"</p></td>");
	    out.println("<td><p>"+Integer.toString(rset.getInt(4))+"</p></td>");
	    out.println("<td><p>"+Integer.toString(rset.getInt(5))+"</p></td>");
	    out.println("</tr>");
	  }
} catch (SQLException e) {
	e.printStackTrace();
} catch (NullPointerException e1) {
	out.println("<h3>테이블이 존재하지 않습니다.</h3>");
	e1.printStackTrace();
} 
 try {
	rset.close();
} catch (SQLException e) {
	e.printStackTrace();
} catch (NullPointerException e1) {
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
%> </table>
</body>
</html>