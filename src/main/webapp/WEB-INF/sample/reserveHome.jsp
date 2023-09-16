<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Date now = new Date();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<!-- 뷰포트 설정 -->
<link rel="stylesheet" href="./css/slick.css">
<link rel="stylesheet" href="./css/sub.css">

<script src="./js/jquery-3.6.0.min.js"></script>
<script src="./js/slick.js"></script>
<script src="./js/logoplay.js"></script>
<script src="./js/splitting.min.js"></script>
<script src="./js/common.js" defer></script>



<script type="text/javascript"
	src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${mapKey}"></script>
<!-- 네이버지도api설정  -->
<script
	src="${pageContext.request.contextPath}/js/lib/jquery/jquery-3.7.0.min.js"></script>
<!-- jquery 파일 -->
<%--<script src="${pageContext.request.contextPath}/js/service/rent.js"></script> --%>
<!-- jsp파일 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/custom/rent.css" />
<!-- css 파일 -->






<title>대여소지도</title>
<script type="text/javascript"> /* 반납 팝업창 띄우기 */
       function returnBike(){
           window.open("<%=request.getContextPath()%>/returnBike/returnBike.do",
					"자전거 반납하기", "width=640, height=400")
			opener.location.reload();
		}



       $(document).ready(function () {
           eventHandler();
           
            $(".reserve-go").click(function () { //예약 처리 ajax
       		
               var formDataArray = $("#reserveForm").serializeArray();
               var formDataObject = {};
       		
               $.each(formDataArray, function(i, item) {
                   formDataObject[item.name] = item.value;
               });
               
               $.ajax({
                   url: "reserveAjaxTest.do",// 서버에서 데이터를 가져올 URL
                   type: "POST",
                   contentType :"application/json",
                   data: JSON.stringify(formDataObject),   // 화 다.
                   success: function (response) {
                     if (response) {
                       alert("예약 완료되었습니다.");
                       location.reload();
       			} else {
       				alert("이미 예약하신 내역이 존재 합니다.\n * 1인 1대의 예약만 가능합니다. *");
       				 location.reload();
       					}

                   },
                   error: function (e) {
                       console.error(e);
                   }
               });
           
           });
           
       });


       function eventHandler() { //리스트 검색 ajax
       	
       	$(".search-input").keyup(function (e) {
               if (e.keyCode === 13) { 
               
                   e.preventDefault(); // 기본 동작 중지 (페이지 새로고침 방지)
                   $(".search-button").click(); // 검색 버튼 클릭 이벤트 발생
               }
           });
       	
           $(".search-button").click(function () {
       	
               var formDataArray = $("#form2").serializeArray();
               var formDataObject = {};

               $.each(formDataArray, function(i, item) {
                   formDataObject[item.name] = item.value;
               });
               
               $.ajax({
                   url: "search.do",// 서버에서 데이터를 가져올 URL
                   type: "POST",
                   contentType :"application/json",
                   data: JSON.stringify(formDataObject),   // 화 다.
                   success: function (response) {
                       updateTable(response);
                   },
                   error: function (e) {
                       console.error(e);
                   }
               });
           });

           // 모달 팝업 닫기
           $(".close").click(function () {
               // 팝업 닫기
               $("#myModal").css("display", "none");
           });

           // 모달 외부 클릭 시 팝업 닫기
           $(window).click(function (e) {
               if (e.target == $("#myModal")[0]) {
                   // 팝업 닫기
                   $("#myModal").css("display", "none");
               }
           });

       }

       function updateTable(data) { //검색 리스트 띄우기

           const tbody = $("table tbody"); //table요소 <tbody>선택
           tbody.empty();
       	
           $.each(data, function (index, rent) {
                   var row = $("<tr>");
                   row.append($("<td>").text(rent.reservePlaceName));
                   row.append($("<td>").text(rent.reservePlaceAddr));
                   row.append($("<td>").text(rent.count));
                   
                   var hiddenTd = $("<td>")
                   .css("display", "none") // Set inline style
                   .text(rent.reservePlaceId); // Set the content
               	row.append(hiddenTd);
                   
                   if (rent.count > 0) {
                   var reserveButton = $("<button>")
                       .text("예약")
                       .addClass("reserve-button")
                       .click(function () {
                           // 예약 버튼 클릭 시 동작 추가
                           
                         	 var row = $(this).closest("tr");
                            var reservePlaceIdInform = row.find("td:hidden").text();
                            var reservePlaceName = row.find("td:eq(0)").text();
                            
                            $("#reservePlaceName").val(reservePlaceName);
                            $("#reservePlaceNameCell").text(reservePlaceName);
                            $("#reservePlaceIdInform").val(reservePlaceIdInform);
                            reservePopup();
                       })
                       .attr("onclick", "reservePopup()");
                   row.append($("<td>").append(reserveButton));
               } else {
                   var disabledButton = $("<button>")
                       .text("예약불가")
                       .addClass("reserve-button-disabled")
                       .prop("disabled", true); // 버튼 비활성화 처리
                   row.append($("<td>").append(disabledButton));
               }
                   tbody.append(row);
               });
       }
       function reservePopup2(pop) { //예약 팝업창 띄우기
          //$("#myModal").css("display", "block"); //효과없이 띄우기
          $("#reservePlaceIdInform").val($(pop).prev().val());
          $("#myModal").fadeIn(); //부드럽게 띄우기
          
          var reservePlaceName = $(pop).closest('.rental-info').find('.reserve-place-name-td').text();
           $("#reservePlaceNameCell").text(reservePlaceName);
       }


       function reservePopup() { //예약 팝업창 띄우기
       	//$("#myModal").css("display", "block"); //효과없이 띄우기
       	$("#myModal").fadeIn(); //부드럽게 띄우기
       	
       }
       $(document).ready(function () { //예약정보 팝업창에 전달
           $(".reserve-button").click(function () {
           	
               var reservePlaceIdInform = $(this).closest("tr").find("td:eq(2)").text();
               $("#reservePlaceIdInform").val(reservePlaceIdInform); // reservePlaceId 값을 숨겨진 필드에 설정
               
               var reservePlaceName= $(this).closest("tr").find("td:eq(0)").text();
               $("#reservePlaceName").val(reservePlaceName);
              	$("#reservePlaceNameCell").text(reservePlaceName); //스판안에 대여
               
           });
       });

