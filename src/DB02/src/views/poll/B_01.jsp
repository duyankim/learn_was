<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.ac.poll.kopo03.service.*, kr.ac.poll.kopo03.domain.*, kr.ac.poll.kopo03.dao.*" %>
<%@ page import = "java.util.*, java.net.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>B_01</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="../../styles/vote.css">
    <link rel="stylesheet" href="../../styles/title.css">
</head>
<body>
	<%
    CandidateService canService = CandidateServiceImpl.getInstance();
    List<Candidate> data=canService.viewAll();
	%>
    <div class="title">
        <div class="icon">
            <i class="fas fa-vote-yea"></i>
        </div>
        <div class="subtitle">
            <h1>투표하기</h1>
            <p>연령대를 선택해주세요</p>
        </div>
    </div>
    <div class="voteSection">
        <form method="post" action="B_02.jsp" name="B_01_Form">
            <div class="voteContent">
                <div class="voteHubo">
                    <select name="voteHubo" id="selectHubo">
   	<%
    for (int i = 0; i < data.size(); i++) {
    	out.println("<option value='"+ data.get(i).getId() +"'>" 
    				+ data.get(i).getId() + ":" + data.get(i).getName() + "</option>");
    }
   	%>
                    </select>
                </div>
                <div class="voteAge">
                    <select name="voteAge" id="selectAge">
                        <option value="1">10대</option>
                        <option value="2">20대</option>
                        <option value="3">30대</option>
                        <option value="4">40대</option>
                        <option value="5">50대</option>
                        <option value="6">60대</option>
                        <option value="7">70대</option>
                        <option value="8">80대</option>
                        <option value="9">90대</option>
                    </select>
                </div>
                <div class="voteBtn">
                    <input type="submit" value="투표하기">
                </div>
            </div>
        </form>
    </div>
</body>

</html>