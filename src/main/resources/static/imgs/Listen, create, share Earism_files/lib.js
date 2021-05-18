//플레이 리스트 옆 세팅아이콘
const modal = document.querySelector('dialog');
const btn = document.querySelector('button');
const btnClose = document.querySelectorAll('.close');

btn.addEventListener('click', () => openModal());
btnClose.forEach((elm) => elm.addEventListener('click', () => closeModal()));
modal.addEventListener('click', (e) => detectBackdropClick(e));

openModal = () => {
	modal.showModal();
}

closeModal = () => {
	modal.classList.add("dialog__animate-out");
	modal.addEventListener('animationend', handleClose, false);
}

handleClose = () => {
	modal.classList.remove("dialog__animate-out");
	modal.removeEventListener('animationend', handleClose, false);
	modal.close();
}

detectBackdropClick = (event) => {
	if(event.target === modal) {
		closeModal();
	}
}

var swiper = new Swiper('.swiper-container', {
  slidesPerView: 4,
  spaceBetween: 30,
  centeredSlides: true,
  pagination: {
    el: '.swiper-pagination',
    clickable: true,
  },
});

//멤버 아코디언 메뉴 클릭시 세부메뉴 등장

$(".logedin").click(function(){
  if($(".acowrapper").hasClass("disphidden")){
    $(".acowrapper").removeClass("disphidden");
    $(".acodim").removeClass("disphidden");
    $(".acowrapper").show();
    $(".acodim").show();
  }else{$(".acowrapper").addClass("disphidden");}

})

$(".acodim").click(function(){
  if(!$(".acowrapper").hasClass("disphidden")){
    $(".acowrapper").addClass("disphidden");
    $(".acodim").addClass("disphidden");
  };
})

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

//업로드 버튼

document.querySelectorAll('.buttonup').forEach(buttonup => buttonup.addEventListener('click', e => {
  if(!buttonup.classList.contains('compress')) {

      buttonup.classList.add('compress');

      setTimeout(() => buttonup.classList.remove('compress'), 4000);

  }
  e.preventDefault();
}));



//신용카드

$('.input-cart-number').on('keyup change', function(){
    $t = $(this);
    
    if ($t.val().length > 3) {
      $t.next().focus();
    }
    
    var card_number = '';
    $('.input-cart-number').each(function(){
      card_number += $(this).val() + ' ';
      if ($(this).val().length == 4) {
        $(this).next().focus();
      }
    })
    
    $('.credit-card-box .number').html(card_number);
  });
  
  $('#card-holder').on('keyup change', function(){
    $t = $(this);
    $('.credit-card-box .card-holder div').html($t.val());
  });
  
  $('#card-holder').on('keyup change', function(){
    $t = $(this);
    $('.credit-card-box .card-holder div').html($t.val());
  });
  
  $('#card-expiration-month, #card-expiration-year').change(function(){
    m = $('#card-expiration-month option').index($('#card-expiration-month option:selected'));
    m = (m < 10) ? '0' + m : m;
    y = $('#card-expiration-year').val().substr(2,2);
    $('.card-expiration-date div').html(m + '/' + y);
  })
  
  $('#card-ccv').on('focus', function(){
    $('.credit-card-box').addClass('hover');
  }).on('blur', function(){
    $('.credit-card-box').removeClass('hover');
  }).on('keyup change', function(){
    $('.ccv div').html($(this).val());
  });
  
  
  /*--------------------
  CodePen Tile Preview
  --------------------*/
  setTimeout(function(){
    $('#card-ccv').focus().delay(1000).queue(function(){
      $(this).blur().dequeue();
    });
  }, 500);
  
  /*function getCreditCardType(accountNumber) {
    if (/^5[1-5]/.test(accountNumber)) {
      result = 'mastercard';
    } else if (/^4/.test(accountNumber)) {
      result = 'visa';
    } else if ( /^(5018|5020|5038|6304|6759|676[1-3])/.test(accountNumber)) {
      result = 'maestro';
    } else {
      result = 'unknown'
    }
    return result;
  }
  
  $('#card-number').change(function(){
    console.log(getCreditCardType($(this).val()));
  })*/



