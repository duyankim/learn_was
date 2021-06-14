<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*, javax.sql.*, java.io.*, java.net.*" %>

<html>
<head>
	<title>B_02</title>
	<link rel="stylesheet" href="">
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

    String sql="";
    String[] select = request.getParameterValues("choice");
    if (select != null){
        sql = "insert into tupyo_table (id, age) values("
            + select[0] + ","
            + select[1] + ");"
    }

    try {
	    stmt.execute(sql);
    } catch (SQLException e6) {
        out.println("<h3>테이블을 먼저 생성해주세요</h3>");
    } catch (NullPointerException e7) {
        out.println("e7" + e7);
    } 

    try {
        stmt.executeUpdate(sql);
    } catch (SQLException e) {
        out.println(e);
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
    <h3>투표결과: 투표를 완료하였습니다.</h3>
</body>
</html>