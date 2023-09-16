<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script>
    function deleteBoard(boardId) {
        if (confirm("게시물을 삭제하시겠습니까?")) {
            // 삭제 동작을 수행하기 위한 URL 생성
            var deleteUrl = "deleteBoard.do?board_id=" + boardId;

            // 페이지 이동
            window.location.href = deleteUrl;
        }
    }
    
    
</script>



<style>
.center-align {
	text-align: center;
	margin-bottom: 30px;
}

.vertical-align-container {
	display: flex;
	flex-direction: column; /* 수직으로 정렬 */
	align-items: center; /* 가운데 정렬 */
}
</style>




<title>게시글 상세</title>
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
								<li class="depth-2"><a href="user/register.do"><span>회원가입</span></a></li>
								<li class="depth-2"><a href="login.jsp"><span>로그인</span></a></li>
							</c:if>
							<c:if test="${user != null }">
								<li class="depth-2"><a href="login.jsp"><span>로그아웃</span></a></li>
							</c:if>
						</ul></li>
					<li class="depth-1"><a href="information.jsp"><span>달구지</span></a>
						<ul class="gnb-depth-2">
							<li class="depth-2"><a
								href="../information&guide/information.jsp"><span>달구지란?</span></a></li>
							<li class="depth-2"><a href="../information&guide/guide.jsp"><span>이용방법</span></a></li>
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
					<li class="sub-item current"><a href="selectBoardList.do">
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
					<div class="bordered-section">
						<c:if test="${msg == null }">
							<form id="b" style="margin: 0 auto;" action="updateBoard.do"
								method="post">
								<table class="board-table visual-tbody">
									<tr>
										<td style="font-size: 30px" class="num th">번호</td>
										<td class="num1 td"><input
											style="font-size: 30px; color: black;" name="board_id"
											type="text" value="${board.board_id }" readonly="readonly" /></td>
									</tr>

									<tr>
										<td style="font-size: 30px" class="name th">제목</td>
										<td class="name1 td"><input placeholder="제목을 입력해 주세요"
											style="font-size: 30px;" name="board_title" type="text"
											value="${board.board_title }" /></td>
									</tr>

									<tr>
										<td style="font-size: 30px" class="regUser th">작성자</td>
										<td style="font-size: 30px" class="regUser1 td">${board.user_id }</td>
									</tr>
									<tr>
										<td style="font-size: 30px" class="content th">내용</td>
										<td class="content1 td"><textarea
												placeholder="내용을 입력해 주세요" cols="40" rows="5"
												style="font-size: 30px; background-color: #F8F8F8;"
												name="board_content">${board.board_content }</textarea></td>
									</tr>
									<tr>
										<td style="font-size: 30px" class="date th">등록일</td>
										<td style="font-size: 30px" class="date1 td">${board.board_regdate}</td>
									</tr>
								</table>
							</form>
							<div class="center-align" style="margin-top: 30px;">
								<button type="submit" value="UPDATE" form="b"
									style="width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">
									수정</button>
								<button onclick="deleteBoard(${board.board_id})"
									style="width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">
									삭제</button>
								<a href="selectBoardList.do">
									<button
										style="width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">목록
									</button>
								</a>
							</div>

						</c:if>
					</div>

					<form style="margin: 0 auto;" method="post" action="write.do">
						<table class="board-table" style="border-bottom: 2px solid #777;">
							<tr class="visual-tbody">
								<td style="font-size: 30px;" class="regUser2 th">댓글 작성자</td>
								<td class="regUser3 td"><input
									style="font-size: 30px; font-weight: bold; color: black;"
									name="user_id" type="text" value="${user.user_id }" /></td>
							</tr>
							<tr class="visual-tbody">
								<td style="font-size: 30px;" class="content2 th">댓글 내용</td>
								<td class="content1 td"><textarea
										placeholder="댓글 내용을 입력해 주세요" cols="40" rows="5"
										style="font-size: 30px; background-color: #F8F8F8;"
										name="reply_content"></textarea></td>
							</tr>
						</table>
						<div style="text-align: center;">
							<input type="hidden" name="board_id" value="${board.board_id}">
							<button
								style="margin-bottom: 30px; margin-top: 30px; width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;"
								type="submit">댓글 작성</button>
						</div>

					</form>


					<div class="bordered-section">
						<table class="board-table" style="margin-bottom: 30px;">
							<c:forEach items="${reply }" var="item">
								<tr class="visual-tbody">
									<td style="font-size: 30px;" class="replyid1 th">작성자 ID</td>
									<td style="font-size: 30px;" class="replyid2 td">${item.user_id }</td>
								</tr>
								<tr class="visual-tbody">
									<td style="font-size: 30px;" class="replydate1 th">등록일</td>
									<td style="font-size: 30px;" class="replydate2 td"><fmt:formatDate
											value="${item.reply_date}" pattern="yyyy.MM.dd" /></td>
								</tr>
								<tr class="visual-tbody">
									<td style="font-size: 30px;" class="replycon1 th">댓글 내용</td>
									<td style="font-size: 30px;" class="replycon2 td">${item.reply_content }</td>
								</tr>
								<tr class="visual-tbody">
									<td colspan="2" style="text-align: center;"><a
										href="modifyReply.do?board_id=${board.board_id }&reply_id=${item.reply_id}">
											<button
												style="width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">
												수정</button>
									</a> <a
										href="delete.do?board_id=${board.board_id }&reply_id=${item.reply_id}">
											<button
												style="width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">

												삭제</button>
									</a></td>
								</tr>
							</c:forEach>
						</table>
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