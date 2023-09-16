<!-- 회원 탈퇴 시 비밀번호 확인 실패 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script>
	var msg = "<c:out value='${msg}'/>"
	var url = "<c:out value='${url}'/>"
	alert(msg);
	location.href = url;
</script>