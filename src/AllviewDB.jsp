<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*, javax.sql.*, java.io.*" %>

<html>
<head>
<title>Insert title here</title>
	<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

	body {
		box-sizing: border-box;
	}
	
	h1 {
		font-family: 'Noto Sans KR', sans-serif;
		color: #6807f9;
	}

	table {
		border-collapse: collapse;
		background-color: white;
		font-family: 'Noto Sans KR', sans-serif;
	}

	th {
		color: white;
		height: 80px;
		background-color: #6807f9;
	}

	td {
		padding: 20px;
		min-width: 100px;
		min-height: 300px;
		border: 1px solid #e0e5f6;
	}
	</style>
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
<table cellspacing=1 width=600 border=1>
	<tr>
		<th width=30><p align=center>이름</p></th>
		<th width=30><p align=center>학번</p></th>
		<th width=30><p align=center>국어</p></th>
		<th width=30><p align=center>영어</p></th>
		<th width=30><p align=center>수학</p></th>
	</tr>
<%
 try {
	while (rset.next()) { 
	
		out.println("<tr>");
	    out.println("<td width=50><p align=center><a href='oneview.jsp?name="+rset.getString(1)+"&studentid="+rset.getInt(2)+"'>"+rset.getString(1)+"</a></p></td>");
	    out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(2))+"</p></td>");
	    out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(3))+"</p></td>");
	    out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(4))+"</p></td>");
	    out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(5))+"</p></td>");
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