<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="../css/slick.css">
<link rel="stylesheet" href="../css/sub.css">

<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/slick.js"></script>
<script src="../js/logoplay.js"></script>
<script src="../js/splitting.min.js"></script>
<script src="../js/common.js" defer></script>

<title>누비자 > 달구지 > 달구지란?</title>
	<script type="text/javascript"> /* 반납 팝업창 띄우기 */
       function returnBike(){
           window.open("<%=request.getContextPath()%>/returnBike/returnBike.do",
					"자전거 반납하기", "width=640, height=400")
			opener.location.reload();
		}
	</script>

</head>
<body>

	<!-- 헤더 -->
	<header class="header">
		<div class="header-inner layout">
			<h1 class="header-logo">
				<a href="../index.jsp"><img src="../images/home1.jpg"
					alt="달구지 홈 화면"></a>
			</h1>
			<nav class="header-gnb" id="gnb">
				<ul class="gnb-depth-1">
					<li class="depth-1"><a href="../login.jsp"><span>사용자</span></a>
						<ul class="gnb-depth-2">
							<c:if test="${user == null }">
								<li class="depth-2"><a href="../user/register.do"><span>회원가입</span></a></li>
								<li class="depth-2"><a href="../login.jsp"><span>로그인</span></a></li>
							</c:if>
							<c:if test="${user != null }">
								<li class="depth-2"><a href="../login.jsp"><span>로그아웃</span></a></li>
							</c:if>
						</ul></li>
					<li class="depth-1"><a href="information.jsp"><span>달구지</span></a>
						<ul class="gnb-depth-2">
							<li class="depth-2"><a
								href="../information&guide/information.jsp"><span>달구지란?</span></a></li>
							<li class="depth-2"><a href="../information&guide/guide.jsp"><span>이용방법</span></a></li>
						</ul></li>
					<li class="depth-1"><a href="../reserveHome.do"><span>대여소</span></a>
						<ul class="gnb-depth-2">
							<c:if test="${user == null }">
								<li class="depth-2"><a href="reserveHome.do"><span>예약하기</span></a></li>
							</c:if>
							<c:if test="${user != null }">
								<li class="depth-2"><a href="../reserveHome.do"><span>예약하기</span></a></li>
								<li class="depth-2"><a href="javascript:returnBike()"><span>반납하기</span></a></li>
							</c:if>
						</ul></li>
					<li class="depth-1"><a href="../sample/selectBoardList.do"><span>게시판</span></a>
						<ul class="gnb-depth-2">
							<li class="depth-2"><a href="../sample/selectBoardList.do"><span>자유게시판</span></a></li>
							<li class="depth-2"><a href="../qboard/selectQBoardList.do"><span>문의게시판</span></a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</header>

	<!-- 서브 비주얼 영역 -->
	<div class="svisual-layout">
		<div class="svisual-inner layout">
			<strong class="svisual-title">달구지</strong>
		</div>
	</div>

	<!-- 서브 콘텐츠 -->
	<div class="body-wrap">
		<div class="layout">
			<aside class="lnb-layout">
				<ul class="sub-menu col5">
					<li class="sub-item current"><a
						href="../information&guide/information.jsp"> <span>달구지란?</span>
					</a></li>
					<li class="sub-item"><a href="../information&guide/guide.jsp">
							<span>이용방법</span>
					</a></li>
				</ul>
			</aside>

			<div class="content-wrap" id="txt">
				<h2 class="h2">달구지란?</h2>

				<div class="topbox-text" style="text-align: center;">
					<strong>&lsquo; XX 지역을 자유료이 달리는 &rsquo; </strong> <em>언제나,
						어디서나, 손쉽게 이용할 수 있는 무인대여 공영자전거 달구지</em>
					<p>
						자동차 배기가스로 인한 환경오염을 줄이고 국민들의 비만율을 낮추기 위해<br> 시민들이 공영자전거를 빌려
						자유롭게 탈 수 있는 ‘국민 공영 자전거제’를 도입, 운영
					</p>
				</div>
				<div style="position: relative;">
					<img src="../images/logo4.jpg" alt="달구지">
				</div>
			</div>

			<ul class="nubija-list">
				<li class="nubija-item">
					<div class="item-img">
						<img src="../images/bycicle6.jpg" alt="달구지 자전거 일러스트 이미지">
					</div>
					<div class="item-text">
						<strong class="h4">달구지 자전거</strong>
						<p class="item-desc">
							누비자 자전거는 여성 및 노약자도 편하게 승, 하차 할 수 있는 생활형 자전거 입니다. <br> 7단
							변속기로 오르막 주행시에도 편안하게 이용할 수 있습니다.
						</p>
					</div>
				</li>
				<li class="nubija-item">
					<div class="item-img">
						<img src="../images/bycicle6.jpg" alt="달구지 대여소 일러스트 이미지">
					</div>
					<div class="item-text">
						<strong class="h4">달구지 대여소</strong>
						<p class="item-desc">
							지하철역을 중심으로 주변 생활시설에서 접근 및 시민들의 이용이 편리한 곳에 대여소가 설치되어 있습니다. <br>
							대여소에 설치된 키오스크에서 서비스 이용 및 주변의 다른 터미널 현황 정보를 열람할 수 있습니다.
						</p>
					</div>
				</li>
				<li class="nubija-item">
					<div class="item-img">
						<img src="../images/bycicle6.jpg" alt="자전거 보관대 일러스트 이미지">
					</div>
					<div class="item-text">
						<strong class="h4">대여소 보관대</strong>
						<p class="item-desc">
							대여소에 설치된 자전거 보관대는 공영자전거의 잠금 및 도난방지를 위한 자전거 잠금 장치가 부착되어 있습니다. <br>
							회원카드 및 자전거 식별 장치가 부착되어 무인으로 대여 및 반납을 할 수 있습니다.
						</p>
					</div>
				</li>
				<li class="nubija-item">
					<div class="item-img">
						<img src="../images/bycicle6.jpg" alt="스마트락 일러스트 이미지">
					</div>
					<div class="item-text">
						<strong class="h4">스마트락</strong>
						<p class="item-desc">
							자전거 뒷부분에 부착하는 잠금장치로 서버와 통신을 하여 누비자 회원에게 대여 및 반납 기능을 수행합니다. <br>
							QR코드 및 회원카드로 대여를 할 수 있습니다.
						</p>
					</div>
				</li>
			</ul>
		</div>
	</div>
	</div>

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
					<img src="../images/logo1.jpg" alt="자전거">
				</div>
				<div class="footer-info">
					<p class="info-text01">주소 : 대구광역시 수성구 알파시티 1로 170(대흥동)
						대구디지털혁신즌흥원 대표 전화 : 053-000-0000</p>
					<p class="info-text02">Copyright</p>
				</div>
				<div class="footer-logo02">
					<img src="../images/logo2.jpg" alt="자전거">
				</div>
			</div>
		</div>
	</footer>
</body>
</html>