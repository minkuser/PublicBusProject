<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	function deleteQReply() {
		var result=confirm("삭제하시겠습니까?");
		if(result) {
			location.href="deleteQReply.do?no=${QBoard.no}";
		} else {
			return false;
		}
	}
</script>	
</head>
<body>
<center>
<h1>Q&A</h1>

<form id="updateQReply" action="updateQReply.do" method="post">
<table border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td bgcolor="skyblue" with="70">문의 유형</td>
		<td align="left">${QBoard.category.category}</td>
	</tr>
	<tr>
		<td bgcolor="skyblue" >작성자</td>
		<td align="left">${QBoard.users}</td>
	</tr>
	<tr>
		<td bgcolor="skyblue" >제목</td>
		<td align="left">${QBoard.title}</td>
	</tr>
	<tr>
		<c:if test="${QBoard.users eq 'ad'}">
			<td bgcolor="skyblue">내용</td>
			<td align="left"><textarea name="content" id="content" rows="5" cols="40">${QBoard.content}</textarea></td>
		</c:if>
		<c:if test="${QBoard.users ne 'ad'}">
			<td bgcolor="skyblue">내용</td>
			<td align="left">${QBoard.content}</td>
		</c:if>
	</tr>
	<tr>
		<td bgcolor="skyblue">작성일</td>
		<td align="left">${QBoard.regDate}</td>
	</tr>
</table>
<br>

<c:if test="${QBoard.users eq 'ad'}">
	<button type="submit" form="updateQReply">수정</button>
	<button type="button" onclick="return deleteQReply()">삭제</button>
</c:if>
	<button type="button" onclick="location.href='selectQBoardList.do'">이전</button>
	
</form>
</center>
</body>
</html>