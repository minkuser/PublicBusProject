<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
	function fileDelete() {
		$("#fileName").val(null);
	}

	function deleteQBoard() {
		var result = confirm("삭제하시겠습니까?");
		if (result) {
			location.href = "deleteQBoard.do?groupId=${QBoard.groupId}";
		} else {
			return false;
		}
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
								<li class="depth-2"><a href="user/register.do"><span>회원가입</span></a></li>
								<li class="depth-2"><a href="login.jsp"><span>로그인</span></a></li>
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
					<li class="depth-1"><a href="reserveHome.do"><span>대여소</span></a>
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
			<strong class="svisual-title">게시판</strong>
		</div>
	</div>

	<!-- 서브 콘텐츠 -->
	<div class="body-wrap">
		<div class="layout">
			<aside class="lnb-layout">
				<ul class="sub-menu col5">
					<li class="sub-item "><a href="../sample/selectBoardList.do">
							<span>자유게시판</span>
					</a></li>
					<li class="sub-item current"><a href="selectQBoardList.do">
							<span>문의게시판</span>
					</a></li>
				</ul>
			</aside>
			<div class="content-wrap">
				<h2 class="h2">문의게시판</h2>

				<form id="updateQBoard" action="updateQBoard.do" method="post"
					enctype="multipart/form-data">
					<table class="board-table visual-tbody">
						<tr>
							<td style="font-size: 30px" class="type2 th">문의 유형</td>
							<td class="type3 th"><select
								style="font-size: 30px; background-color: #F8F8F8;"
								id="category" name="category"
								<c:if test="${sessionId ne QBoard.users || maxLayer gt 0}">disabled="disabled"</c:if>>
									<option value="USER"
										<c:if test="${QBoard.category eq 'USER'}">selected="selected"</c:if>>회원/로그인</option>
									<option value="RENTAL"
										<c:if test="${QBoard.category eq 'RENTAL'}">selected="selected"</c:if>>예약</option>
									<option value="PLACE"
										<c:if test="${QBoard.category eq 'PLACE'}">selected="selected"</c:if>>대여소</option>
									<option value="ETC"
										<c:if test="${QBoard.category eq 'ETC'}">selected="selected"</c:if>>기타</option>
							</select></td>
						</tr>
						<tr>
							<td style="font-size: 30px" class="reguser2 th">작성자</td>
							<td style="font-size: 30px" class="reguser3 th">${QBoard.users}</td>
						</tr>
						<tr>
							<td style="font-size: 30px" class="title3 th">제목</td>
							<td class="title4 th"><input placeholder="제목을 입력해 주세요"
								style="font-size: 30px; background-color: #F8F8F8;" type="text"
								name="title" value="${QBoard.title}" size="30"
								<c:if test="${sessionId ne QBoard.users || maxLayer gt 0}"> readonly="readonly"</c:if>></td>
						</tr>
						<tr>
							<td style="font-size: 30px" class="cont2 th">내용</td>
							<td class="cont3 th"><textarea placeholder="내용을 입력해 주세요"
									style="font-size: 30px; background-color: #F8F8F8;"
									name="content" rows="5" cols="40"
									<c:if test="${sessionId ne QBoard.users || maxLayer gt 0}"> readonly="readonly"</c:if>>${QBoard.content}</textarea></td>
						</tr>
						<c:if test="${!empty QBoard.fileName}">
							<tr>
								<td style="font-size: 30px" class="image th">이미지</td>
								<td class="image1 th"><img alt="#"
									src="<c:url value='/showImage.do?fileName=${QBoard.fileName}'/>"></td>
							</tr>
							<tr>
								<td style="font-size: 30px" class="file th">다운로드</td>
								<td style="font-size: 30px" class="file1 th"><a
									href="fileDownload.do?fileName=${QBoard.fileName}"> <input
										style="background-color: #F8F8F8;" type="text" id="fileName"
										value="${QBoard.fileName}" name="fileName" readonly="readonly"
										size="30" />
								</a>
									<button type="button"
										style="float: right; width: 100px; border: 1px solid; padding: 15px 30px; border-radius: 15px; float: center;"
										onclick="fileDelete()"
										<c:if test="${sessionId ne QBoard.users || maxLayer gt 0}">disabled="disabled"</c:if>>
										<span
											style="display: inline-block; text-align: center; width: 100%;">삭제</span>
									</button>
								<td>
							</tr>
						</c:if>
						<tr>
							<td style="font-size: 30px" class="down th">첨부파일</td>
							<td class="down1 th"><input
								style="background-color: #F8F8F8;" type="file" name="uploadFile"
								<c:if test="${sessionId ne QBoard.users || maxLayer gt 0}">disabled="disabled"</c:if>></td>
						</tr>
						<tr>
							<td style="font-size: 30px" class="regdate1 th">작성일</td>
							<td class="regdate2 th">${QBoard.regDate}</td>
						</tr>
					</table>
					<div class="button-container"
						style="text-align: center; margin-bottom: 10px; display: flex; justify-content: center; gap: 40px;">
						<c:if test="${sessionId eq 'ad'}">
							<button
								style="width: 100px; display: inline-block; border: 1px solid; padding: 15px 30px; border-radius: 15px; margin-top: 20px;"
								onclick="location.href='insertQReply.do?no=${board.no}'">답글</button>
							<button
								style="width: 100px; margin: auto; display: inline-block; border: 1px solid; padding: 15px 30px; border-radius: 15px; margin-top: 20px;"
								type="button" onclick="return deleteQBoard()">삭제</button>
						</c:if>
						<c:if test="${sessionId ne 'ad'}">
							<c:if test="${sessionId eq QBoard.users}">
								<c:if test="${maxLayer eq 0}">
									<button
										style="width: 100px; display: inline-block; border: 1px solid; padding: 15px 30px; border-radius: 15px; margin-top: 20px;"
										type="submit" form="updateQBoard">수정</button>
								</c:if>
								<button
									style="width: 100px; display: inline-block;; border: 1px solid; padding: 15px 30px; border-radius: 15px; margin-top: 20px;"
									type="button" onclick="return deleteQBoard()">삭제</button>
							</c:if>
						</c:if>
						<button
							style="width: 100px; display: inline-block; border: 1px solid; padding: 15px 30px; border-radius: 15px; margin-top: 20px;"
							type="button" onclick="location.href='selectQBoardList.do'">이전</button>
					</div>
				</form>
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