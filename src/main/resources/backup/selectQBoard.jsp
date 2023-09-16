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

<style>
.center-align {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px; /* 필요한 만큼 여백 추가 */
}
</style>


<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script>
	$("#fileDelete").click(function() {
		alert("ok");
		$('#fileName').val(null);
	});

	function fileDelete() {
		$("#fileName").val(null);
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
							<li class="depth-2"><a href="../user/register.do"><span>회원가입</span></a></li>
							<c:if test="${user == null }">
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
					<li class="depth-1"><a href="./sub_0301.html"><span>대여소</span></a>
						<ul class="gnb-depth-2">
							<li class="depth-2"><a href="selectBoardList.do"><span>예약하기</span></a></li>
							<li class="depth-2"><a href="selectBoardList.do"><span>반납하기</span></a></li>
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
					<li class="sub-item"><a href="../sample/selectBoardList.do">
							<span>자유게시판</span>
					</a></li>
					<li class="sub-item current"><a
						href="../qboard/selectQBoardList.do"> <span>문의게시판</span>
					</a></li>
				</ul>
			</aside>

			<div class="content-wrap">
				<h2 class="h2">문의 게시글</h2>
				<c:if test="${msg == null }">
					<div class="board-wrap">
						<form action="updateQBoard.do" method="post"
							enctype="multipart/form-data">
							<div class="board-table text-center">
								<table>
									<tr class="point">
										<td class="number1 th">#</td>
										<td class="number2 th">${QBoard.no}</td>
									</tr>
									<tr class="point">
										<td class="type2 th">문의 유형</td>
										<td class="type3 th"><select style="font-size: 30px;"
											id="category" name="category" required="required">
												<option value="ETC">선택</option>
												<option value="USER">회원/로그인</option>
												<option value="RENTAL">대여/반납</option>
												<option value="PLACE">대여소</option>
												<option value="ETC">기타</option>
										</select></td>
									</tr>
									<tr class="point">
										<td class="reguser2 th">작성자</td>
										<td class="reguser3 th">${QBoard.users}</td>
									</tr>
									<tr class="point">
										<td class="title3 th">제목</td>
										<td class="title4 th"><input placeholder="제목을 입력해 주세요" style="font-size: 30px;"
											type="text" id="title" name="title" size="52"
											value="${QBoard.title}" /></td>
									</tr>

									<tr class="point">
										<td class="cont2 th">내용</td>
										<td class="cont3 th"><textarea placeholder="내용을 입력해 주세요" style="font-size: 30px;"
												name="content" id="content" rows="5" cols="40">${QBoard.content}</textarea></td>
									</tr>
									<tr class="point">
										<c:choose>
											<c:when test="${QBoard.fileName eq null}">
												<tr>
													<td class="file th">첨부파일</td>
													<td class="file1 th"><input type="file"
														name="uploadFile"></td>
												</tr>
											</c:when>
											<c:when test="${QBoard.fileName eq ''}">
												<tr>
													<td class="file th">첨부파일</td>
													<td class="file1 th"><input type="file"
														name="uploadFile"></td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td class="image th">이미지</td>
													<td class="image1 th"><img alt="#"
														src="${path}${QBoard.fileName}"></td>
												</tr>
												<tr>
													<td class="file th">다운로드</td>
													<td class="file1 th"><a
														href="fileDownload.do?fileName=${QBoard.fileName}"> <input
															type="text" id="fileName" value="${QBoard.fileName}"
															name="fileName" readonly="readonly" size="30" />
													</a>
														<button type="button" style="float: right"
															onclick="fileDelete()">파일 삭제</button> <br>
													<td>
												</tr>
												<tr>
													<td class="file th">첨부파일</td>
													<td class="file1 th"><input type="file"
														name="uploadFile"></td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tr>
									<tr>
										<td class="regdate1 th">작성일</td>
										<td class="regdate2 th">${QBoard.regDate}</td>
									</tr>
								</table>
							</div>
							<button value="수정"
								style="width: 100px; margin: auto; display: block; border: 1px solid; padding: 15px 30px; border-radius: 15px; margin-top: 20px;"
								type="submit">수정</button>
						</form>
					</div>
					<div class="center-align">
						<a href="insertQBoard.do"><button value="이전"
								style="width: 100px; margin: auto; display: block; border: 1px solid; padding: 15px 30px; border-radius: 15px; margin-top: 20px;"
								type="submit">이전</button></a>
						&nbsp;&nbsp;&nbsp; 
						<a href="deleteQBoard.do?no=${QBoard.no}"><button value="삭제" onclick="btnDelete()"
								style="width: 100px; margin: auto; display: block; border: 1px solid; padding: 15px 30px; border-radius: 15px; margin-top: 20px;"
								type="submit">삭제</button></a>
						&nbsp;&nbsp;&nbsp; 
						<a href="selectQBoardList.do"><button value="목록"
								style="width: 100px; margin: auto; display: block; border: 1px solid; padding: 15px 30px; border-radius: 15px; margin-top: 20px;"
								type="submit">목록</button></a>
					</div>

				</c:if>

				<c:if test="${msg == false}">

					<h2 style="text-align: center;" class="h2">로그인을 하셔야 글을 수정할 수
						있습니다.</h2>
					<h2 style="text-align: center;" class="h3">회원가입을 진행하지 않으셨다면
						회원가입 진행 후 로그인하여 작성 바랍니다.</h2>

					<div style="position: relative;">
						<img src="../images/logo4.jpg" alt="달구지">
					</div>

					<div class="button-container">
						<div>
							<a href="../index.jsp"
								style="display: block; text-decoration: none;">
								<button
									style="width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">
									홈으로</button>
							</a>
						</div>
						<div>
							<a href="selectQBoardList.do"
								style="display: block; text-decoration: none;">
								<button
									style="margin-bottom: 50px; width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">
									목록</button>
							</a>
						</div>
					</div>

				</c:if>
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