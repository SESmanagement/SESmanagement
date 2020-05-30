<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임</title>
<script src="../resources/js/jquery-3.2.1.min.js"></script>
<style>
	table{
		background-color: white;
		border: 1px;
		color: red;
		width: 300px;
		padding: 20px;
	}
</style>
</head>
<body>
	<%@ include file="../top.jsp"%>
	<br>
		<c:forEach items="${list }" var="vo">
			<a href="/manage/group/detail?group_num=${vo.group_num }">
				<table>
					<tr>
						<td>소모임명</td>
						<td>${vo.group_title }</td>
					</tr>
					<tr>
						<td>모집인원</td>
						<td>${vo.headcount }</td>
					</tr>
					<tr>
						<td>모집기간</td>
						<td>${vo.start_date }- ${vo.end_date }</td>
					</tr>
					<tr>
						<td>소모임 개설자</td>
						<td>${vo.owner_name}</td>
					</tr>
				</table>
			</a>
		</c:forEach>
</body>
</html>