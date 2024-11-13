$(document).ready(function(){
// Barchart JS
var barGraph = Highcharts.chart('container', {
    chart: {
        type: 'bar',
        backgroundColor: 'rgba(0,0,0,0)'
    },
    title: {
        text: ''
    },
    credits: {
        enabled: false
    },
    xAxis: {
        categories: ['Users', 'Campaigns', 'Lists', 'In-Groups', 'Dids']
    },
    yAxis: {
        min: 0,
        title: false
    },
    legend: {
        reversed: true
    },
    plotOptions: {
        series: {
            stacking: 'normal',
            dataLabels: {
                enabled: true,
                style: {
                    textOutline: 0,
                }
            }
        }
    },
    series: [{
        name: 'Active',
        data: [71, 33, 101, 90, 80]
    }, {
        name: 'In-Active',
        data: [371, 30, 60, 86, 74]
    }]
});

barGraph.reflow();

// PieChart JS
var pieChart = Highcharts.chart('container1', {
    chart: {
        type: 'pie',
        backgroundColor: 'rgba(0,0,0,0)'
    },
    title: {
        text: ''
    },
    credits: {
        enabled: false
    },
    tooltip: {
        valueSuffix: '%'
    },
    subtitle: {
        text: ''
    },
    plotOptions: {
      pie: {
        size:'80%'
      },
        series: {
            allowPointSelect: false,
            dataLabels: [{
                enabled: true,
                distance: 20,
                style: {
                    textOutline: 0,
                    color: '#000'
                }
            }, {
                enabled: true,
                distance: -40,
                format: '{point.percentage:.0f}%',
                style: {
                    fontSize: '1em',
                    textOutline: 'none',
                    opacity: 1
                }
            }]
        }
    },
    series: [{
        name: 'Percentage',
        colorByPoint: true,
        data: [
            {
                name: 'Max. Agents',
                y: 45
            },
            {
                name: 'InBound',
                y: 15
            },
            {
                name: 'OutBound',
                y: 15
            },
            {
                name: 'Total Calls',
                y: 25
            }
        ]
    }]
});

pieChart.reflow();
});