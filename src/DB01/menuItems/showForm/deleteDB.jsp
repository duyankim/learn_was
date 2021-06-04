<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
<html>
<head>
<title>deleteDB.jsp</title>
	<script>
		console.log("deleteDB.jsp");
	</script>
	<link rel="stylesheet" href="../../styles/tableStyle.css">
</head>
<body>
<h1>레코드 수정</h1>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
} catch (ClassNotFoundException e) {
	out.println(e);
} 
 Connection conn = null;
try {
	conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc",                  
	                                   "root" , "kopoctc");
} catch (SQLException e) {
	out.println(e);
}
  
 Statement stmt = null;
try {
	stmt = conn.createStatement();
} catch (SQLException e) {
	out.println(e);
} 

String cTmp = request.getParameter("studentid");
String sql = "delete from examtable where studentid = " + cTmp;

try {
	stmt.executeUpdate(sql);
} catch (SQLException e) {
	out.println(e);
}

 ResultSet rset = null;
try {
	rset = stmt.executeQuery("select * from examtable;");
} catch (SQLException e) {
	out.println(e);
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
	 String name = "";
	 String studentid, kor, eng, mat;
	while (rset.next()) { 
		name = rset.getString(1);
		studentid = Integer.toString(rset.getInt(2));
		kor = Integer.toString(rset.getInt(3));
		eng = Integer.toString(rset.getInt(4));
		mat = Integer.toString(rset.getInt(5));
		
		out.println("<tr>");
			out.println("<td><p>");
			out.println("<a href='oneview.jsp?name="+name+"&studentid=" + studentid+"'>" + name + "</a>");
			out.println("</p></td>");
			out.println("<td><p>" +studentid + "</p></td>");
			out.println("<td><p>" +kor + "</p></td>");
			out.println("<td><p>" +eng + "</p></td>");
			out.println("<td><p>" +mat + "</p></td>");
		out.println("</tr>");
	  }
} catch (SQLException e) {
	out.println(e);
} catch (NullPointerException e1) {
	out.println(e1);
}
 
 try {
	rset.close();
} catch (SQLException e) {
	out.println(e);
} catch (NullPointerException e1) {
	out.println(e1);
} 
 try {
	stmt.close();
} catch (SQLException e) {
	out.println(e);
} 
 try {
	conn.close();
} catch (SQLException e) {
	out.println(e);
} 
%>
	</table>
</body>
</html>