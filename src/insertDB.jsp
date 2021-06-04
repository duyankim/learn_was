<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*, javax.sql.*, java.io.*, java.net.*" %>

<html>
<head>
	<title>insertDB.jsp</title>
	<link rel="stylesheet" href="./styles/tableStyle.css">
</head>
<body>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
} catch (ClassNotFoundException e) {
	out.println(e);
} 
 Connection conn = null;
try {
	conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root" , "kopoctc");
} catch (SQLException e) {
	out.println(e);
}
  
 Statement stmt = null;
try {
	stmt = conn.createStatement();
} catch (SQLException e1) {
	out.println(e1);
} 

int NewStdId = 202101;

 ResultSet rset = null;

String cTmp = request.getParameter("name");
String cTmpHan = new String(cTmp.getBytes("8859_1"), "utf-8");

try {
	stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('"
				+ cTmpHan + "',"
				+ Integer.toString(NewStdId) + ","
				+ request.getParameter("korean") + ","
				+ request.getParameter("english") + ","
				+ request.getParameter("math") + ");" );
} catch (SQLException e) {
	try {
		rset = stmt.executeQuery("select min(studentid) from examtable" 
			+ " where studentid+1 " 
			+ "not in (select studentid from examtable);");
			
			try {
				while (rset.next()) { 
					NewStdId = rset.getInt(1) + 1;
				  }
			} catch (SQLException e9) {
				out.println(e9);
			} catch (NullPointerException e8) {
				out.println("e8" + e8);
			}
			
			try {
				stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('"
							+ cTmpHan + "',"
							+ Integer.toString(NewStdId) + ","
							+ request.getParameter("korean") + ","
							+ request.getParameter("english") + ","
							+ request.getParameter("math") + ");" );
			} catch (SQLException e5) {
				out.println(e5);
			}
			
%>
	<h1>성적입력완료</h1>
	<form action="inputForm1.html" method="post">			
		<table>
			<tr>
				<th><p>이름</p></th>
				<td class="readonly">
					<p><input type='text' name='name' value='<%=cTmpHan%>' readonly></p>
				</td>
			</tr>
			<tr>
				<th><p>학번</p></th>
				<td class="readonly">
					<p><input type='text' name='studentid' value='<%=Integer.toString(NewStdId)%>' readonly></p>
				</td>
			</tr>
			<tr>
				<th><p>국어</p></th>
				<td class="readonly">
					<p><input type='text' name='korean' value='<%=request.getParameter("korean")%>' readonly></p>
				</td>
			</tr>
			<tr>
				<th><p>영어</p></th>
				<td class="readonly">
					<p><input type='text' name='english' value='<%=request.getParameter("english")%>' readonly></p>
				</td>
			</tr>
			<tr>
				<th><p>수학</p></th>
				<td class="readonly">
					<p><input type='text' name='math' value='<%=request.getParameter("math")%>' readonly></p>
				</td>
			</tr>
		</table>
		<input type="submit" value="뒤로가기" class="btn">
	</form>
<%	
	} catch (SQLException e6) {
		out.println("<h3>테이블을 먼저 생성해주세요</h3>");
	} catch (NullPointerException e7) {
		out.println("e7" + e7);
	} 
}

 try {
	rset.close();
} catch (SQLException e) {
	out.println(e);
} catch (NullPointerException e10) {
	
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
</body>
</html>
