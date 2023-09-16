<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>자유게시판</title>
<style>
.button-container {
	text-align: center;
}

.button-container>div {
	display: inline-block;
	margin: 20px; /* Adjust this margin for the desired gap */
}
</style>

<script type="text/javaScript" language="javascript" defer="defer">
	function fn_egov_link_page(pageNo) {
		location.href = "/WebProject/sample/selectBoardList.do?pageIndex="
				+ pageNo
				+ "&searchKeyword=${searchKeyword}&searchCondition=${searchCondition}";
	}
</script>
<script type="text/javascript"> /* 반납 팝업창 띄우기 */
       function returnBike(){
           window.open("<%=request.getContextPath()%>
	/returnBike/returnBike.do",
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
				<a href="../index.jsp"><img src="../images/home1.png"
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
					<li class="depth-1"><a href="selectBoardList.do"><span>게시판</span></a>
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
			<strong class="svisual-title">게시판</strong>
		</div>
	</div>

	<!-- 서브 콘텐츠 -->
	<div class="body-wrap">
		<div class="layout">
			<aside class="lnb-layout">
				<ul class="sub-menu col5">
					<li class="sub-item current"><a href="./selectBoardList.do">
							<span>자유게시판</span>
					</a></li>
					<li class="sub-item"><a href="../qboard/selectQBoardList.do">
							<span>문의게시판</span>
					</a></li>
				</ul>
			</aside>

			<div class="content-wrap">
				<h2 class="h2">자유게시판</h2>
				<div class="board-wrap">
					<form action="selectBoardList.do" method="post">
						<div class="search-box">
							<select class="search-select" name="searchCondition"
								title="검색 카테고리 선택">
								<c:forEach items="${conditionMap }" var="option">
									<option value="${option.value }">${option.key }
								</c:forEach>
							</select> <input type="text" name="searchKeyword"
								placeholder="검색어를 입력해주세요." class="search-text">
							<button type="submit" class="search-btn" title="검색하기"></button>
						</div>



						<table class="board-table text-center">
							<tr style="border-bottom: 2px solid #777;">
								<th class="num th">번호</th>
								<th class="name th">제목</th>
								<th class="regUser th">작성자</th>
								<th class="date th">등록일</th>
								<th class="readCount th">조회수</th>
							</tr>
							<c:forEach var="board" items="${boardList }">
								<tr class="visual-tbody">
									<td class="num th"><a
										href="selectBoard.do?board_id=${board.board_id }">${board.rnum}</a></td>
									<td class="name th"><a
										href="selectBoard.do?board_id=${board.board_id }">${board.board_title }</a></td>
									<td class="regUser th">${board.user_id }</td>
									<td class="date th">${board.board_regdate }</td>
									<td class="readCount th">${board.board_viewcount }</td>
								</tr>
							</c:forEach>
						</table>
					</form>

					<div id="paging" class="pagination">
						<ui:pagination paginationInfo="${paginationInfo }" type="image"
							jsFunction="fn_egov_link_page" />
						<form:hidden path="pageIndex" path="searchKeyword"
							path="searchCondition" />
					</div>
					<br>
					<div class="button-container">
						<div>
							<a href="insertBoard.do"
								style="display: block; text-decoration: none;">
								<button
									style="width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">
									게시글 등록</button>
							</a>
						</div>
						<div>
							<a href="selectBoardList.do"
								style="display: block; text-decoration: none;">
								<button
									style="width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">
									게시글 목록</button>
							</a>
						</div>

						<div>
							<button type="button"
								style="width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;"
								onclick="location.href='../index.jsp'">홈으로</button>
						</div>
						<div>
							<button type="button"
								style="width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;"
								onclick="location.href='../login.jsp'">로그인</button>
						</div>


					</div>
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