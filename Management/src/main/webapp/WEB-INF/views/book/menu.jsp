<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MENU</title>
</head>
<body>
<%-- 	<c:if test="${MemberVO.student_num != 'admin'}"> --%>
<!-- 		<a href="bookList"><input type="button" id="getBookList" value="도서목록"></a> -->
<!-- 		<a href="borrowList"><input type="button" id="getBorrowList" value="대출현황"></a> -->
<%-- 	</c:if> --%>
	<c:if test="${MemberVO.student_num == 'admin'}">
<!-- 		<a href="applyList"><input type = "button" id="getApplyList" value="대출 신청 목록"></a> -->
<!-- 		<a href="lendList"><input type = "button" id="getLendList" value="대출 목록"></a> -->
<!-- 		<a href="delayList"><input type = "button" id="getDelayList" value="연체목록"></a> -->
		<a href="registBook"><input type = "button" id="registBook" value="도서등록"></a>
		
		<a href="home"><input type = "button" id="goBack" value="메인으로"></a>
	</c:if>
</body>
</html>