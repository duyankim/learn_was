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
	VoterServiceImpl voteService = VoterServiceImpl.getInstance();
	int[] voteResult = voteService.allCandidateVotes();
	String result = Arrays.toString(voteResult);
	
	CandidateServiceImpl canService = CandidateServiceImpl.getInstance();
	String names = canService.allCandidateNames();

	%>
    <div class="title">
        <div class="icon">
            <i class="fas fa-chart-bar"></i>
        </div>
        <div class="subtitle">
            <h1>후보별 득표 결과</h1>
        </div>
    </div>
    <div id="chartContainer">
        <canvas id="chart"></canvas>
    </div>

    <script>
    const hubo = <%= names%>;
    const voteResult = <%= result%>;

    const backgroundColor = [
        '#8dace7', '#7089b8', '#bacdf0', '#54678a', '#7a72a4', '#9b8de7', '#c7bef1', '#dfdaf7', '#a3bceb'
      ];

    const hoverBackgroundColor = [
        '#7097e1', '#4dd6a7', '#eb6886'
      ];

    const data = {
      labels: hubo,
      datasets: [{
        label: 'poll anaylsis',
        data: voteResult,
        backgroundColor: backgroundColor,
        hoverBackgroundColor: hoverBackgroundColor,
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
            text: '전체 득표율'
         }, 
        animation: {
            animateScale: true,
            animateRotate: true
        }
    }

    const config = {
      type: 'doughnut',
      data: data,
      options: options
    };

    const ctx = document.getElementById("chart");
    var myChart = new Chart(ctx, config);
    </script>
</body>
</html>