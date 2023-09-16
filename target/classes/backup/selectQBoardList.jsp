<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html> 
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

<title>Q&A</title>
<style>
.button-container {
	text-align: center;
}

.button-container>div {
	display: inline-block;
	margin: 20px; /* Adjust this margin for the desired gap */
}
</style>

</head>
<body>

	<!-- 헤더 -->
	<header class="header">
		<div class="header-inner layout">
			<h1 class="header-logo">
				<a href="../index.jsp"><img src="../images/home1.png"
					alt="달구지 홈 화면"></a>
			</h1>
			<nav class="header-gnb" id="gnb">
				<ul class="gnb-depth-1">
					<li class="depth-1"><a href="../login.jsp"><span>사용자</span></a>
						<ul class="gnb-depth-2">
							<li class="depth-2"><a href="../user/register.do"><span>회원가입</span></a></li>
							<c:if test="${user == null }">
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
					<li class="depth-1"><a href="./sub_0301.html"><span>대여소</span></a>
						<ul class="gnb-depth-2">
							<li class="depth-2"><a href="selectBoardList.do"><span>예약하기</span></a></li>
							<li class="depth-2"><a href="selectBoardList.do"><span>반납하기</span></a></li>
						</ul></li>
					<li class="depth-1"><a href="../sample/selectBoardList.do"><span>게시판</span></a>
						<ul class="gnb-depth-2">
							<li class="depth-2"><a href="../sample/selectBoardList.do"><span>자유게시판</span></a></li>
							<li class="depth-2"><a href="selectQBoardList.do"><span>문의게시판</span></a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</header>

	<!-- 서브 비주얼 영역 -->
	<div class="svisual-layout">
		<div class="svisual-inner layout">
			<strong class="svisual-title">게시판</strong>
		</div>
	</div>

	<!-- 서브 콘텐츠 -->
	<div class="body-wrap">
		<div class="layout">
			<aside class="lnb-layout">
				<ul class="sub-menu col5">
					<li class="sub-item"><a href="../sample/selectBoardList.do">
							<span>자유게시판</span>
					</a></li>
					<li class="sub-item current"><a href="selectQBoardList.do">
							<span>문의게시판</span>
					</a></li>
				</ul>
			</aside>

			<div class="content-wrap">
				<h2 class="h2">문의게시판</h2>
				<div class="board-wrap">
					<div class="board-table">
						<div class="visual-thead" style="margin: auto;">
							<div class="number th">번호</div>
							<div class="type th">유형</div>
							<div class="title th">제목</div>
							<div class="reguser th">작성자</div>
							<div class="regdate th">등록일</div>
							<div class="readcount th">조회수</div>
						</div>
						<form action="selectQBoardList.do" method="post">
							<table class="visual-tbody">
								<c:forEach var="board" items="${QBoardList}">
									<tr class="point">
										<td class="number th">${board.no}</td>
										<td class="type th">${board.category.category}</td>
										<td class="title th"><a
											href="selectQBoard.do?no=${board.no}">${board.title}</a></td>
										<td class="reguser th">${board.users}</td>
										<td class="regdate th">${board.regDate}</td>
										<td class="readcount th">${board.readCount}</td>
									</tr>
								</c:forEach>
							</table>
						</form>

						<div class="button-container">
							<a href="insertQBoard.do"
								style="display: block; text-decoration: none;">
								<button
									style="margin-bottom: 30px; width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">
									문의</button>
							</a>
						</div>

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
</body>
</html>