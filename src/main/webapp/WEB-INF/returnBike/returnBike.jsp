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

<title>반납</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

header {
	max-width: 800px;
	margin: 0 auto;
	background-color: #7AA500;
	color: #fff;
	text-align: center;
	padding: 20px 0;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	font-size: 24px;
}

p {
	font-size: 18px;
}

form {
	margin-top: 20px;
}

select {
	width: 90%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 20px;
	margin-bottom: 10px;
}

input[type="submit"] {
	background-color: #007BFF;
	color: #fff;
	padding: 12px 20px;
	border: none;
	border-radius: 5px;
	font-size: 20px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<header>
		<h1>반납하기</h1>
	</header>
	<div class="container">
		<form action="returnBike.do" method="post">
			<table class="board-table" style="margin: 0 auto;">
				<tr class="visual-tbody">
					<td class="th" style="text-align: center;">예약한 대여소</td>
					<td style="font-size: 20px;">${current_place_name }</td>
				</tr>
				<tr class="visual-tbody">
					<td class="th" style="text-align: center;">반납 대여소</td>
					<td><select id="selectReservePlace" name="selectReservePlace">
							<c:forEach items="${list }" var="option">
								<option value="${option.reservePlaceName}">${option.reservePlaceName }</option>
							</c:forEach>
					</select></td>
				</tr>
			</table>
			<div style="text-align: center; margin-top: 20px;" >
			<input type="submit" value="반납하기" />
			</div>
		</form>
	</div>
</body>
</html>