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

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

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
		var category = $("#category option:selected").val();
		if (category == "X") {
			alert("문의 유형을 선택해주세요.");
			$("#category").focus();
			return false;
		}
		if ($("#title").val().trim().length == 0) {
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}
		if ($("#content").val().trim().length == 0) {
			alert("내용을 입력해주세요.");
			$("#content").focus();
			return false;
		}
		return true;
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
					<li class="depth-1"><a href="information.jsp"><span>달구지</span></a>
						<ul class="gnb-depth-2">
							<li class="depth-2"><a
								href="../information&guide/information.jsp"><span>달구지란?</span></a></li>
							<li class="depth-2"><a href="../information&guide/guide.jsp"><span>이용방법</span></a></li>
						</ul></li>
					<li class="depth-1"><a href="./sub_0301.html"><span>대여소</span></a>
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
					<li class="sub-item "><a href="../sample/selectBoardList.do"> <span>자유게시판</span>
					</a></li>
					<li class="sub-item current"><a href="selectQBoardList.do">
							<span>문의게시판</span>
					</a></li>
				</ul>
			</aside>

			<div class="content-wrap">
				<h2 class="h2">문의 게시판</h2>
				<c:if test="${msg == null }">
					<form id="insertQBoard" action="insertQBoard.do" method="post"
						enctype="multipart/form-data">
						<table class="board-table text-center">
							<tr class="visual-tbody">
								<td style="font-size: 30px;" class="type2 th">문의 유형</td>
								<td class="type3 th"><select
									style="font-size: 30px; background-color: #F8F8F8;"
									id="category" name="category" required="required">
										<option value="X">선택</option>
										<option value="USER">회원/로그인</option>
										<option value="RENTAL">대여/반납</option>
										<option value="PLACE">대여소</option>
										<option value="ETC">기타</option>
								</select></td>
							</tr>
							<tr class="visual-tbody">
								<td style="font-size: 30px;" class="reguser2 th">작성자</td>
								<td class="reguser3 th"><input
									style="font-size: 30px; background-color: #F8F8F8;"
									value="${user.user_id }" type="text" name="users" size="30"
									readonly="readonly" /></td>
							</tr>
							<tr style="font-size: 30px;" class="visual-tbody">
								<td style="font-size: 30px;" class="title3 th">제목</td>
								<td class="title4 th"><input placeholder="제목을 입력해 주세요"
									style="font-size: 30px; background-color: #F8F8F8;" type="text"
									id="title" name="title" size="30" value="${QBoardVO.title }" /></td>
							</tr>
							<tr class="visual-tbody">
								<td style="font-size: 30px;" class="cont2 th">내용</td>
								<td class="cont3 th"><textarea placeholder="내용을 입력해 주세요"
										style="font-size: 30px; background-color: #F8F8F8;"
										name="content" id="content" rows="5" cols="40"></textarea></td>
							</tr>
							<tr>
								<td style="font-size: 30px;" class="file th">첨부파일</td>
								<td class="file1 th"><input placeholder="첨부파일"
									style="font-size: 30px; background-color: #F8F8F8;" type="file"
									name="uploadFile"></td>
							</tr>
						</table>
					</form>
					<div class="button-container">
						<button value="등록" onclick="return insertQBoard()"
							form="insertQBoard"
							style="width: 100px; margin: auto; display: inline-block; border: 1px solid; padding: 15px 30px; border-radius: 15px; margin-top: 20px; margin-bottom: 20px;"
							type="submit">등록</button>
						<button
							style="width: 100px; margin: 0 10px; display: inline-block; border: 1px solid; padding: 15px 30px; border-radius: 15px;"
							type="button" onclick="location.href='selectQBoardList.do'">목록</button>
					</div>

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
						<div>
							<a href="../user/register.do"
								style="display: block; text-decoration: none;">
								<button
									style="margin-bottom: 50px; width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">
									회원가입</button>
							</a>
						</div>
						<div>
							<a href="../login.jsp"
								style="display: block; text-decoration: none;">
								<button
									style="margin-bottom: 50px; width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">
									로그인</button>
							</a>
						</div>
					</div>
				</div>

			</c:if>
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