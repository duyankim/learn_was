<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
<html>
<head>
<script>
	console.log("showREC.jsp");
	function submitForm(mode) {
		if(mode == "update") {
			myform.action = "updateDB.jsp";
			myform.submit();
		} else if (mode == "delete") {
			myform.action = "deleteDB.jsp";
			myform.submit();
		}
	}
	
	function checkValidId(txt, event) {
		let numbers = /^[0-9]+$/;
		if (txt.value == "") {
			txt.focus();
			alert('값을 입력해주세요!');
			event.preventDefault(); 
		} else if (!txt.value.match(numbers)){
			txt.focus();
			alert('숫자를 입력해주세요!');
			event.preventDefault(); 
		} 
	};
		
	function checkValidName(txt, event) {
		let str = txt.value;
		const regex = new RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z]+$/);
		
		if (str == "") {
			txt.focus();
			alert('값을 입력해주세요!');
			event.preventDefault();
		} else if (!regex.test(str)) {
			txt.focus();
			alert('한글 또는 영어만 입력해주세요!');
			event.preventDefault(); 
		} else if (str.length > 20) {
			txt.focus();
			alert('20자 이하만 입력 가능합니다!');
			event.preventDefault(); 
		} else if (regex.test(str) && str.length < 20) {
			submitForm('update');
		}
	};
</script>
<title>Insert title here</title>
	<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

	body {
		box-sizing: border-box;
	}
	
	h1 {
		font-family: 'Noto Sans KR', sans-serif;
		color: #6807f9;
	}

	#searchTable {
		border-collapse: collapse;
		border-bottom: none;
		background-color: white;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	input[type="submit"] {
		margin-left: 20px;
	}

	table {
		border-collapse: collapse;
		background-color: white;
		font-family: 'Noto Sans KR', sans-serif;
	}

	th {
		color: white;
		height: 50px;
		background-color: #6807f9;
		width: 120px;
	}

	td {
		padding: 20px;
		width: 300px;
		min-height: 300px;
		border: 1px solid #e0e5f6;
	}
	
	p {
		text-align: center;
	}
	
	.btn {
		background-color: #6807f9;
		border-radius: 10%;
		color: #ffffff;
		font-family: 'Noto Sans KR', sans-serif;
		font: 20px;
		width: 70px;
		height: 40px;
		margin-top: 20px;
		border: none;
	}
	
	input {
		background-color: #e8ebf8;
		border: none;
		height: 30px;
		width: 200px;
		font-size: 14px;
		text-align: center;
	}
	
	#viewBtn {
		width: 50px;
	}
	
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
	}
	</style>
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
					onclick='checkValidId(document.showRecForm1.searchid, event)'>
				</p></td>
			</tr>
		</table>
	</form>
		
	<form name="myform" method="post">
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
		"onclick='checkValidName(document.myform.name, event)' >");
		out.println("<input type=button value='삭제' onclick=\"submitForm('delete')\" class='btn'>");
	}
%>
	</form>
</body>
</html>