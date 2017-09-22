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
	<script src="/manage/resources/js/jquery-3.2.1.js"></script>
	
<style type="text/css">
 	[class="sr"] { 
 		position:relative; 
 		border:1px; 
 		border-style:solid; 
 		padding:10px; 
 		width:100px; 
 		height:50px; 
 		display: inline-block;
 	}
 	
 	div.mouseView { 
 		padding:10px; 
 		width:300px; 
 		position:absolute; 
 		border:2px solid #ccc; 
 		font-size:12px; 
 		background-color:#fafafa; 
 	}
 	
 	[class=section] {
 		display: inline;
 		border: 1px solid #ff0000;
 		padding: 10px;
 		width: auto;
 		height: 3000px;
 	}
 	
</style>
</head>
<body>
<script>
	// 초기화
	// 해당 스터디룸(studyroom_num)에 마우스 오버시 툴팁 띄우기
	function showInside(studyroom_num){
		$.ajax({
			url: "/manage/studyroom/showInside",
			type: "get",
			data: {"studyroom_num": studyroom_num},
			success: function(result) { 
				$(".srList").empty();
				var addRow = "<tr><td>스터디룸번호</td><td>좌석번호</td><td>충전가능여부</td><td>예약완료수</td></tr>";
 				$(result).each(function(index, item) {
					addRow += "<tr><td>"+item.studyroom_num+"</td>";
					addRow += "<td>"+item.sr_seat_num+"</td>";
					addRow += "<td>"+item.rechargable+"</td>";
					if (item.seated_status == null) {
						addRow += "<td>0/4</td></tr>";
					} else if (item.seated_status == 4) {
						addRow += "<td>예약불가</td></tr>";
					} else addRow += "<td>"+item.seated_status+"/4"+"</td></tr>";
				}) // each
				$(".srList").append(addRow);
			} // success
		}); // ajax
		
		$("span.tooltip").css({
		    opacity:"0.9",
		    position:"absolute",
		    display:"none"
		}); 
		$(".sr").mouseover(function(){
		    $("span.tooltip").fadeIn();
		}).mouseout(function(){
		    $("span.tooltip").fadeOut();
		}).mousemove(function(e){
		    $("span.tooltip").css({
			"top":e.pageY+10+"px",
			"left":e.pageX+10+"px"
		    });
		});
	};
	
	// 해당 스터디룸(studyroom_num)에 마우스 클릭시 예약 페이지로 이동
	$(document).on("click", ".sr", function() {
		var studyroom = $(this).text();
		var studyroom_num = studyroom.substring(4, studyroom.length);
		
		location.href="/manage/studyroom/reserveRoomForm?studyroom_num="+studyroom_num;
	});
	
	// 체크박스 선택시 (시간대별 예약가능여부 조회, 복수 선택 가능)
	// 체크박스 전체 선택하기
	$(document).on("click", "#checkAll", function() {
	      if ($("#checkAll").is(":checked")) {
			$(".checkbox").each(function (index, item) {
				if (!($(item).is(":disabled"))) { // 선택 가능한 상태에서만 전체 선택 가능
					$(item).prop("checked", true); // 전체 선택 
				} // if
			}) // each
		} else {
			$(".checkbox").each(function (index, item) {
				if (!($(item).is(":disabled"))) { // 선택 가능한 상태에서만 전체 해제 가능
					$(item).prop("checked", false); // 전체 해제
				} // if
			}) // each
		} // else
	});
	
	// 체크박스 개별 선택시, 선택된 시간대 예약가능여부 조회하기
	$(document).on("click", "#submit", function() {
		var checkList = []; // 선택된 체크박스의 예약 시작 시간를 담을 배열
		
		$(".checkbox").each(function (index, item) {
			if ($(item).is(":checked")) { // 체크된 내역
				checkList.push($(item).val());
			} // if
		}) // each
		
		// 선택된 내역이 없을 경우, submit 취소
		if (checkList.length < 1) {
			alert("선택된 예약 내역이 없습니다.");
			return;
		} // if 
		
		// 체크박스로 선택된 시간대 배열로 넘기기 (컨트롤러에서는 리스트로 받는다.)
		$.ajax({
			url: "/manage/studyroom/checkAvailableRoom",
			type: "post",
			data: {"checkList":checkList},
			success: function(result) {
				// 초기화
				$(".sr").css("background-color", ""); 
				$(result).each(function(index, item) {
					$("#"+item+"").css("background-color", "lime");
				}) // each
			} // success
		}) // ajax
	});
	
	// 초기화
	// 예약 시작시간이 지나면 조회 불가 처리
	$(function (){
		
		// 초기화  
		if (now_time > '00' && now_time < '19') {
			$(".checkbox").each(function (index, item) {
				$(item).removeAttr("disabled") // 선택 가능한 상태에서만 전체 해제 가능
			}) // each
		} // if
		
		// 초기화
		$(".sr").css("background-color", ""); 
		
		var now = "${sysdate}"; // yy-mm-dd hh24:mi:ss dy
		var now_mm = now.substring(9, 14); // 현재 시각
		var now_time = now.substring(9, 11); // 현재 시각
		
		// 접속 시점 예약가능한 스터디룸 표시 (색 벼)
		if (now_mm > '08:30' && now_mm < '22:00') { 
			$.ajax({
				url: "/manage/studyroom/nowAvailableRoom",
				type: "get",
				success: function(result){
					$(result).each(function(index, item) {
						$("#"+item+"").css("background-color", "lime");
					}) // each
				} // success
			}) // ajax
		} // if
		
		// 현재 시간보다 작은 예약시간대 체크 박스 선택 불가 처리
		$(".checkbox").each(function (index, item) {
			if (now_time >= $(item).val()) { // 부등호 >= 로 바꾸기!!!!!!!!
				$(item).attr("disabled", true);
			} // if
		}) // each
		
	});
	
	// 현시점 조회버튼 누르기
	 $(document).on("click", "#now_submit", function(){
		 $.ajax({
				url: "/manage/studyroom/nowAvailableRoom",
				type: "get",
				success: function(result){
					$(result).each(function(index, item) {
						$("#"+item+"").css("background-color", "lime");
					}) // each
				} // success
			}) // ajax
			$(".checkbox").each(function (index, item){
				$(item).prop("checked", false); // 체크박스 초기화
			}) // each
	 });
	
