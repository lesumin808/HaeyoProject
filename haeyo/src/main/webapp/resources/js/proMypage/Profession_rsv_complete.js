var ctx = document.getElementById('monthchart').getContext('2d'); 
var chart = new Chart(ctx, { 
    // The type of chart we want to create 
    type: 'bar', 
    // The data for our dataset 
    data: { 
        labels: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        datasets: [{ 
            label: '완료된 서비스 수',
            backgroundColor: '#05C3A7',
            borderColor: '#dddee2',
            data: mCount
        }] 
    }, 
    // Configuration options go here 
    options: { 
        title: { 
            display: true, 
            text: '연간 완료 서비스 차트',
            fontSize: 25, 
            fontColor: '#353535'
        }, 
        legend: { 
            labels: {
                fontColor: '#353535', 
                fontSize: 13
            } 
        }, 
        scales: {
             xAxes: [{
                  ticks: {
                       fontColor: '#353535', 
                       fontSize: '15' 
                    } 
                }], 
             yAxes: [{ 
                 ticks: {
                    beginAtZero: true, 
                    fontColor: '#353535', 
                    fontSize: '15' 
                } 
            }] 
        } 
    } 
});
