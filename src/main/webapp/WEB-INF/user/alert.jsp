<!-- 로그인 시 아이디 또는 비밀번호가 틀렸을 때 -->
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
