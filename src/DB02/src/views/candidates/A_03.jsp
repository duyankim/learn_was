<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.ac.poll.kopo03.service.*, kr.ac.poll.kopo03.domain.*, kr.ac.poll.kopo03.dao.*" %>
<%@ page import = "java.util.*, java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A_01</title>
    <link rel="stylesheet" 
    	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
        crossorigin="anonymous" />
    <link rel="stylesheet" href="../../styles/title.css">
    <link rel="stylesheet" href="../../styles/candidates.css">
</head>

<body> 
    <%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    CandidateService canService = CandidateServiceImpl.getInstance();
    Candidate can = new Candidate(name);
    canService.enroll(can);
    %>
    <script>
		complete();
		const complete = () => {
			alert('후보가 등록되었습니다.');
		}
	</script>
	<%
	response.sendRedirect("A_01.jsp");
	%>
</body>

</html>