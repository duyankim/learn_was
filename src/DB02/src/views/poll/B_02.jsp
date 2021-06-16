<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.ac.poll.kopo03.service.*, kr.ac.poll.kopo03.domain.*, kr.ac.poll.kopo03.dao.*" %>
<%@ page import = "java.util.*, java.net.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>B_02</title>
    <link rel="stylesheet" 
	    href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" 
	    crossorigin="anonymous" />
    <link rel="stylesheet" href="../../styles/vote.css">
    <link rel="stylesheet" href="../../styles/title.css">
</head>
<body>
	<%
    request.setCharacterEncoding("utf-8");
  
    String[] hubo = request.getParameterValues("voteHubo");
    String[] age = request.getParameterValues("voteAge");
    String huboName = hubo[0].split(" ")[1];
    int voterAge = Integer.parseInt(age[0]);
    
	VoterService voteService = new VoterService();
	Candidate can = new Candidate(huboName);
	Voter voter = new Voter(voterAge, can);
	voteService.vote(voter);
	
	%>
    <div class="title">
        <div class="icon">
            <i class="fas fa-vote-yea"></i>
        </div>
        <div class="subtitle">
            <h1>투표하기</h1>
            <p>선택한 후보에게 투표하였습니다.</p>
        </div>
    </div>
</body>
</html>