<!-- 회원가입 페이지 -->
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
<title>회원가입</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
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
							<li class="depth-2"><a href="../user/register.do"><span>회원가입</span></a></li>
							<li class="depth-2"><a href="../login.jsp"><span>로그인
										& 로그아웃</span></a></li>
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
					<li class="depth-1"><a href="selectBoardList.do"><span>게시판</span></a>
						<ul class="gnb-depth-2">
							<li class="depth-2"><a href="../sample/selectBoardList.do"><span>자유게시판</span></a></li>
							<li class="depth-2"><a href="../sample/selectBoardList.do"><span>문의게시판</span></a></li>
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
					<li class="sub-item current"><a href="../user/regiseter.jsp">
							<span>회원가입</span>
					</a></li>
					<li class="sub-item"><a href="../login.jsp"> <span>로그인
								& 로그아웃</span>
					</a></li>
				</ul>
			</aside>

			<form role="form" method="post" autocomplete="off">
				<p>
					<label for="id">아이디</label> <input type="text" id="user_id"
						name="user_id" />

					<button type="button" class="idCheck">아이디 중복확인</button>
				</p>
				<p class="result">
					<span class="msg">아이디를 확인해 주십시오.</span>
				</p>
				<p>
					<label for="password">패스워드</label> <input type="password"
						id="password" name="password" />
				</p>
				<p>
					<label for="name">이름</label> <input type="text" id="user_name"
						name="user_name" />
				</p>
				<p>
					<label for="number">전화번호</label> <input type="text"
						id="phone_number" name="phone_number" />
				</p>
				<p>
					<button type="submit" id="submit" disabled="disabled">가입</button>
				</p>
				<p>
					<a href="/WebProject">처음으로</a>
				</p>

			</form>
		</div>
	</div>
	<script>
		$(".idCheck").click(function() {

			var query = {
				id : $("#id").val()
			};

			$.ajax({
				url : "/WebProject/idCheck.do",
				type : "post",
				data : query,
				success : function(data) {
					if (data == 1) {
						$(".result .msg").text("중복된 아이디가 존재합니다.");
						$(".result .msg").attr("style", "color:#f00");
						$("#submit").attr("disabled", "disabled");
					} else {
						$(".result .msg").text("사용 가능한 아이디 입니다.");
						$(".result .msg").attr("style", "color:#00f");
						$("#submit").removeAttr("disabled");
					}
				}
			});
		});

		$("#id").keyup(function() {
			$(".result .msg").text("아이디를 확인해주십시오.");
			$(".result .msg").attr("style", "color:#000");

			$("#submit").attr("disabled", "disabled");

		});
	</script>


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

