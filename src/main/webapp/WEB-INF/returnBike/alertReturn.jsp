<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script>
	var msg = "반납이 완료 되었습니다 :)"
/*  	var url = "/WebProject" */
	alert(msg);
/*  	location.href = url;  */
	window.opener.location.reload(); /* 부모창 새로 고침 */
	window.close();
</script>