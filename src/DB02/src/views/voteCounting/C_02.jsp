<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.ac.poll.kopo03.service.*, kr.ac.poll.kopo03.domain.*, kr.ac.poll.kopo03.dao.*" %>
<%@ page import = "java.util.*, java.net.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>C_01</title>
	<link rel="stylesheet" 
		href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="../../styles/title.css">
    <link rel="stylesheet" href="../../styles/chart.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.3.2/chart.min.js"
        integrity="sha512-VCHVc5miKoln972iJPvkQrUYYq7XpxXzvqNfiul1H4aZDwGBGC0lq373KNleaB2LpnC2a/iNfE5zoRYmB4TRDQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>
</head>
<body>
	<%
	CandidateServiceImpl c = CandidateServiceImpl.getInstance();
	VoterServiceImpl v = VoterServiceImpl.getInstance();
	
	List<Candidate> namesList = c.viewAll();
	String index = request.getParameter("huboIndex");
	String name = namesList.get(Integer.parseInt(index)).getName();
	int id = namesList.get(Integer.parseInt(index)).getId();	
	String voteAges= v.singleCandidateVoteAges(id);
	
	int totalVotes = v.totalVotes();
	int totalVotesOfThisCandidate = v.oneCandidateVotes(id, name);
	%>
    <div class="title">
        <div class="icon">
            <i class="fas fa-chart-bar"></i>
        </div>
        <div class="subtitle">
            <h1><%= name %> 후보의 연령별 득표수</h1>
            <p>전체 투표수 <%= totalVotes %>표 중 <%= totalVotesOfThisCandidate%>표 득표</p>
        </div>
    </div>
    <div id="chartContainer">
        <canvas id="chart"></canvas>
    </div>

    <script>
	const voteResult = <%= voteAges %>;
	const age = [
        '10대', '20대', '30대', '40대', '50대', '60대', '70대', '80대', '90대'
        ];
    const ctx = document.getElementById("chart");
    const doughnutChart = (ctx, age, voteResult) => {
    	  const data = {
    	    labels: age,
    	    datasets: [{
    	      label: 'poll anaylsis',
    	      data: voteResult,
    	      backgroundColor: [
    	    	  '#488f31', '#75a760', '#9fc08f', '#c8d8bf', '#f1f1f1', '#f1c6c6', '#ec9c9d', '#e27076', '#de425b'
    	          ],
    	      hoverBackgroundColor: [
    	          '#7097e1', '#4dd6a7', '#eb6886'
    	          ],
    	      hoverOffset: 4
    	    }]
    	  };

    	  const options = {
    	    reponsive: false,
    	    legend: {
    	    	position: 'top'
    	    },
    	    title: {
    	        display: true,
    	        text: '투표율'
    	     }, 
    	    animation: {
    	        animateScale: true,
    	        animateRotate: true
    	    },
    	    onClick: function(event, item){
    	      const clickedHubo = item[0].index;
    	      const huboData = this.data.datasets[0].data[clickedHubo];
			  const form = document.getElementById("chartForm");
			  form.submit();
    	    }
    	  }

    	  const config = {
    	    type: 'doughnut',
    	    data: data,
    	    options: options
    	  };

    	  let myChart = new Chart(ctx, config);
    	}

    	doughnutChart(ctx, age, voteResult);

    </script>
</body>
</html>