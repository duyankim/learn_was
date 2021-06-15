const age = [
    '10대',
    '20대',
    '30대',
    '40대',
    '50대',
    '60대',
    '70대',
    '80대',
    '90대'
  ];

const hubo = [];

const backgroundColor = [
    '#8dace7',
    '#7089b8',
    '#bacdf0',
    '#54678a',
    '#7a72a4',
    '#9b8de7',
    '#c7bef1',
    '#dfdaf7',
    '#a3bceb',
  ];

const hoverBackgroundColor = [
    '#7097e1',
    '#4dd6a7',
    '#eb6886'
  ];

const voteResult = [50, 50, 50, 50, 50, 50, 50, 50, 50];

const data = {
  labels: age,
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
        text: '투표율'
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