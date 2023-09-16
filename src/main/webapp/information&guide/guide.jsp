<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon"
	href="../images/favicon.ico">
<link rel="apple-touch-icon-precomposed"
	href="../images/favicon_152.png">

<link rel="stylesheet" href="../css/slick.css">
<link rel="stylesheet" href="../css/sub.css">

<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/slick.js"></script>
<script src="../js/logoplay.js"></script>
<script src="../js/splitting.min.js"></script>
<script src="../js/common.js" defer></script>

<script type="text/javascript"> /* 반납 팝업창 띄우기 */
       function returnBike(){
           window.open("<%=request.getContextPath()%>/returnBike/returnBike.do",
				"자전거 반납하기", "width=640, height=400")
		opener.location.reload();
	}
</script>



<title>이용방법</title>
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
			<strong class="svisual-title">달구지</strong>
		</div>
	</div>

	<!-- 서브 콘텐츠 -->
	<div class="body-wrap">
		<div class="layout">
			<aside class="lnb-layout">
				<ul class="sub-menu col5">
					<li class="sub-item"><a
						href="../information&guide/information.jsp"> <span>달구지란?</span>
					</a></li>
					<li class="sub-item current"><a
						href="../information&guide/guide.jsp"> <span>이용방법</span>
					</a></li>
				</ul>
			</aside>

			<div class="content-wrap" id="txt">
				<div class="way-wrap">
					<h2 class="h2">이용방법</h2>

					<div class="tab-container">
						<ul class="tab-ul tab-js">
							<li class="tab-item active"><a href="#" data-num="1"
								title="선택됨"><span>카드 및 키오스크</span></a></li>
							<li class="tab-item"><a href="#" data-num="2"><span>달구지
										앱</span></a></li>
						</ul>

						<div class="tab-contents">
							<!-- 카드 및 키오스크 탭 -->
							<div class="tab-inner active" data-num="1">
								<div class="tab-container">
									<div class="tab-top">
										<h3 class="tab-title">카드 및 키오스크</h3>
										<ul class="tab-js tab-ul2">
											<li class="tab-item active"><a href="#" data-num="1"
												title="선택됨">회원가입&amp;사용자카드 등록</a></li>
											<li class="tab-item"><a href="#" data-num="2">이용권
													결제&amp;등록</a></li>
											<li class="tab-item"><a href="#" data-num="3">자전거 대여
													반납절차</a></li>
											<li class="tab-item"><a href="#" data-num="4">키오스크
													이용방법 및 안내</a></li>
										</ul>
									</div>

									<!-- 카드 및 키오스크 탭안에 탭 -->
									<div class="tab-contents">
										<div class="tab-inner active" data-num="1">
											<h3 class="h3">온라인 회원가입 시</h3>
											<ol class="process-list">
												<li class="process-item">
													<div class="item-icon">
														<span class="icon icon05"></span>
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">1</span> 회원가입
														</div>
														<p class="item-desc">달구지 앱에서 회원가입 신청</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-icon">
														<span class="icon icon06"></span>
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">2</span> 회원가입비 납부
														</div>
														<p class="item-desc">가상계좌 또는 휴대폰 등의 결제수단으로 회원가입비 납부</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-icon">
														<span class="icon icon07"></span>
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">3</span> 사용가능카드 등록
														</div>
														<p class="item-desc">
															가까운 터미널에서 사용가능카드 <b class="color-green">(마이비,캐시비,티머니)</b>를
															등록
														</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-icon">
														<span class="icon icon01"></span>
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">4</span> 달구지 이용
														</div>
														<p class="item-desc">달구지 터미널에서 자전거 이용</p>
													</div>
												</li>
											</ol>

											<h3 class="h3">시청 또는 읍,면,동 가입 시</h3>
											<ol class="process-list">
												<li class="process-item">
													<div class="item-icon">
														<span class="icon icon09"></span>
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">1</span> 가입신청서 작성
														</div>
														<p class="item-desc">시청 또는 읍,면,동사무소(주민센터) 방문 후 회원가입
															신청서 작성</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-icon">
														<span class="icon icon06"></span>
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">2</span> 가입 및 가입비 납부
														</div>
														<p class="item-desc">가상계좌입금 또는 휴대폰으로 회원가입비 결제</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-icon">
														<span class="icon icon08"></span>
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">3</span> 교통카드 등록
														</div>
														<p class="item-desc">소지한 교통카드 또는 교통카드 구매 후 등록</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-icon">
														<span class="icon icon01"></span>
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">4</span> 달구지 이용
														</div>
														<p class="item-desc">달구지 터미널에서 자전거 이용</p>
													</div>
												</li>
											</ol>
										</div>

										<div class="tab-inner" data-num="2">
											<h3 class="h3">1일 이용권 결제(비회원)</h3>
											<ol class="way-process col3">
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0102_img01.jpg"
															alt="1일 이용권 결제&대여 메뉴 선택 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">1</span> 1일 이용권 결제&amp;대여 메뉴 선택
														</div>
														<p class="item-desc">키오스크에서 1일 이용권 [결제&amp;대여] 선택</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0102_img02.jpg"
															alt="1일 이용권 결제 선택 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">2</span> 1일 이용권 결제 선택
														</div>
														<p class="item-desc">1일 이용권 결제버튼 선택</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0102_img03.jpg"
															alt="이용안내 & 약관동의 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">3</span> 이용안내 &amp; 약관동의
														</div>
														<p class="item-desc">이용안내 내용 확인 후 약관동의 확인버튼 클릭</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0102_img04.jpg"
															alt="휴대폰 번호 입력 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">4</span> 휴대폰 번호 입력
														</div>
														<p class="item-desc">가입비 결제를 위해 휴대폰번호와 주민번호 입력</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0102_img05.jpg"
															alt="가입비 결제 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">5</span> 가입비 결제
														</div>
														<p class="item-desc">핸드폰으로 전송된 승인번호를 입력하면 가입비 결제완료</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0102_img06.jpg"
															alt="이용권번호 확인 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">6</span> 이용권번호 확인
														</div>
														<p class="item-desc">1일 이용권번호가 화면 및 휴대폰으로 전송됨</p>
													</div>
												</li>
											</ol>

											<h3 class="h3">1일 이용권 대여(비회원)</h3>
											<ol class="way-process col4">
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0102_img07.jpg"
															alt="자전거 대여 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">1</span> 자전거 대여
														</div>
														<p class="item-desc">키오스크에서 1일 이용권 [결제&amp;대여] 선택</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0102_img08.jpg"
															alt="1일 이용권 번호 인증 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">2</span> 1일 이용권 번호 인증
														</div>
														<p class="item-desc">1일 이용권 대여 선택</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0102_img09.jpg"
															alt="1일 이용권 번호 입력 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">3</span> 1일 이용권 번호 입력
														</div>
														<p class="item-desc">1일 이용권 번호 입력</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0102_img10.jpg"
															alt="자전거 선택 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">4</span> 자전거 선택
														</div>
														<p class="item-desc">대여할 자전거 선택 후 선택한 자전거 보관대의 대여버튼 클릭</p>
													</div>
												</li>
											</ol>
										</div>

										<div class="tab-inner" data-num="3">
											<h3 class="h3">회원카드 소지시</h3>
											<ol class="process-list">
												<li class="process-item">
													<div class="item-icon">
														<span class="icon icon11"></span>
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">1</span> 회원카드 인식
														</div>
														<p class="item-desc">등록한 회원카드를 보관대에 인식</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-icon">
														<span class="icon icon10"></span>
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">2</span> 자전거 대여
														</div>
														<p class="item-desc">보관중인 자전거가 분리되어 자전거 대여 가능</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-icon">
														<span class="icon icon13"></span>
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">3</span> 자전거 거치
														</div>
														<p class="item-desc">보관대에 자전거를 거치시키면 반납 완료</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-icon">
														<span class="icon icon-pic"></span>
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">4</span> 반납 상태 확인
														</div>
														<p class="item-desc">대여/반납 시 LED패널을 통하여 반납상태 확인</p>
													</div>
												</li>
											</ol>

											<h3 class="h3">회원카드 미소지시</h3>
											<ol class="way-process col3 connect">
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0103_img01.jpg"
															alt="자전거 대여 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">1</span> 자전거 대여
														</div>
														<p class="item-desc">키오스크 메뉴에서 [자전거 대여] 선택</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0103_img02.jpg"
															alt="휴대폰 인증 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">2</span> 휴대폰 인증
														</div>
														<p class="item-desc">휴대폰으로 인증을 선택하여 대여 절차 진행</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0103_img03.jpg"
															alt="자전거 선택 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">3</span> 자전거 선택
														</div>
														<p class="item-desc">대여할 자전거를 확인하여 선택</p>
													</div>
												</li>
											</ol>
											<ol class="process-list col3 connect">
												<li class="process-item">
													<div class="item-icon">
														<span class="icon icon12"></span>
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">4</span> 자전거 대여
														</div>
														<p class="item-desc">선택한 자전거의 대여버튼을 클릭하면 자전거 이용 가능 (1분
															경과시 대여취소)</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-icon">
														<span class="icon icon10"></span>
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">5</span> 자전거 거치
														</div>
														<p class="item-desc">자전거 이용 후 보관대에 자전거를 거치시키면 반납 완료</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-icon">
														<span class="icon icon-pic"></span>
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">6</span> 반납상태 확인
														</div>
														<p class="item-desc">대여/반납 시 LED패널을 통하여 반납상태 확인</p>
													</div>
												</li>
											</ol>
										</div>

										<div class="tab-inner" data-num="4">
											<div class="text-center mt_40">
												<img src="../images/sub_0203_0105_img01.jpg"
													alt="키오스크 이용방법 및 안내 이미지입니다. 좌측에는 키오스크 화면 이미지가 있고 우측의 자세한 내용은 하단을 참고해주세요.">
												<div class="skip">
													<h3>달구지 키오스크 메뉴구성</h3>
													<ul>
														<li><strong>1일회원 결제/대여</strong>
															<p>1일 이용권 결제, 1일 이용권 대여</p></li>
														<li><strong>자전거 대여(회원용)</strong>
															<p>휴대폰 인증 대여</p></li>
														<li><strong>카드 등록</strong>
															<p>교통카드 등록</p></li>
														<li><strong>회원서비스 연장</strong>
															<p>가입한 회원의 서비스기간 연장</p></li>
														<li><strong>터미널 현황(지도)</strong>
															<p>달구지 터미널현황 위치 확인</p></li>
														<li><strong>열쇠잠금반납요청</strong>
															<p>보조반납대 이용 시 자전거 임시 반납요청</p></li>
														<li><strong>자전거 고장접수</strong></li>
													</ul>
												</div>
												<div class="pic_btn">
													<a href="../images/sub_0203_0105_img01.jpg" target="_blank"
														title="새창열림" rel="noopener noreferrer">큰 이미지로 보기 +</a>
												</div>
											</div>

											<h3 class="h3">
												교통카드 등록 <span class="color-green">[마이비, 캐시비, 티머니]</span>
											</h3>
											<ol class="way-process col4">
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0105_img02.jpg"
															alt="교통카드 등록 메뉴 선택 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">1</span> 교통카드 등록 메뉴 선택
														</div>
														<p class="item-desc">키오스크에서 교통카드 등록 메뉴 선택</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0105_img03.jpg"
															alt="회원 ID 입력 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">2</span> 회원 ID 입력
														</div>
														<p class="item-desc">달구지 회원 ID 입력</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0105_img04.jpg"
															alt="비밀번호 입력 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">3</span> 비밀번호 입력
														</div>
														<p class="item-desc">달구지 회원 비밀번호 입력</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0105_img05.jpg"
															alt="교통카드 인식 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">4</span> 교통카드 인식
														</div>
														<p class="item-desc">키오스크 화면 아래 카드리더기에 카드 인식</p>
													</div>
												</li>
											</ol>

											<h3 class="h3">
												반납요청 <span class="small">※ 자전거를 반납할 보관대가 없어 보조 반납대에
													잠금한 경우 사용합니다.</span>
											</h3>
											<ol class="way-process col3">
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0105_img06.jpg"
															alt="반납요청 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">1</span> 반납요청
														</div>
														<p class="item-desc">키오스크 메뉴에서 [반납요청] 선택</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0105_img07.jpg"
															alt="회원 확인 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">2</span> 회원 확인
														</div>
														<p class="item-desc">등록한 회원카드 또는 달구지회원 ID로 회원 인증</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0105_img08.jpg"
															alt="접수완료 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">3</span> 접수완료
														</div>
														<p class="item-desc">자전거 임시 반납요청 완료</p>
													</div>
												</li>
											</ol>

											<h3 class="h3">자전거 고장신고</h3>
											<ol class="way-process col3">
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0105_img09.jpg"
															alt="자전거 고장신고 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">1</span> 자전거 고장신고
														</div>
														<p class="item-desc">키오스크 메뉴에서 [자전거 고장신고] 선택</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0105_img10.jpg"
															alt="회원 확인 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">2</span> 회원 확인
														</div>
														<p class="item-desc">등록한 회원카드 또는 달구지회원 ID로 회원 인증</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0105_img11.jpg"
															alt="자전거 선택 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">3</span> 자전거 선택
														</div>
														<p class="item-desc">고장난 자전거 번호 선택</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0105_img12.jpg"
															alt="고장부위 선택 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">3</span> 고장부위 선택
														</div>
														<p class="item-desc">고장난 자전거 부위 선택</p>
													</div>
												</li>
												<li class="process-item">
													<div class="item-img">
														<img src="../images/sub_0203_0105_img13.jpg"
															alt="접수완료 이미지">
													</div>
													<div class="item-text">
														<div class="item-title">
															<span class="num">3</span> 접수완료
														</div>
														<p class="item-desc">자전거 고장신고 완료</p>
													</div>
												</li>
											</ol>
										</div>
									</div>
								</div>
							</div>

							<!-- 달구지 앱 탭 -->
							<div class="tab-inner" data-num="2">
								<div class="text-center">
									<img src="../images/ready.jpg"
										alt="현재 콘텐츠 준비중입니다. 보다 나은 서비스 제공을 위하여 페이지 준비중에 있습니다. 빠른 시일내에 준비하여 찾아뵙겠습니다.">
									<div class="pic_btn">
										<a href="../images/ready.jpg" target="_blank" title="새창열림"
											rel="noopener noreferrer">큰 이미지로 보기 +</a>
									</div>
								</div>
							</div>
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
						대구디지털혁신즌흥원 대표 전화 : 053-000-0000</p>
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