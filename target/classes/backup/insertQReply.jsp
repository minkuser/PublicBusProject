<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript">

	function insertQReply() {
		if($("#content").val().trim().length==0) {
			alert("답변을 입력해주세요.");
			$("#content").focus();
			return false;
		}
	}
	
	function deleteQBoard() {
		var result=confirm("삭제하시겠습니까?");
		if(result) {
			location.href="deleteQBoard.do?groupId=${QBoard.groupId}";
		} else {
			return false;
		}
	}
</script>

</head>
<body>
<center>
<h1>Q&A</h1>

<%-- <input type="hidden" name="grupId" value="${QBoard.groupId}"/>
<input type="hidden" name="categoory" value="${QBoard.category}"/>
<input type="hidden" name="secret" value="${QBoard.secret}"/> --%>
<form action="insertQReply.do" method="post" enctype="multipart/form-data">
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
		<td bgcolor="skyblue">내용</td>
		<td align="left">${QBoard.content}</td>
	</tr>
	<c:if test="${!empty QBoard.fileName}">
		<tr>
			<td bgcolor="skyblue">이미지</td>
			<td><img alt="#" src="<c:url value='/showImage.do?fileName=${QBoard.fileName}'/>"></td>
		</tr>
		<tr>
			<td bgcolor="skyblue">다운로드</td>
			<td>
				<a href="fileDownload.do?fileName=${QBoard.fileName}">
				<input type="text" id="fileName" value="${QBoard.fileName}" name="fileName" readonly="readonly" size="30" /></a>
			<td>
		</tr>	
	</c:if>
	<tr>
		<td bgcolor="skyblue">작성일</td>
		<td align="left">${QBoard.regDate}</td>
	</tr>
	<c:if test="${maxLayer eq 0}">
		<tr>
			<td bgcolor="skyblue" with="70">답변</td>
			<td align="left"><textarea name="content" id="content" rows="5" cols="40"></textarea></td>
	</tr>
	</c:if>
</table>
<br>
<c:if test="${maxLayer eq 0}">
	<input type="submit" value="등록" onclick="return insertQReply()"/>
</c:if>
<button type="button" onclick="return deleteQBoard()">삭제</button>
<button type="button" onclick="location.href='selectQBoardList.do'">이전</button>
</form>
</center>
</body>
</html>