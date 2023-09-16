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
.button-container {
	text-align: center;
}

.button-container>div {
	display: inline-block;
	margin: 20px; /* Adjust this margin for the desired gap */
}
</style>


<script type="text/javascript">
	function insertQBoard() {
		if ($("#title").val().trim().length == 0
				|| $("#content").val().trim().length == 0) {
			alert("제목과 내용을 입력해주세요.");
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
							<li class="depth-2"><a href="../user/register.do"><span>회원가입</span></a></li>
							<c:if test="${user == null }">
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
					<li class="sub-item "><a href="../board/selectBoardList.jsp">
							<span>자유게시판</span>
					</a></li>
					<li class="sub-item current"><a
						href="../qboard/selectQBoardList.jsp"> <span>문의게시판</span>
					</a></li>
				</ul>
			</aside>

			<div class="content-wrap">
				<h2 class="h2">문의 게시글 등록</h2>
				<c:if test="${msg == null }">
					<form id="insertQBoard" action="insertQBoard.do" method="post"
						enctype="multipart/form-data">
						<div class="board-table">
							<table>
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
									<td class="reguser3 th"><input style="font-size: 30px;"
										value="${user.user_id }" type="text" name="users" size="52"
										readonly="readonly" /></td>
								</tr>
								<tr class="point">
									<td class="title3 th">제목</td>
									<td class="title4 th"><input placeholder="제목을 입력해 주세요" style="font-size: 30px;"
										type="text" id="title" name="title" size="52"
										value="${QBoardVO.title }" /></td>
								</tr>

								<tr class="point">
									<td class="cont2 th">내용</td>
									<td class="cont3 th"><textarea placeholder="내용을 입력해 주세요" style="font-size: 30px;"
											name="content" id="content" rows="5" cols="40"></textarea></td>
								</tr>
								<tr class="point">
									<td class="file th">첨부파일</td>
									<td class="file1 th"><input placeholder="첨부파일" style="font-size: 30px;"
										type="file" name="uploadFile"></td>
								</tr>
							</table>
						</div>
						<button value="등록" onclick="insertQBoard()"
							style="width: 100px; margin: auto; display: block; border: 1px solid; padding: 15px 30px; border-radius: 15px; margin-top: 20px;"
							type="submit">등록</button>
					</form>
					<a href="selectQBoardList.do"><input type="button"
						style="width: 100px; margin: auto; margin-bottom:30px; display: block; border: 1px solid; padding: 15px 30px; border-radius: 15px; margin-top: 20px;"
						value="이전"></a>
				</c:if>
			</div>
			<c:if test="${msg == false }">

				<div class="content-wrap">
					<h2 style="text-align: center;" class="h2">로그인을 하셔야 글을 작성할 수
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
				</div>
			</c:if>



			<%-- 			<center>
				<h1>Q&A</h1>

				<form id="insertQBoard" action="insertQBoard.do" method="post"
					enctype="multipart/form-data">
					<table border="1" cellpadding="0" cellspacing="0">
						<tr>
							<td bgcolor="skyblue" with="70">문의 유형</td>
							<td align="left"><select id="category" name="category"
								required="required">
									<option value="ETC">선택</option>
									<option value="USER">회원/로그인</option>
									<option value="RENTAL">대여/반납</option>
									<option value="PLACE">대여소</option>
									<option value="ETC">기타</option>
							</select></td>
						</tr>
						<tr>
							<td bgcolor="skyblue">작성자</td>
							<td align="left"><input value="${user.user_id }" type="text"
								name="users" size="52" /></td>
						</tr>
						<tr>
							<td bgcolor="skyblue">제목</td>
							<td align="left"><input type="text" id="title" name="title"
								size="52" /></td>
						</tr>
						<tr>
							<td bgcolor="skyblue">내용</td>
							<td align="left"><textarea name="content" id="content"
									rows="5" cols="40"></textarea></td>
						</tr>
						<tr>
							<td bgcolor="skyblue">첨부파일</td>
							<td><input type="file" name="uploadFile"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="checkbox" name="secret">
								<label>비밀글 설정</label></td>
						</tr>
					</table>
					<input type="submit" value="등록" onclick="insertQBoard()" />
				</form>

				<br> <a href="selectQBoardList.do"><input type="button"
					value="이전"></a>
			</center>
 --%>
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