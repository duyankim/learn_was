<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*, javax.sql.*, java.io.*, java.net.*" %>

<html>
<head>
	<title>A_03.jsp</title>
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
    
    String cTmp = request.getParameter("name");

    String cTmpHan = new String(cTmp.getBytes("8859_1"), "utf-8");

    String sql = "update hubo_table set " +
        "name = '" + cTmpHan + "'" +
        " where id = " + request.getParameter("id");

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
    <h3>후보등록 결과: 후보가 추가되었습니다.</h3>
</body>
</html>