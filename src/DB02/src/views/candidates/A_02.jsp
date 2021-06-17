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
    <div class="title">
        <div class="icon">
            <i class="fas fa-user"></i>
        </div>
        <div class="subtitle">
            <h1>후보등록</h1>
            <p>후보가 삭제되었습니다.</p>
        </div>
    </div>
    <div class="card">
        <ul class="listCandidates">
    
    <%
    String id = request.getParameter("id");
    CandidateService canService = CandidateServiceImpl.getInstance();
    Candidate can = new Candidate(Integer.parseInt(id));
    canService.resign(can);
    
    List<Candidate> data=canService.viewAll();
    int endData = data.size();
    int lastHuboId;
    lastHuboId = endData < 1 ? 1 : data.get(endData-1).getId()+1;
    
    for (int i = 0; i < endData; i++) {
    	out.println("<li class='listItem'>");
    	out.println("<div class='widgetImg'>");
    	out.println("<img src='../../images/hubo"+(i+1)+".png'>");
    	out.println("</div>");
    	out.println("<form class='huboForm' method='post' action='A_02.jsp' id='A_01_Form'>");
    	out.println("<div class='widgetContent'>");
    	out.println("<div class='huboName'>이름 : ");
    	out.println("<input type='text' name='name' value='"+data.get(i).getName()+"' readonly>");
    	out.println("</div>");
    	out.println("<div class='huboId'>기호 : ");
    	out.println("<input type='text' name='id' value="+data.get(i).getId() +" readonly>");
    	out.println("</div>");
    	out.println("</div>");
    	out.println("<div class='widgetRight'>");
    	out.println("<input type='submit' value='삭제' onclick='submitForm(\"delete\")'>");
    	out.println("</div>");
    	out.println("</form>");
    	out.println("</li>");
    }
    
    %>
            <li class="listItem">
                <div class="widgetImg">
                    <img src='../../images/hubo<%=data.size()+1%>.png'>
                </div>
                <form class="huboForm" 
                	  method="post" 
                	  action="A_02.jsp" 
                	  id="A_01_Form">
                    <div class="widgetContent">
                        <div class="huboName">
                            이름 : 
                            <input type="text" name="name">
                        </div>
                        <div class="huboId">
                            기호 : 
                            <input type="text" name="id" value=<%=lastHuboId%>>
                        </div>
                    </div>
                    <div class="widgetRight">
                        <input type="submit" 
                        	   value="추가" 
                        	   onclick="checkNameAndUpdate(document.A_01_Form.name, event)">
                    </div>
                </form>
            </li>
        </ul>
    </div>
    <script src="../../script/form.js"></script>
</body>

</html>