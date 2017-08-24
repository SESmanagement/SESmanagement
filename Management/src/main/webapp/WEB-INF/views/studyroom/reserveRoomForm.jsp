<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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

	// 해당 스터디룸의 예약 현황 조회
	$(function() {
		$.ajax({
			url: "/manage/studyroom/srResvInfo",
			data: {"studyroom_num":"${studyroom_num}"},
			type: "post",
			success: function(result) {
				$(".timeline").empty();
				
		 		// 테이블에 좌석번호별 id속성 입력
		 		$(".sr_seat_num").each(function(indexx, itemm) {
		 			var sr_seat_num = $(itemm).text();
		 			$(itemm).attr("id", sr_seat_num);
		 			
		 			// db에서 조회한 예약 현황 조회
	 				$(result).each(function(index, item) {
	 					var id = itemm.id; // 테이블의 좌석 번호
	 					var start_time = item.start_time.substring(0,2); // 예약 시작시간
	 					var end_time = item.end_time.substring(0,2); 	 // 예약 종료시간
	 					var resv_time = end_time - start_time;			 // 예약 시간 (종료-시작)
	 					
						if (item.sr_seat_num == id) { // item.sr_seat_num : 예약현황의 좌석번호
							if (start_time == '19') {
								for (var i=1; i <= resv_time; i++) {
									$("#"+id).siblings("#time"+i).css("background-color", "red");
									$("#"+id).siblings("#time"+i).val("non-selectable");
								}
							} 
	 						if (start_time == '20') {
								for (var i=2; i <= resv_time+1; i++) {
									$("#"+id).siblings("#time"+i).css("background-color", "red");
									$("#"+id).siblings("#time"+i).val("non-selectable");
								}
							}
	 						if (start_time == '21') {
								for (var i=3; i <= resv_time+2; i++) {
									$("#"+id).siblings("#time"+i).css("background-color", "red");
									$("#"+id).siblings("#time"+i).val("non-selectable");
								}
							}
	 						if (start_time == '22') {
								for (var i=4; i <= resv_time+3; i++) {
									$("#"+id).siblings("#time"+i).css("background-color", "red");
									$("#"+id).siblings("#time"+i).val("non-selectable");
								}
							} 
	 						
						} // outer if
					}) // result의 each
					
		 		})//.sr_seat_num의 each
		 		
				// 조회 시점 이후에는 선택불가 처리
 				// 00:00 ~ 08시 30분까지 선택불가 처리
 				var sysdate = "${sysdate}";
 				if (sysdate > "00:00" && sysdate < "08:30") {
 					for (var i=1; i<=$(".sr_seat_num").length; i++) {
 						$(".sr_seat_num").siblings("#time"+i).css("background-color", "grey");
 						$(".sr_seat_num").siblings("#time"+i).val("non-selectable");
 					} // for
 				} // if
 				
 				// 19시 이후 #time1 선택불가 처리
 				if (sysdate.substring(0,2) == '19') {
 					$(".sr_seat_num").siblings("#time1").css("background-color", "grey");
 					$(".sr_seat_num").siblings("#time1").val("non-selectable");
 				}
 				// 20시 이후 #time1,2 선택불가 처리
 				if (sysdate.substring(0,2) == '20') {
 					for (var i=1; i<=$(".sr_seat_num").length-2; i++) {
 						$(".sr_seat_num").siblings("#time"+i).css("background-color", "grey");
 						$(".sr_seat_num").siblings("#time"+i).val("non-selectable");
 					} // for
 				} // if
 				// 21시 이후 #time1~3 선택불가 처리
 				if (sysdate.substring(0,2) == '21') {
 					for (var i=1; i<=$(".sr_seat_num").length-1; i++) {
 						$(".sr_seat_num").siblings("#time"+i).css("background-color", "grey");
 						$(".sr_seat_num").siblings("#time"+i).val("non-selectable");
 					} // for
 				} // if
 				// 22시 이후 #time1~4 선택불가 처리
 				if (sysdate.substring(0,2) == '22') {
 					for (var i=1; i<=$(".sr_seat_num").length; i++) {
 						$(".sr_seat_num").siblings("#time"+i).css("background-color", "grey");
 						$(".sr_seat_num").siblings("#time"+i).val("non-selectable");
 					} // for
 				} // if

			} // success
		}) // ajax
	});

	
	// 좌석 및 예약 시간대 선택
	var resvApplyArr = []; // 예약시간대 담는 배열
	$(document).on("click", ".timeline", function() {
		// 선택불가 셀(value="non-selectable")이 선택시 함수 종료
		if ($(this).val() == "non-selectable") {
			alert("선택불가");
			return;
		} // if
		
		// 선택 셀(value="selected")을 다시 클릭할 경우 -> 선택 해제
		if ($(this).val() == "selected") {
			alert("선택이 취소됩니다.");
			var removeIndex = resvApplyArr.indexOf(${studyroom_num}+":"+$(this).siblings(".sr_seat_num").text()+":"+this.id); // 선택 셀의 인덱스값 확인
			resvApplyArr.splice(removeIndex, 1); // 배열에서 선택 셀 삭제
			$(this).css("background-color", "lime");
			$(this).val("");
			return;
		} // if
		
		var select_timeline = this.id; // 예약 시간대
		var sr_seat_num = $(this).siblings(".sr_seat_num").text(); // 좌석 번호
		var studyroom_num = "${studyroom_num}"; // 스터디룸 번호
		var resvApply = studyroom_num+":"+sr_seat_num+":"+select_timeline; // 스터디룸 번호:좌석번호:에약시간대
		resvApplyArr.push(resvApply); // 선택 배열에 담기
		$(this).css("background-color", "orange");	// 선택 시간대 표시하기
		$(this).val("selected");
		
// 		for (var i=0; i<resvApplyArr.length; i++) {
// 			alert(resvApplyArr[i]);
// 		}
		
		// 동일 시간대 선택 불가 처리
		for (var i=0; i<resvApplyArr.length-1; i++) {
			var selected_timeline = resvApplyArr[i].split(":")[2]; // 이미 선택된 시간대
			
			if (select_timeline == selected_timeline) {
				alert("동일 시간대에 예약내역이 있습니다. 다시 확인하세요.");
				resvApplyArr.pop();
				$(this).css("background-color", "lime");
				$(this).val("");
			} 
		} // for
		
		// 예약 시간대 4개 이상 선택시 알림창 및 선택 배열에서 제외
		if (resvApplyArr.length > 4) {
			alert("최대 4시간까지만 가능합니다.");
			resvApplyArr.pop();
		}
		
		
// 		alert("배열크기: " + resvApplyArr.length)
		
	});
	
	
</script>

<%@ include file="../top.jsp" %>
<br>
		<h1>스터디룸 ${studyroom_num}</h1>
<section>여기에 스터디룸 자리배치도</section>

	<table>
		<tr>
			<td rowspan="2">좌석번호</td>
			<td colspan="4">이용시간-임시 타임라인바 찾아보기!!</td>
		</tr>
		<tr>
			<td>7~8시</td>
			<td>8~9시</td>
			<td>9~10시</td>
			<td>10~11시</td>
		</tr>
		<c:forEach items="${srList}" var="vo">
			<tr>
				<td class="sr_seat_num">${vo.sr_seat_num}</td>
				<td class="timeline" id="time1"></td>
				<td class="timeline" id="time2"></td>
				<td class="timeline" id="time3"></td>
				<td class="timeline" id="time4"></td>
			</tr>
		</c:forEach>
	</table>
	
	

</body>
</html>