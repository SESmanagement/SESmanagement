<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
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
테스트: ${sessionScope.vo.name }
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