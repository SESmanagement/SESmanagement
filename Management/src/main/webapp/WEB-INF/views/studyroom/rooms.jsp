<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
<script>

// //마우스 오버시 해당 스터디룸(studyroom_num) 예약현황 팝업창 띄우기
// 	function showInside(studyroom_num) {
// 		$.ajax({
// 			url: "/manage/studyroom/showInside",
// 			type: "get",
// 			data: {"studyroom_num": studyroom_num},
// 			success: function(result) { 
// 				$(".srList").empty();
//  				$(result).each(function(index, item) {
// 					var addRow = "<tr><td>"+item.studyroom_num+"</td>";
// 					addRow += "<td>"+item.sr_seat_num+"</td>";
// 					addRow += "<td>"+item.rechargable+"</td>";
// 					addRow += "<td>"+item.seated_status+"</td></tr>";
// 					$(".srList").append(addRow);
// 				}) // each
// 			} // success
// 		}); // ajax
// 	} // showInside
	

	// 해당 스터디룸(studyroom_num)에 마우스 오버시 툴팁 띄우기
	function showInside(studyroom_num){
		$.ajax({
			url: "/manage/studyroom/showInside",
			type: "get",
			data: {"studyroom_num": studyroom_num},
			success: function(result) { 
				$(".srList").empty();
				var addRow = "<tr><td>스터디룸번호</td><td>좌석번호</td><td>충전가능여부</td><td>예약가능여부</td></tr>";
 				$(result).each(function(index, item) {
					addRow += "<tr><td>"+item.studyroom_num+"</td>";
					addRow += "<td>"+item.sr_seat_num+"</td>";
					addRow += "<td>"+item.rechargable+"</td>";
					addRow += "<td>"+item.seated_status+"</td></tr>";
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
	
</script>
<%@ include file="../top.jsp" %>
<br>
<div class="sr" onmouseover="showInside(5)">스터디룸5</div> 		 <div class="sr" onmouseover="showInside(10)">스터디룸10</div><br>
<div class="sr" onmouseover="showInside(4)">스터디룸4</div>  	     <div class="sr" onmouseover="showInside(9)">스터디룸9</div><br>
<div class="sr" onmouseover="showInside(3)">스터디룸3</div> 		 <div class="sr" onmouseover="showInside(8)">스터디룸8</div><br>
<div class="sr" onmouseover="showInside(2)">스터디룸2</div> 		 <div class="sr" onmouseover="showInside(7)">스터디룸7</div><br>
<div class="sr" onmouseover="showInside(1)">스터디룸1</div>  		 <div class="sr" onmouseover="showInside(6)">스터디룸6</div><br>

<span class="tooltip"><table class="srList"></table><br><strong>

</body>
</html>