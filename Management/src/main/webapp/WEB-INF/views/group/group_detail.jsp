<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세부사항</title>
<script src="../resources/js/jquery-3.2.1.min.js"></script>
<script>
	function joinPlz() {
		$.ajax({
					url : "/manage/group/join",
					type : "post",
					data : $("#form").serialize(),
					success : function(result) {
						if (result) {
							alert('가입성공!');
							location.href = "/manage";
						} else {
							alert('이미 가입된 멤버입니다');
							location.href = "/manage/group/detail?group_num=${vo2.group_num}";
						}
					},
					error : function() {
						alert('에러발생!');
					}

				});
	}
</script>
</head>
<body>

	<%@ include file="../top.jsp"%>
	<h1>일본어 소모임</h1>
	<c:forEach items="${list }" var="vo2">
		<table>
			<tr>
				<td>참여중인 학생</td>
				<td>${vo2.owner_name } <!-- c:forEach문으로 참여중인 학생 돌리기 -->
				</td>
			</tr>
			<tr>
				<td>소모임명</td>
				<td>${vo2.group_title }</td>
			</tr>
			<tr>
				<td>주제</td>
				<td>${vo2.content }</td>
			</tr>
			<tr>
				<td>기간</td>
				<td>${vo2.start_date }~ ${vo2.end_date }</td>
			</tr>
			<tr>
				<td><input type="button" value="가입신청"
					onclick="javascript:joinPlz();"></td>
				<td><input type="button" value="이전화면으로"
					onclick="javascript:history.go(-1);"></td>
			</tr>
		</table>
		<form name="form" id="form">
			<input type="hidden" name="student_num"
				value="${sessionScope.vo.student_num}"> <input type="hidden"
				name="group_num" value="${vo2.group_num }">
	</c:forEach>
	</form>
</body>
</html>
