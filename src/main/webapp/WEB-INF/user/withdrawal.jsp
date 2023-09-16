<!-- 회원탈퇴 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="../css/slick.css">
<link rel="stylesheet" href="../css/sub.css">

<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/slick.js"></script>
<script src="../js/logoplay.js"></script>
<script src="../js/splitting.min.js"></script>
<script src="../js/common.js" defer></script>
<style>
.button-container {
	text-align: center;
}

.button-container>div {
	display: inline-block;
	margin: 20px; /* Adjust this margin for the desired gap */
}
</style>
<script>
	// JavaScript 코드
	document.getElementById("goToLink").addEventListener("click", function() {
		window.location.href = "/"; // 이동할 링크를 지정
	});
</script>

<title>회원탈퇴</title>
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
								<li class="depth-2"><a href="user/register.do"><span>회원가입</span></a></li>
								<li class="depth-2"><a href="login.jsp"><span>로그인</span></a></li>
							</c:if>
							<c:if test="${user != null }">
								<li class="depth-2"><a href="login.jsp"><span>로그아웃</span></a></li>
							</c:if>
						</ul></li>
					<li class="depth-1"><a
						href="../information&guide/information.jsp"><span>달구지</span></a>
						<ul class="gnb-depth-2">
							<li class="depth-2"><a
								href="../information&guide/information.jsp"><span>달구지란?</span></a></li>
							<li class="depth-2"><a href="../information&guide/guide.jsp"><span>이용방법</span></a></li>
						</ul></li>
					<li class="depth-1"><a href="../reserveHome.do"><span>대여소</span></a>
						<ul class="gnb-depth-2">
							<c:if test="${user == null }">
								<li class="depth-2"><a href="../reserveHome.do"><span>예약하기</span></a></li>
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
			<strong class="svisual-title">사용자</strong>
		</div>
	</div>
	<!-- 서브 콘텐츠 -->
	<div class="body-wrap">
		<div class="layout">
			<aside class="lnb-layout">
				<ul class="sub-menu col5">
					<li class="sub-item "><a href="../user/regiseter.jsp"> <span>회원가입</span>
					</a></li>
					<li class="sub-item current"><a href="../login.jsp"> <span>회원탈퇴</span>
					</a></li>
				</ul>
			</aside>

			<div class="content-wrap">
				<h2 class="h2">회원탈퇴</h2>
				<div style="position: relative;">
					<img src="../images/logo4.jpg" alt="달구지">
				</div>

				<form method="post" id="b">
					<table class="board-table" style="width: 80%; margin: 0 auto;">
						<tr class="visual-tbody">
							<td class="Id th" style="font-size: 30px;">아이디 :</td>
							<td class="Id1 th"><input style="font-size: 30px;"
								type="text" id="user_id" name="user_id" value="${user.user_id }"
								readonly="readonly" /></td>
						</tr>
						<tr class="visual-tbody">
							<td class="pass th" style="font-size: 30px;">패스워드 :</td>
							<td class="pass1 th"><input
								style="font-size: 30px; background-color: #F8F8F8;"
								type="password" id="password" name="password" /></td>
						</tr>
					</table>
				</form>
				<div class="button-container"
					style="margin-right: 30px; margin-top: 30px; margin-bottom: 30px;">
					<button type="submit" id="submit" form="b"
						style="width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">
						탈퇴</button>
					<a href="../index.jsp">
						<button
							style="width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">
							처음으로</button>
					</a>
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
							대구디지털혁신진흥원 대표 전화 : 053-000-0000</p>
						<p class="info-text02">Copyright</p>
					</div>
					<div class="footer-logo02">
						<img src="../images/logo2.jpg" alt="자전거">
					</div>
				</div>
			</div>
		</footer>


	</div>
</body>
</html>