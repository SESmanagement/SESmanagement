<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
</head>
<style>
body{
	background-color: white;
}
</style>

<body>
<%@ include file="top.jsp" %>
<br>
<c:if test="${sessionScope.vo.name == null}">
	<%@ include file="login.jsp" %>
</c:if>
<c:if test="${sessionScope.vo.name != null}">
	<%@ include file="logedin.jsp" %>
</c:if>
</body>
</html>