</script>


<style>
.modal {
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	display: none;
}

.rental-info { /* 마커 클릭시 알람창 효과 */
	animation: fadein 1s;
	-moz-animation: fadein 1s; /* Firefox */
	-webkit-animation: fadein 1s; /* Safari and Chrome */
	-o-animation: fadein 1s; /* Opera */
}

@
keyframes fadein {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
-moz-keyframes fadein { /* Firefox */ from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
-webkit-keyframes fadein { /* Safari and Chrome */ from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
-o-keyframes fadein { /* Opera */ from { opacity:0;
	
}

to {
	opacity: 1;
}

}
.button-container {
	text-align: center;
}

.button-container>div {
	display: inline-block;
	margin: 10px; /* Adjust this margin for the desired gap */
}

.border-divider {
	border-top: 1px solid #ccc;
	margin: 20px 0;
}

.selectTime {
	width: 80px; /* 원하는 가로 크기로 조절하세요. */
	font-size: 20px;
}
</style>

</head>
<body>
	<!-- 헤더 -->
	<header class="header">
		<div class="header-inner layout">
			<h1 class="header-logo">
				<a href="./index.jsp"><img src="./images/home1.png"
					alt="달구지 홈 화면"></a>
			</h1>
			<nav class="header-gnb" id="gnb">
				<ul class="gnb-depth-1">
					<li class="depth-1"><a href="./login.jsp"><span>사용자</span></a>
						<ul class="gnb-depth-2">
							<c:if test="${user == null }">
								<li class="depth-2"><a href="user/register.do"><span>회원가입</span></a></li>
								<li class="depth-2"><a href="login.jsp"><span>로그인</span></a></li>
							</c:if>
							<c:if test="${user != null }">
								<li class="depth-2"><a href="./login.jsp"><span>로그아웃</span></a></li>
							</c:if>
						</ul></li>
					<li class="depth-1"><a
						href="./information&guide/information.jsp"><span>달구지</span></a>
						<ul class="gnb-depth-2">
							<li class="depth-2"><a
								href="./information&guide/information.jsp"><span>달구지란?</span></a></li>
							<li class="depth-2"><a href="./information&guide/guide.jsp"><span>이용방법</span></a></li>
						</ul></li>
					<li class="depth-1"><a href="./reserveHome.do"><span>대여소</span></a>
						<ul class="gnb-depth-2">
							<c:if test="${user == null }">
								<li class="depth-2"><a href="reserveHome.do"><span>예약하기</span></a></li>
							</c:if>
							<c:if test="${user != null }">
								<li class="depth-2"><a href="reserveHome.do"><span>예약하기</span></a></li>
								<li class="depth-2"><a href="javascript:returnBike()"><span>반납하기</span></a></li>
							</c:if>
						</ul></li>
					<li class="depth-1"><a href="./sample/selectBoardList.do"><span>게시판</span></a>
						<ul class="gnb-depth-2">
							<li class="depth-2"><a href="./sample/selectBoardList.do"><span>자유게시판</span></a></li>
							<li class="depth-2"><a href="./qboard/selectQBoardList.do"><span>문의게시판</span></a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</header>
	<c:if test="${user != null }">
		<!-- 서브 비주얼 영역 -->
		<div class="svisual-layout">
			<div class="svisual-inner layout">
				<strong class="svisual-title">대여소</strong>
			</div>
		</div>

		<!-- 서브 콘텐츠 -->
		<div class="body-wrap">
			<div class="layout">
				<aside class="lnb-layout">
					<ul class="sub-menu col5">
						<li class="sub-item current"><a href="./reserveHome.do">
								<span>예약하기</span>
						</a></li>
					</ul>
				</aside>

				<div class="content-wrap">
					<h2 class="h2">예약하기</h2>
					<div class="situation-wrap">
						<div class="situation-desc">
							<div class="top-left">
								<span class="left-icon"></span> <strong class="count-num">
									대여소 : <span class="color-gray">총 <span
										class="color-green">10</span>개소
								</span>
								</strong>
							</div>
							<div class="top-right">
								<ul class="list-1st">
									<li>대여소 마킹 클릭 시 대여 가능한 자전거 댓수 정보를 볼 수 있습니다.</li>
									<li>마우스 클릭 후 드래그 하시면 지도가 이동됩니다.</li>
								</ul>
							</div>
						</div>

						<div class="situation-map">

							<div id="map" style="width: 100%; height: 880px"></div>
							<!-- 지도 div 크기 설정  -->

							<div class="map-info">
								<div class="info-icon">
									<div class="icon-item">
										<span class="icon icon01"><img src="./mapImg/able.png"
											alt="달구지 홈 화면"></span>사용가능한 대여소
									</div>
									<div class="icon-item">
										<span class="icon icon02"><img
											src="./mapImg/unable.png" alt="달구지 홈 화면"></span> 사용 불가한 대여소
									</div>
								</div>
								<div class="info-time"><%=now%></div>
							</div>
						</div>

					</div>

					<div class="border-divider"></div>

					<form id="form2" method="post">
						<div class="search-box">
							<!-- 대여소 목록 검색 form 및 검색창-->
							<input name="reservePlaceName" class="search-input" type="text"
								placeholder="주소 또는 대여소 이름을 입력하세요"><input
								class="search-button" type="button" value="검색">
						</div>
					</form>

					<div class="scrolle">
						<div class="board-table text-center">
							<div class="visual-thead">
								<div class="place th">대여소명</div>
								<div class="address th">주소</div>
								<div class="bycount th">수량</div>
								<div class="reserve th">예약</div>
							</div>
							<table class="visual-tbody">
								<c:forEach items="${rentList}" var="res" varStatus="loop">
									<!-- 리스트 정보 -->

									<tr class="point">
										<td class="clickable place th" data-index="${loop.index}">${res.reservePlaceName}</td>
										<td class="clickable address th" data-index="${loop.index}">${res.reservePlaceAddr}</td>
										<td style="display: none">${res.reservePlaceId}</td>
										<td class="bycount th">${res.count}</td>
										<td class="reserve th"><c:choose>
												<c:when test="${res.count == 0}">
													<button class="reserve-button-disabled"
														style="text-align: center;" disabled>예약불가</button>
												</c:when>

												<c:otherwise>
													<button class="reserve-button" onclick="reservePopup()">예약</button>
												</c:otherwise>
											</c:choose></td>

									</tr>
								</c:forEach>
							</table>
						</div>
					</div>

					<form id="reserveForm">
						<!-- 예약창팝업 -->
						<div id="myModal" class="modal">
							<div class="modal-content">
								<span class="close">&times;</span>
								<!-- 팝업 내용을 추가하세요 -->
								<h2 style="font-weight: bold; font-size: 40px;">예약 하기</h2>
								<table class="board-table">
									<tr class="visual-tbody">
										<td
											style="font-size: 20px; color: white; background-color: #7AA500;"
											class="reguser th">예약자</td>
										<td style="font-size: 20px;" class="reguser td">${user.user_name }님</td>
									</tr>
									<tr class="visual-tbody">
										<td
											style="font-size: 20px; color: white; background-color: #7AA500;"
											class="title th">예약장소</td>
										<td style="font-size: 20px;" class="title td"><span
											id="reservePlaceNameCell"></span></td>
									</tr>
									<tr class="visual-tbody">
										<td
											style="font-size: 20px; color: white; background-color: #7AA500;"
											class="time th">시간</td>
										<td class="time td"><select style="font-size: 20px;"
											class="selectTime" name="textPeriod">
												<option value="01:00:00">1시간</option>
												<option value="02:00:00">2시간</option>
												<option value="03:00:00">3시간</option>
										</select></td>
									</tr>
								</table>
								<div style="text-align: center; margin-top: 20px;">
									<input
										style="width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;"
										class="reserve-go" type="button" value="예약하기">
								</div>
								<input type="hidden" id="reservePlaceIdInform"
									name="bikeReservePlaceId">

							</div>
						</div>
					</form>





				</div>
			</div>
		</div>
	</c:if>

	<c:if test="${user == null }">

		<!-- 서브 비주얼 영역 -->
		<div class="svisual-layout">
			<div class="svisual-inner layout">
				<strong class="svisual-title">대여소</strong>
			</div>
		</div>
		<!-- 서브 콘텐츠 -->
		<div class="body-wrap">
			<div class="layout">
				<aside class="lnb-layout">
					<ul class="sub-menu col5">
						<li class="sub-item current"><a href="./reserveHome.do">
								<span>예약하기</span>
						</a></li>
					</ul>
				</aside>

				<div class="content-wrap">
					<h2 style="text-align: center;" class="h3">공공 자전거(달구지) 대여서비스는
						로그인 후 진행 가능합니다.</h2>
					<h2 style="text-align: center;" class="h3">아이디가 없으시면 회원가입 후 진행
						부탁드립니다.</h2>
					<div style="position: relative;">
						<img src="./images/logo4.jpg" alt="달구지">
					</div>

					<div class="button-container">
						<div>
							<a href="user/register.do"
								style="display: block; text-decoration: none;">
								<button
									style="width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">
									회원가입</button>
							</a>
						</div>
						<div>
							<a href="./login.jsp"
								style="display: block; text-decoration: none;">
								<button
									style="width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">
									로그인</button>
							</a>
						</div>
						<div>
							<a href="./index.jsp"
								style="display: block; text-decoration: none;">
								<button
									style="width: 150px; border: 1px solid; padding: 15px 30px; border-radius: 15px;">
									홈으로</button>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>




	<script> /* map파일은 작동을 안함.... */
	
		
		var rentList = JSON.parse('${jsonPlacelist}'); /* 검색리스트  */

		var HOME_PATH = window.HOME_PATH || '.'; //지도 이벤트 실행 요소?
		var map = new naver.maps.Map('map', { //지도 위도, 경도 및 크기설정
			center : new naver.maps.LatLng(35.8648, 128.5935),
			zoom : 14
		});

		

		var latlngArr = []; //마커 위도,경도 배열
		var markerName = []; //마커 이름 배열
		
		latlngArr.push(new naver.maps.LatLng(35.8569, 128.5553));//두류역
		latlngArr.push(new naver.maps.LatLng(35.8043, 128.5005));//화원역
		latlngArr.push(new naver.maps.LatLng(35.8792, 128.6273));//동대구역
		latlngArr.push(new naver.maps.LatLng(35.8648, 128.5935));//반월당역
		latlngArr.push(new naver.maps.LatLng(35.8459, 128.625));//어린이회관역
		latlngArr.push(new naver.maps.LatLng(35.8363, 128.7525));//영남대역
		latlngArr.push(new naver.maps.LatLng(35.8418, 128.68));//대공원역
		latlngArr.push(new naver.maps.LatLng(35.8374, 128.5572));//서부정류장역
		latlngArr.push(new naver.maps.LatLng(35.8889, 128.5682));//팔달시장역
		latlngArr.push(new naver.maps.LatLng(35.8699, 128.5823));//서문시장역

		/* latlngArr.push(new naver.maps.LatLng(35.8751, 128.5954));//대구역 */
		
		markerName.push("두류역");
		markerName.push("화원역");
		markerName.push("동대구역");
		markerName.push("반월당역");
		markerName.push("어린이회관역");
		markerName.push("영남대역");
		markerName.push("대공원역"); 
		markerName.push("서부정류장역");
		markerName.push("팔달시장역");
		markerName.push("서문시장역");

		var contentString = [ // 마커 표시창 문구 

		].join('');

		var infowindow = new naver.maps.InfoWindow({ //정보표시창
			content : contentString
		});

		var markers = []; //마커 배열

		for (var i = 0; i < latlngArr.length; i++) { //마커 등록
	          
	         var marker = new naver.maps.Marker({
	              map: map,
	              title: markerName[i],
	              position: latlngArr[i],
	             
	              
	              
	               });
	          
	          if (rentList[i].count === 0) { // rentList[i].count가 0인 경우
	              marker.setIcon({ // 아이콘 설정
	                  content: '<img src="${pageContext.request.contextPath}/mapImg/unable.png"/>"',
	                  size: new naver.maps.Size(32, 32),
	                  anchor: new naver.maps.Point(16, 32)})
	              }else{
	            	  
	            	  marker.setIcon({ // 아이콘 설정
		                  content: '<img src="${pageContext.request.contextPath}/mapImg/able.png"/>"',
		                  size: new naver.maps.Size(32, 32),
		                  anchor: new naver.maps.Point(16, 32)
	            	  
	            	  
	              }
						              
	              
	              );
	          
	                    }
	          markers.push(marker);

	      } 
		
		$(".clickable").on("click", function(e) { //클릭시 지도 화면 이동
		    
			var index =$(this).data("index");
			
			e.preventDefault();
			map.setZoom(16);
		    map.panTo(latlngArr[index]);
		   
		});
		
		
		
		for (let i = 0; i < markers.length; i++) { //마커 띄우기 
			(function(index) {
				naver.maps.Event.addListener(markers[index], "click", function(
						e) {

					if (!infowindow.getMap()
							|| infowindow.marker !== markers[index]) { //클릭되지않은 마커 안내창연다.
						
						contentString = [
						    '<div class="rental-info">', // 대여 정보 컨테이너 열기
						    '   <h4>대여소명 :  <span class="reserve-place-name-td">' + rentList[index].reservePlaceName + '</span></h4>',
						    '   <p>대여가능대수 : ' + rentList[index].count + ' <br />',
						    '   <input type="hidden" class="reserve-place-id" value="' + rentList[index].reservePlaceId + '">', // 숨겨진 데이터 추가
						    '   <button class="reserve-button-map" ' + (rentList[index].count > 0 ? 'onclick="reservePopup2(this)"' : 'disabled') + '>'  
						    + (rentList[index].count > 0 ? '대여하기' : '예약불가') + '</button>',
						    '</div>' // 대여 정보 컨테이너 닫기
						].join('');
						
						map.setZoom(15);
						map.panTo(latlngArr[index]);
						infowindow.setContent(contentString);
						
						infowindow.open(map, markers[index]);
						
					} else {
						infowindow.close();
					}
					infowindow.marker = markers[index];
				});
			})(i);
		}

		naver.maps.Event.addListener(map, "click", function(e) { //지도 클릭하면 마커안내창닫음
			infowindow.close();
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
					<img src="./images/logo1.jpg" alt="자전거">
				</div>
				<div class="footer-info">
					<p class="info-text01">주소 : 대구광역시 수성구 알파시티 1로 170(대흥동)
						대구디지털혁신진흥원 대표 전화 : 053-000-0000</p>
					<p class="info-text02">Copyright</p>
				</div>
				<div class="footer-logo02">
					<img src="./images/logo2.jpg" alt="자전거">
				</div>
			</div>
		</div>
	</footer>
</body>
</html>