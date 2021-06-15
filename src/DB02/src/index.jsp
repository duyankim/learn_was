<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Poll System</title>
<link rel="stylesheet" href="./styles/app.css">
</head>
<body>
	<div id="header">
		<div>후보자별 유권자 투표 성향 분석 시스템</div>
	</div>
	<div class="container">
		<iframe id="menuSection" 
				scrolling="no" 
				src="menu.html">
		</iframe>
		<iframe id="contentSection"
		
				scrolling="no"
				name="contentFrame"
				src="./views/candidates/A_01.jsp">
		</iframe>
	</div>
</body>
</html>