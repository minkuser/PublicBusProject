<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript">
	var msg="<c:out value='${msg}' />";
	var url="<c:out value='${url}' />";
	alert(msg);
	location.href=url;
</script>
</head>
<body>

</body>
</html>