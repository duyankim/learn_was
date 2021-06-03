<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
<html>
<head>
<title>Insert title here</title>
	<script>
		console.log("updateDB.jsp");
	</script>
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
		width: 120px;
	}

	td {
		padding: 20px;
		min-width: 100px;
		min-height: 300px;
		border: 1px solid #e0e5f6;
	}
	
	p {
		text-align: center;
	}
	
	#result {
		background-color: #e8ebf8;;
	}
	</style>
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

String cTmp = request.getParameter("name");

String cTmpHan = new String(cTmp.getBytes("8859_1"), "utf-8");

String sql = "update examtable set " +
	"name = '" + cTmpHan + "', " +
	"kor = " + request.getParameter("korean") + ", " +
	"eng = " + request.getParameter("english") + ", " +
	"mat = " + request.getParameter("math") +
	" where studentid = " + request.getParameter("studentid");

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
 if (cTmp.length() <= 20) {
	try {
		 String name = "";
		 String studentid, kor, eng, mat;
		while (rset.next()) { 
			name = rset.getString(1);
			studentid = Integer.toString(rset.getInt(2));
			kor = Integer.toString(rset.getInt(3));
			eng = Integer.toString(rset.getInt(4));
			mat = Integer.toString(rset.getInt(5));
			
			if (request.getParameter("studentid").equals(studentid)) {
				out.println("<tr id='result'>");
					out.println("<td><p>");
					out.println("<a href='oneview.jsp?name="+name+"&studentid=" + studentid+"'>" + name + "</a>");
					out.println("</p></td>");
					out.println("<td><p>" +studentid + "</p></td>");
					out.println("<td><p>" +kor + "</p></td>");
					out.println("<td><p>" +eng + "</p></td>");
					out.println("<td><p>" +mat + "</p></td>");
				out.println("</tr>");
			} else {
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
		  }
	} catch (SQLException e) {
		out.println(e);
	} catch (NullPointerException e1) {
		out.println(e1);
	}
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