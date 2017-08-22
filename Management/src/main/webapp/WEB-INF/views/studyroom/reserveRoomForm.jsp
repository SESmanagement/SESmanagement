<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸 예약현황</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" />
	<link rel="stylesheet" href="/manage/resources/css/style.css" />
	<link rel="stylesheet" href="/manage/resources/css/jquery.datetimepicker.min.css" />
	<script src="/manage/resources/js/jquery-3.2.1.js"></script>
	<script src="/manage/resources/js/jquery.datetimepicker.full.min.js"></script>
	
<style type="text/css">

</style>
</head>
<body>
<script>

</script>

<%@ include file="../top.jsp" %>
<br>
		<h1>스터디룸 ${param.studyroom_num}</h1>
<section>여기에 스터디룸 자리배치도</section>
<section>
	<table>
		<tr>
			<td>좌석번호</td>
			<td>이용시간</td>
		</tr>
		<c:forEach items="${param.srList}" var="srVO">
		<tr>
			<td>${srVO.sr_seat_num }</td>
			<td>
				<progress value="22" max="240"></progress>
			</td>
		</tr>
		</c:forEach>
	</table>
</section>

</body>
</html>