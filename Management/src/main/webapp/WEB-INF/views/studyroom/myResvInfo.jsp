<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	[class="timeline"] {
		background-color:lime;
	}
	
</style>
</head>
<body>
<script>
	// 예약 취소 성공 메세지
	if ("${cancelResult}" != null) {
		if ("${cancelResult}" == true) alert("예약이 취소되었습니다.")
		else ("예약 취소에 실패했습니다.")
	}

	// 체크박스 전체 선택하기
	$(document).on("click", "#checkAll", function() {
	      if ($("#checkAll").is(":checked")) {
			$("input[name=checkbox]").prop("checked", true); // 전체 선택
		} else {
			$("input[name=checkbox]").prop("checked", false); // 전체 해제
		}
	});

	// 선택된 예약건 취소 신청하기
	$(document).on("click", "#submit", function() {
		var checkList = []; // 선택된 체크박스의 예약번호를 담을 배열
		
		$(".checkbox").each(function (index, item) {
			var sr_resv_num = $(item).val();
// 			if ($(".checkbox").is(":checked")) {
			if ($(item).is(":checked")) { // 체크된 내역
				checkList.push(sr_resv_num);
			} // if
		}) // each
		
		// 선택된 내역이 없을 경우, submit 취소
		if (checkList.length < 1) {
			alert("선택된 예약 내역이 없습니다.");
			return;
			
		} else { // 취소할 예약 번호들이 담긴 checkList를 컨트롤로 넘김
			$("#fm").attr("action", "/manage/studyroom/cancelMySRR?checkList="+checkList+"&student_num=${sessionScope.vo.student_num }");			
			$("#submit").attr("type", "submit");
			
		} // else
	});
</script>

<%@ include file="../top.jsp" %>
<br>
		<h1>${sessionScope.vo.name } 님의 스터디룸 예약 현황</h1>
		<h1>현재 시각 : ${sysdate } </h1>
<section>
	<form action="" method="post" id="fm">
	<table>
		<tr>
			<th><input type="checkbox" id="checkAll">전체 선택</th>
			<th>예약 일자</th>
			<th>스터디룸 번호</th>
			<th>좌석번호</th>
			<th>시작 시간</th>
			<th>종료 시간</th>
		</tr>
		<c:forEach items="${myResvList}" var="vo">
		<c:if test="${myResvList eq ''}">
		<tr>
			<td colspan="5">예약내역이 없습니다.</td>
		</tr>
		</c:if>
		<c:if test="${myResvList ne ''}">
		<tr>
		<fmt:parseDate var="now" value="${sysdate }" pattern="yy-MM-dd kk:mm:ss"/>
		<fmt:parseDate var="start_date" value="${vo.start_time }" pattern="yy-MM-dd kk:mm:ss"/>
		<c:set var="start_time" value="${vo.start_time }"></c:set>
		<c:set var="end_time" value="${vo.end_time }"></c:set>
				<td>
			<c:if test="${now < start_date }"> <!-- 부등호 < 로 바꾸기 -->
					<input type="checkbox" name="checkbox" class="checkbox" value="${vo.sr_resv_num }">
			</c:if>
				</td>
				<td>${fn:substring(start_time, 2, 10)}</td>
				<td>${vo.studyroom_num}</td>
				<td>${vo.sr_seat_num}</td>
				<td>${fn:substring(start_time, 11, 16)}</td>
				<td>${fn:substring(end_time, 11, 16)}</td>
				<td class="number"><input type="hidden" name="sr_resv_num" value="${vo.sr_resv_num }" ></td>
		</c:if>
		</tr>
		</c:forEach>
	</table>
	
		<input type="button" value="취소 신청" id="submit">
		<input type="reset" value="전체 선택취소">
	</form>
</section>
	

</body>
</html>