</script>
<%@ include file="../top.jsp" %>
<br>
<h1>현재 시각 : ${sysdate } </h1>

시간대별 예약가능 현황  <table>
		<tr>
		<td><input type="checkbox" id="checkAll" value="99">전체</td>
		<td><input type="checkbox" class="checkbox" value="19">7-8시</td>
		<td><input type="checkbox" class="checkbox" value="20">8-9시</td>
		<td><input type="checkbox" class="checkbox" value="21">9-10시</td>
		<td><input type="checkbox" class="checkbox" value="22">10-11시</td>
		<td><input type="button" value="조회" id="submit"></td>
		<td><input type="button" value="현시점 조회" id="now_submit"></td>
		</tr>
</table>
<br>
<div id="roomSection">


<div class="sr" id="5" onmouseover="showInside(5)">스터디룸5</div> 		 <div class="sr" id="10" onmouseover="showInside(10)">스터디룸10</div><br>
<div class="sr" id="4" onmouseover="showInside(4)">스터디룸4</div>  	     <div class="sr" id="9" onmouseover="showInside(9)">스터디룸9</div><br>
<div class="sr" id="3" onmouseover="showInside(3)">스터디룸3</div> 		 <div class="sr" id="8" onmouseover="showInside(8)">스터디룸8</div><br>
<div class="sr" id="2" onmouseover="showInside(2)">스터디룸2</div> 		 <div class="sr" id="7" onmouseover="showInside(7)">스터디룸7</div><br>
<div class="sr" id="1" onmouseover="showInside(1)">스터디룸1</div>  		 <div class="sr" id="6" onmouseover="showInside(6)">스터디룸6</div><br>
</div>

<span class="tooltip"><table class="srList"><br><strong>

</body>
</html>