<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
<html>
<head>
	<title>showREC.jsp</title>
	<link rel="stylesheet" href="./styles/tableStyle.css">
</head>
<body>
	<h1>조회</h1>
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
} catch (SQLException e1) {
	out.println(e1);
} 

String name = "", studentid = "", kor = "", eng = "", mat="";

String ctmp = request.getParameter("searchid");
if (ctmp.length() == 0) ctmp = "0";

ResultSet rset = null;
try {
	rset = stmt.executeQuery("select * from examtable where studentid = " + ctmp +";");
	 try {
		 name="해당학번없음";
		while (rset.next()) { 
			name = rset.getString(1);
			studentid = Integer.toString(rset.getInt(2));
			kor = Integer.toString(rset.getInt(3));
			eng = Integer.toString(rset.getInt(4));
			mat = Integer.toString(rset.getInt(5));
	    }
	} catch (SQLException e) {
		out.println(e);
	} catch (NullPointerException e1) {
		out.println(e1);
	}
} catch (SQLException e) {
	out.println("<h3>테이블이 존재하지 않습니다.</h3>");
} 

 try {
	rset.close();
} catch (SQLException e) {
	
} catch (NullPointerException e1) {
	
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
	<h1>성적 조회후 정정 / 삭제</h1>
	<form action="showREC.jsp" method="post" name="showRecForm1">
		<table id="searchTable">
			<tr>
				<th><p>조회할 학번</p></th>
				<td><p>
					<input type='text' name='searchid' id="stuidInput">
					<input type='submit' value='조회' id="viewBtn"
					onclick='checkId(document.showRecForm1.searchid, event)'>
				</p></td>
			</tr>
		</table>
	</form>
		
	<form name="myform" method="post" id="myform" action="">
		<table>
			<tr>
				<th><p>이름</p></th>
				<td><p><input type='text' name='name' value='<%=name%>'></p></td>
			</tr>
			<tr>
				<th><p>학번</p></th>
				<td><p><input type='text' name='studentid' readonly value='<%=studentid%>'></p></td>
			</tr>
			<tr>
				<th><p>국어</p></th>
				<td><p><input type='number' min='0' max='100'  name='korean' value='<%=kor%>'></p></td>
			</tr>
			<tr>
				<th><p>영어</p></th>
				<td><p><input type='number' min='0' max='100'  name='english' value='<%=eng%>'></p></td>
			</tr>
			<tr>
				<th><p>수학</p></th>
				<td><p><input type='number' min='0' max='100'  name='math' value='<%=mat%>'></p></td>
			</tr>
		</table>
<%
	if(studentid.length() != 0) {
		out.println("<input type='button' value='수정' class='btn' "+
		"onclick='checkNameAndUpdate(document.myform.name, event)' >");
		out.println("<input type=button value='삭제' onclick=\"submitForm('delete')\" class='btn'>");
	}
%>
	</form>
	<script src="./script/form.js"></script>
</body>
</html>