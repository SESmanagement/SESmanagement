<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 소모임 모집하기 </title>
<script src="../resources/js/jquery-3.2.1.min.js"></script>
<script src="../resources/js/jquery.datetimepicker.full.min.js"></script>
<link rel="stylesheet" href="../resources/css/jquery.datetimepicker.min.css">
<script>
	$(function(){
		$("#start_date").datetimepicker();
		$("#end_date").datetimepicker();
	
		var owner = document.getElementById("owner");
		if(owner.value == ""){
// 			로그인창으로 보내버리자
			alert('다시 로그인해주세요');
			location.href="/manage";
		}
	
	})
	
</script>
</head>
<body>
<%@ include file="../top.jsp" %>
<h1> 소모임 모집하기 </h1>
<form action="/manage/group/group_seek" method="post">
	<div class="tb">
	<table>
		<tr>
			<td>소모임 이름</td>
			<td><input type="text" name="group_title" id="group_title"></td>
		</tr>
		<tr>
			<td>콘텐츠</td>
<!-- 			나중에 select 된 거에 따라서 datetimepicker 부분 수정하기... 단기나 쉬는시간 같은 경우에는 end_date 없애버리든지 -->
			<td><select name="content">
				<option>스터디</option>
				<option>단기</option>
				<option>장기</option>
				<option>쉬는시간</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>기간</td>
			<td>
				<input type="text" size="20" name="start_date" id="start_date">~
				<input type="text" size="20" name="end_date" id="end_date">
			</td>
		<tr>
			<td>인원</td>
			<td><input type="text" name="headcount" id="headcount">명</td>
		</tr>
		<tr>
			<td><input type="submit"></td>
			<td><input type="button" value="취소" onclick="javascript:history.go(-1);"></td>
		</tr>	
	</table>
	</div>
	<input type="hidden" name="owner" id="owner" value="${vo.student_num }">
	<input type="hidden" name="penalty_total" value="0">
	<input type="hidden" name="group_num" value="0">
</form>
</body>
</html>