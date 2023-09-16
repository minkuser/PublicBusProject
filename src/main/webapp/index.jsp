<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://code.jquery.com/jquery-1.7.min.js"></script>


<link rel="stylesheet" href="./css/slick.css">
<link rel="stylesheet" href="./css/index.css">

<script src="./js/jquery-3.6.0.min.js"></script>
<script src="./js/slick.js"></script>
<script src="./js/logoplay.js"></script>
<script src="./js/splitting.min.js"></script>
<script src="./js/common.js" defer></script>
<title>달구지 HOME</title>
<script>
    
    $.getJSON('https://api.openweathermap.org/data/2.5/weather?q=Daegu&appid=60b8746dfb06ed4d6d217cbd3b605048&units=metric', function(data){
      
        var $minTemp = data.main.temp_min;
        var $maxTemp = data.main.temp_max;
        var $cTemp = data.main.temp;
        var $now = new Date($.now());
        var $cDate = $now.getFullYear() +'년'+ ($now.getMonth()+1) +'월'+ $now.getDate()+'일' + $now.getHours() + ':' + $now.getMinutes();
        var $wIcon = data.weather[0].icon;

     
        $('.clowtemp').append($minTemp);
        $('.chightemp').append($maxTemp);
        $('.ctemp').append($cTemp);
        $('h2').prepend($cDate)
        $('.cicon').append('<img src="https://openweathermap.org/img/wn/' + $wIcon + '@2x.png"/>')


      
    });

</script>
<script>
	$(function() {
		// 메인 비주얼 영역 애니메이션 적용
		var animation = bodymovin.loadAnimation({
			container : document.getElementById("visual_lottie01"),
			renderer : "svg",
			loop : true,
			autoplay : true,
			path : "../json/visual_lottie01.json"
		});

		// 메인 비주얼 splitting
		Splitting();

		// 공유행정정보 슬라이드
		var popupzoneSlide = $('.popupzone-slide');
		var currentSlide;
		var slidesCount;
		var currentCount = $('.slide-count .current');
		var totalCount = $('.slide-count .total');

		var updateSlideCounter = function(slick, currentIndex) {
			currentSlide = slick.slickCurrentSlide() + 1;
			slidesCount = slick.slideCount;
			currentCount.text(currentSlide);
			totalCount.text(slidesCount);
		};

		popupzoneSlide.on('init', function(event, slick) {
			updateSlideCounter(slick);
		});

		popupzoneSlide.on('afterChange', function(event, slick, currentSlide) {
			updateSlideCounter(slick, currentSlide);
		});

		popupzoneSlide.slick({
			fade : true,
			slidesToShow : 1,
			draggable : false,
			speed : 200,
			autoplay : true,
			autoplaySpeed : 10000,
			prevArrow : $('.slide-nav .slide-prev'),
			nextArrow : $('.slide-nav .slide-next'),
		});
	});
</script>

