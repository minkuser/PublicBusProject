<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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