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
		width: 120px;
		border: 1px solid #e0e5f6;
	}
	
	p {
		text-align: center;
	}
	</style>
</head>
<body>
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
 String name = request.getParameter("name");
 String studentid = request.getParameter("studentid");
 ResultSet rset = null;
try {
	rset = stmt.executeQuery("select * from examtable where studentid = '"+studentid+"';");
} catch (SQLException e) {
	out.println(e);
} 

%>
<h1><%=name%></h1>

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
	    out.println("<td width=50><p align=center>"+rset.getString(1)+"</p></td>");
	    out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(2))+"</p></td>");
	    out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(3))+"</p></td>");
	    out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(4))+"</p></td>");
	    out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(5))+"</p></td>");
	    out.println("</tr>");
	  }
} catch (SQLException e) {
	out.println(e);
} 
 try {
	rset.close();
} catch (SQLException e) {
	e.printStackTrace();
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