</head>
<body>
	<!-- 헤더 -->
	<header class="header">
		<div class="header-inner layout">
			<h1 class="header-logo">
				<a href="index.jsp"><img src="./images/home1.png" alt="달구지 홈 화면"></a>
			</h1>
			<nav class="header-gnb" id="gnb">
				<ul class="gnb-depth-1">
					<li class="depth-1"><a href="login.jsp"><span>사용자</span></a>
						<ul class="gnb-depth-2">
							<c:if test="${user == null }">
								<li class="depth-2"><a href="user/register.do"><span>회원가입</span></a></li>
								<li class="depth-2"><a href="login.jsp"><span>로그인</span></a></li>
							</c:if>
							<c:if test="${user != null }">
								<li class="depth-2"><a href="logout.do"><span>로그아웃</span></a></li>
							</c:if>
						</ul></li>
					<li class="depth-1"><a
						href="information&guide/information.jsp"><span>달구지</span></a>
						<ul class="gnb-depth-2">
							<li class="depth-2"><a
								href="information&guide/information.jsp"><span>달구지란?</span></a></li>
							<li class="depth-2"><a href="information&guide/guide.jsp"><span>이용방법</span></a></li>
						</ul></li>
					<li class="depth-1"><a href="reserveHome.do"><span>대여소</span></a>
						<ul class="gnb-depth-2">
							<c:if test="${user == null }">
								<li class="depth-2"><a href="reserveHome.do"><span>예약하기</span></a></li>
							</c:if>
							<c:if test="${user != null }">
								<li class="depth-2"><a href="reserveHome.do"><span>예약하기</span></a></li>
								<li class="depth-2"><a href="javascript:returnBike()"><span>반납하기</span></a></li>
							</c:if>

						</ul></li>
					<li class="depth-1"><a href="./sample/selectBoardList.do"><span>게시판</span></a>
						<ul class="gnb-depth-2">
							<li class="depth-2"><a href="./sample/selectBoardList.do"><span>자유게시판</span></a></li>
							<li class="depth-2"><a href="./qboard/selectQBoardList.do"><span>문의게시판</span></a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</header>

	<!-- 메인 콘텐츠 -->
	<main class="wrap" id="txt">

		<!-- 상단 비주얼 영역 -->
		<section class="section01 main-visual">
			<div class="section-inner">
				<div class="visual-text layout">
					<div class="visual-title">
						<strong class="splitting-text" data-splitting>언제나, 어디서나 <br>손쉽게
							이용할 수 있는 <br> <b>대구광역시 무인대여 공영자전거</b></strong>
					</div>
					<div class="visual-desc">
						<strong class="splitting-text" data-splitting>앱을 다운로드 하고
							달구지 공영자전거 시스템을 이용해보세요.</strong>
					</div>
				</div>
				<div class="visual-icon">
					<!-- 임시 이미지입니다. 애니메이션 로티 파일로 대체될 예정입니다. -->
					<div class="icon01" id="visual_lottie01">
						<img src="./images/main_place.jpg" alt="자전거 아이콘">
					</div>

				</div>
			</div>
		</section>

		<!-- 공지사항 및 공유행정정보 -->
		<section class="section02">
			<div class="section-inner layout">
				<div class="sec-block notice-zone">
					<div class="sec-title">
						<strong class="block-title">공지시항</strong> <a
							href="./sub_0401.html" class="icon"><span class="skip">공지사항
								더보기</span></a>
					</div>
					<ul class="notice-list">
						<li class="notice-item"><a href="javascript:void(0)">
								<div class="notice-name">공유형 달구지 서비스 개시 안내</div> <span
								class="notice-date">2023.09.01</span>
						</a></li>
						<li class="notice-item"><a href="javascript:void(0)">
								<div class="notice-name">달구지 서비스가입 가상계좌 서비스 일시 중지 안내</div> <span
								class="notice-date">2023.09.10</span>
						</a></li>
						<li class="notice-item"><a href="javascript:void(0)">
								<div class="notice-name">2022년 대학생 달구지 이용 교통비 지원사업 안내</div> <span
								class="notice-date">2023.09.23</span>
						</a></li>
						<li class="notice-item"><a href="javascript:void(0)">
								<div class="notice-name">2023년 달구지 이용만족도 설문조사</div> <span
								class="notice-date">2023.01.31</span>
						</a></li>
					</ul>
				</div>
				<div class="sec-block popup-zone">
					<div class="sec-title">
						<strong class="block-title">이미지슬라이드</strong>
						<div class="slide-nav">
							<button class="slide-prev slide-arrow">
								<img src="./images/left_icon.png" alt="이전으로">
							</button>
							<div class="slide-count">
								<span class="current"></span> <span class="divide">/</span> <span
									class="total"></span>
							</div>
							<button class="slide-next slide-arrow">
								<img src="./images/right_icon.png" alt="다음으로">
							</button>
						</div>
					</div>
					<div class="popupzone-slide">
						<div class="slide-item">
							<a href="javascript:void(0)"> <img
								src="./images/bycicle1.jpg">
							</a>
						</div>
						<div class="slide-item">
							<a href="javascript:void(0)"> <img
								src="./images/bycicle2.jpg">
							</a>
						</div>
						<div class="slide-item">
							<a href="javascript:void(0)"> <img
								src="./images/bycicle3.jpg">
							</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- 푸터 -->
	<footer class="footer">
		<div class="footer-inner">
			<div class="footer-top">
				<ul class="util-list layout">
					<li class="util-item"><a href="./sitemap_01.html">이용약관</a></li>
					<li class="util-item"><a href="./sitemap_02.html"
						class="color-green">개인정보처리방침</a></li>
				</ul>
			</div>
			<div class="footer-bottom layout">
				<div class="footer-logo01">
					<img src="./images/logo1.jpg" alt="자전거">
				</div>
				<div class="footer-info">
					<p class="info-text01">주소 : 대구광역시 수성구 알파시티 1로 170(대흥동)
						대구디지털혁신진흥원 대표 전화 : 053-000-0000</p>
					<p class="info-text02">Copyright</p>
				</div>
				<div class="footer-logo02">
					<img src="./images/logo2.jpg" alt="자전거">
				</div>
			</div>
		</div>
	</footer>
	<script type="text/javascript"> /* 반납 팝업창 띄우기 */
       function returnBike(){
           window.open("<%=request.getContextPath()%>
		/returnBike/returnBike.do",
					"자전거 반납하기", "width=640, height=400")
			opener.location.reload();
		}
	</script>

</body>
</html>