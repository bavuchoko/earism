
//차트
var dom = document.getElementById("circlechart");
var myChart = echarts.init(dom);
var app = {};

var option;



option = {
    title: {
        text: '장르별 점유율',
        subtext: '-최근-',
        left: 'center'
    },
    tooltip: {
        trigger: 'item'
    },

    series: [
        {
            
            type: 'pie',
            radius: '50%',
            data: [
                {value: 1048, name: '댄스'},
                {value: 735, name: 'BGM'},
                {value: 580, name: '발라드'},
                {value: 484, name: '밴드'},
                {value: 300, name: '재즈'}
            ],
            emphasis: {
                itemStyle: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
    ]
};

if (option && typeof option === 'object') {
    myChart.setOption(option);
}


/* 개인매출 */ 

var dom = document.getElementById("mysale");
var myChart = echarts.init(dom);
var app = {};

var option;



option = {
    color: ['#80FFA5', '#00DDFF', '#37A2FF', '#FF0087', '#FFBF00'],
    title: {
        text: '월별 음원판매액'
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            label: {
                backgroundColor: '#6a7985'
            }
        }
    },
    legend: {
        data: 'Line 1'
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis: [
        {
            type: 'category',
            boundaryGap: false,
            data: ['1월', '2월', '3월', '4월', '5월', '6월', '7월','8월','9월','10월','11월','12월']
        }
    ],
    yAxis: [
        {
            type: 'value'
        }
    ],
    series: [
        {
            name: 'Line 1',
            type: 'line',
            stack: '总量',
            smooth: true,
            lineStyle: {
                width: 0
            },
            showSymbol: false,
            areaStyle: {
                opacity: 0.8,
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: 'rgba(128, 255, 165)'
                }, {
                    offset: 1,
                    color: 'rgba(1, 191, 236)'
                }])
            },
            emphasis: {
                focus: 'series'
            },
            data: [140, 232, 101, 264, 90, 340, 250, 144, 190, 222, 124,92]
        },
        
    ]
};

if (option && typeof option === 'object') {
    myChart.setOption(option);
}
window.onresize =() => {
  myChart.resize();
}  
